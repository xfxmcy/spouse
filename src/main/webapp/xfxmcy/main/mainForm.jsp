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
				file_types : "*.jpg;*.png;*.gif;*.jpeg;",
				file_types_description : "文档",
				post_params : {
					folder : "/romantic",
					isPdfCoverter : true
				}
			};
		}
		function afterTestcaseUploaded(data) {
			data = JSON.parse(data);
			if (data instanceof Array) {
				$.each(data, function(index, obj) {
					var url = obj.fileName;
					if(flag){
						$("#imagesecond").val(url);
						flag = false;
					}
					else{
						$("#imagefirst").val(url);
						flag = true;
					}
					
					//if (url) {
						/*更新到表中*/
						//var fileName = obj.name;
						//$('#resourcePath').val(url);
						//$('#materialName').val(fileName);
					//}
				});
			}
		}
		
	</script>
	<form action="" method="post" id="romantic"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 110px;">
					<tr>
						<td>图片名称 &nbsp; &nbsp;<input id="dd" name="date" type="text"  required="required" style="width: 130px;"></input></td>
						<td colspan="2">图片描述 &nbsp; &nbsp;<input name="dateclass" id="dateclass"   style="width:130px;" /></td>
					</tr>
					
					<tr>
						<td>排列顺序&nbsp; &nbsp;<input name="title" id="title"    style="width:130px;" /></td>
						<td>上传图片&nbsp; &nbsp;<input id="imagefirst" name="imagefirst" class="easyui-validatebox" id="linkStr"   value="${param.linkStr}" style="width:130px;" readonly="readonly" data-options="required:true"  /></td>
						<td>
							<input name="queryType" id="queryType" value="${param.type}"   style="width:130px;display: none;" />
							<input name="id" value="${param.mid}"  style="width:130px;display: none;" />
							展示位置&nbsp; &nbsp;<input id="imagefirst" name="imagefirst" class="easyui-validatebox" id="linkStr"   value="${param.linkStr}" style="width:130px;" readonly="readonly" data-options="required:true"  />
						</td>
					</tr>
					<tr>
						<td>图片类型 &nbsp; &nbsp;
							<select id="contentclass" class="easyui-combobox" name="contentclass" style="width:130px;" data-options="editable:false">  
							    <option value="list_show">跑马灯</option>  
							    <option value="list_show show3">大图</option>  
							    <option value="list_show show4">小图</option>  
							    <option value="list_show show5">其他</option>  
							</select> 
							
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
