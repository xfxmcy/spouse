<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include>
<head>

</head>
<body>	

	
	<form action="" method="post" id="taskInfo" > 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 90%;">
					<tr>
						<td>任务名称 &nbsp; &nbsp;<input id="dd" class="easyui-validatebox"  name="title" type="text"  required="required" style="width: 130px;"></input></td>
						<td>任务描述 &nbsp; &nbsp;<input name="descri" id="dateclass"   style="width:300px;" />
									<input name="pid" id="parentId" value="${param.parentId}"   style="width:130px;display: none;" />
						</td>
						
					</tr>
					
					<tr>
						<td>任务来源 &nbsp; &nbsp;<input name="phOrder" id="title" style="width:130px;" class="easyui-validatebox" /></td>
						<td >
							<input name="queryType" id="queryType" value="${param.type}"   style="width:130px;display: none;" />
							<input name="id" value="${param.mid}"  style="width:130px;display: none;" />
							任务状态&nbsp; &nbsp;
							<select id="locationClass" class="easyui-combobox" name="showLocation" style="width:130px;" data-options="editable:false">  
							    <option value="0">未开始</option>  
							    <option value="1">已开始</option>  
							    <option value="2">已完成</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>任务开始时间 &nbsp; &nbsp;<input id="sdate" name="start" type="text" class="easyui-datebox" required="required" style="width: 110px;"></input></td>
						<td>是否为整天任务&nbsp;  是<input type="radio" name="allday" onclick="javascript:$('#edate').datebox('disable');" checked="checked" />&nbsp;否<input type="radio" name="allday" onclick="javascript:$('#edate').datebox('enable');" /> </td>
						<td>任务结束时间 &nbsp; &nbsp;<input id="edate" name="end" type="text" class="easyui-datebox" data-options="disabled:true" style="width: 110px;"></input></td>
					</tr>
					<tr>
						<td colspan="2">任务链接&nbsp;&nbsp;<input id="taskUrl" name="url" type="text" class="easyui-validatebox"   required="required" style="width: 180px;"></input></td>
						<td><a id="jumpTask" href="#" class="easyui-linkbutton" data-options="" onclick="taskUrl()">任务跳转</a> </td>
					</tr>
					<tr>
						<td><a id="submitTask" href="#" class="easyui-linkbutton" data-options="" onclick="submitTask()">提交</a> </td>
						<td></td>
					</tr>
				</table>
	</form>
	<script type="text/javascript">
		$('body').css('visibility','visible');
		var taskForm = null ;
		function submitTask(){
			
			if (!$('#taskInfo').form('validate')) {
				parent.parent.simpleMessAlert.call(this,'提示',"请认真填写信息");
				return ;
			}
			var taskForm =  $('#taskInfo').serialize();
			$.post('${cy}/task/taskPersistent.do',taskForm,function(json){
				parent.parent.simpleMessAlert.call(this,'提示',json.message);
				if (json.success) {
					
					//parent.$('#calendar')
					parent.$.fancybox.close();
					
				}
			},'json');
			
		}
		function taskUrl(){
			var url = $('#taskUrl').val();
			if(!url || url ==''){
				parent.parent.simpleMessAlert.call(this,'提示','task url is null');
			} 
			window.open(url,'task window','height=300,width=700,top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
		}
		$(function(){
			/*初始化页面*/
			easyloader.load(["tree","dialog", "parser", "tabs", "accordion", "layout",
					"validatebox", "combobox", "form", "blockUI", "messager",
					"validMethods", "datebox", "datagrid" ], function() {
				
				taskForm = $('#taskInfo').form({});
			});
			
		});
	</script>
</body>
</html>
