<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<dynamic>>" ContentType="text/xml" %>
<data>
    <% foreach (var myevent in Model) { %>
        <event id="<%=myevent.IdActividad%>">
            <start_date><![CDATA[<%=    String.Format("{0:MM/dd/yyyy HH:mm}",myevent.HoraInicio) %>]]></start_date>
            <end_date><![CDATA[<%=      String.Format("{0:MM/dd/yyyy HH:mm}",myevent.HoraFin) %>]]></end_date>
            <text><![CDATA[<%=          myevent.Nombre%>]]></text>
        </event>
    <% } %>
</data>