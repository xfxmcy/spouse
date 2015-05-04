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
function saveMemory(){
 	mainDialog = parent.cy.dialog({
		title : 'add a memory',
		href : '${cy}/xfxmcy/family/memory/memoryForm.jsp?type=memory',
		width : 680,
		height : 191,
		buttons : [{
			text : 'add',
			handler : function() {			
				formDia = mainDialog.find('form');
				if(!formDia.form("validate")){
					parent.simpleMessAlert.call(this,'提示',"请认真填写信息");
					return;
				}
				$.post('${cy}/memory/memoryPersistent.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#memoryGrid").datagrid("insertRow",{
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
function updateMemory(id){
	if ($("#memoryGrid").datagrid('getSelections').length == 1) {
		updateMemoryAble.call(this, $("#memoryGrid").datagrid('getSelected').id);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}

function deleteMemory(id){
	if ($("#memoryGrid").datagrid('getSelections').length == 1) {
		parent.simpleMessConf.call(this,
				 'warning',
				 'do you be sure for your dicision ?',
				 function(result){
					if(result){
						deleteMemoryAble.call(this, $("#memoryGrid").datagrid('getSelected').id);
					}
				}
		);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}
function deleteMemoryAble(id){
	$.post('${cy}/memory/memoryDelete/'+id+'.do',"queryType=memory",function(json){
		if (json.success) {
			$("#memoryGrid").datagrid("deleteRow",
				 $("#memoryGrid").datagrid("getRowIndex",id)
			);
		}
		parent.simpleMessAlert.call(this,'提示',json.message);
	},'json');
	
}

function updateMemoryAble(id){
	mainDialog = parent.cy.dialog({
		title : 'update a memory',
		href : '${cy}/xfxmcy/family/memory/memoryForm.jsp?type=memory',
		width : 680,
		height : 191,
		buttons : [ {
			text : 'update',
			handler : function() {			
				formDia = mainDialog.find('form');
				if(!formDia.form("validate")){
					parent.simpleMessAlert.call(this,'提示',"请认真填写信息");
					return;
				}
				$.post('${cy}/memory/memoryMerge.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#memoryGrid").datagrid("updateRow",{
							index : $("#memoryGrid").datagrid("getRowIndex",id) ,
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
			var rowSelected = $("#memoryGrid").datagrid("getSelected");
			formDia = mainDialog.find('form');
			formDia.form('load',{title:rowSelected.title,id:rowSelected.id,description:rowSelected.description,model:rowSelected.model,href:rowSelected.href});	
			formDia.form('load',{'queryType':'memory','currentTime':rowSelected.formattedDate});
		}
		
	});
}
/*开启 memory*/
function openMemory(){
	if ($("#memoryGrid").datagrid('getSelections').length == 1) {
		parent.simpleMessConf.call(this,
				 'warning',
				 'do you want open or close this preface?',
				 function(result){
					if(result){
						var id = $("#memoryGrid").datagrid('getSelected').id;
						var flag = $("#memoryGrid").datagrid('getSelected').flag;
						if(flag == "1"){
							$.post('${cy}/memory/memoryClose/'+id+'.do',"queryType=memory",function(json){
								if(json.success)
									$("#memoryGrid").datagrid('reload');
								parent.simpleMessAlert.call(this,'提示',json.message);
							},'json');
						}else {
							$.post('${cy}/memory/memoryOpen/'+id+'.do',"queryType=memory",function(json){
								if(json.success)
									$("#memoryGrid").datagrid('reload');
								parent.simpleMessAlert.call(this,'提示',json.message);
								},'json');
						}
					}
				 		
			});
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
	
}
</script>
<!-- toolbar -->
<div id="mainProToolbar">
	&nbsp;标题关键字 &nbsp;: &nbsp; 
	<input size="20" type="text" id="searchPublicPro"> 
	<a id="btnCurSearch" onclick="searchMemory()" class="easyui-linkbutton"
		data-options="">查询</a>
		<div class="button-group">
			<a id="enterPro" class="easyui-linkbutton" onclick="saveMemory()" data-options="plain:true">
				<label class="button-label">增加</label>
			</a>
			<a id="processPro" class="easyui-linkbutton" onclick="updateMemory()" data-options="plain:true">
				<label class="button-label">修改</label>
			</a>
			<a id="showPro" class="easyui-linkbutton" onclick="deleteMemory()" data-options="plain:true">
				<label class="button-label"><span id = "proDis">删除</span></label>
			</a>
			<a id="openPro" class="easyui-linkbutton" onclick="openMemory()" data-options="plain:true">
				<label class="button-label">启/停</label>
			</a>
		</div>	
	
</div>
<!-- 项目grid -->
<div style="height: 480px;">
	<table class="easyui-datagrid" id="memoryGrid"
		data-options="fit:false,idField:'id',loadMsg:'正在加载…',pagination:true,title:'memory信息维护',
			url:'${cy}/ours/oursQuery.ajax?queryType=memory',toolbar:'#mainProToolbar', 
			singleSelect:true, rownumbers : true,pagination : true,  maximized:true, striped:true,
			pageSize : 5,pageList:[5],fitColumns:true,
			checkOnSelect : false,selectOnCheck : false,singleSelect  : true
			">
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true, width:100, align:'center'"></th>

				<th data-options="field:'title', width:152, align:'center'">名称</th>

				<th
					data-options="field:'description', width:280,align:'center'">描述</th>
				<th
					data-options="field:'model', width:120,align:'center',formatter:function(value,row){
						return cy.transModelInFront(value).status;
					}">类型</th>
				<th
					data-options="field:'formattedDate', width:120,align:'center'">时间</th>

				<th
					data-options="field:'flag', width:160,align:'center',formatter:function(value,row){
					if(value == 1)
						return '启用';
					
					if(value == 0)
						return '停用';
					
					}">启用</th>
				
			</tr>
		</thead>
	</table>