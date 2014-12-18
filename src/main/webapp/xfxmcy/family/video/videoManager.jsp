<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include>
<style>
	.button-group{ margin:20px 0 10px 10px;}
	.search-group{ line-height:40px; margin:10px 20px;}
	.button-label{ margin:0 5px; cursor:pointer;}
</style>
<script type="text/javascript" charset="utf-8">
/*initial*/
$(function() {
	/*初始化页面*/
	easyloader.load(["dialog", "parser", "tabs","validatebox", "combobox", "form", "blockUI", "messager",
			"validMethods", "datebox", "datagrid" ], function() {
		$("body").css("visibility","visible");	
	});
});	

var mainDialog ;
var formDia ;
function saveVideo(){
 	mainDialog = parent.cy.dialog({
		title : 'add a video',
		href : '${cy}/xfxmcy/family/video/videoForm.jsp?type=simpleSave',
		width : 880,
		height : 500,
		buttons : [{
			text : 'add',
			handler : function() {			
				formDia = mainDialog.find('form');
				if(!formDia.form("validate")){
					parent.simpleMessAlert.call(this,'提示',"请认真填写信息");
					return;
				}
				$.post('${cy}/video/videoPersistent.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#videoGrid").datagrid("insertRow",{
							index : 0 ,
							row : json.result
						});
						mainDialog.dialog('close');
					}
					parent.simpleMessAlert.call(this,'提示',json.message);
				},'json');
				
			} 
		}, {
			text : 'clean',
			handler : function() {
				formDia.form('clear');	
			}
		}],
		onLoad : function(){
			formDia = mainDialog.find('form');
		}
		
	});
}
function updateVideo(id){
	if ($("#videoGrid").datagrid('getSelections').length == 1) {
		updateVideoAble.call(this, $("#videoGrid").datagrid('getSelected').id);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}

function deleteVideo(id){
	if ($("#videoGrid").datagrid('getSelections').length == 1) {
		parent.simpleMessConf.call(this,
				 'warning',
				 'do you be sure for your dicision ?',
				 function(result){
					if(result){
						deleteVideoAble.call(this, $("#videoGrid").datagrid('getSelected').id);
					}
				}
		);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}
function deleteVideoAble(id){
	$.post('${cy}/video/videoDelete/'+id+'.do',"queryType=simpleDelete",function(json){
		if (json.success) {
			$("#videoGrid").datagrid("deleteRow",
				 $("#videoGrid").datagrid("getRowIndex",id)
			);
		}
		parent.simpleMessAlert.call(this,'提示',json.message);
	},'json');
	
}
/*构建 setting file*/
function constructSetting(){
	parent.simpleMessConf.call(this,
				 'warning',
				 'do you want refresh musicial template ?',
				 function(result){
					if(result){
						$.post('${cy}/video/templateMusic.do',"queryType=simpleQueryOnly",function(json){
								parent.simpleMessAlert.call(this,'提示',json.message);
							},'json');
					}
				}
		);
}
function updateVideoAble(id){
	mainDialog = parent.cy.dialog({
		title : 'update a video',
		href : '${cy}/xfxmcy/family/video/videoForm.jsp?type=simpleUpdate',
		width : 680,
		height : 400,
		buttons : [ {
			text : 'update',
			handler : function() {			
				formDia = mainDialog.find('form');
				if(!formDia.form("validate")){
					parent.simpleMessAlert.call(this,'提示',"请认真填写信息");
					return;
				}
				$.post('${cy}/video/videoMerge.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#videoGrid").datagrid("updateRow",{
							index : $("#videoGrid").datagrid("getRowIndex",id) ,
							row : json.result
						});
						mainDialog.dialog('close');
					}
					parent.simpleMessAlert.call(this,'提示',json.message);
				},'json');
				
			} 
		}, {
			text : 'clean',
			handler : function() {
				formDia.form('clear');	
			}
		}],
		onLoad : function(){
			formDia = mainDialog.find('form');
			formDia.form('load',$("#videoGrid").datagrid("getSelected"));	
		}
		
	});
}
</script>
<!-- toolbar -->
<div id="mainProToolbar">
	&nbsp;category &nbsp;: &nbsp; <select id="projectCheckStatus"
		data-options="editable:false" class="easyui-combobox" name="dept"
		style="width:100px;">
		<option value="-1">全部</option>
		<option value="0">视频</option>
		<option value="1">音乐</option>
	</select> &nbsp;描述 &nbsp;: &nbsp; 
	<input size="20" type="text" id="searchPublicPro"> 
	<a id="btnCurSearch" onclick="searchVideo()" class="easyui-linkbutton"
		data-options="">查询</a>
		<div class="button-group">
			<a id="enterPro" class="easyui-linkbutton" onclick="saveVideo()" data-options="plain:true">
				<label class="button-label">增加</label>
			</a>
			<a id="processPro" class="easyui-linkbutton" onclick="updateVideo()" data-options="plain:true">
				<label class="button-label">修改</label>
			</a>
			<a id="showPro" class="easyui-linkbutton" onclick="deleteVideo()" data-options="plain:true">
				<label class="button-label"><span id = "proDis">删除</span></label>
			</a>
			<a id="frontPro" class="easyui-linkbutton" onclick="constructSetting()" data-options="plain:true">
				<label class="button-label">构建音乐配置文件</label>
			</a>
		</div>	
	
</div>
<!-- 项目grid -->
<div style="height: 480px;">
	<table class="easyui-datagrid" id="videoGrid"
		data-options="fit:false,idField:'id',loadMsg:'正在加载…',pagination:true,title:'视频信息维护',
			url:'${cy}/video/videoQuery.ajax?queryType=simpleQueryPaged',toolbar:'#mainProToolbar', 
			singleSelect:true, rownumbers : true,pagination : true,  maximized:true, striped:true,
			pageSize : 5,pageList:[5],
			checkOnSelect : false,selectOnCheck : false,singleSelect  : true
			">
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true, width:100, align:'center'"></th>

				<th data-options="field:'name', width:152, align:'center'">名称</th>

				<th data-options="field:'url', width:180, align:'center'">路径</th>

				<th
					data-options="field:'description', width:330,align:'center'">描述</th>
				<th
					data-options="field:'type', width:130,align:'center',formatter:function(value,row){
					if(value == 1)
						return 'video';
					
					if(value == 0)
						return 'mp3';
					
					}">类型</th>

				<th
					data-options="field:'flag', width:160,align:'center',formatter:function(value,row){
					if(value == 1)
						return '启用';
					
					if(value == 0)
						return '停用';
					
					}">启用</th>
				<th
					data-options="field:'formattedCreateTime', width:150,align:'center' ">创建时间</th>
			</tr>
		</thead>
	</table>