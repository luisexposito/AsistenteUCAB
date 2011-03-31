<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Alumno>" %>

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

    <% } %>

        <table>
            <td><a title="Materias" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Listado de Alumnos", "Index")%></td>
        </table>

</asp:Content>

