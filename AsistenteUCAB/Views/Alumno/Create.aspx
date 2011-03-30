<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Alumno>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Nuevo Alumno</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Apellido) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Apellido) %>
                <%: Html.ValidationMessageFor(model => model.Apellido) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Cedula) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Cedula) %>
                <%: Html.ValidationMessageFor(model => model.Cedula) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CorreoAlternativo) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CorreoAlternativo) %>
                <%: Html.ValidationMessageFor(model => model.CorreoAlternativo) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.CorreoUcab) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.CorreoUcab) %>
                <%: Html.ValidationMessageFor(model => model.CorreoUcab) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Expediente) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Expediente) %>
                <%: Html.ValidationMessageFor(model => model.Expediente) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nombre) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nombre) %>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
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

