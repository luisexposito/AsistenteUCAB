<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Modelos.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Iniciar sesión
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="content">
        <h1>Iniciar Sesion</h1>
    </div>
    <div id="content2">
    <%: Html.ValidationSummary(true) %>
        <div id="wrapper" align="center">
            <div id="steps">
    <% using (Html.BeginForm()) {%>
        
        <fieldset class="step">
            <legend>Si no estas registrado en la red, tu invitamos a hacerlo: <%: Html.ActionLink("Registrate!", "Register") %></legend>
            
            <%: Html.ValidationMessage("NCIncorrecto")%>
            <p>
                <%: Html.LabelFor(model => model.UserName) %>
                <%: Html.TextBoxFor(model => model.UserName)%>
                <%: Html.ValidationMessageFor(model => model.UserName, "*")%>
            </p>
            
            <p>
                <%: Html.LabelFor(model => model.Password) %>
                <%: Html.PasswordFor(model => model.Password)%>
                <%: Html.ValidationMessageFor(model => model.Password, "*")%>
            </p>

             <p class="submit">
                <button type="submit" id="registerButton"> Iniciar sesion </button>
            </p>
        </fieldset>

    <% } %>
    </div>
    </div>
    </div>
</asp:Content>
