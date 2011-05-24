<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Actividad>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de Actividades
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion de Actividades</h2>

     <div align="right">
        <table>
            <td><a title="Agregar Actividad" href="<%=Url.Action("Create","Actividad")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Agregar nueva Actividad", "Create")%></td>
        </table>
    </div>

    <% using (Html.BeginForm())
    {%>
        <fieldset>
        <legend>Buscar Actividad: </legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
            <%= Html.TextBox("actividad",null, new { @class = "text-box" })%>
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
                IdActividad
            </th>
            <th>
                Nombre
            </th>       
            <th>
                HoraInicio
            </th>
            <th>
                HoraFin
            </th>
            <th>
                IdMateria
            </th>
            <th>
                Seccion
            </th>
            <th>
                Periodo
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
                <%:item.IdActividad%>
            </td>
            <td>
                <%:item.Nombre%>
            </td>
            <td>
                <%:String.Format("{0:t}", item.HoraFin)%>
            </td>
            <td>
                <%:String.Format("{0:t}", item.HoraInicio)%>
            </td>
            <td>
                <%:item.IdMateria%>
            </td>
            <td>
                <%:item.Seccion%>
            </td>
            <td>
                <%:item.Periodo%>
            </td>
            <td>
                <a title="Editar" href="<%=Url.Action("Edit", "Actividad", new {id = item.IdActividad}, null)%>">
                  <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>
            </td>
            <td>
                <a title="Eliminar Actividad" href="<%=Url.Action("Delete", "Actividad", new {id = item.IdActividad}, null)%>">
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
        $("input#actividad").autocomplete('<%= Url.Action("Find", "Actividad") %>');
        }); 
    </script>

</asp:Content>

