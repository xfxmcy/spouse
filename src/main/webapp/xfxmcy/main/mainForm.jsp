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
					folder : "/main",
					isPdfCoverter : true
				}
			};
		}
		function afterTestcaseUploaded(data) {
			data = JSON.parse(data);
			if (data instanceof Array) {
				$.each(data, function(index, obj) {
					var url = obj.fileName;
					/* if(flag){
						$("#imagesecond").val(url);
						flag = false;
					}
					else{
						$("#imagefirst").val(url);
						flag = true;
					} */
					$("#imagefirst").val(url);
					$("#mainForm").form('validate');
					//if (url) {
						/*更新到表中*/
						//var fileName = obj.name;
						//$('#path').val(url);
						//$('#materialName').val(fileName);
					//}
				});
			}
		}
		
	</script>
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
			
		<div id="dlg" title="文件上传"
			style="width: 450px; height: 0px; padding: 10px">
			<iframe
				src="${cy}/upload.jsp?params=getTestcaseParam&success=afterTestcaseUploaded"
				frameborder="0" scrolling="no" id="ifr" ></iframe>
		</div>	
</body>
</html>
