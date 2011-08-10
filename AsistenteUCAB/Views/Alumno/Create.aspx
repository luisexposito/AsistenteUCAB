<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Alumno>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nuevo Alumno
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion de Alumnos</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Agregar nuevo alumno:</legend>
            
            <div class="editor-label">
                <%: Html.Label("Alumno.Expediente") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("Alumno.Expediente")%>
                <%: Html.ValidationMessage("Alumno.Expediente")%>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Alumno.Nombre") %>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("Alumno.Nombre")%>
                <%: Html.ValidationMessage("Alumno.Nombre")%>
            </div>

            <div class="editor-label">
                <%: Html.Label("Alumno.Apellido")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("Alumno.Apellido")%>
                <%: Html.ValidationMessage("Alumno.Apellido")%>
            </div>

            <div class="editor-label">
                <%: Html.Label("Alumno.Sexo")%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("Alumno.Sexo")%>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Alumno.Username")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("Alumno.Username")%>
                <%: Html.ValidationMessage("Alumno.Username")%>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Alumno.Cedula")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("Alumno.Cedula")%>
                <%: Html.ValidationMessage("Alumno.Cedula")%>
            </div>

            <div class="editor-label">
                <%: Html.Label("Alumno.CorreoUcab")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("Alumno.CorreoUcab")%>
                <%: Html.ValidationMessage("Alumno.CorreoUcab")%>
            </div>

            <div class="editor-label">
                <%: Html.Label("Alumno.CorreoAlternativo")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("Alumno.CorreoAlternativo")%>
                <%: Html.ValidationMessage("Alumno.CorreoAlternativo")%>
            </div>
            
            <div class="editor-label">
                <input type="submit" value="Aceptar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover"/>
            </div>
        </fieldset>

    <% } %>

        <table>
            <td><a title="Materias" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Listado de Alumnos", "Index")%></td>
        </table>

</asp:Content>

