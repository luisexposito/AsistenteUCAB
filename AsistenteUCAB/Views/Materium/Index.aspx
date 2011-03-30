<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Materium>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Materias</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Creditos
            </th>
            <th>
                Descripcion
            </th>
            <th>
                HorasLab
            </th>
            <th>
                HorasPractica
            </th>
            <th>
                HorasTeoria
            </th>
            <th>
                IdMateria
            </th>
            <th>
                Nombre
            </th>
            <th>
                Periodo
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.IdMateria }) %> |
                <%: Html.ActionLink("Details", "Details", new { id = item.IdMateria })%> |
                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%: item.Creditos %>
            </td>
            <td>
                <%: item.Descripcion %>
            </td>
            <td>
                <%: item.HorasLab %>
            </td>
            <td>
                <%: item.HorasPractica %>
            </td>
            <td>
                <%: item.HorasTeoria %>
            </td>
            <td>
                <%: item.IdMateria %>
            </td>
            <td>
                <%: item.Nombre %>
            </td>
            <td>
                <%: item.Periodo %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

