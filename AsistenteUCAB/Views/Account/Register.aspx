<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Alumno>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Registrarse
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    
    
    <script type="text/javascript" src="<%:Url.Content("~/Scripts/sliding.form.js") %>"></script>    
    <%: Html.ValidationSummary(true) %>    <div id="content">    <h1>Gestion de Usuarios</h1>
    <h2>Forma parte de nuestra red,  AsistenteUCAB y aprueba tus materias</h2>
    <br />
    <br />
        <div id="wrapper">
            <div id="steps">
    <% using (Html.BeginForm("Register", "Account", FormMethod.Post, new { id = "formElem", name = "formElem" }))
       {%>
         <fieldset class="step">
            <legend>Cuenta</legend>
            <p>
                <%: Html.LabelFor(model => model.Username) %>
                <%: Html.TextBoxFor(model => model.Username, new { AUTOCOMPLETE = "OFF" })%>
                <%: Html.ValidationMessage("Alumno.Username")%>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.Password) %>
                <%: Html.PasswordFor(model => model.Password, new { AUTOCOMPLETE = "OFF" })%>
                <%: Html.ValidationMessage("Alumno.Password")%>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.ConfirmPassword)%>
                <%: Html.PasswordFor(model => model.ConfirmPassword, new { AUTOCOMPLETE = "OFF" })%>
                <%: Html.ValidationMessage("Alumno.ConfirmPassword")%>
            </p>
            <%: Html.ValidationMessage("contrasenia")%>
            <%: Html.ValidationMessage("passOrUsername")%>
        </fieldset>
        <fieldset class="step">
            <legend>Datos personales</legend>

            <p>
                <%: Html.LabelFor(model => model.Nombre) %>
                <%: Html.TextBox("Alumno.Nombre")%>
                <%: Html.ValidationMessage("Alumno.Nombre")%>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.Apellido)%>
                <%: Html.TextBox("Alumno.Apellido")%>
                <%: Html.ValidationMessage("Alumno.Apellido")%>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.Sexo)%>
                <%: Html.DropDownList("Alumno.Sexo")%>
            </p>

            <p>
                <%: Html.LabelFor(model => model.Cedula)%>
                <%: Html.TextBoxFor(model => model.Cedula, new { AUTOCOMPLETE = "OFF" })%>
                <%: Html.ValidationMessage("Alumno.Cedula")%>
            </p>

            <p>
                <%: Html.LabelFor(model => model.CorreoAlternativo)%>
                <%: Html.TextBoxFor(model => model.CorreoAlternativo, new { placeholder = "ejemplo@dominio.com", type = "email", AUTOCOMPLETE = "OFF" })%>
                <%: Html.ValidationMessage("Alumno.CorreoAlternativo")%>
            </p>
            
        </fieldset>
        
        <fieldset class="step">
            <legend>Donde vives?</legend>
            <p>
                <%: Html.LabelFor(model => model.Direccion.Ciudad) %>
                <%: Html.TextBox("Alumno.Direccion.Ciudad")%>
                <%: Html.ValidationMessage("Alumno.Direccion.Ciudad")%>
            </p>

            <p>
                <%: Html.LabelFor(model => model.Direccion.Municipio)%>
                <%: Html.TextBox("Alumno.Direccion.Municipio")%>
                <%: Html.ValidationMessage("Alumno.Direccion.Municipio")%>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.Direccion.Localidad)%>
                <%: Html.TextBox("Alumno.Direccion.Localidad")%>
                <%: Html.ValidationMessage("Alumno.Direccion.Localidad")%>
            </p>
            
        </fieldset>
        
        <fieldset class="step">
        <legend>Datos UCAB</legend>
            <p>
                <%: Html.LabelFor(model => model.Expediente) %>
                <%: Html.TextBoxFor(model => model.Expediente, new { AUTOCOMPLETE = "OFF" })%>
                <%: Html.ValidationMessage("Alumno.Expediente")%>
            </p>

            <p>
                <%: Html.LabelFor(model => model.CorreoUcab)%>
                <%: Html.TextBoxFor(model => model.CorreoUcab, new { AUTOCOMPLETE = "OFF" })%>
                <%: Html.ValidationMessage("Alumno.CorreoUcab")%>
            </p>
            <p class="submit">
                <button type="submit" id="Button1"> Aceptar </button>
            </p>
        </fieldset>

       
    <% } %>
    </div>
    <div id="navigation" style="display:none;">
        <ul>
            <li class="selected">
                <a href="#">Cuenta</a>
            </li>
            <li>
                <a href="#">Datos personales</a>
            </li>
            <li>
                <a href="#">Donde vives?</a>
            </li>
            <li>
                <a href="#">Datos UCAB</a>
            </li>
        </ul>
    </div>
    </div>
    </div>
</asp:Content>
