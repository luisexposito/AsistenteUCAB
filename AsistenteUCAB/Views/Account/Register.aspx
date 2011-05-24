<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Alumno>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Registrarse
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Crear una nueva cuenta</h2>
    <p>
        Use el siguiente formulario para crear una nueva cuenta. 
    </p>
    <p>
        Las contraseñas deben tener una longitud mínima de <%: ViewData["PasswordLength"] %> caracteres.
    </p>

    <% using (Html.BeginForm()) { %>
        <%: Html.ValidationSummary(true, "No se creó la cuenta. Corrija los errores e inténtelo de nuevo.") %>
        <div>
            <fieldset>
                <legend>Información de cuenta</legend>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Username) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(m => m.Username)%>
                    <%: Html.ValidationMessageFor(m => m.Username)%>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.Password) %>
                    <%: Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-field">
                    <%: Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%: Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Expediente) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Expediente) %>
                    <%: Html.ValidationMessageFor(model => model.Expediente) %>
                </div>
            
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Nombre) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Nombre) %>
                    <%: Html.ValidationMessageFor(model => model.Nombre) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Apellido) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Apellido) %>
                    <%: Html.ValidationMessageFor(model => model.Apellido) %>
                </div>
            
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Cedula) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Cedula) %>
                    <%: Html.ValidationMessageFor(model => model.Cedula) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.CorreoUcab) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.CorreoUcab) %>
                    <%: Html.ValidationMessageFor(model => model.CorreoUcab) %>
                </div>

                <div class="editor-label">
                    <%: Html.LabelFor(model => model.CorreoAlternativo) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.CorreoAlternativo) %>
                    <%: Html.ValidationMessageFor(model => model.CorreoAlternativo) %>
                </div>
            
                <div class="editor-label">
                    <input type="submit" value="Aceptar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover"/>
                </div>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
