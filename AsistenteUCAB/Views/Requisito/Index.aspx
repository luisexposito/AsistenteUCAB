<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Requisito>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Gestion de Prelaciones
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion de Prelaciones</h2>
    <div align="right">
        <table>
            <td><a title="Nueva Prelacion" href="<%=Url.Action("Create", "Requisito")%>">
                <img src="<%=Url.Content("~/Content/agregar.png")%>" height="25px" width="25px" /></a></td>
            <td><%:Html.ActionLink("Nueva Prelacion", "Create")%></td>
        </table>
    </div>

    <%
        using (Html.BeginForm())
        {%>
        <fieldset>
        <legend>Buscar Prelaciones: </legend>
            
            <div class="editor-label">
                <label for="Nombre">Nombre:</label>
            </div>
            <div class="editor-field">
            <%=Html.TextBox("requisito", null, new {@class = "text-box"})%>
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
                Materia
            </th>
            <th>
                Prelada Por:
            </th>
        </tr>

    <%
             foreach (var item in Model)
             {%>
    
        <tr>
            <td>
                <%:item.MateriaHijo.Nombre%>
            </td>
            <td>
                <%:item.MateriaPadre.Nombre%>
            </td>
            <td>
                <a title="Editar" href="<%=Url.Action("Edit", "Requisito", new {idPadre = item.IdMateriaPadre, idHijo = item.IdMateriaHijo}, null)%>">
                  <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>
            </td>
            <td>
                <a title="Eliminar" href="<%=Url.Action("Delete", "Requisito", new {idPadre = item.IdMateriaPadre, idHijo = item.IdMateriaHijo}, null)%>">
                    <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
            </td>
        </tr>
    
    <%
             }%>

    </table>
    <%
         }%>

</asp:Content>

