<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include>
<head>
	<style type="text/css">
		#calendar{width:960px; margin:20px auto 10px auto}
		.fancy{width:450px; height:auto}
		.fancy h3{height:30px; line-height:30px; border-bottom:1px solid #d3d3d3; font-size:14px}
		.fancy form{padding:10px}
		.fancy p{height:28px; line-height:28px; padding:4px; color:#999}
		.input{height:20px; line-height:20px; padding:2px; border:1px solid #d3d3d3; width:100px}
		.btn{-webkit-border-radius: 3px;-moz-border-radius:3px;padding:5px 12px; cursor:pointer}
		.btn_ok{background: #360;border: 1px solid #390;color:#fff}
		.btn_cancel{background:#f0f0f0;border: 1px solid #d3d3d3; color:#666 }
		.btn_del{background:#f90;border: 1px solid #f80; color:#fff }
		.sub_btn{height:32px; line-height:32px; padding-top:6px; border-top:1px solid #f0f0f0; text-align:right; position:relative}
		.sub_btn .del{position:absolute; left:2px}
	</style>
</head>
<body onload="initTask()">
<script type="text/javascript">
	function initTask(){
		if("${param.queryType}" == "simpleUpdate"){
			
			$("#title").val(parent.window.scheduleTitle);
			$("#url").val(parent.window.scheduleUrl);
			$("#eid").val(parent.window.scheduleEid);
			var sheduleDate = parent.window.scheduleStart;
			var formattedStart = changeDate(sheduleDate);
			$("#start").datetimebox('setValue', formattedStart);
			$("#taskInfo").form('validate');
			$("#eventName").html("编辑事件") ;
			
			if(!parent.window.scheduleEvent.allDay || parent.window.scheduleEvent.allDay == "false"){
				var sheduleDate = parent.window.scheduleEnd;
				if(!sheduleDate || sheduleDate == null)
					return;
				var formattedEnd = changeDate(sheduleDate);
				$("#end").datetimebox('setValue', formattedEnd);
				$("[name = allday][value = 0]:radio").attr("checked", true);
				$('#end').datetimebox('enable');
				
			}
		}
		else
			$("#eventName").html("创建事件") ;
		
	}
	function changeDate(datetime){
		 var year = datetime.getFullYear();
		 var month = datetime.getMonth()+1;//js从0开始取 
		 var date = datetime.getDate(); 
		 var hour = datetime.getHours(); 
		 var minutes = datetime.getMinutes(); 
		 var second = datetime.getSeconds();
		 return year+"-"+month+"-"+date+" "+hour+":"+minutes+":"+second;
	}
</script>
	<div style="top: 10px; left: 10px; width: 450px; height: 320px; overflow: auto;">
		<h3 id="eventName">事件</h3>	
		<form action="" method="post" id="taskInfo" > 
		<p>日程内容：<input type="text" class="input" name="title" id="title" style="width:320px" placeholder="记录你将要做的一件事..."/>
			<input name="queryType" id="queryType" value="${param.queryType}"   style="width:130px;display: none;" />
			<input name="status"  value="1"   style="width:130px;display: none;" />
			<input name="flag"  value="1"   style="width:130px;display: none;" />
			<input name="id" id="eid"    style="width:130px;display: none;" />
			<input name="taskFrom"  value="1"   style="width:130px;display: none;" />
			<input name="taskStatus"  value="1"   style="width:130px;display: none;" />	
			<input name="businessId"  value="1"   style="width:130px;display: none;" />
		</p>
	    <p>开始时间：<input id="start" name="start" type="text" class="easyui-datetimebox" data-options="required:true"  style="width: 110px;"></input></p>
	    
	   	<p>      
	   		是否为全天任务&nbsp;  是<input type="radio" value="1" name="allday" onclick="javascript:$('#end').datebox('disable');" checked="checked" />&nbsp;否<input type="radio" name="allday" value="0" onclick="javascript:$('#end').datetimebox('enable');" /></p> 
	    <p>
	   	  	结束时间 ：<input id="end" name="end" type="text" class="easyui-datetimebox" data-options="disabled:true" style="width: 110px;"></input>      
	    </p>
	    <p>任务链接：<input id="url" class="input" name="url" type="text"  style="width: 180px"></input>
	   	  	<a id="jumpTask" href="#" class="easyui-linkbutton" data-options="" onclick="taskUrl()">任务跳转</a>      
	    </p>
	    <br/>
	    <div class="sub_btn">
	    	<span class="del">
	    		<input type="button" class="btn btn_del" onclick="deleteTask()" id="del_event" value="删除">
	    	</span>
	    	<input type="button" class="btn btn_ok" value="确定" onclick="submitTask()"> 
	    	<input type="button" class="btn btn_cancel" value="取消" onClick="parent.$.fancybox.close()"></div>
		</form>
	</div>
	<script type="text/javascript">
		$('body').css('visibility','visible');
		var taskForm = null ;
		function submitTask(){
			
			if (!$('#taskInfo').form('validate')) {
				parent.parent.simpleMessAlert.call(this,'提示',"请认真填写信息");
				return ;
			}
			//var taskForm =  $('#taskInfo').serialize();
			var taskForm =  cy.serializeObject($('#taskInfo'));
			if("${param.queryType}" == "simpleUpdate"){
				parent.parent.simpleMessConf.call(this,'Confirm', 'Are you sure to update the taskinfo?', function(r){
					if (r){
						updateTask.call(this,taskForm);		
					}
				});
					
			}
			else if("${param.queryType}" == "simpleSave"){
				parent.parent.simpleMessConf.call(this,'Confirm', 'Are you sure to save the taskinfo?', function(r){
					if (r){
						saveTask.call(this,taskForm);		
					}
				});
			}
			
		}
		function saveTask(taskForm){
			var source = [];
			$.post('${cy}/task/taskPersistent.do',taskForm,function(json){
				parent.parent.simpleMessAlert.call(this,'提示',json.message);
				if (json.success) {
					taskForm.eid = json.result.id;
					source[0] = taskForm;
					parent.$('#calendar').fullCalendar('addEventSource',source);
					parent.$.fancybox.close();
				}
			},'json');
		}
		
		function updateTask(taskForm){
			var schEvent = parent.window.scheduleEvent;
			//console.info(schEvent);
			schEvent.title = taskForm.title;
			schEvent.url = taskForm.url;
			if(taskForm.allday == '1' || taskForm.allday == 1){
				schEvent.end = null;
				schEvent.allDay = true;
			}
			else{
				schEvent.end = new Date(taskForm.end);
				schEvent.allDay = false;
			}
			//taskForm.allday = taskForm.allday == '1'?true:false;
			schEvent.start = new Date(taskForm.start);
			//parent.$('#calendar').fullCalendar('refetchEvents');
			//parent.$.fancybox.close();
			$.post('${cy}/task/taskUpdate.do',taskForm,function(json){
				parent.parent.simpleMessAlert.call(this,'提示',json.message);
				if (json.success) {
					parent.$('#calendar').fullCalendar('updateEvent',schEvent);
					parent.$.fancybox.close();
				}
			},'json'); 
		}
		
		function deleteTask(){
			parent.parent.simpleMessConf.call(this,'Confirm', 'Are you sure to delete the taskinfo?', function(r){
				if (r){
					$.post('${cy}/task/taskDelete/' + $("#eid").val() + '.do',"queryType=simpleDelete",function(json){
						parent.parent.simpleMessAlert.call(this,'提示',json.message);
						if (json.success) {
							//removeEvents
							parent.$('#calendar').fullCalendar('refetchEvents');
							parent.$.fancybox.close();
						}
					},'json');		
				}
			});
		}
		
		function taskUrl(){
			var url = $('#url').val();
			if(!url || url ==''){
				parent.parent.simpleMessAlert.call(this,'提示','task url is null');
				return;
			} 
			window.open(url,'task window','height=300,width=700,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		}
		$(function(){
			/*初始化页面*/
			easyloader.load(["tree","dialog", "parser", "tabs", "accordion", "layout",
					"validatebox", "combobox", "form", "blockUI", "messager",
					"validMethods", "datebox", "datagrid" ], function() {
				
			});
			
		});
	</script>
</body>
</html>
