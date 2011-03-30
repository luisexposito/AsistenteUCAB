<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Actividad>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Actividades</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Expediente
            </th>
            <th>
                HoraFin
            </th>            
            <th>
                HoraInicio
            </th>
            <th>
                IdActividad
            </th>
            <th>
                IdMateria
            </th>
            <th>
                Nombre
            </th>
            <th>
                Seccion
            </th>
            <th>
                Periodo
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.IdActividad }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.IdActividad })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.IdActividad })%>
            </td>
            <td>
                <%: item.Expediente %>
            </td>
            <td>
                <%: String.Format("{0:t}", item.HoraFin) %>
            </td>
            <td>
                <%: String.Format("{0:t}", item.HoraInicio) %>
            </td>
            <td>
                <%: item.IdActividad %>
            </td>
            <td>
                <%: item.IdMateria %>
            </td>
            <td>
                <%: item.Nombre %>
            </td>
            <td>
                <%: item.Seccion %>
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

