<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Requisito>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva Prelacion
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Gestion de Prelaciones</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Crear nueva prelacion:</legend>
            
            <div class="editor-label">
                <%: Html.Label("Nombre de la materia")%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("MateriaHijo.Descripcion")%>
                <%: Html.ValidationMessage("MateriaHijo.Descripcion", "*")%>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("Prelada por")%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("MateriaPadre.Nombre")%>
                <%: Html.ValidationMessage("MateriaPadre.Nombre", "*")%>
            </div>

            <div class="editor-label">
                <input type="submit" value="Aceptar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover"/>
            </div>
        </fieldset>

    <% } %>

    <table>
        <td><a title="Prelaciones" href="<%=Url.Action("Index")%>">
            <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Listado de Prelaciones", "Index")%></td>
    </table>

</asp:Content>

