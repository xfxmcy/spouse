<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include>
<head>

<script type="text/javascript">
var scheduleTitle = "";
var scheduleUrl = "";
var scheduleStart = "";
var scheduleEnd = "";
var scheduleEid = "";
var scheduleEvent = null;
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
            	
                'href':'${cy}/xfxmcy/my/schedule/task.jsp?queryType=simpleSave',
                /* 'transitionIn'  :   'elastic',
                'transitionOut' :   'elastic',
                'speedIn'       :   600, 
                'speedOut'      :   200  */
                'width':'48%',
       			'height':'80%',
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
           
           scheduleTitle = calEvent.title;
           scheduleStart = calEvent.start;
           if(!calEvent.allDay)
           		scheduleEnd = calEvent.end;
           scheduleEid = calEvent.eid;
           scheduleUrl = calEvent.url;
           scheduleEvent = calEvent;
    	   $.fancybox({//调用fancybox弹出层 
            'href':'${cy}/xfxmcy/my/schedule/task.jsp?queryType=simpleUpdate',
            'width':'48%',
   			'height':'80%',
   			'autoScale':false,
   			'transitionIn':'none',
   			'transitionOut':'none',
   			'type':'iframe',
   			'onComplete':function(){
               //'overlayShow'   :   false
   			}
           }); 
          
          // var title = window.frames["fancybox-frame"].document.getElementById("title");
           //$(title)
           
           //$('#calendar').fullCalendar('updateEvent', event);
           return false;

       },
       eventDragStart:function(event,jsEvent,ui,view) { 
    	  
       },
       eventDragStop:function( event, jsEvent, ui, view ) { 
       },
       eventResize : function(calEvent, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view){
    	   if(calEvent.allDay){
    		   parent.simpleMessAlert.call(this,'提示','allday event not allow to resize, you need to update event turn to allday-not');
    		   revertFunc();
    		   return;
    	   }
    	   parent.simpleMessConf.call(this,'Confirm', 'Are you sure to resize the taskinfo?', function(r){
				if (r){
					var param = {};
					param.id = calEvent.eid;
					param.dayDelta = dayDelta;
					param.minuteDelta = minuteDelta;
					param.queryType = 'simpleUpdate';
					$.post('${cy}/task/taskResize.do',param,function(json){
						parent.simpleMessAlert.call(this,'提示',json.message);
						if (!json.success) {
							revertFunc();
						}
					},'json');		
				}
				else
					revertFunc();
    	   });	
    	   //console.info(dayDelta);
    	   //console.info(calEvent.allDay);
    	   //$('#calendar').fullCalendar('updateEvent',calEvent);
       },
       eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
          /*  alert(
               event.title + " was moved " +
               dayDelta + " days and " +
               minuteDelta + " minutes."
           ); 

           if (allDay) {
               alert("Event is now all-day");
           }else{
               alert("Event has a time-of-day");
           }*/
           parent.simpleMessConf.call(this,'Confirm', 'Are you sure to drop the taskinfo?', function(r){
				if (r){
					var param = {};
					param.id = event.eid;
					param.dayDelta = dayDelta;
					param.minuteDelta = minuteDelta;
					param.queryType = 'simpleUpdate';
					$.post('${cy}/task/taskDrop.do',param,function(json){
						parent.simpleMessAlert.call(this,'提示',json.message);
						if (!json.success) {
							revertFunc();
						}
					},'json');		
				}
				else
					revertFunc();
   	   	   });
           //console.info(dayDelta);
           //console.info(minuteDelta);

       },
        events: function(start,end, callback) {
            $.ajax({
                url:'${cy}/task/queryTasks.do?queryType=taskForUser',
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
                 	   //if($(this).attr('allDay')!="" && $(this).attr('allDay') != undefined){
                 	    if($(this).attr('allday')!= "1"){	   
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
