<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Recordacademico>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion del Record Academico
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="content">
        <h1>Mi Record Academico</h1>
    </div>
    <div id="content2">
        <div id="wrapper2" align="center">
        <div id="steps2">
        <% using (Html.BeginForm()) {%>
            <fieldset class="step2">
                <legend>No encuentras una materia? Buscala por su nombre:</legend>
                <p>
                    <%: Html.Label("Nombre:") %>
                    <%= Html.TextBox("record", null, new { @class = "text-box", AUTOCOMPLETE = "OFF" })%>
                </p>
                <button type="submit" id="registerButton"> Buscar </button>
            </fieldset>

        <% } %>
        </div>
        </div>
        <%
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
         </div>
    <script type="text/javascript">
        jQuery.noConflict();
        jQuery(document).ready(function () {
            jQuery("input#record").autocomplete('<%= Url.Action("Find", "RecordAcademico") %>');
        }); 
    </script>
</asp:Content>

