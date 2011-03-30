using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
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
            if(ModelState.IsValid)
            {
                IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
                myRepoActividad.Save(Actividad);
                return RedirectToAction("Index");
            }
            return View(Actividad);
            
        }

        //
        // GET: /Actividad/Edit/5

        public ActionResult Edit(int id)
        {
            IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
            return View(myRepoActividad.GetById(id));
        }

        //
        // POST: /Actividad/Edit/5

        [HttpPost]
        public ActionResult Edit(Actividad Actividad)
        {
             if(ModelState.IsValid)
            {
                IRepositorio<Actividad> myRepoActividad = new ActividadRepositorio();
                myRepoActividad.Update(Actividad);
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
                myRepoActividad.Delete(myRepoActividad.GetById(id));
                return RedirectToAction("Index");
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
    }
}
