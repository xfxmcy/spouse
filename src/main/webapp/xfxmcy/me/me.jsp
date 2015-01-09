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

$(function() {
	/*初始化页面*/
	easyloader.load(["dialog", "parser", "tabs","validatebox", "combobox", "form", "blockUI", "messager",
			"validMethods", "datebox", "datagrid" ], function() {
		$("body").css("visibility","visible");	
		
	});
});	

/*修改密码*/
function updateSecret(){
	
}
var formDia ;
var meDialog ;
/*上传图片*/
function uploadPhoto(){
	meDialog = parent.cy.dialog({
		title : 'add a romantic',
		href : '${cy}/xfxmcy/me/photo.jsp?type=simpleUpdate',
		width : 680,
		height : 400,
		buttons : [ {
			text : 'add',
			handler : function() {			
				formDia = meDialog.find('form');
				
				if(!formDia.form("validate")){
					parent.simpleMessAlert.call(this,'提示',"请上传一张图片");
					return;
				}
				parent.$.messager.progress();
				//parent.$.messager.progress('close');
				/*$.post('${cy}/romantic/romanticPersistent.do',cy.serializeObject(formDia),function(json){
					if (json.success) {
						$("#romanticGrid").datagrid("insertRow",{
							index : 0 ,
							row : json.result
						});
						meDialog.dialog('close');
					}
					parent.simpleMessAlert.call(this,'提示',json.message);
				},'json');*/
				
			} 
		}, {
			text : 'clean',
			handler : function() {
				formDia.form('clear');	
			}
		}],
		onLoad : function(){
			formDia = meDialog.find('form');
		}
		
	});
}
</script>
<div style="width: 100%;height: 15%;text-align: center;" >
		xfxmcy system
</div>
<div style="width: 100%;">
	<table style="width: 60%;" align="center" >
		<tr>
			<td>账号</td>
			<td>${sessionInfo.loginName}</td>
			<td></td>
		</tr>
		<tr>
			<td>密码</td>
			<td>
				******
			</td>
			<td>
			<a href="#" class="easyui-linkbutton" onclick="updateSecret();">修改</a>
			</td>
		</tr>
		<tr>
			<td>照片</td>
			<td>
				<img alt="my photo" width="100px" src="${cy}/${sessionInfo.path}">
			</td>
			<td>
				<a href="#" class="easyui-linkbutton" onclick="uploadPhoto();">上传</a>	
			</td>
		</tr>
		
	</table>
			
</div>