<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Materium>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva Materia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion de Materias</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Crear nueva Materia:</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Creditos) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Creditos) %>
                <%: Html.ValidationMessageFor(model => model.Creditos) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Descripcion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Descripcion) %>
                <%: Html.ValidationMessageFor(model => model.Descripcion) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HorasLab)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HorasLab) %>
                <%: Html.ValidationMessageFor(model => model.HorasLab) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HorasPractica) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HorasPractica) %>
                <%: Html.ValidationMessageFor(model => model.HorasPractica) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HorasTeoria) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HorasTeoria) %>
                <%: Html.ValidationMessageFor(model => model.HorasTeoria) %>
            </div>
           
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Periodo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Periodo) %>
                <%: Html.ValidationMessageFor(model => model.Periodo) %>
            </div>
            
            <div class="editor-label">
                <input type="submit" value="Aceptar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover"/>
            </div>
        </fieldset>
    <% } %>

    <br />
        <table>
            <td><a title="Materias" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Listado de Materias", "Index")%></td>
        </table>
    

</asp:Content>

