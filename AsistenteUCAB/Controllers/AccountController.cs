using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using AsistenteUCAB.Modelos;
using AsistenteUCAB.Repositorios;

namespace AsistenteUCAB.Controllers
{

    [HandleError]
    public class AccountController : Controller
    {

        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }

        // **************************************
        // URL: /Account/LogOn
        // **************************************

        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ValidateUser(model.UserName, model.Password))
                {
                    FormsService.SignIn(model.UserName, model.RememberMe);
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "El nombre de usuario o la contraseña especificados son incorrectos.");
                }
            }

            // Si llegamos a este punto, es que se ha producido un error y volvemos a mostrar el formulario
            return View(model);
        }

        // **************************************
        // URL: /Account/LogOff
        // **************************************

        public ActionResult LogOff()
        {
            FormsService.SignOut();

            return RedirectToAction("Index", "Home");
        }

        // **************************************
        // URL: /Account/Register
        // **************************************

        public IEnumerable<string> GetCountryList()
        {
            List<string> list = new List<string>();
            CultureInfo[] cultures =
                        CultureInfo.GetCultures(CultureTypes.InstalledWin32Cultures |
                        CultureTypes.SpecificCultures);
            foreach (CultureInfo info in cultures)
            {
                RegionInfo info2 = new RegionInfo(info.LCID);
                if (!list.Contains(info2.EnglishName))
                {
                    list.Add(info2.DisplayName);
                }
            }
            return list;
        }

        public ActionResult Register()
        {
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            ViewData["Pais"] = new SelectList(GetCountryList());
            return View();
        }

        [HttpPost]
        public ActionResult Register(Alumno alumno)
        {

            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipService.CreateUser(alumno.Username, alumno.Password, alumno.CorreoUcab);
                IRepositorio<Alumno> repositorioAlumno = new AlumnoRepositorio();
                string resultado = repositorioAlumno.Save(alumno);

                if (resultado.Equals("true"))
                    if (createStatus == MembershipCreateStatus.Success)
                    {
                        FormsService.SignIn(alumno.Username, false /* createPersistentCookie */);
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
                    }
            }

            // If we got this far, something failed, redisplay form
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            ViewData["Pais"] = new SelectList(GetCountryList());
            return View();
        }

        // **************************************
        // URL: /Account/ChangePassword
        // **************************************

        [Authorize]
        public ActionResult ChangePassword()
        {
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword))
                {
                    return RedirectToAction("ChangePasswordSuccess");
                }
                else
                {
                    ModelState.AddModelError("", "La contraseña actual es incorrecta o la nueva contraseña no es válida.");
                }
            }

            // Si llegamos a este punto, es que se ha producido un error y volvemos a mostrar el formulario
            ViewData["PasswordLength"] = MembershipService.MinPasswordLength;
            return View(model);
        }

        // **************************************
        // URL: /Account/ChangePasswordSuccess
        // **************************************

        public ActionResult ChangePasswordSuccess()
        {
            return View();
        }

        [Authorize]
        public ActionResult EditProfile()
        {
            MembershipUser user = Membership.GetUser();
            IRepositorio<Alumno> repositorioAlumno = new AlumnoRepositorio();
            Alumno usuario = repositorioAlumno.GetByUniqueAtribute(User.Identity.Name);
            usuario.Theme = this.HttpContext.Profile.GetPropertyValue("Theme").ToString();
            usuario.CreationDate = user.CreationDate.ToShortDateString();
            return View(usuario);
        }

        [Authorize]
        [HttpPost]
        public ActionResult EditProfileBasic(Alumno usuario)
        {
            IRepositorio<Alumno> repositorioAlumno = new AlumnoRepositorio();
            Alumno miUsuario = repositorioAlumno.GetByUniqueAtribute(User.Identity.Name);
            if (string.IsNullOrWhiteSpace(miUsuario.CorreoUcab))
            {
                ModelState.AddModelError("", "Email no puede ser vacio.");
            }
            else
                if (MembershipService.ChangeEmail(User.Identity.Name, miUsuario.CorreoUcab) == false)
                {
                    ModelState.AddModelError("", "El email no es valido.");
                }
            if (repositorioAlumno.Update(miUsuario) != "true")
            {
                ModelState.AddModelError("", "Error al actualizar sus datos, por favor intente de nuevo.");
                return RedirectToAction("EditProfile");
            }
            return RedirectToAction("Index", "Home");
        }

        [Authorize]
        [HttpPost]
        public ActionResult EditProfileDetails(ProfileModel model)
        {
            if (ModelState.IsValid)
            {
                if (string.IsNullOrWhiteSpace(model.Theme))
                {
                    ModelState.AddModelError("", "A theme must be selected.");
                }
                else
                {
                    this.HttpContext.Profile.SetPropertyValue("Theme", model.Theme);
                }
            }
            return RedirectToAction("EditProfile");
        }

    }
}
