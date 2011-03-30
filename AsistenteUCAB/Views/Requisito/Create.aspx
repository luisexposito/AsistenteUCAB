<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Requisito>" %>

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
                <%: Html.Label("MateriaPadre.Nombre")%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("MateriaPadre.Nombre")%>
                <%: Html.ValidationMessage("MateriaPadre.Nombre", "*")%>
            </div>
            
            <div class="editor-label">
                <%: Html.Label("MateriaHijo.Nombre")%>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("MateriaHijo.Nombre")%>
                <%: Html.ValidationMessage("MateriaHijo.Nombre", "*")%>
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

