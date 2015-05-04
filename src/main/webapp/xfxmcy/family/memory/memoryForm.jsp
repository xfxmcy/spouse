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
	<form action="" method="post" id="prefaceForm"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 110px;">
					<tr>
						<td colspan="2">标题&nbsp;&nbsp;
							<input name="title" id="title" class="easyui-validatebox" data-options="required:true,validType:'length[0,50]'"   style="width:130px;" />
						</td>
					</tr>
					<tr>
						<td colspan="2">描述 &nbsp;&nbsp;<input name="description" id="description"  style="width:380px;" />
							<input name="queryType" id="queryType"  value="${param.type}"   style="width:130px;display: none;" />
							<input name="id"   style="width:130px;display: none;" />
							<input name="flag" value="0"   style="width:130px;display: none;" />
							
						</td>
					</tr>
					<tr>
						<td>模块&nbsp;&nbsp;
							<select id="model" class="easyui-combobox" name="model" style="width:130px;" data-options="editable:false,panelHeight:'auto'">  
							    <option value="0" selected="selected">ours</option>  
							    <option value="1">her</option>  
							    <option value="2">him</option>  
							    <option value="3">schedule</option>
							    <option value="4">index</option>
							    <option value="5">contact</option>  
							</select> 
						</td>
						<td>时间&nbsp;&nbsp;
							<input name="currentTime" id="currentTime" class="easyui-datebox"  style="width:180px;"  data-options="editable:false,required:true" />
						</td>
					</tr>
					<tr>
						<td colspan="2">链接&nbsp;&nbsp;
							<input name="href" id="href" class="easyui-validatebox" data-options="validType:'length[0,100]'"   style="width:180px;" />
						</td>
					</tr>
				</table>
	</form>
			
		
</body>
</html>
