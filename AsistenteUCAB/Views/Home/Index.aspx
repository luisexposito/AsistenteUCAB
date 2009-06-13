﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Página principal
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        
        <script src="/Scripts/dhtmlxscheduler.js" type="text/javascript"></script>
	    <link href="/Scripts/dhtmlxscheduler.css" rel="stylesheet" type="text/css" />
	    
        
        <div style='width:900px; height:500px;'>
		    <div id="scheduler_here" class="dhx_cal_container" style=' height:100%;'>
			    <div class="dhx_cal_navline">
				    <div class="dhx_cal_prev_button">&nbsp;</div>
				    <div class="dhx_cal_next_button">&nbsp;</div>
				    <div class="dhx_cal_today_button"></div>
				    <div class="dhx_cal_date"></div>
				    <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
				    <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
				    <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
			    </div>
			    <div class="dhx_cal_header">
			    </div>
			    <div class="dhx_cal_data">
			    </div>		
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
