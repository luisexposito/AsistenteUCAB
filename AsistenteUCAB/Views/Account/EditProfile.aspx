<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Alumno>" %>
<%@ Import Namespace="AsistenteUCAB.Modelos" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
    <script type="text/javascript" src="<%:Url.Content("~/Scripts/jquery.loadimages.1.0.1.js") %>"></script>
    <script type="text/javascript">
        $(document).ready(initialiseSettings);
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Perfil
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div id="editprofile">
    <div id="tab_userdetails">
    <% using (Html.BeginForm("editprofilebasic", "Account"))
       { %>
        <%: Html.ValidationSummary(true, "Error actualizando el perfil. Por favor arrefle los errores e intente de nuevo.") %>
        <fieldset>
        <legend>Datos personales:</legend>
        <div class="editor-row">
            <div class="editor-label">
                <%: Html.LabelFor(m => m.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.DisplayFor(m => m.Nombre) %>
            </div>
        </div>    

        <div class="editor-row">
            <div class="editor-label">
                <%: Html.LabelFor(m => m.Apellido) %>
            </div>
            <div class="editor-field">
                <%: Html.DisplayFor(m => m.Apellido) %>
            </div>
        </div>    
              
        <div class="editor-row">
            <div class="editor-label">
                <%:Html.Label("Correo UCAB:") %>
            </div>
            <div class="editor-field">
                <%:Html.TextBoxFor(m => m.CorreoUcab) %>
            </div>
            <%: Html.ValidationFor<Alumno>(m => m.CorreoUcab)%>
        </div>

        <div class="editor-row">
            <div class="editor-label">
                <%:Html.Label("Correo Alternativo:") %>
            </div>
            <div class="editor-field">
                <%:Html.TextBoxFor(m => m.CorreoAlternativo) %>
            </div>
            <%: Html.ValidationFor<Alumno>(m => m.CorreoAlternativo)%>
        </div>

        <div class="editor-row">
            <div class="editor-label">
            </div>
            <br />
            <p>
                <input type="submit" value="Aceptar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover"/>
            </p>
        </div>
        </fieldset>
    <% } %>
    <% using (Html.BeginForm("editprofiledetails", "Account"))
       { %>
        <%: Html.ValidationSummary(true, "Error actualizando el perfil. Por favor arrefle los errores e intente de nuevo.")%>
        <fieldset>
        <legend>Datos de su cuenta:</legend>
        <div class="editor-row">
            <div class="editor-label">
                <%: Html.Label("Nombre de usuario:") %>
            </div>
            <div class="editor-field">
                <%:Html.DisplayFor(m => m.Username) %>
            </div>
        </div>
        <div class="editor-row">
            <div class="editor-label">
                <%: Html.Label("Fecha de registro:") %>
            </div>
            <div class="editor-field">
                <%:Html.DisplayFor(m => m.CreationDate)%>
            </div>
        </div>
        <div class="editor-row">
            <div class="editor-label">
                <%: Html.Label("Avatar:") %>
            </div>
            <div class="editor-field">
                <img alt="avatar" src="<%:Html.GetGravatarUrl(120)%>" width="120px" height="120px" />
            </div>
        </div>
        <div class="editor-row">
            <div class="editor-label">
                <%: Html.Label("Tema:") %>
            </div>
            <div class="editor-field">
                <select name="Theme" id="theme">
                    <%foreach (var theme in (IList<string>)Application["themes"])
                      {%>
                    <% if (theme == Model.Theme)
                       {%>
                    <option selected="selected">
                        <%:theme%></option>
                    <% }
                       else
                       {%>
                    <option>
                        <%:theme%></option>
                    <% }%>
                    <%} %>
                </select>
            </div>
            <div id="thememessage"><span>Este tema no esta salvado!</span></div>
        </div>

        <div class="editor-row">
            <div class="editor-label">
            </div>
            <br />
            <p>
                 <input type="submit" value="Aceptar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" />
            </p>
        </div>
        </fieldset>
    <% } %>
        <br />
    </div>

</div>

</asp:Content>
