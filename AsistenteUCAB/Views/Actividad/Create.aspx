<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Actividad>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Nueva Actividad</h2>

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
                <%: Html.LabelFor(model => model.HoraFin) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HoraFin) %>
                <%: Html.ValidationMessageFor(model => model.HoraFin) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HoraInicio) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HoraInicio) %>
                <%: Html.ValidationMessageFor(model => model.HoraInicio) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdActividad) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.IdActividad) %>
                <%: Html.ValidationMessageFor(model => model.IdActividad) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IdMateria) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.IdMateria) %>
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
                <%: Html.LabelFor(model => model.Seccion) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Seccion) %>
                <%: Html.ValidationMessageFor(model => model.Seccion) %>
            </div>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Periodo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Periodo) %>
                <%: Html.ValidationMessageFor(model => model.Periodo) %>
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

