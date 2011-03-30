<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Alumno>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Alumnos</h2>

    <table>
        <tr>
            <th></th>
             <th>
                Expediente
            </th>
            <th>
                Nombre
            </th>
            <th>
                Apellido
            </th>
            <th>
                Cedula
            </th>
            <th>
                CorreoUcab
            </th>
            <th>
                CorreoAlternativo
            </th>
            
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.Expediente }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.Expediente })%> |
                <%: Html.ActionLink("Delete", "Delete", new { /* id=item.PrimaryKey */ })%>
            </td>
            <td>
                <%: item.Expediente %>
            </td>
            <td>
                <%: item.Nombre %>
            </td>
            <td>
                <%: item.Apellido %>
            </td>
            <td>
                <%: item.Cedula %>
            </td>
            <td>
                <%: item.CorreoUcab %>
            </td>
            <td>
                <%: item.CorreoAlternativo %>
            </td>
            
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

