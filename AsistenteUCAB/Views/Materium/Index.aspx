<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Materium>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de Materias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="content">
        <h1>Gestion de Materias</h1>
    </div>
     <div style=" margin:10px auto; float:left; width:500px; position:relative; height:100%;">
        <table>
            <td><a title="Agregar Materia" href="<%=Url.Action("Create", "Materium")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
            <td><%:Html.ActionLink("Agregar Materia", "Create")%></td>
        </table>
    </div>

    <%
        using (Html.BeginForm())
        {%>
        <fieldset>
        <legend>Buscar Materia: </legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
            <%=Html.TextBox("materia", null, new {@class = "text-box"})%>
            </div>
            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Buscar"/>
            </div>
         </fieldset>
     <%
        }
        if (Model.Count() != 0)
        {%>
    <table align="center">
        <tr>
            <th>
                Nombre
            </th>
            <th>
                Periodo
            </th>
            <th>
                Creditos
            </th>
            <th>
                Horas Laboratorio
            </th>
            <th>
                Horas Practica
            </th>
            <th>
                Horas Teoria
            </th>
            
        </tr>

    <%
            foreach (var item in Model)
            {%>
    
        <tr>
            <td>
                <%:item.Nombre%>
            </td>
            <td>
                <%:item.Periodo%>
            </td>
            <td>
                <%:item.Creditos%>
            </td>
            <td>
                <%:item.HorasLab%>
            </td>
            <td>
                <%:item.HorasPractica%>
            </td>
            <td>
                <%:item.HorasTeoria%>
            </td>
            <td>
                <a title="Editar" href="<%=Url.Action("Edit", "Materium", new {id = item.IdMateria}, null)%>">
                  <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>
            </td>
            <td>
                <a title="Eliminar Materia" href="<%=Url.Action("Delete", "Materium", new {id = item.IdMateria}, null)%>">
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
        $("input#materia").autocomplete('<%= Url.Action("Find", "Materium") %>');
    }); 
    </script>

</asp:Content>

