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
function saveAccount(){
 	mainDialog = parent.cy.dialog({
		title : 'add a Account',
		href : '${cy}/xfxmcy/my/account/accountForm.jsp',
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
				$.post('${cy}/account/accountPersistent.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#accountGrid").datagrid("insertRow",{
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
function updateAccount(id){
	if ($("#accountGrid").datagrid('getSelections').length == 1) {
		updateAccountAble.call(this, $("#accountGrid").datagrid('getSelected').id);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}

function deleteAccount(id){
	if ($("#accountGrid").datagrid('getSelections').length == 1) {
		parent.simpleMessConf.call(this,
				 'warning',
				 'do you be sure for your dicision ?',
				 function(result){
					if(result){
						deleteAccountAble.call(this, $("#accountGrid").datagrid('getSelected').id);
					}
				}
		);
	} else {
		parent.simpleMessAlert.call(this,'提示','请选择1条记录进行操作');
	}
}
function deleteAccountAble(id){
	$.post('${cy}/account/accountDelete/'+id+'.do',null,function(json){
		if (json.success) {
			$("#accountGrid").datagrid("deleteRow",
				 $("#accountGrid").datagrid("getRowIndex",id)
			);
		}
		parent.simpleMessAlert.call(this,'提示',json.message);
	},'json');
	
}

function updateAccountAble(id){
	mainDialog = parent.cy.dialog({
		title : 'update a Account',
		href : '${cy}/xfxmcy/my/account/accountForm.jsp',
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
				$.post('${cy}/account/accountMerge.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#accountGrid").datagrid("updateRow",{
							index : $("#accountGrid").datagrid("getRowIndex",id) ,
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
			var rowSelected = $("#accountGrid").datagrid("getSelected");
			formDia = mainDialog.find('form');
			formDia.form('load',{title:rowSelected.title,id:rowSelected.id,menofirst:rowSelected.menofirst,pass:rowSelected.pass,account:rowSelected.account,type:rowSelected.type,url:rowSelected.url});	
			
		}
		
	});
}


/**
 * 根据title 查询
 */
function searchAccount(){
	
	var param = {};
	if("" != $('#searchAc').val().trim())
		param.likeNameFirst = $('#searchAc').val();
	$('#accountGrid').datagrid('reload',param);
	
}



</script>
<!-- toolbar -->
<div id="mainProToolbar">
	&nbsp;标题关键字 &nbsp;: &nbsp; 
	<input size="20" type="text" id="searchAc"> 
	<a id="btnCurSearch" onclick="searchAccount()" class="easyui-linkbutton"
		data-options="">查询</a>
		<div class="button-group">
			<a id="enterPro" class="easyui-linkbutton" onclick="saveAccount()" data-options="plain:true">
				<label class="button-label">增加</label>
			</a>
			<a id="processPro" class="easyui-linkbutton" onclick="updateAccount()" data-options="plain:true">
				<label class="button-label">修改</label>
			</a>
			<a id="showPro" class="easyui-linkbutton" onclick="deleteAccount()" data-options="plain:true">
				<label class="button-label"><span id = "proDis">删除</span></label>
			</a>
			
		</div>	
	
</div>
<!-- 项目grid -->
<div style="height: 480px;">
	<table class="easyui-datagrid" id="accountGrid"
		data-options="fit:false,idField:'id',loadMsg:'正在加载…',pagination:true,title:'Account信息维护',
			url:'${cy}/account/accounts.ajax',toolbar:'#mainProToolbar', 
			singleSelect:true, rownumbers : true,pagination : true,  maximized:true, striped:true,
			pageSize : 5,pageList:[5],fitColumns:true,
			checkOnSelect : false,selectOnCheck : false,singleSelect  : true
			">
		<thead>
			<tr>
				<th data-options="field:'id',hidden:true, width:100, align:'center'"></th>

				<th data-options="field:'title', width:152, align:'center'">title</th>

				<th
					data-options="field:'url', width:280,align:'center'">url</th>
				<th
					data-options="field:'type', width:120,align:'center',formatter:function(value,row){
						return cy.transAccountType(value).status;
					}">类型</th>
				<th
					data-options="field:'account', width:120,align:'center'">账号</th>

				<th
					data-options="field:'pass', width:160,align:'center'">密码</th>
				
			</tr>
		</thead>
	</table>