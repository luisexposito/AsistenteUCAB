using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{
    public class RequisitoController : Controller
    {

        protected override void Initialize(RequestContext requestContext)
        {
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IList<Materium> listaMaterias = repositorioMateria.GetAll();
            IList<String> nombresMaterias = listaMaterias.Select(listaMateria => listaMateria.Nombre).ToList();
            ViewData["MateriaPadre.Nombre"] = new SelectList(nombresMaterias);
            ViewData["MateriaHijo.Descripcion"] = new SelectList(nombresMaterias);
            base.Initialize(requestContext);
        }

        //
        // GET: /Requisito/

        public ActionResult Index()
        {
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
            IList<Requisito> listaRequisitos = myRepoRequisito.GetAll();
            foreach (var requisito in listaRequisitos)
            {
                requisito.MateriaHijo = repositorioMateria.GetById(requisito.IdMateriaHijo);
                requisito.MateriaPadre = repositorioMateria.GetById(requisito.IdMateriaPadre);
            }
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
        public ActionResult Create(Requisito requisito)
        {
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IList<Materium> listaMaterias = repositorioMateria.GetAll();
            
            foreach (var materia in listaMaterias)
            {
                if (materia.Nombre == requisito.MateriaHijo.Descripcion)
                    requisito.IdMateriaHijo = materia.IdMateria;
                if (materia.Nombre == requisito.MateriaPadre.Nombre)
                    requisito.IdMateriaPadre = materia.IdMateria;
            }

            if(ModelState.IsValid)
            {
                IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
                String resultado = myRepoRequisito.Save(requisito);

                if (resultado.Equals("true"))
                    return RedirectToAction("Index");
            }
            return View(requisito);
        }

        //
        // GET: /Requisito/Edit/5

        public ActionResult Edit(int idPadre, int idHijo)
        {
            IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
            IList<Requisito> todosRequisitos = myRepoRequisito.GetAll();
            Requisito requisitoBuscado = null;

            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            foreach (var requisito in todosRequisitos)
            {
                if (requisito.IdMateriaPadre == idPadre && requisito.IdMateriaHijo == idHijo)
                {
                    requisitoBuscado = requisito;
                    requisitoBuscado.MateriaHijo = repositorioMateria.GetById(requisito.IdMateriaHijo);
                    requisitoBuscado.MateriaPadre = repositorioMateria.GetById(requisito.IdMateriaPadre);
                }
            }
            return View(requisitoBuscado);
        }

        //
        // POST: /Requisito/Edit/5

        [HttpPost]
        public ActionResult Edit(Requisito requisito)
        {
            IRepositorio<Materium> repositorioMateria = new MateriumRepositorio();
            IList<Materium> listaMaterias = repositorioMateria.GetAll();
            
            foreach (var materia in listaMaterias)
            {
                if (materia.Nombre == requisito.MateriaPadre.Nombre)
                    requisito.IdMateriaPadre = materia.IdMateria;
            }

            if(ModelState.IsValid)
            {
                IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
                String resultado = myRepoRequisito.Update(requisito);

                if (resultado.Equals("true"))
                    return RedirectToAction("Index");
            }
            return View(requisito);
        }

        //
        // GET: /Requisito/Delete/5

        public ActionResult Delete(int idPadre, int idHijo)
        {
            IRepositorio<Requisito> myRepoRequisito = new RequisitoRepositorio();
            IList<Requisito> todosRequisitos = myRepoRequisito.GetAll();
            Requisito requisitoBuscado = null;
            
            foreach (var requisito in todosRequisitos)
            {
                if (requisito.IdMateriaPadre == idPadre && requisito.IdMateriaHijo == idHijo)
                {
                    requisitoBuscado = requisito;
                }
            }

            if(ModelState.IsValid)
            {
                String resultado = myRepoRequisito.Delete(requisitoBuscado);

                if (resultado.Equals("true"))
                    return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }
    }
}
