<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Recordacademico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion del Record Academico
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion de Records Academicos</h2>
    <div align="right">
        <table>
            <td><a title="Nueva Entrada al Record Academico" href="<%=Url.Action("Create", "Materium")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
            <td><%:Html.ActionLink("Nueva Entrada al Record Academico", "Create")%></td>
        </table>
    </div>

    <%
        using (Html.BeginForm())
        {%>
        <fieldset>
        <legend>Buscar Record: </legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
            <%=Html.TextBox("nombre", null, new {@class = "text-box"})%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
        }
         if (Model.Count() != 0)
         { %>
    <table align="center">
        <tr>
            <th>
                Expediente
            </th>
            <th>
                Nombre del Alumno
            </th>
            <th>
                Materia
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

    <%
             foreach (var item in Model)
             {%>
    
        <tr>
            <td>
                <%:item.Expediente%>
            </td>
            <td>
                <%:item.Alumno.Nombre + " " + item.Alumno.Apellido%>
            </td>
            <td>
                <%:item.Materium.Nombre%>
            </td>
            <td>
                <%:item.Nota%>
            </td>
            <td>
                <%:item.PeriodoAcademico%>
            </td>
            <td>
                <%:item.Reparacion%>
            </td>
            <td>
                <a title="Editar" href="<%=Url.Action("Edit", "Recordacademico", new {id = item.IdRecord}, null)%>">
                  <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>
            </td>
            <td>
                <a title="Eliminar" href="<%=Url.Action("Delete", "Recordacademico", new {id = item.IdRecord}, null)%>">
                    <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
        </tr>
    
    <%
             }%>

    </table>
    <%
         }%>
</asp:Content>

