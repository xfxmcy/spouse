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
var nodeCurrent;
/*initial*/
$(function() {
	/*初始化页面*/
	easyloader.load(["dialog", "parser", "tabs","validatebox", "combobox", "form", "blockUI", "messager",
			"validMethods", "datebox", "datagrid" ], function() {
		$("body").css("visibility","visible");	
	});
});	
/*双击行*/
function checkRomantic(rowIndex, field, value){
	if(field != "imagefirst" && field != "imagesecond"){
		$('#imageShow').hide();	
		return;
	}
	if(value){
		$('#imageShow').css("top",event.clientY-100);
		$('#imageShow').css("left",event.clientX+40);
		$('#imageShow').css("position","absolute");
		$('#imaRo').attr('src','${cy}/resource/upload'+value);
		$('#imageShow').show();
	}	
}
/*close image*/
function closeImage(){
	
}
var romanticDialog ;
var formDia;
/*增加romantic*/
function addRomantic(){
	romanticDialog = parent.cy.dialog({
		title : 'add a romantic',
		href : '${cy}/xfxmcy/romantic/romanticForm.jsp?type=simpleSave',
		width : 680,
		height : 400,
		buttons : [ {
			text : 'add',
			handler : function() {			
				formDia = romanticDialog.find('form');
				if(!formDia.form("validate")){
					parent.simpleMessAlert.call(this,'提示',"请认真填写信息,最少上传一张图片");
					return;
				}
				$.post('${cy}/romantic/romanticPersistent.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#romanticGrid").datagrid("insertRow",{
							index : 0 ,
							row : json.result
						});
						romanticDialog.dialog('close');
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
			formDia = romanticDialog.find('form');
		}
		
	});
}
/*更新 romantic*/
function updateRomantic(){
	if ($("#romanticGrid").datagrid('getSelections').length == 1) {
		updateRomanticAble.call(this, $("#romanticGrid").datagrid('getSelected').id);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}
/*更新 romantic 确认*/
function updateRomanticAble(id){
	var nodeCurrent = $("#romanticGrid").datagrid('getSelected');
	romanticDialog = parent.cy.dialog({
			title : 'update a romantic',
			href : '${cy}/xfxmcy/romantic/romanticForm.jsp?type=simpleUpdate&mid='+id,
			width : 640,
			height : 400,
			buttons : [ {
				text : '修改',
				handler : function() {			
					formDia = romanticDialog.find('form');
					if(!formDia.form("validate")){
						parent.simpleMessAlert.call(this,'提示',"请认真填写信息,最少上传一张图片");
						return;
					}
					$.post('${cy}/romantic/romanticUpdate.do',cy.serializeObject(formDia),function(json){
						if (json.success) {
							$("#romanticGrid").datagrid("updateRow",{
								index : $("#romanticGrid").datagrid("getRowIndex",id) ,
								row : json.result
							});
							romanticDialog.dialog('close');
						}
						parent.simpleMessAlert.call(this,'提示',json.message);
					},'json');
				}
			}, {
					text : '清空',
					handler : function() {
						formDia.form('clear');	
					}
				}],
				onLoad : function(){
					formDia = romanticDialog.find('form');
					/*赋值*/
					formDia.form('load',{
						date:nodeCurrent.formattedDate,
						isyear:nodeCurrent.isyear
					});				
					formDia.find('#dateclass').val(nodeCurrent.dateclass);
					formDia.find('#title').val(nodeCurrent.title);
					formDia.find('#imagefirst').val(nodeCurrent.imagefirst);
					formDia.find('#imagesecond').val(nodeCurrent.imagesecond);
					formDia.find('#contentfirst').val(nodeCurrent.contentfirst);
					formDia.find('#contentsecond').val(nodeCurrent.contentsecond);
					formDia.find('#contentclass').combobox('setText', nodeCurrent.contentclass);
					formDia.find('#contentclass').combobox('setValue', nodeCurrent.contentclass);

				}	
			});
}
/*删除 romantic*/
function deleteRomantic(){
	if ($("#romanticGrid").datagrid('getSelections').length == 1) {
		nodeCurrent = $('#romanticGrid').datagrid('getSelected');
		parent.simpleMessConf.call(this,
				 'warning',
				 'do you sure your dicision ?',
				 function(result){
					if(result){
						deleteRomanticCheck.call(this,nodeCurrent.id);
					}
				}
			);
		
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}
/*确认删除 romantic*/
function deleteRomanticCheck(id){
	$.post('${cy}/romantic/romanticDelete/'+id+'.do',"queryType=simpleDelete",function(json){
		if (json.success) {
			$("#romanticGrid").datagrid("deleteRow",
				 $("#romanticGrid").datagrid("getRowIndex",id)
			);
		}
		parent.simpleMessAlert.call(this,'提示',json.message);
	},'json');
}
function openRomantic(){
	window.open('${cy}/romantic/index.jsp', 'romantic jing');
}
function searchRomantic(){
	var param = {};
	if(-1 != $('#romanticStatus').combo('getValue'))
		param.isyear = $('#romanticStatus').combo('getValue');
	if("" != $('#searchRomantic').val().trim())
		param.likeNameFirst = $('#searchRomantic').val();
	$('#romanticGrid').datagrid('reload',param);
	
}
</script>
<!-- toolbar -->
<div id="mainProToolbar">
	&nbsp;category &nbsp;: &nbsp; <select id="romanticStatus"
		data-options="editable:false" class="easyui-combobox" name="dept"
		style="width:100px;">
		<option value="-1">全部</option>
		<option value="1">年</option>
		<option value="0">日</option>
	</select> &nbsp;title &nbsp;: &nbsp; 
	<input size="20" type="text" id="searchRomantic"> 
	<a id="btnCurSearch" onclick="searchRomantic()" class="easyui-linkbutton"
		data-options="">查询</a>
		<div class="button-group">
			<a id="addRomantic" class="easyui-linkbutton" onclick="addRomantic()" data-options="plain:true"><label class="button-label">添加</label></a>
			<a id="updateRomantic" class="easyui-linkbutton" onclick="updateRomantic()" data-options="plain:true"><label class="button-label">修改</label></a>
			<a id="deleteRomantic" class="easyui-linkbutton" onclick="deleteRomantic()" data-options="plain:true"><label class="button-label">删除</label></a>
			<a id="openRomantic" class="easyui-linkbutton" onclick="openRomantic()" data-options="plain:true"><label class="button-label">romantic</label></a>
		</div>	
	
</div>
<!-- 项目grid -->
<div style="height: 460px;">
<!-- nowrap:false, -->
	<table class="easyui-datagrid" id="romanticGrid"
		data-options="fit:false,idField:'id',loadMsg:'正在加载…',pagination:true,title:'romantic信息维护',
			url:'${cy}/home/homeQuery.ajax?queryType=romaticPaged',toolbar:'#mainProToolbar', 
			singleSelect:true, rownumbers : true,pagination : true,  maximized:true, striped:true,
			pageSize : 5,pageList:[5],onClickCell : checkRomantic,
			checkOnSelect : false,selectOnCheck : false,singleSelect  : true
			"><!-- onClickRow:closeImage, -->
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true, width:100, align:'center'"></th>

				<th data-options="field:'formattedDate', width:100, align:'center'">日期</th>
				
				<th data-options="field:'isyear', width:60, align:'center',formatter:function(value){
					if(value == 1){
						return '是';
					}
					return '否';
				}">显示年</th>
				
				<th data-options="field:'dateclass', width:85, align:'center'">日期class</th>
				
				<th
					data-options="field:'title', width:130,align:'center'">标题</th>
					
				<th
					data-options="field:'imagefirst', width:145,align:'center'">图片1</th>
				<th
					data-options="field:'imagesecond', width:145,align:'center'">图片2</th>


				<th
					data-options="field:'contentfirst', width:145,align:'center' ">内容1</th>
				<th
					data-options="field:'contentsecond', width:145,align:'center' ">内容2</th>
				<th
					data-options="field:'contentclass', width:145,align:'center' ">内容 class</th>	
			</tr>
		</thead>
	</table>
</div>
<div id="imageShow" style="display: none">
	<img alt="photo" src="" id="imaRo">
</div>		