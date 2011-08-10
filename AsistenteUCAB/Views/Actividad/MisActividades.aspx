<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<AsistenteUCAB.Modelos.Actividad>>" %>
 <% if (Model.Count() != 0)
           {%>
        <div class="barraTitulo">
            <h3>Actividades Personales</h3>
        </div>
        <%
            foreach (var item in Model)
            { %>
        <table align="center" style="width: 600px">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <div class="fechaActividadInicio">
                                    <%:String.Format("{0:dd/MM/yyyy}", item.HoraInicio)%>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fechaActividadFin">
                                    <%:String.Format("{0:dd/MM/yyyy}", item.HoraFin)%>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <div class="fechaActividadInicio">
                                    <%:String.Format("{0:t}", item.HoraInicio)%>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="fechaActividadFin">
                                    <%:String.Format("{0:t}", item.HoraFin)%>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 300px">
                    <%:item.Nombre%>
                </td>
                <td style="width: 30px">
                    <a title="Editar" href="<%=Url.Action("Edit", "Actividad", new {id = item.IdActividad}, null)%>">
                        <img src="<%=Url.Content("~/Content/editar.png")%>" height="25px" width="25px" /></a>
                </td>
                <td style="width: 30px">
                    <a title="Eliminar Actividad" href="<%=Url.Action("Delete", "Actividad", new {id = item.IdActividad}, null)%>">
                        <img src="<%=Url.Content("~/Content/eliminar.png")%>" height="25px" width="25px" /></a>
                </td>
            </tr>
            <table>
                <tr>
                    <td>
                        <div class="hrs">
                        </div>
                    </td>
                </tr>
            </table>
        </table>
        <%
            }
        }%>