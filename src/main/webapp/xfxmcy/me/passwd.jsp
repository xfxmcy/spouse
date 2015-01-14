<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include>
<head>

</head>
<body>	

	<script type="text/javascript">
	</script>
	<form action="" method="post" id="meP"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 60px;">
					<tr>
						<th style="width: 85px;">原始密码</th>
						<td><input tLogin="password" name="sPassword"
								type="password" class="easyui-validatebox" required="true"
								missingMessage="请填写登录密码" style="width: 145px;" /></td>

					</tr>
					<tr>
						<th style="width: 85px;">重复密码</th>
						<td><input type="password" class="easyui-validatebox" style="width: 145px;"
						data-options="required:'true',missingMessage:'请再次填写密码',validType:'eqPassword[\'#meP input[tLogin=password]\']'" /></td>
					</tr>
					<tr>
						<th style="width: 85px;">更新密码</th>
						<td><input name="sPasswordNew"
								type="password" class="easyui-validatebox" required="true"
								missingMessage="请填写新密码" style="width: 145px;" />
						<input name="queryType" id="queryType" value="${param.type}"   style="width:130px;display: none;" />
						<input name="sAccount" value="${sessionInfo.loginName}"  style="width:130px;display: none;" />
						</td>
					</tr>
										
		</table>
	</form>
</body>
</html>
