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

</script>
<div style="width: 100%;height: 15%;text-align: center;" >
		xfxmcy system
</div>
<div style="width: 100%;">
	<table style="width: 100%;" >
		<tr>
			<td>账号</td>
			<td>${sessionInfo.loginName}</td>
		</tr>
		<tr>
			<td>密码</td>
			<td></td>
		</tr>
		<tr>
			<td>照片</td>
			<td></td>
		</tr>
	</table>
		
</div>