using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{
    public class MateriumController : Controller
    {
        //
        // GET: /Materium/

        public ActionResult Index()
        {
            IRepositorio<Materium> myRepoMaterium = new MateriumRepositorio();
            IList<Materium> listaMateriums = myRepoMaterium.GetAll();
            return View(listaMateriums);
        }

        //
        // GET: /Materium/Details/5

        public ActionResult Details(int id)
        {
            IRepositorio<Materium> myRepoMaterium = new MateriumRepositorio();
            return View(myRepoMaterium.GetById(id));
        }

        //
        // GET: /Materium/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Materium/Create

        [HttpPost]
        public ActionResult Create(Materium Materium)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Materium> myRepoMaterium = new MateriumRepositorio();
                myRepoMaterium.Save(Materium);
                return RedirectToAction("Index");
            }
            return View(Materium);
        }

        //
        // GET: /Materium/Edit/5

        public ActionResult Edit(int id)
        {
            IRepositorio<Materium> myRepoMaterium = new MateriumRepositorio();
            return View(myRepoMaterium.GetById(id));
        }

        //
        // POST: /Materium/Edit/5

        [HttpPost]
        public ActionResult Edit(Materium Materium, int id, FormCollection collection)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Materium> myRepoMaterium = new MateriumRepositorio();
                Materium.IdMateria = id;
                myRepoMaterium.Update(Materium);
                return RedirectToAction("Index");
            }
            return View(Materium);
        }

        //
        // GET: /Materium/Delete/5

        public ActionResult Delete(int id)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Materium> myRepoMaterium = new MateriumRepositorio();
                myRepoMaterium.Delete(myRepoMaterium.GetById(id));
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        //
        // POST: /Materium/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, Materium Materium)
        {
            return RedirectToAction("Index");
        }
    }
}
