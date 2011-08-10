<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Página principal
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="/Scripts/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="/Scripts/dhtmlxscheduler.css" type="text/css" media="screen"
        title="no title" charset="utf-8">
        
    <script src="/Scripts/dhtmlxscheduler_recurring.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="/Scripts/dhtmlxscheduler_recurring.css" type="text/css" media="screen"
        title="no title" charset="utf-8">
    <div id="scheduler_here" class="dhx_cal_container" style="width: 943px; height: 400px;
        position: relative;">
        <div class="dhx_cal_navline">
            <div class="dhx_cal_prev_button">
                &nbsp;</div>
            <div class="dhx_cal_next_button">
                &nbsp;</div>
            <div class="dhx_cal_today_button">
            </div>
            <div class="dhx_cal_date">
            </div>
            <div class="dhx_cal_tab" name="day_tab" style="right: 204px;">
            </div>
            <div class="dhx_cal_tab" name="week_tab" style="right: 140px;">
            </div>
            <div class="dhx_cal_tab" name="month_tab" style="right: 76px;">
            </div>
        </div>
        <div class="dhx_cal_header">
        </div>
        <div class="dhx_cal_data">
        </div>
    </div>
    <script type="text/javascript">
        function init() {
            scheduler.config.xml_date = "%m/%d/%Y %H:%i";
            var date = new Date();
            scheduler.init("scheduler_here", new Date(date.getFullYear(), date.getMonth(), date.getDay()), "month");
            scheduler.load("/Actividad/Data");

            var dp = new dataProcessor("/Actividad/Save");
            dp.init(scheduler);
            dp.setTransactionMode("POST", false);
        }
        init();
    </script>
</asp:Content>
