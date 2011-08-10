<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Actividad>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nueva Actividad
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript">
    jQuery.noConflict();
    jQuery(function () {
        jQuery("#HoraFin").datetimepicker();
        jQuery("#HoraInicio").datetimepicker();
    });
 </script>

    <div id="content">        <h1>Gestion de Actividades</h1>
    </div>
    <div id="content2">
    <%: Html.ValidationSummary(true) %>
        <div id="wrapper" align="center">
            <div id="steps">
    <% using (Html.BeginForm()) {%>
        
        <fieldset class="step">
            <legend>Persolaniza tu horario y agrega tus actividades personales.</legend>
            <%: Html.ValidationMessage("FechaInvalida") %>
            <p>
                <%: Html.Label("Actividad") %>
  
                <%: Html.TextBoxFor(model => model.Nombre, new { placeholder = "GYM, Practica de Tennis, etc." })%>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
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

