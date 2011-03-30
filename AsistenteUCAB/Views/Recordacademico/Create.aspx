<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Recordacademico>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Nuevo Record Academico</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Expediente) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Expediente) %>
                <%: Html.ValidationMessageFor(model => model.Expediente) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdMateria) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.IdMateria) %>
                <%: Html.ValidationMessageFor(model => model.IdMateria) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdRecord) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.IdRecord) %>
                <%: Html.ValidationMessageFor(model => model.IdRecord) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nota) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nota) %>
                <%: Html.ValidationMessageFor(model => model.Nota) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.PeriodoAcademico) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.PeriodoAcademico) %>
                <%: Html.ValidationMessageFor(model => model.PeriodoAcademico) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Reparacion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Reparacion) %>
                <%: Html.ValidationMessageFor(model => model.Reparacion) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

