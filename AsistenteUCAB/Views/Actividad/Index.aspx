<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Actividad>>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Gestion de Actividades
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="content">
        <h1>
            Mis Actividades</h1>
        <table class="tabla">
            <td>
                <a title="Agregar Actividad" href="<%=Url.Action("Create","Actividad")%>">
                    <img src="<%=Url.Content("~/Content/agregar.png")%>" height="23px" width="23px" /></a>
            </td>
            <td>
                <%: Html.ActionLink("Agregar nueva Actividad", "Create")%>
            </td>
        </table>
    </div>
    <div id="content2">
        <div id="wrapper2" align="center">
            <div id="steps2">
                <% using (Html.BeginForm())
                   {%>
                <fieldset class="step2">
                    <legend>Quieres editar o eliminar una actividad? Buscala aqui por su nombre:</legend>
                    <p>
                        <%: Html.Label("Nombre:") %>
                        <%= Html.TextBox("actividad", null, new { @class = "text-box", AUTOCOMPLETE = "OFF" })%>
                    </p>
                    <button type="submit" id="registerButton">
                        Buscar
                    </button>
                </fieldset>
                <% } %>
            </div>
        </div>
      
        <% Html.RenderAction("MisActividades","Actividad", new { nombre = ViewData["ActividadBuscada"]});%>
        <% Html.RenderAction("ActividadesInteligentes", "Actividad", new { nombre = ViewData["ActividadBuscada"] });%>

    </div>
    <script type="text/javascript">
        jQuery.noConflict();
        jQuery(document).ready(function () {
            jQuery("input#actividad").autocomplete('<%= Url.Action("Find", "Actividad") %>');
        }); 
    </script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="HeaderContent">
    <style type="text/css">
        .style1
        {
            width: 129px;
        }
    </style>
</asp:Content>
