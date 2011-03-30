using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{
    public class RecordacademicoController : Controller
    {
        //
        // GET: /Recordacademico/

        public ActionResult Index()
        {
            IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
            IList<Recordacademico> listaRecordacademicos = myRepoRecordacademico.GetAll();
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
        public ActionResult Create(Recordacademico Recordacademico)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
                myRepoRecordacademico.Save(Recordacademico);
                return RedirectToAction("Index");
            }
            return View(Recordacademico);
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
        public ActionResult Edit(Recordacademico Recordacademico, int id, FormCollection collection)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
                Recordacademico.IdRecord = id;
                myRepoRecordacademico.Update(Recordacademico);
                return RedirectToAction("Index");
            }
            return View(Recordacademico);
        }

        //
        // GET: /Recordacademico/Delete/5

        public ActionResult Delete(int id)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Recordacademico> myRepoRecordacademico = new RecordacademicoRepositorio();
                myRepoRecordacademico.Delete(myRepoRecordacademico.GetById(id));
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
       }

        //
        // POST: /Recordacademico/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, Recordacademico Recordacademico)
        {
            return RedirectToAction("Index");
        }
    }
}
