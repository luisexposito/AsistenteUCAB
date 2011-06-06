<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<dynamic>>" ContentType="text/xml" %>
<data>
    <% foreach (var myevent in Model) { %>
        <event id="<%=myevent.idActividad%>">
            <start_date><![CDATA[<%=    String.Format("{0:MM/dd/yyyy HH:mm}",myevent.horaInicio) %>]]></start_date>
            <end_date><![CDATA[<%=      String.Format("{0:MM/dd/yyyy HH:mm}",myevent.horaFin) %>]]></end_date>
            <text><![CDATA[<%=          myevent.nombre%>]]></text>
        </event>
    <% } %>
</data>