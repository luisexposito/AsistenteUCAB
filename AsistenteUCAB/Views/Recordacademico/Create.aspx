<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Recordacademico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva Entrada al Record Academico
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion de Records Academicos</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Nueva Entrada al Record Academico:</legend>
            
            <div class="editor-label">
                <%: Html.Label("Estudiante")%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("Alumno.Nombre")%>
                <%: Html.ValidationMessage("Alumno.Nombre")%>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Materia") %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("Materium.Nombre")%>
                <%: Html.ValidationMessage("Materium.Nombre")%>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Nota")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("Nota")%>
                <%: Html.ValidationMessage("Nota")%>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("PeriodoAcademico")%>
            </div>
            <div class="editor-field">
                <%: Html.TextBox("PeriodoAcademico")%>
                <%: Html.ValidationMessage("PeriodoAcademico")%>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Reparacion")%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("Reparacion")%>
                <%: Html.ValidationMessage("Reparacion")%>
            </div>
            
            <div class="editor-label">
                <input type="submit" value="Aceptar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover"/>
            </div>
        </fieldset>

    <% } %>

        <table>
            <td><a title="Records Academicos" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Listado de Records Academicos", "Index")%></td>
        </table>
    
</asp:Content>

