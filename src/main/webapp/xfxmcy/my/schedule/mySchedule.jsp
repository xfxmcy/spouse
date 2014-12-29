<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include>
<head>
<link rel='stylesheet' href='${cy}/js/fullcalendar/cupertino/jquery-ui.min.css' />
<link rel="stylesheet" href="${cy}/js/fullcalendar/fullcalendar.css"/>
<link rel="stylesheet" href="${cy}/js/fullcalendar/fancybox.css"/>
<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${cy}/js/fullcalendar/jquery-ui.custom.min.js"></script>
<script type="text/javascript" src="${cy}/js/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="${cy}/js/fullcalendar/jquery.fancybox-1.3.1.pack.js"></script>

<script type="text/javascript">
$(function() { 
	//$("body").css("visibility","visible");
	$('#calendar').fullCalendar({
		//theme: false,
		theme: true,
        editable:true,  
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
        //editable: false,  
        height : 400,
        weekMode : 'liquid',
        currentTimezone: 'Asia/Beijing',
        /**/
        dayClick: function(date, allDay, jsEvent, view) { 
           // var selDate =$.fullCalendar.formatDate(date,'yyyy-MM-dd');//格式化日期 
            //console.info(date+","+allDay+","+jsEvent+","+view);
          
            $.fancybox({//调用fancybox弹出层 
            	
                'href':'${cy}/xfxmcy/my/schedule/task.jsp?type=add',
                /* 'transitionIn'  :   'elastic',
                'transitionOut' :   'elastic',
                'speedIn'       :   600, 
                'speedOut'      :   200  */
                'width':'85%',
    			'height':'62%',
    			'autoScale':false,
    			'transitionIn':'none',
    			'transitionOut':'none',
    			'type':'iframe'
                //'overlayShow'   :   false
            }); 
            
        },
       /**/
       eventClick: function(calEvent) {
           /* window.open(calEvent.url);
           return false; */
    	   $.fancybox({//调用fancybox弹出层 
            'href':'${cy}/xfxmcy/my/schedule/task.jsp?type=update',
            'width':'85%',
   			'height':'62%',
   			'autoScale':false,
   			'transitionIn':'none',
   			'transitionOut':'none',
   			'type':'iframe'
               //'overlayShow'   :   false
           }); 
           return false;

       },
       eventDragStart:function(event,jsEvent,ui,view) { 
       },
       eventDragStop:function( event, jsEvent, ui, view ) { 
       },
       eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
		   console.info(event);
          /*  alert(
               event.title + " was moved " +
               dayDelta + " days and " +
               minuteDelta + " minutes."
           ); */

           if (allDay) {
               alert("Event is now all-day");
           }else{
               alert("Event has a time-of-day");
           }

           if (!confirm("你确定要改变此任务吗?")) {
               revertFunc();
           }

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
                 			  	eid : $(this).attr('id'),
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
                 			  eid : $(this).attr('id'),
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
	$("body").css("visibility","visible");
}); 
	
</script>
</head>

<body>
	 <div style="font-family: 楷体;margin-top: 2%">
	      <div id="calendar" align="center"></div>
		  <div style="display:none">
	  			<div id="inline" style="width:400px; height:160px; overflow:auto">
	     		</div>
		  </div>
	  </div>
		
</body>
</html>
