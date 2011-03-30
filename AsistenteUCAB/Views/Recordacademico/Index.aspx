<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Recordacademico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Records Academicos</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Expediente
            </th>
            <th>
                IdMateria
            </th>
            <th>
                IdRecord
            </th>
            <th>
                Nota
            </th>
            <th>
                PeriodoAcademico
            </th>
            <th>
                Reparacion
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.IdRecord}) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.IdRecord })%> |
                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%: item.Expediente %>
            </td>
            <td>
                <%: item.IdMateria %>
            </td>
            <td>
                <%: item.IdRecord %>
            </td>
            <td>
                <%: item.Nota %>
            </td>
            <td>
                <%: item.PeriodoAcademico %>
            </td>
            <td>
                <%: item.Reparacion %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

