using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{
    public class RecordacademicoController : Controller
    {
 
        protected override void Initialize(RequestContext requestContext)
        {
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IList<Materium> listaMaterias = repositorioMateria.GetAll();
            IList<String> nombresMaterias = listaMaterias.Select(listaMateria => listaMateria.Nombre + " cod.: " + listaMateria.IdMateria).ToList();
            ViewData["Materium.Nombre"] = new SelectList(nombresMaterias);

            IRepositorio<Alumno> repositorioAlumno = new AlumnoRepositorio();
            IList<Alumno> listaAlumnos = repositorioAlumno.GetAll();
            IList<String> nombresAlumnos = listaAlumnos.Select(listaAlumno => listaAlumno.Nombre + " " + listaAlumno.Apellido + " - " + listaAlumno.Expediente).ToList();
            ViewData["Alumno.Nombre"] = new SelectList(nombresAlumnos);

            IEnumerable<string> items = new string[] { "S", "N" };
            ViewData["Reparacion"] = new SelectList(items);
            base.Initialize(requestContext);
        }

        //
        // GET: /Recordacademico/

        public ActionResult Index()
        {
            IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IRepositorio<Alumno> repositorioAlumno = new AlumnoRepositorio();
            IList<Recordacademico> listaRecordacademicos = myRepoRecordacademico.GetAll();
            foreach (var recordacademico in listaRecordacademicos)
            {
                recordacademico.Materium = repositorioMateria.GetById(recordacademico.IdMateria);
                recordacademico.Alumno = repositorioAlumno.GetById(recordacademico.Expediente);
            }
            return View(listaRecordacademicos);
        }

        //
        // GET: /Recordacademico/Details/5

        public ActionResult Details(int id)
        {
            IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
            return View(myRepoRecordacademico.GetById(id));
        }

        //
        // GET: /Recordacademico/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Recordacademico/Create

        [HttpPost]
        public ActionResult Create(Recordacademico recordacademico)
        {
            int indice = recordacademico.Alumno.Nombre.IndexOf('-') + 2;
            if (indice != 1)
            {
                string exp = recordacademico.Alumno.Nombre.Substring(indice).Trim();
                int expediente = Convert.ToInt32(exp);
                recordacademico.Expediente = expediente;

                indice = recordacademico.Materium.Nombre.IndexOf(':') + 2;
                if (indice != 1)
                {
                    string id = recordacademico.Materium.Nombre.Substring(indice).Trim();
                    int idMateria = Convert.ToInt32(id);
                    recordacademico.IdMateria = idMateria;

                    if (ModelState.IsValid)
                    {
                        IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
                        String resultado = myRepoRecordacademico.Save(recordacademico);

                        if (resultado.Equals("true"))
                            return RedirectToAction("Index");
                    }
                }
            }
            return View(recordacademico);
        }

        //
        // GET: /Recordacademico/Edit/5

        public ActionResult Edit(int id)
        {
            IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
            return View(myRepoRecordacademico.GetById(id));
        }

        //
        // POST: /Recordacademico/Edit/5

        [HttpPost]
        public ActionResult Edit(Recordacademico recordacademico, int id, FormCollection collection)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
                recordacademico.IdRecord = id;
                String resultado = myRepoRecordacademico.Update(recordacademico);

                if (resultado.Equals("true"))
                return RedirectToAction("Index");
            }
            return View(recordacademico);
        }

        //
        // GET: /Recordacademico/Delete/5

        public ActionResult Delete(int id)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
                String resultado = myRepoRecordacademico.Delete(myRepoRecordacademico.GetById(id));

                if (resultado.Equals("true"))
                    return RedirectToAction("Index"); return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
       }

    }
}
