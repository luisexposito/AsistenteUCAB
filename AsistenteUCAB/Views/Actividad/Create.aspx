<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Actividad>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva Actividad
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Gestion de Actividades</h2>

    <div id="content">
        <div id="wrapper" align="center">
            <div id="steps">
    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>

        <fieldset class="step">
            <legend>Crear nueva Actividad</legend>
            
            <p>
                <%: Html.Label("Actividad") %>
  
                <%: Html.TextBoxFor(model => model.Nombre, new { placeholder = "LAVAR LA ROPA" })%>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </p>

            <p>
                <%: Html.Label("Materia")%>
                <%: Html.DropDownList("Materia.Nombre")%>
                <%: Html.ValidationMessage("Materia.Nombre", "*")%>
            </p>

            <p>
                <%: Html.LabelFor(model => model.Expediente) %>
                <%: Html.TextBoxFor(model => model.Expediente) %>
                <%: Html.ValidationMessageFor(model => model.Expediente) %>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.HoraInicio) %>
                <%: Html.TextBoxFor(model => model.HoraInicio) %>
                <%: Html.ValidationMessageFor(model => model.HoraInicio) %>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.HoraFin) %>
                <%: Html.TextBoxFor(model => model.HoraFin) %>
                <%: Html.ValidationMessageFor(model => model.HoraFin) %>
            </p>

            <p>
                <%: Html.LabelFor(model => model.Seccion) %>
                <%: Html.TextBoxFor(model => model.Seccion) %>
                <%: Html.ValidationMessageFor(model => model.Seccion) %>
            </p>

            <p>
                <%: Html.LabelFor(model => model.Periodo) %>
                <%: Html.TextBoxFor(model => model.Periodo) %>
                <%: Html.ValidationMessageFor(model => model.Periodo) %>
            </p>
            
             <p class="submit">
                <button type="submit" id="registerButton"> Aceptar </button>
            </p>
        </fieldset>

    <% } %>
    </div>
    </div>
    </div>
    <br />
        <table>
            <td><a title="Actividades" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Listado de Actividades", "Index")%></td>
        </table>

</asp:Content>

