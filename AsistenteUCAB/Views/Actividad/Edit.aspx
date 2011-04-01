<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Actividad>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion de Actividades</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Editar Actividad:</legend>
            
              
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </div>
             
            <div class="editor-label">
                <%: Html.Label("Materia")%>
            </div>
            <div class="editor-field">
                <%: Html.DisplayFor(model => model.Materia.Nombre)%>
                <%: Html.ValidationMessage("Materia.Nombre", "*")%>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Expediente) %>
            </div>
            <div class="editor-field">
                <%: Html.DisplayFor(model => model.Expediente) %>
                <%: Html.ValidationMessageFor(model => model.Expediente) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HoraInicio) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => Model.HoraInicio) %>
                <%: Html.ValidationMessageFor(model => model.HoraInicio) %>
            </div>

             <div class="editor-label">
                <%: Html.LabelFor(model => model.HoraFin)%>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.HoraFin)%>
                <%: Html.ValidationMessageFor(model => model.HoraFin) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Seccion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Seccion) %>
                <%: Html.ValidationMessageFor(model => model.Seccion) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Periodo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Periodo) %>
                <%: Html.ValidationMessageFor(model => model.Periodo) %>
            </div>
            
            <input type="hidden" name="IdActividad" value="<%: Model.IdActividad %>" />
	        <input type="hidden" name="Expediente" value="<%: Model.Expediente %>" />            
	        <input type="hidden" name="IdMateria" value="<%: Model.IdMateria %>" />            
	        
            <div class="editor-label">
                <input type="submit" value="Aceptar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover"/>
            </div>
        </fieldset>

    <% } %>
    <br />
        <table>
            <td><a title="Activiades" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Listado de Actividades", "Index")%></td>
        </table>

</asp:Content>

