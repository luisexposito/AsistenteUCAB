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
        // GET: /Materium/

        [HttpPost]
        public ActionResult Index(HtmlForm form)
        {
            string nombre = Request["materia"];
            IRepositorio<Materium> myRepoMaterium = new MateriumRepositorio();
            IList<Materium> todasMateriums = myRepoMaterium.GetAll();
            IList<Materium> listaMateriums = new List<Materium>();
            foreach (var materium in todasMateriums)
            {
                if (materium.Nombre == nombre)
                    listaMateriums.Add(materium);
            }
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
                String resultado = myRepoMaterium.Save(Materium);

                if (resultado.Equals("true"))
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
                String resultado = myRepoMaterium.Update(Materium);

                if (resultado.Equals("true"))
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
                String resultado = myRepoMaterium.Delete(myRepoMaterium.GetById(id));

                if (resultado.Equals("true"))
                    return RedirectToAction("Index"); return RedirectToAction("Index");
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

        public ActionResult Find(string q)
        {
            IRepositorio<Materium> repoS = new MateriumRepositorio();
            IList<Materium> materiums = repoS.GetAll();
            IList<Materium> posiblesMaterias = new List<Materium>();

            foreach (var item in materiums)
            {
                if (item.Nombre.Contains(q.ToUpper()) || item.Nombre.Contains(q.ToLower()))
                {
                    posiblesMaterias.Add(item);
                }
            }
            string[] emp = new string[posiblesMaterias.Count];
            int i = 0;
            foreach (var materia in posiblesMaterias)
            {
                emp[i] = materia.Nombre;
                i++;
            }

            return Content(string.Join("\n", emp)); ;
        }
    }
}
