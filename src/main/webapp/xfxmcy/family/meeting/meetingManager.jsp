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
/*双击行*/
function checkPhoto(rowIndex, rowData){
	
}
var mainDialog ;
var formDia ;
function saveMainPhoto(){
/* 	mainDialog = parent.cy.dialog({
		title : 'add a main photo',
		href : '${cy}/xfxmcy/family/meeting/mettingForm.jsp?type=simpleSave',
		//content : "<iframe src='${cy}/xfxmcy/family/meeting/mettingForm.jsp'  />",
		width : 880,
		height : 500,
		buttons : [ 
		]           
	}); */
	window.open('${cy}/xfxmcy/family/meeting/mettingForm.jsp?type=simpleSave','vdi Apply','top=150,left=200,height=500,width=880,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
}
function updateMainPhoto(id){
	if ($("#homeGrid").datagrid('getSelections').length == 1) {
		updateMainPhotoAble.call(this, $("#homeGrid").datagrid('getSelected').id);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}
function updateMainPhotoAble(){
	
}
function deleteMainPhoto(id){
	if ($("#homeGrid").datagrid('getSelections').length == 1) {
		deleteMainPhotoAble.call(this, $("#homeGrid").datagrid('getSelected').id);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}
function deleteMainPhotoAble(){
	
}
function constructIndex(){
	
}
</script>
<!-- toolbar -->
<div id="mainProToolbar">
	&nbsp;category &nbsp;: &nbsp; <select id="projectCheckStatus"
		data-options="editable:false" class="easyui-combobox" name="dept"
		style="width:100px;">
		<option value="-1">全部</option>
		<option value="0">首页slide</option>
		<option value="1">首页人物</option>
		<option value="2">首页 头像</option>
	</select> &nbsp;图片描述 &nbsp;: &nbsp; 
	<input size="20" type="text" id="searchPublicPro"> 
	<a id="btnCurSearch" onclick="searchProject()" class="easyui-linkbutton"
		data-options="">查询</a>
		<div class="button-group">
			<a id="enterPro" class="easyui-linkbutton" onclick="saveMainPhoto()" data-options="plain:true">
				<label class="button-label">增加</label>
			</a>
			<a id="processPro" class="easyui-linkbutton" onclick="updateMainPhoto()" data-options="plain:true">
				<label class="button-label">修改</label>
			</a>
			<a id="showPro" class="easyui-linkbutton" onclick="deleteMainPhoto()" data-options="plain:true">
				<label class="button-label"><span id = "proDis">删除</span></label>
			</a>
			<a id="frontPro" class="easyui-linkbutton" onclick="constructIndex()" data-options="plain:true">
				<label class="button-label">构建主页</label>
			</a>
		</div>	
	
</div>
<!-- 项目grid -->
<div style="height: 480px;">
	<table class="easyui-datagrid" id="homeGrid"
		data-options="fit:false,idField:'id',loadMsg:'正在加载…',pagination:true,title:'主页信息维护',
			url:'${cy}/home/homeQuery.ajax?queryType=simpleQueryPaged',toolbar:'#mainProToolbar', 
			singleSelect:true, rownumbers : true,pagination : true,  maximized:true, striped:true,
			pageSize : 5,pageList:[5],onDblClickRow : checkPhoto,
			checkOnSelect : false,selectOnCheck : false,singleSelect  : true
			">
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true, width:100, align:'center'"></th>

				<th data-options="field:'name', width:152, align:'center'">图片名称</th>

				<th data-options="field:'path', width:180, align:'center'">图片路径</th>

				<th
					data-options="field:'descri', width:330,align:'center'">图片描述</th>
				<th
					data-options="field:'type', width:130,align:'center',formatter:function(value,row){
					if(value == 1)
						return 'slider';
					
					}">图片类型</th>

				<th
					data-options="field:'showLocation', width:160,align:'center' ">展示位置</th>
				<th
					data-options="field:'phOrder', width:150,align:'center' ">排序</th>
			</tr>
		</thead>
	</table>