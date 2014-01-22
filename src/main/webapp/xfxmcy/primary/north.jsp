<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <a href="${pageContext.request.contextPath}"> 	
 	<img alt="xfxmcy" height="70" src="${pageContext.request.contextPath}/images/aa.png">
 </a>
 <span style="margin-left: 10%;margin-bottom: 2px;" class="cy_font">
  	 		非管理员,请退出该系统!  
 </span>
 <div style="position: absolute;right: 5px;top:10px;">
	<div id="sessionInfoDiv" >
		<c:if test="${sessionInfo.userId != null}">[<strong>${sessionInfo.loginName}</strong>]，欢迎你！您使用[<strong>${sessionInfo.ip}</strong>]IP登录！</c:if>
	</div>
	<div style="margin-left: 40%;margin-top: 5%;width: 200px;">
		<a id="btn"  href="#" class="easyui-linkbutton" onclick="logout()">安全退出</a>  
	</div>
</div>
