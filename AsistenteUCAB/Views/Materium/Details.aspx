<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Materium>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles de Materia</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Creditos</div>
        <div class="display-field"><%: Model.Creditos %></div>
        
        <div class="display-label">Descripcion</div>
        <div class="display-field"><%: Model.Descripcion %></div>
        
        <div class="display-label">HorasLab</div>
        <div class="display-field"><%: Model.HorasLab %></div>
        
        <div class="display-label">HorasPractica</div>
        <div class="display-field"><%: Model.HorasPractica %></div>
        
        <div class="display-label">HorasTeoria</div>
        <div class="display-field"><%: Model.HorasTeoria %></div>
        
        <div class="display-label">IdMateria</div>
        <div class="display-field"><%: Model.IdMateria %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.Nombre %></div>
        
        <div class="display-label">Periodo</div>
        <div class="display-field"><%: Model.Periodo %></div>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdMateria }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

