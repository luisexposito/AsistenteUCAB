<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Requisito>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Detalles de Requisito</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">IdMateriaHijo</div>
        <div class="display-field"><%: Model.IdMateriaHijo %></div>
        
        <div class="display-label">IdMateriaPadre</div>
        <div class="display-field"><%: Model.IdMateriaPadre %></div>
        
    </fieldset>
    <p>
        <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

