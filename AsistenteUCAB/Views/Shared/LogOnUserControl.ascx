<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% if (Request.IsAuthenticated)
   {
%>
<ul>
    <li>
        <img alt="avatar" src="<%:Html.GetGravatarUrl(24)%>" width="24px" height="24px" />
    </li>
    <li>
        <a class="ui-button ui-state-default ui-corner-all ui-button-text-only" href="<%: Url.Content("~/account/editprofile/") %>">
            <%: Page.User.Identity.Name %>
        </a>
    </li>
    <li>
        <a class="ui-button ui-state-default ui-corner-all ui-button-text-only" href="<%: Url.Content("~/account/logoff/") %>">
        Cerrar sesion
        </a>
    </li>
</ul>
<% }
   else
   {
%>
<ul>
    <li></li>
    <li>
        <a class="ui-state-default ui-button-text-only ui-corner-all ui-button" href='<%: Url.Content("~/account/logon/") %>'> 
            Iniciar sesion
        </a>
    </li>
</ul>
<%} %>


