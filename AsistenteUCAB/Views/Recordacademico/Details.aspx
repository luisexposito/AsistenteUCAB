<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Recordacademico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles de Record Acaademico</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Expediente</div>
        <div class="display-field"><%: Model.Expediente %></div>
        
        <div class="display-label">IdMateria</div>
        <div class="display-field"><%: Model.IdMateria %></div>
        
        <div class="display-label">IdRecord</div>
        <div class="display-field"><%: Model.IdRecord %></div>
        
        <div class="display-label">Nota</div>
        <div class="display-field"><%: Model.Nota %></div>
        
        <div class="display-label">PeriodoAcademico</div>
        <div class="display-field"><%: Model.PeriodoAcademico %></div>
        
        <div class="display-label">Reparacion</div>
        <div class="display-field"><%: Model.Reparacion %></div>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdRecord }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

