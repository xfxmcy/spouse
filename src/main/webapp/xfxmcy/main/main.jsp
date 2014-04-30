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
			<a id="enterPro" class="easyui-linkbutton" onclick="enterStorage()" data-options="plain:true"><label class="button-label">入库</label></a>
			<a id="processPro" class="easyui-linkbutton" onclick="processCheck()" data-options="plain:true"><label class="button-label">流程</label></a>
			<a id="showPro" class="easyui-linkbutton" onclick="displayPro()" data-options="plain:true"><label class="button-label"><span id = "proDis">展示</span></label></a>
			<a id="frontPro" class="easyui-linkbutton" onclick="frontCheck()" data-options="plain:true"><label class="button-label">项目前台</label></a>
		</div>	
	
</div>
<!-- 项目grid -->
<div style="height: 480px;">
	<table class="easyui-datagrid" id="homeGrid"
		data-options="fit:false,idField:'id',loadMsg:'正在加载…',pagination:true,title:'主页信息维护',
			url:'${cy}/home/homeQuery.ajax?queryType=simpleQueryPaged',toolbar:'#mainProToolbar', 
			singleSelect:true, rownumbers : true,pagination : true,  maximized:true, striped:true,
			pageSize : 5,pageList:[5],
			checkOnSelect : false,selectOnCheck : false,singleSelect  : true
			">
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true, width:100, align:'center'"></th>

				<th data-options="field:'name', width:140, align:'center'">图片名称</th>

				<th data-options="field:'path', width:120, align:'center'">图片路径</th>

				<th
					data-options="field:'descri', width:290,align:'center'">图片描述</th>
				<th
					data-options="field:'type', width:90,align:'center'">图片类型</th>


				<th
					data-options="field:'show_location', width:115,align:'center' ">展示位置</th>
				<th
					data-options="field:'ph_order', width:110,align:'center' ">排序</th>
			</tr>
		</thead>
	</table>