using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{
    public class RequisitoController : Controller
    {
        //
        // GET: /Requisito/

        public ActionResult Index()
        {
            IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
            IList<Requisito> listaRequisitos = myRepoRequisito.GetAll();
            return View(listaRequisitos);
        }

        //
        // GET: /Requisito/Details/5

        public ActionResult Details(int id)
        {
            IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
            return View(myRepoRequisito.GetById(id));
        }

        //
        // GET: /Requisito/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Requisito/Create

        [HttpPost]
        public ActionResult Create(Requisito Requisito)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
                myRepoRequisito.Save(Requisito);
                return RedirectToAction("Index");
            }
            return View(Requisito);
        }

        //
        // GET: /Requisito/Edit/5

        public ActionResult Edit(int idPadre, int idHijo)
        {
            IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
            return View(myRepoRequisito.GetById(idPadre, idHijo));
        }

        //
        // POST: /Requisito/Edit/5

        [HttpPost]
        public ActionResult Edit(Requisito Requisito, int id, FormCollection collection)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
                Requisito.IdMateriaPadre = id;
                myRepoRequisito.Update(Requisito);
                return RedirectToAction("Index");
            }
            return View(Requisito);
        }

        //
        // GET: /Requisito/Delete/5

        public ActionResult Delete(int id)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
                myRepoRequisito.Delete(myRepoRequisito.GetById(id));
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        //
        // POST: /Requisito/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, Requisito Requisito)
        {
            return RedirectToAction("Index");
        }
    }
}
