<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="/xfxmcy/initialEasyUI.jsp"></jsp:include>
<head>

</head>
<body>	

	
	<form action="" method="post" id="mainForm"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 110px;">
					<tr>
						<td>图片名称 &nbsp; &nbsp;<input id="dd" name="name" type="text"  required="required" style="width: 130px;"></input></td>
						<td colspan="2">图片描述 &nbsp; &nbsp;<input name="descri" id="dateclass"   style="width:350px;" /></td>
					</tr>
					
					<tr>
						<td>排列(0不展示)&nbsp;<input name="phOrder" id="title"    style="width:130px;" /></td>
						<td>
							<input name="queryType" id="queryType" value="${param.type}"   style="width:130px;display: none;" />
							<input name="id" value="${param.mid}"  style="width:130px;display: none;" />
							展示位置&nbsp; &nbsp;
							<select id="locationClass" class="easyui-combobox" name="showLocation" style="width:130px;" data-options="editable:false">  
							    <option value="1">左</option>  
							    <option value="2">中</option>  
							    <option value="3">右</option>
							    <option value="0">无</option>   
							</select> 
						</td>
						<td>上传图片&nbsp; &nbsp;<input id="imagefirst" name="path" class="easyui-validatebox" id="linkStr"   value="${param.linkStr}" style="width:130px;" readonly="readonly" data-options="required:true"  /></td>
					</tr>
					<tr>
						<td>图片类型 &nbsp; &nbsp;
							<select id="contentclass" class="easyui-combobox" name="type" style="width:130px;" data-options="editable:false">  
							    <option value="0">跑马灯</option>  
							    <option value="2">大图(左中右)</option>  
							    <option value="1">小图</option>  
							    <option value="3">其他</option>  
							</select> 
						</td>
					</tr>
				</table>
	</form>
	<script type="text/javascript">
		$('body').css('visibility','visible');
	</script>
</body>
</html>
