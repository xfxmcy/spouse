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
					folder : "/me",
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
						$("#imageFirst").val(obj.name);
						$("#imageSecond").val(url);
						$("#me").form('validate');
					}
				});
			}
		}
		
		
	</script>
	<form action="" method="post" id="me"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 60px;">
					<tr>
						<td>图片 &nbsp; &nbsp;<input id="imageFirst" name="image" class="easyui-validatebox" id="linkStr"   style="width:130px;" readonly="readonly" data-options="required:true"  /></td>
						<td>
							<input name="queryType" id="queryType" value="${param.type}"   style="width:130px;display: none;" />
							<input name="sAccount" value="${sessionInfo.loginName}"  style="width:130px;display: none;" />
							<input id="imageSecond" name="path"   style="width:130px;display: none;" />
							
						</td>
					</tr>
					
				</table>
	</form>
			
		<div id="dlg" title="文件上传"
			style="width: 250px; height: 0px; padding: 10px">
			<iframe
				src="${cy}/upload.jsp?params=getTestcaseParam&success=afterTestcaseUploaded"
				frameborder="0" scrolling="no" id="ifr" ></iframe>
		</div>	
</body>
</html>
