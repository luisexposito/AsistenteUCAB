using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.UI.HtmlControls;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{
    public class AlumnoController : Controller
    {
        protected override void Initialize(RequestContext requestContext)
        {

            base.Initialize(requestContext);
        }

        //
        // GET: /Alumno/

        public ActionResult Index()
        {
            IRepositorio<Alumno> myRepoAlumno = new AlumnoRepositorio();
            IList<Alumno> listaAlumnos = myRepoAlumno.GetAll();
            return View(listaAlumnos);
        }

        [HttpPost]
        public ActionResult Index(HtmlForm form)
        {
            string cadena = Request["alumno"];
            int indice = Request["alumno"].IndexOf('-') + 2;
            if (indice != 1)
            {
                string exp = cadena.Substring(indice).Trim();
                int expediente = Convert.ToInt32(exp);
                IRepositorio<Alumno> alumnoRepositorio = new AlumnoRepositorio();
                IList<Alumno> listaAlumnos = new List<Alumno> {alumnoRepositorio.GetById(expediente)};
                return View(listaAlumnos);
            }
            return View();
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
                String resultado = myRepoAlumno.Save(Alumno);

                if (resultado.Equals("true"))
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
                String resultado = myRepoAlumno.Update(Alumno);

                if (resultado.Equals("true"))
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
                String resultado = myRepoAlumno.Delete(myRepoAlumno.GetById(id));

                if (resultado.Equals("true"))
                    return RedirectToAction("Index"); return RedirectToAction("Index");
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

        public ActionResult Find(string q)
        {
            IRepositorio<Alumno> repoS = new AlumnoRepositorio();
            IList<Alumno> alumnos = repoS.GetAll();
            IList<Alumno> posiblesAlumnos = new List<Alumno>();

            foreach (var item in alumnos)
            {
                if (item.Nombre.Contains(q.ToUpper()) || item.Nombre.Contains(q.ToLower()) ||
                    item.Apellido.Contains(q.ToUpper()) || item.Apellido.Contains(q.ToLower()) ||
                    item.Expediente.ToString().Contains(q.ToUpper()) || item.Expediente.ToString().Contains(q.ToLower()))
                {
                    posiblesAlumnos.Add(item);
                }
            }
            string[] emp = new string[posiblesAlumnos.Count];
            int i = 0;
            foreach (var alumno in posiblesAlumnos)
            {
                emp[i] = alumno.Nombre + " " + alumno.Apellido + " - " + alumno.Expediente;
                i++;
            }

            return Content(string.Join("\n", emp)); ;
        }
    }
}
