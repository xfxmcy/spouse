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
	<form action="" method="post" id="photoForm"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 110px;">
					<tr>
						<td colspan="2">原标题&nbsp;&nbsp;
							<span id="previousTitle"></span>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">新标题&nbsp;&nbsp;<input name="content" id="content"  style="width:380px;" />
							<input name="queryType" id="queryType"  value="${param.type}"   style="width:130px;display: none;" />
							<input name="id"   style="width:130px;display: none;" />
							<input name="flag" value="0"   style="width:130px;display: none;" />
							
						</td>
					</tr>
					
				</table>
	</form>
			
		
</body>
</html>
