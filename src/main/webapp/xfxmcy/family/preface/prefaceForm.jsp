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
		function getTestcaseParam() {
			return {
				file_size_limit : "10 MB",
				file_types : "*.jpg;*.png;*.gif;*.jpeg;",
				file_types_description : "文档",
				post_params : {
					folder : "/preface",
					isPdfCoverter : true
				}
			};
		}
		function afterTestcaseUploaded(data) {
			data = JSON.parse(data);
			if (data instanceof Array) {
				$.each(data, function(index, obj) {
					var url = obj.fileName;
					if (url) {
						/*更新到表中*/
						var fileName = obj.name;
						$('#image').val(url);
						$('#prefaceForm').form('validate');
						//$('#materialName').val(fileName);
					}
				});
			}
		}
		
	</script>
	<form action="" method="post" id="prefaceForm"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 110px;">
					<tr>
						<td colspan="2">标题&nbsp;&nbsp;
							<input name="title" id="title" class="easyui-validatebox" data-options="required:true,validType:'length[0,30]'"   style="width:130px;" />
						</td>
					</tr>
					
					<tr>
						<td colspan="2">内容 &nbsp;&nbsp;<input name="content" id="content"  style="width:380px;" />
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
						<td>图片&nbsp;&nbsp;
							<input name="image" id="image" class="easyui-validatebox"  style="width:180px;" readonly="readonly" data-options="required:true" />
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
