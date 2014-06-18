<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>    
<body>
		<form id="material_link_linkForm"  method="post">
				<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 110px;">
					<tr>
						<td>标题 &nbsp; &nbsp;<input name="title" id="mtitle" style="width:130px;" /></td>
						<td>说明 &nbsp; &nbsp;<input name="description" id='mdescription'  style="width:130px;" /></td>
					</tr>
					
					<tr>
						<td>链接 &nbsp; &nbsp;<input name="url" id="linkStr"   value="${param.linkStr}" style="width:130px;" /></td>
						<td>是否前台展示 &nbsp; &nbsp;否&nbsp;<input type="radio" id="memoFF" value="0" name="memofirst" checked="checked">&nbsp;&nbsp;
												 是&nbsp;<input type="radio" id="memoFT" value="1" name="memofirst">
						</td>
						<td>
							<input name="pid" id="parentId" value="${param.parentId}"   style="width:130px;display: none;" />
							<input name="queryType" id="queryType" value="${param.type}"   style="width:130px;display: none;" />
							<input name="id" value="${param.mid}"  style="width:130px;display: none;" />
						</td>
							
					
					</tr> 
				</table>
			</form>
		
</body>
