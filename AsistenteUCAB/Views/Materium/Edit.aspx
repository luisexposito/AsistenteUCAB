<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Materium>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Materia
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Gestion de Materias</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Editar Materia:</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Creditos) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Creditos) %>
                <%: Html.ValidationMessageFor(model => model.Creditos) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Periodo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Periodo) %>
                <%: Html.ValidationMessageFor(model => model.Periodo) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Descripcion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Descripcion) %>
                <%: Html.ValidationMessageFor(model => model.Descripcion) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HorasLab) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HorasLab, String.Format("{0:g}", Model.HorasLab)) %>
                <%: Html.ValidationMessageFor(model => model.HorasLab) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HorasPractica) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HorasPractica, String.Format("{0:g}", Model.HorasPractica)) %>
                <%: Html.ValidationMessageFor(model => model.HorasPractica) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HorasTeoria) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HorasTeoria, String.Format("{0:g}", Model.HorasTeoria)) %>
                <%: Html.ValidationMessageFor(model => model.HorasTeoria) %>
            </div>
            
            <input type="hidden" name="IdMateria" value="<%: Model.IdMateria %>" />

            <div class="editor-label">
                <input type="submit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only ui-state-hover" value="Actualizar" />
            </div>
        </fieldset>

    <% } %>

    <table>
        <td><a title="Materias" href="<%=Url.Action("Index")%>">
            <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
        <td><%: Html.ActionLink("Listado de Materias", "Index")%></td>
    </table>

</asp:Content>

