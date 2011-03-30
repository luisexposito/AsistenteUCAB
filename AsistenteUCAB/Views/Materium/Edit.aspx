<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Materium>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar Materia</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
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
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdMateria) %>
            </div>
            <div class="editor-field">
                <%: Html.DisplayFor(model => model.IdMateria) %>
                <%: Html.ValidationMessageFor(model => model.IdMateria) %>
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
            
            <input type="hidden" name="IdMeteria" value="<%: Model.IdMateria %>" />

            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

