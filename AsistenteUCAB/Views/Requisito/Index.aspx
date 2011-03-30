<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Requisito>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Requisitos</h2>

    <table>
        <tr>
            <th></th>
            <th>
                IdMateriaHijo
            </th>
            <th>
                IdMateriaPadre
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { idPadre=item.IdMateriaPadre, IdHijo=item.IdMateriaHijo }) %> |
                <%: Html.ActionLink("Details", "Details", new { idPadre = item.IdMateriaPadre, IdHijo = item.IdMateriaHijo })%> |
                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%: item.IdMateriaHijo %>
            </td>
            <td>
                <%: item.IdMateriaPadre %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

