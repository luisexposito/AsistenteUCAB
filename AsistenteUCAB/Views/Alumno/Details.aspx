<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Alumno>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles de Alumno</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Expediente</div>
        <div class="display-field"><%: Model.Expediente %></div>
        
        <div class="display-label">Nombre</div>
        <div class="display-field"><%: Model.Nombre %></div>

        <div class="display-label">Apellido</div>
        <div class="display-field"><%: Model.Apellido %></div>
        
        <div class="display-label">Cedula</div>
        <div class="display-field"><%: Model.Cedula %></div>
        
        <div class="display-label">CorreoUcab</div>
        <div class="display-field"><%: Model.CorreoUcab %></div>

        <div class="display-label">CorreoAlternativo</div>
        <div class="display-field"><%: Model.CorreoAlternativo %></div>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

