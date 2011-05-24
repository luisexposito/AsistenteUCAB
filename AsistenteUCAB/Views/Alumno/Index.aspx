<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Alumno>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de Alumnos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion de Alumnos</h2>
    <div align="right">
        <table>
            <td><a title="Agregar Alumno" href="<%=Url.Action("Create","Alumno")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Agregar Alumno", "Create")%></td>
        </table>
    </div>

    <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Alumno: </legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
            <%= Html.TextBox("alumno",null, new { @class = "text-box" })%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
    }%>
    <% if (Model.Count() != 0)
      {%>
    <table align="center">
        <tr>
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
            
        </tr>

    <%
          foreach (var item in Model)
          {%>
    
        <tr>
            <td>
                <%:item.Expediente%>
            </td>
            <td>
                <%:item.Nombre%>
            </td>
            <td>
                <%:item.Apellido%>
            </td>
            <td>
                <%:item.Cedula%>
            </td>
            <td>
                <%:item.CorreoUcab%>
            </td>
            <td>
                <a title="Editar Alumno" href="<%=Url.Action("Edit", "Alumno", new {id = item.Expediente}, null)%>">
                  <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>
            </td>
            <td>
                <a title="Eliminar Alumno" href="<%=Url.Action("Delete", "Alumno", new {id = item.Expediente}, null)%>">
                    <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
            
        </tr>
    
    <%
          }%>

    </table>
    <%
      }%>
    <script type="text/javascript">
        $(document).ready(function () {
            $("input#alumno").autocomplete('<%= Url.Action("Find", "Alumno") %>');
        }); 
    </script>

</asp:Content>

