<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.Actividad>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar la Actividad
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
            <legend>Edita actividades personales.</legend>
            <%: Html.ValidationMessage("FechaInvalida") %>
            <p>
                <%: Html.Label("Actividad") %>
  
                <%: Html.TextBoxFor(model => model.Nombre, new { placeholder = "GYM, Practica de Tennis, etc.", AUTOCOMPLETE="OFF"})%>
                <%: Html.ValidationMessageFor(model => model.Nombre) %>
            </p>

            <p>
                <%: Html.LabelFor(model => model.Expediente) %>
                <%: Html.TextBoxFor(model => model.Expediente) %>
                <%: Html.ValidationMessageFor(model => model.Expediente) %>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.HoraInicio) %>
                <%: Html.TextBoxFor(model => model.HoraInicio, new { AUTOCOMPLETE = "OFF" })%>
                <%: Html.ValidationMessageFor(model => model.HoraInicio) %>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.HoraFin) %>
                <%: Html.TextBoxFor(model => model.HoraFin, new { AUTOCOMPLETE = "OFF" })%>
                <%: Html.ValidationMessageFor(model => model.HoraFin) %>
            </p>
            <input type="hidden" name="IdActividad" value="<%: Model.IdActividad %>" />
	        <input type="hidden" name="Expediente" value="<%: Model.Expediente %>" />            
	        <input type="hidden" name="IdMateria" value="<%: Model.IdMateria %>" />
 
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
            <td><a title="Activiades" href="<%=Url.Action("Index")%>">
                <img src="<%=Url.Content("~/Content/atras.png")%>" height="25px" width="25px" /></a></td>
            <td><%: Html.ActionLink("Listado de Actividades", "Index")%></td>
        </table>

</asp:Content>


