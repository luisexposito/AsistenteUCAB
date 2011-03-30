using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{
    public class AlumnoController : Controller
    {
        //
        // GET: /Alumno/

        public ActionResult Index()
        {
            IRepositorio<Alumno> myRepoAlumno = new AlumnoRepositorio();
            IList<Alumno> listaAlumnos = myRepoAlumno.GetAll();
            return View(listaAlumnos);
        }

        //
        // GET: /Alumno/Details/5

        public ActionResult Details(int id)
        {
            IRepositorio<Alumno> myRepoAlumno = new AlumnoRepositorio();
            return View(myRepoAlumno.GetById(id));
        }

        //
        // GET: /Alumno/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Alumno/Create

        [HttpPost]
        public ActionResult Create(Alumno Alumno)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Alumno> myRepoAlumno = new AlumnoRepositorio();
                myRepoAlumno.Save(Alumno);
                return RedirectToAction("Index");
            }
            return View(Alumno);
        }

        //
        // GET: /Alumno/Edit/5

        public ActionResult Edit(int id)
        {
            IRepositorio<Alumno> myRepoAlumno = new AlumnoRepositorio();
            return View(myRepoAlumno.GetById(id));
        }

        //
        // POST: /Alumno/Edit/5

        [HttpPost]
        public ActionResult Edit(Alumno Alumno, int id, FormCollection collection)
        {
           if(ModelState.IsValid)
            {
                IRepositorio<Alumno> myRepoAlumno = new AlumnoRepositorio();
                Alumno.Expediente = id;
                myRepoAlumno.Update(Alumno);
                return RedirectToAction("Index");
            }
            return View(Alumno);
        }

        //
        // GET: /Alumno/Delete/5

        public ActionResult Delete(int id)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Alumno> myRepoAlumno = new AlumnoRepositorio();
                myRepoAlumno.Delete(myRepoAlumno.GetById(id));
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        //
        // POST: /Alumno/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, Alumno Alumno)
        {
            return RedirectToAction("Index");
        }
    }
}
