<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Materium>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete</h2>

    <h3>Are you sure you want to delete this?</h3>
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
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%: Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>

