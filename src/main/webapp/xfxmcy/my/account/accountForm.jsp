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
	<form action="" method="post" id="accountForm"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 110px;">
					<tr>
						<td >标题&nbsp;&nbsp;
							<input name="title" id="title" class="easyui-validatebox" data-options="required:true,validType:'length[0,50]'"   style="width:130px;" />
						</td>
						<td >账号&nbsp;&nbsp;
							<input name="account" id="account" class="easyui-validatebox" data-options="required:true,validType:'length[0,50]'"   style="width:130px;" />
						</td>
					</tr>
					<tr>
						<td>类型&nbsp;&nbsp;
							<select id="type" class="easyui-combobox" name="type" style="width:130px;" data-options="editable:false,panelHeight:'auto'">  
							    <option value="0" selected="selected">game</option>  
							    <option value="1">learning</option>
							</select> 
						</td>
						<td>密码&nbsp;&nbsp;
							<input name="pass" id="pass"   style="width:180px;"   />
						</td>
					</tr>
					<tr>
						<td colspan="2">备注 &nbsp;&nbsp;<input name="menofirst" id="menofirst"  style="width:380px;" />
							<input name="id"   style="width:130px;display: none;" />
						</td>
					</tr>
					
					<tr>
						<td colspan="2">url&nbsp;&nbsp;
							<input name="url" id="url" class="easyui-validatebox" data-options="validType:'length[0,100]'"   style="width:180px;" />
						</td>
					</tr>
				</table>
	</form>
			
		
</body>
</html>
