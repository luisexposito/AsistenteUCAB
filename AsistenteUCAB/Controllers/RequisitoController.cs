using System;
using System.Collections;
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
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IList<Materium> listaMaterias = repositorioMateria.GetAll();
            IList<String> nombresMaterias = listaMaterias.Select(listaMateria => listaMateria.Nombre).ToList();
            ViewData["MateriaPadre.Nombre"] = new SelectList(nombresMaterias);
            ViewData["MateriaHijo.Nombre"] = new SelectList(nombresMaterias);
            return View();
        }

        //
        // POST: /Requisito/Create

        [HttpPost]
        public ActionResult Create(Requisito Requisito)
        {
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IList<Materium> listaMaterias = repositorioMateria.GetAll();
            
            foreach (var materia in listaMaterias)
            {
                if (materia.Nombre == Requisito.MateriaHijo.Nombre)
                    Requisito.IdMateriaHijo = materia.IdMateria;
                if (materia.Nombre == Requisito.MateriaPadre.Nombre)
                    Requisito.IdMateriaPadre = materia.IdMateria;
            }

            if(ModelState.IsValid)
            {
                IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
                String resultado = myRepoRequisito.Save(Requisito);

                if (resultado.Equals("true"))
                    return RedirectToAction("Index");
            }
            return View(Requisito);
        }

        //
        // GET: /Requisito/Edit/5

        public ActionResult Edit(int idPadre, int idHijo)
        {
            IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
            IList<Requisito> todosRequisitos = myRepoRequisito.GetAll();
            Requisito requisitoBuscado = null;
            foreach (var requisito in todosRequisitos)
            {
                if (requisito.IdMateriaPadre == idPadre && requisito.IdMateriaHijo == idHijo)
                    requisitoBuscado = requisito;
            }
            return View(requisitoBuscado);
        }

        //
        // POST: /Requisito/Edit/5

        [HttpPost]
        public ActionResult Edit(Requisito Requisito)
        {
            if(ModelState.IsValid)
            {
                IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
                String resultado = myRepoRequisito.Update(Requisito);

                if (resultado.Equals("true"))
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
                String resultado = myRepoRequisito.Delete(myRepoRequisito.GetById(id));

                if (resultado.Equals("true"))
                    return RedirectToAction("Index"); return RedirectToAction("Index");
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
