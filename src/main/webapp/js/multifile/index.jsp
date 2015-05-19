<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<style>
	.button-group{ margin:20px 0 10px 10px;}
	.search-group{ line-height:40px; margin:10px 20px;}
	.button-label{ margin:0 5px; cursor:pointer;}
</style>
		<meta charset="UTF-8">
		<title>upload </title>
		<!-- 引用控制层插件样式 -->
		<link rel="stylesheet" href="${cy}/js/multifile/control/css/zyUpload.css" type="text/css">
		<script type="text/javascript">
		function insertMyPhoto(filePath){
			
			$.post("${cy}/photo/photoPersistent.do?",{"url":filePath,"queryType":"simpleSave"},function(data){
				
				if(!data.success){
					parent.simpleMessAlert.call(this,'提示',data.message);
				}
			});
		}
		
		</script>
		<script type="text/javascript" src="${cy}/js/multifile/jquery-1.7.2.js"></script>
		<!-- 引用核心层插件 -->
		<script type="text/javascript" src="${cy}/js/multifile/core/zyFile.js"></script>
		<!-- 引用控制层插件 -->
		<script type="text/javascript" src="${cy}/js/multifile/control/js/zyUpload.js"></script>
		<!-- 引用初始化JS -->
		<script type="text/javascript" src="${cy}/js/multifile/demo.js"></script>
	
		<h1 style="text-align:center;">upload</h1>
	    <div id="demo" class="demo"></div>   
