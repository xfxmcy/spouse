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
function savePreface(){
 	mainDialog = parent.cy.dialog({
		title : 'add a preface',
		href : '${cy}/xfxmcy/family/preface/prefaceForm.jsp?type=preface',
		width : 620,
		height : 340,
		buttons : [{
			text : 'add',
			handler : function() {			
				formDia = mainDialog.find('form');
				if(!formDia.form("validate")){
					parent.simpleMessAlert.call(this,'提示',"请认真填写信息");
					return;
				}
				$.post('${cy}/preface/prefacePersistent.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#prefaceGrid").datagrid("insertRow",{
							index : 0 ,
							row : json.result
						});
						mainDialog.dialog('close');
					}
					parent.simpleMessAlert.call(this,'提示',json.message);
				},'json');
				
			} 
		}, {
			text : 'cancel',
			handler : function() {
				mainDialog.dialog('close');
			}
		}],
		onLoad : function(){
			formDia = mainDialog.find('form');
		}
		
	});
}
function updatePreface(id){
	if ($("#prefaceGrid").datagrid('getSelections').length == 1) {
		updatePrefaceAble.call(this, $("#prefaceGrid").datagrid('getSelected').id);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}

function deletePreface(id){
	if ($("#prefaceGrid").datagrid('getSelections').length == 1) {
		parent.simpleMessConf.call(this,
				 'warning',
				 'do you be sure for your dicision ?',
				 function(result){
					if(result){
						deletePrefaceAble.call(this, $("#prefaceGrid").datagrid('getSelected').id);
					}
				}
		);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}
function deletePrefaceAble(id){
	$.post('${cy}/preface/prefaceDelete/'+id+'.do',"queryType=preface",function(json){
		if (json.success) {
			$("#prefaceGrid").datagrid("deleteRow",
				 $("#prefaceGrid").datagrid("getRowIndex",id)
			);
		}
		parent.simpleMessAlert.call(this,'提示',json.message);
	},'json');
	
}

function updatePrefaceAble(id){
	mainDialog = parent.cy.dialog({
		title : 'update a preface',
		href : '${cy}/xfxmcy/family/preface/prefaceForm.jsp?type=preface',
		width : 620,
		height : 340,
		buttons : [ {
			text : 'update',
			handler : function() {			
				formDia = mainDialog.find('form');
				if(!formDia.form("validate")){
					parent.simpleMessAlert.call(this,'提示',"请认真填写信息");
					return;
				}
				$.post('${cy}/preface/prefaceMerge.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#prefaceGrid").datagrid("updateRow",{
							index : $("#prefaceGrid").datagrid("getRowIndex",id) ,
							row : json.result
						});
						mainDialog.dialog('close');
					}
					parent.simpleMessAlert.call(this,'提示',json.message);
				},'json');
				
			} 
		}, {
			text : 'cancel',
			handler : function() {
				mainDialog.dialog('close');
			}
		}],
		onLoad : function(){
			formDia = mainDialog.find('form');
			formDia.form('load',$("#prefaceGrid").datagrid("getSelected"));
			formDia.form('load',{'queryType':'preface','flag':'0'});
			//$("#queryType").val("preface");
		}
		
	});
}


function openPreface(){
	if ($("#prefaceGrid").datagrid('getSelections').length == 1) {
		parent.simpleMessConf.call(this,
				 'warning',
				 'do you want open or close this preface?',
				 function(result){
					if(result){
						var id = $("#prefaceGrid").datagrid('getSelected').id;
						var flag = $("#prefaceGrid").datagrid('getSelected').flag;
						if(flag == "1"){
							$.post('${cy}/preface/prefaceClose/'+id+'.do',"queryType=preface",function(json){
								if(json.success)
									$("#prefaceGrid").datagrid('reload');
								parent.simpleMessAlert.call(this,'提示',json.message);
							},'json');
						}else {
							$.post('${cy}/preface/prefaceOpen/'+id+'.do',"queryType=preface",function(json){
								if(json.success)
									$("#prefaceGrid").datagrid('reload');
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
	<a id="btnCurSearch" onclick="searchPreface()" class="easyui-linkbutton"
		data-options="">查询</a>
		<div class="button-group">
			<a id="enterPro" class="easyui-linkbutton" onclick="savePreface()" data-options="plain:true">
				<label class="button-label">增加</label>
			</a>
			<a id="processPro" class="easyui-linkbutton" onclick="updatePreface()" data-options="plain:true">
				<label class="button-label">修改</label>
			</a>
			<a id="showPro" class="easyui-linkbutton" onclick="deletePreface()" data-options="plain:true">
				<label class="button-label">删除</label>
			</a>
			<a id="openPro" class="easyui-linkbutton" onclick="openPreface()" data-options="plain:true">
				<label class="button-label">启/停</label>
			</a>
		</div>	
	
</div>
<!-- 项目grid -->
<div style="height: 480px;">
	<table class="easyui-datagrid" id="prefaceGrid"
		data-options="fit:false,idField:'id',loadMsg:'正在加载…',pagination:true,title:'preface信息维护',
			url:'${cy}/ours/oursQuery.ajax?queryType=preface',toolbar:'#mainProToolbar', 
			singleSelect:true, rownumbers : true,pagination : true,  maximized:true, striped:true,
			pageSize : 5,pageList:[5],fitColumns:true,
			checkOnSelect : false,selectOnCheck : false,singleSelect  : true
			">
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true, width:100, align:'center'"></th>

				<th data-options="field:'title', width:152, align:'center'">名称</th>

				<th data-options="field:'image', width:180, align:'center'">图片</th>

				<th
					data-options="field:'content', width:330,align:'center'">内容</th>
				<th
					data-options="field:'model', width:130,align:'center',formatter:function(value,row){
						return cy.transModelInFront(value).status;
					}">类型</th>

				<th
					data-options="field:'flag', width:160,align:'center',formatter:function(value,row){
					if(value == 1)
						return '启用';
					
					if(value == 0)
						return '停用';
					
					}">启用</th>
				<th
					data-options="field:'userId', width:170,align:'center' ">创建人</th>
			</tr>
		</thead>
	</table>