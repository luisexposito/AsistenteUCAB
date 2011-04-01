using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.HtmlControls;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{
    public class ActividadController : Controller
    {
        //
        // GET: /Actividad/

        public ActionResult Index()
        {
            IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
            IList<Actividad> listaActividads = myRepoActividad.GetAll();
            return View(listaActividads);
        }

        [HttpPost]
        public ActionResult Index(HtmlForm form)
        {
            string nombre = Request["actividad"];
            IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
            IList<Actividad> todasActividades = myRepoActividad.GetAll();
            IList<Actividad> listaActividades = new List<Actividad>();
            foreach (var Actividad in todasActividades)
            {
                if (Actividad.Nombre == nombre)
                    listaActividades.Add(Actividad);
            }
            return View(listaActividades);
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
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IList<Materium> listaMaterias = repositorioMateria.GetAll();
            IList<String> nombresMaterias = listaMaterias.Select(listaMateria => listaMateria.Nombre).ToList();
            ViewData["Materia.Nombre"] = new SelectList(nombresMaterias);

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
                IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
                String resultado = myRepoActividad.Save(Actividad);
                
                if(resultado.Equals("true"))
                    return RedirectToAction("Index");
            }
            IList<String> nombresMaterias = listaMaterias.Select(listaMateria => listaMateria.Nombre).ToList();
            ViewData["Materia.Nombre"] = new SelectList(nombresMaterias);
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
    }
}
