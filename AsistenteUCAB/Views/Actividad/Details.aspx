<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Actividad>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles de Actividad</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Expediente</div>
        <div class="display-field"><%: Model.Expediente %></div>
        
        <div class="display-label">HoraFin</div>
        <div class="display-field"><%: String.Format("{0:t}", Model.HoraFin) %></div>
        
        <div class="display-label">HoraInicio</div>
        <div class="display-field"><%: String.Format("{0:t}", Model.HoraInicio) %></div>
        
        <div class="display-label">IdActividad</div>
        <div class="display-field"><%: Model.IdActividad %></div>
        
        <div class="display-label">IdMateria</div>
        <div class="display-field"><%: Model.IdMateria %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.Nombre %></div>
        
        <div class="display-label">Seccion</div>
        <div class="display-field"><%: Model.Seccion %></div>

        <div class="display-label">Periodo</div>
        <div class="display-field"><%: Model.Periodo %></div>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdActividad}) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

