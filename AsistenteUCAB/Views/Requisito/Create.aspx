<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Requisito>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Nuevo Requisito</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdMateriaHijo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.IdMateriaHijo) %>
                <%: Html.ValidationMessageFor(model => model.IdMateriaHijo) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdMateriaPadre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.IdMateriaPadre) %>
                <%: Html.ValidationMessageFor(model => model.IdMateriaPadre) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

