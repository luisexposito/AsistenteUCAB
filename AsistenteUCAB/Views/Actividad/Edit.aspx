<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TwoColumn.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Actividad>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Editar Actividad</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Expediente) %>
            </div>
            <div class="editor-field">
                <%: Html.DisplayFor(model => model.Expediente) %>
                <%: Html.ValidationMessageFor(model => model.Expediente) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HoraFin)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.HoraFin.TimeOfDay) %>
                <%: Html.ValidationMessageFor(model => model.HoraFin) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.HoraInicio) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => Model.HoraInicio.TimeOfDay) %>
                <%: Html.ValidationMessageFor(model => model.HoraInicio) %>
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
            
            <input type="hidden" name="IdActividad" value="<%: Model.IdActividad %>" />
	        <input type="hidden" name="Expediente" value="<%: Model.Expediente %>" />            
	        <input type="hidden" name="IdMateria" value="<%: Model.IdMateria %>" />            
	    <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

