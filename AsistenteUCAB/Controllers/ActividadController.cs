using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.UI.HtmlControls;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{
    public class ActividadActionResponseModel
    {
        public String Status;
        public Int64 Source_id;
        public Int64 Target_id;

        public ActividadActionResponseModel(String status, Int64 source_id, Int64 target_id)
        {
            Status = status;
            Source_id = source_id;
            Target_id = target_id;
        }
    }

    public class ActividadController : Controller
    {
        private IRepositorio<Actividad> myRepoActividad;
        private IList<Actividad> listaActividads;
        protected override void Initialize(RequestContext requestContext)
        {
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IList<Materium> listaMaterias = repositorioMateria.GetAll();
            IList<String> nombresMaterias = listaMaterias.Select(listaMateria => listaMateria.Nombre).ToList();
            ViewData["Materia.Nombre"] = new SelectList(nombresMaterias);

            myRepoActividad = new ActividadRepositorio();
            listaActividads = myRepoActividad.GetAll();
            base.Initialize(requestContext);
        }
        //
        // GET: /Actividad/

        public ActionResult Index()
        {
            ViewData["ActividadBuscada"] = null;
            return View();
        }

        public ActionResult MisActividades(string nombre)
        {
            if (String.IsNullOrEmpty(nombre) || String.IsNullOrWhiteSpace(nombre))
            {
                return View(listaActividads.Where(actividad => actividad.IdMateria == null).OrderBy(actividad => actividad.HoraInicio));
            }
            return View(listaActividads.Where(actividad => actividad.IdMateria == null && actividad.Nombre == nombre).OrderBy(actividad => actividad.HoraInicio));
        }

        public ActionResult ActividadesInteligentes(string nombre)
        {
            if (String.IsNullOrEmpty(nombre) || String.IsNullOrWhiteSpace(nombre))
            {
                return View(listaActividads.Where(actividad => actividad.IdMateria != null).OrderBy(actividad => actividad.HoraInicio));
            }
            return View(listaActividads.Where(actividad => actividad.IdMateria != null && actividad.Nombre == nombre).OrderBy(actividad => actividad.HoraInicio));
        }

        [HttpPost]
        public ActionResult Index(string actividad)
        {
            ViewData["ActividadBuscada"] = actividad;
            return View();
        }

        //
        // GET: /Actividad/Details/5

        public ActionResult Details(int id)
        {
            IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
            return View(myRepoActividad.GetById(id));
            
        }

        //
        // GET: /Actividad/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Actividad/Create

        [HttpPost]
        public ActionResult Create(Actividad Actividad)
        {
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IList<Materium> listaMaterias = repositorioMateria.GetAll();
            
            foreach (var materia in listaMaterias)
                if (materia.Nombre == Actividad.Materia.Nombre)
                    Actividad.IdMateria = materia.IdMateria;

            if(ModelState.IsValid)
            {
                if (Actividad.HoraInicio > Actividad.HoraFin)
                {
                    ModelState.AddModelError("FechaInvalida",
                                             "La fecha/hora de inicio no puede ser mayor a la fecha/hora fin.");
                    return View(Actividad);
                }
                IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
                String resultado = myRepoActividad.Save(Actividad);
                
                if(resultado.Equals("true"))
                    return RedirectToAction("Index");
            }
            return View(Actividad);
            
        }

        //
        // GET: /Actividad/Edit/5

        public ActionResult Edit(int id)
        {
            IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();

            Actividad actividad = myRepoActividad.GetById(id);
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            actividad.Materia = repositorioMateria.GetById(actividad.IdMateria);
            
            return View(actividad);
        }

        //
        // POST: /Actividad/Edit/5

        [HttpPost]
        public ActionResult Edit(Actividad Actividad)
        {
             if(ModelState.IsValid)
            {
                IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
                String resultado = myRepoActividad.Update(Actividad);

                if (resultado.Equals("true"))
                    return RedirectToAction("Index"); 
                
            }
             return View(Actividad);
        }

        //
        // GET: /Actividad/Delete/5

        public ActionResult Delete(int id)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
                String resultado = myRepoActividad.Delete(myRepoActividad.GetById(id));

                if (resultado.Equals("true"))
                    return RedirectToAction("Index"); return RedirectToAction("Index");
            }
             return RedirectToAction("Index");
        }

        //
        // POST: /Actividad/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, Actividad Actividad)
        {
            return RedirectToAction("Index");
        }

        public ActionResult Find(string q)
        {
            IRepositorio<Actividad> repoS = new ActividadRepositorio();
            IList<Actividad> actividades = repoS.GetAll();
            IList<Actividad> posiblesActividades = new List<Actividad>();

            foreach (var item in actividades)
            {
                if (item.Nombre.Contains(q.ToUpper()) || item.Nombre.Contains(q.ToLower()))
                {
                    posiblesActividades.Add(item);
                }
            }
            string[] emp = new string[posiblesActividades.Count];
            int i = 0;
            foreach (var actividad in posiblesActividades)
            {
                emp[i] = actividad.Nombre;
                i++;
            }

            return Content(string.Join("\n", emp)); ;
        }


        public ActionResult Data()
        {
            IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
            return View(myRepoActividad.GetAll());
        }

        public ActionResult Save(ACTIVIDAD changedEvent, FormCollection actionValues)
        {
            String action_type = actionValues["!nativeeditor_status"];
            Int64 source_id = Int64.Parse(actionValues["id"]);
            Int64 target_id = source_id;


            MyEventsDataContext data = new MyEventsDataContext();
            try
            {
                switch (action_type)
                {
                    case "inserted":
                        data.ACTIVIDAD.InsertOnSubmit(changedEvent);
                        break;
                    case "deleted":
                        changedEvent = data.ACTIVIDAD.SingleOrDefault(ev => ev.idActividad == source_id);
                        data.ACTIVIDAD.DeleteOnSubmit(changedEvent);
                        break;
                    default: // "updated"
                        changedEvent = data.ACTIVIDAD.SingleOrDefault(ev => ev.idActividad == source_id);
                        UpdateModel(changedEvent);
                        break;
                }
                data.SubmitChanges();
                target_id = changedEvent.idActividad;
            }
            catch
            {
                action_type = "error";
            }

            return View(new ActividadActionResponseModel(action_type, source_id, target_id));
        }
    }
}
