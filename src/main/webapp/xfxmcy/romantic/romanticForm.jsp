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
		
		function clearPhoto(){
			$("#imagefirst").val();
			$("#imagesecond").val();
		}
	</script>
	<form action="" method="post" id="romantic"> 
		<table class="tableForm datagrid-toolbar"
					style="width: 100%;height: 110px;">
					<tr>
						<td>日期 &nbsp; &nbsp;<input id="dd" name="date" type="text" class="easyui-datebox" required="required" style="width: 130px;"></input></td>
						<td>显示 &nbsp; &nbsp;<input  type="radio" value="1" name="isyear" >年</input>
											<input  type="radio" value="0" name="isyear" checked="checked" >日期</input>
						</td>
						<td>日期class &nbsp; &nbsp;<input name="dateclass" id="dateclass"   style="width:130px;" /></td>
					</tr>
					
					<tr>
						<td>title &nbsp; &nbsp;<input name="title" id="title"    style="width:130px;" /></td>
						<td>图片1 &nbsp; &nbsp;<input id="imagefirst" name="imagefirst" class="easyui-validatebox" id="linkStr"   value="${param.linkStr}" style="width:130px;" readonly="readonly" data-options="required:true"  /></td>
						<td>图片2 &nbsp; &nbsp;<input id="imagesecond" name="imagesecond" class="easyui-validatebox" id="linkStr"   value="${param.linkStr}" style="width:130px;" readonly="readonly" /></td>
						<td>
							<input name="queryType" id="queryType" value="${param.type}"   style="width:130px;display: none;" />
							<input name="id" value="${param.mid}"  style="width:130px;display: none;" />
						</td>
					</tr>
					<tr>
						<td>内容1 &nbsp; &nbsp;<input name="contentfirst" id="contentfirst"   value="${param.linkStr}" style="width:130px;" /></td>
						<td>内容2 &nbsp; &nbsp;<input name="contentsecond" id="contentsecond"   value="${param.linkStr}" style="width:130px;" /></td>
						<td>内容class &nbsp; &nbsp;
							<select id="contentclass" class="easyui-combobox" name="contentclass" style="width:130px;" data-options="editable:false">  
							    <option value="list_show">list_show(1图)</option>  
							    <option value="list_show show3">list_show show3(2图)</option>  
							    <option value="list_show show4">list_show show4(2图)</option>  
							    <option value="list_show show5">list_show show5(2图)</option>  
							</select> 
							
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input  type="button" value="清空图片" onclick="clearPhoto()"/>
						</td>
					</tr> 
				</table>
	</form>
			
		<div>上传一张 ~ 两张图片</div>
		<div id="dlg" title="文件上传"
			style="width: 450px; height: 0px; padding: 10px">
			<iframe
				src="${cy}/upload.jsp?params=getTestcaseParam&success=afterTestcaseUploaded"
				frameborder="0" scrolling="no" id="ifr" ></iframe>
		</div>	
</body>
</html>
