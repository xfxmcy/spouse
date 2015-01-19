<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>schedule</title>
<link rel="shortcut icon" href="${cy}/icon/favicon.ico" type="image/x-icon"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${cy}/style.css" rel="stylesheet" type="text/css" />
</head>
<link rel='stylesheet' href='${cy}/js/fullcalendar/cupertino/jquery-ui.min.css' />
<link rel="stylesheet" href="${cy}/js/fullcalendar/fullcalendar.css"/>
<link rel="stylesheet" href="${cy}/js/fullcalendar/fancybox.css"/>
<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${cy}/js/fullcalendar/jquery-ui.custom.min.js"></script>
<script type="text/javascript" src="${cy}/js/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="${cy}/js/fullcalendar/jquery.fancybox-1.3.1.pack.js"></script>
<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/xfUtil.js"></script>
<script type="text/javascript">
$(function() { 
	//$("body").css("visibility","visible");
	$.post("${cy}/ours/oursQuery.ajax", {
			queryType:'preface',
			model: cy.reverseModelInFront("schedule").status
			},function(data){
				if(data.total > 0){
					if(data.rows[0].image && data.rows[0].image != ''){
						$("#schedulePhoto").attr('src','${cy}' + cy.uploadPath + data.rows[0].image);	
					}
					$("#scheduleContent").html(data.rows[0].content); 
					$("#scheduleTitle").html(data.rows[0].title); 
				}
			
			},'json');
	
	
	
	$('#calendar').fullCalendar({
		theme: true,  
        editable:false,  
        header: {     
           left:  'prev,next',    
           center: 'title',  
           right: 'month,agendaWeek,agendaDay' //right: 'month,agendaWeek,agendaDay'    
        },
        axisFormat: 'H(:mm)tt',
        //timeFormat: 'H:mm',
        allDayText:"全天事件", 
        monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
        monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
        dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],  
        dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"],  
        today: ["今天"],  
        firstDay: 1,  
        buttonText: {  
          today: '今天',  
          month: '月',  
          week: '周',  
          day: '日' 
        },  
        //minTime : 7,
        editable: false,  
        height : 400,
        weekMode : 'liquid',
        currentTimezone: 'Asia/Beijing',
        /**
        dayClick: function(date, allDay, jsEvent, view) { 
            var selDate =$.fullCalendar.formatDate(date,'yyyy-MM-dd');//格式化日期 
            console.info(date+","+allDay+","+jsEvent+","+view);
            $.fancybox({//调用fancybox弹出层 
                'href':'#inline'
            }); 
        },
       **/
       eventClick: function(calEvent) {
           window.open(calEvent.url);
           return false;

       },
        events: function(start,end, callback) {
            $.ajax({
                url:'${cy}/task/queryTasks.do',
                dataType: 'json',
                type: "post",
                data: {
                    start:start.getTime(),
                    end: end.getTime()
                    //username : '${param.username}'
                },
                success:function(result) {
                	var events =[];
                    $(result).each(function() {
                 	   if($(this).attr('end')!="" && $(this).attr('end') != undefined){
                 		   events.push({
                 			   title : $(this).attr('title'),
                                url : $(this).attr('url'),
                                businessId : $(this).attr('businessId'),
                                taskFrom:$(this).attr('taskFrom'),
                                taskStatus : $(this).attr('taskStatus'),
                                flag: $(this).attr('flag'),
                                status: $(this).attr('status'),
                                start: new Date($(this).attr('start')), // will be parsed
                                end: new Date($(this).attr('end')),
                                allDay: false
                            }); 
                 	   }else{
                 		   events.push({
                 			  title : $(this).attr('title'),
                              url : $(this).attr('url'),
                              businessId : $(this).attr('businessId'),
                              taskFrom:$(this).attr('taskFrom'),
                              taskStatus : $(this).attr('taskStatus'),
                              flag: $(this).attr('flag'),
                              status: $(this).attr('status'),
                              start: new Date($(this).attr('start'))// will be parsed
                            });
                 	   }
                 	   
                        
                     });
                    callback(events);
                },
                error:function(info){
                //	alert(info);
                }
            });
        }
		
	});
	$('.fc-header-title h2').css('color','blue');
}); 
</script>
<body>
<div id="container">
  <div class="header">
       <div class="logo"  >
    		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="349" height="220">
		 	 <param name="movie" value="media.swf" />
		 	<param name="quality" value="high" />
		 	 <param name="allowScriptAccess" value="always" />
		 	 <param name="wmode" value="transparent"/>
		  	   <embed src="${cy}/media/media.swf"
		  	    quality="high"
		  	    type="application/x-shockwave-flash"
			      WMODE="transparent"
			      width="349"
			      height="220"
			      pluginspage="http://www.macromedia.com/go/getflashplayer"
			      allowScriptAccess="always" />
			</object>
    	</div>
    <div class="menu">
      <ul>
        <li><a href="${cy}/spouse/managerment/guest.do">home</a></li>
        <li><a href="${cy}/spouse/managerment/ours.do">ours</a></li>
        <li><a href="${cy}/spouse/managerment/hers.do">her</a></li>
        <li><a href="${cy}/spouse/managerment/his.do">him</a></li>
        <li><a href="${cy}/spouse/managerment/message.do">Contact her/him</a></li>
        <li><a href="${cy}/spouse/managerment/schedule.do">schedule</a></li>
      </ul>
    </div>
  </div>
  <div class="main">
    <div class="services">
      <div class="service_bg">
        <h3>our dream</h3>
        <ul class="link">
          <li>looking meteor shower<a href="#"><strong>		together</strong></a></li>
          <li>sunrise<a href="#"><strong>	together</strong></a></li>
          <li>sea<a href="#"><strong>	together</strong></a></li>
        </ul>
        <p>i am not happy beca se</p>
      </div>
      <div class="clr"></div>
    </div>
    <div class="global_main">
      <div class="page_title_text">
        <h1>cy</h1>
      </div>
      <div class="clr"></div>
      <div style="background-color: white;font-family: 楷体">
	      <div id="calendar"></div>
		  <div style="display:none">
	  			<div id="inline" style="width:400px; height:160px; overflow:auto">
	     		</div>
		  </div>
	  </div>
      <div class="block_text">
        <div class="block_full">
          <p class="title">
          <img src="${cy}/images/tian.jpg" width="138" height="132" hspace="10" vspace="5" align="left" alt="schedulePhoto" id="schedulePhoto" />
          <span id="scheduleTitle"></span>
          </p>
          <p id="scheduleContent"></p>
          <div class="clr"></div>
        </div>
        <div class="clr"></div>
      </div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="footer">
    <div class="footer_text">
      <ul>
        <li><a href="${cy}/spouse/managerment/guest.do">home</a></li>
        <li><a href="${cy}/spouse/managerment/ours.do">ours</a></li>
        <li><a href="${cy}/spouse/managerment/hers.do">her</a></li>
        <li><a href="${cy}/spouse/managerment/his.do">him</a></li>
        <li><a href="${cy}/spouse/managerment/message.do">Contact her/him</a></li>
        <li><a href="${cy}/spouse/managerment/schedule.do">schedule</a></li>
      </ul>
      <div class="clr"></div>
       <p>Copyright © 2013-2015 xfxmcy.com. All rights reserved.</p>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>