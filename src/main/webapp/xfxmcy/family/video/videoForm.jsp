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
	var flag =false;
		function getTestcaseParam() {
			return {
				file_size_limit : "10 MB",
				file_types : "*.mp3;*.flv;",
				file_types_description : "mp3",
				post_params : {
					folder : "/video"
				}
			};
		}
		function afterTestcaseUploaded(data) {
			data = JSON.parse(data);
			if (data instanceof Array) {
				$.each(data, function(index, obj) {
					var url = obj.fileName;
					
					$("#imagefirst").val(url);
					$("#videoForm").form('validate');
					
				});
			}
		}
		
	</script>
	<form action="" method="post" id="videoForm"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 110px;">
					<tr>
						<td>名称 &nbsp; &nbsp;<input id="dname" name="name" type="text"  required="required" style="width: 130px;" class="easyui-validatebox" data-options="validType:'maxLength[50]',invalidMessage:'最大长度50'"></input></td>
						<td colspan="2">描述 &nbsp; &nbsp;<input name="description" id="dateclass"   style="width:350px;" /></td>
					</tr>
					<tr>
						<td>作者 &nbsp; &nbsp;<input id="artist" name="artist" type="text"  required="required" style="width: 130px;"></input></td>
						<td>专辑 &nbsp; &nbsp;<input name="album" id="album"   style="width:190px;" /></td>
					</tr>
					<tr>
						<td>
							<input name="queryType" id="queryType" value="${param.type}"   style="width:130px;display: none;" />
							<input name="id" value="${param.mid}"  style="width:130px;display: none;" />
							类型&nbsp;&nbsp;&nbsp;
							<select id="locationClass" class="easyui-combobox" name="type" style="width:130px;" data-options="editable:false">  
							    <option value="0">mp3</option>  
							    <option value="1">video</option>  
							</select> 
						</td>
						<td>文件&nbsp;&nbsp;&nbsp;&nbsp;<input id="imagefirst" name="url" class="easyui-validatebox" id="linkStr"   value="${param.linkStr}" style="width:190px;" readonly="readonly" data-options="required:true"  /></td>
					</tr>
					<tr>
						<td>启用 &nbsp;&nbsp;
							<select id="contentclass" class="easyui-combobox" name="flag" style="width:130px;" data-options="editable:false">  
							    <option value="1">启用</option>  
							    <option value="0">停用</option>  
							</select>
							<input name="formattedCreateTime"     style="width:130px;display: none;" /> 
						</td>
						<td>
						</td>
					</tr>
					
				</table>
	</form>
			
		<div id="dlg" title="文件上传"
			style="width: 450px; height: 0px; padding: 10px">
			<iframe
				src="${cy}/upload.jsp?params=getTestcaseParam&success=afterTestcaseUploaded"
				frameborder="0" scrolling="no" id="ifr" ></iframe>
		</div>	
</body>
</html>
