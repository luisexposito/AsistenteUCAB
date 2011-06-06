<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<AsistenteUCAB.Controllers.ActividadActionResponseModel>" ContentType="text/xml"%>
<data>
    <action type="<%= Model.Status %>" sid="<%= Model.Source_id %>" tid="<%= Model.Target_id %>"></action>
</data>