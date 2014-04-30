<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<link href="${cy}/nofinding/style.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
	function goback(){
		parent.window.location.href = "${cy}/index.jsp";
	}
</script>
<body>
	<div id="main">
		<!-- header -->
		<div id="header">
			<h1>Page Gone To Heaven And Doesn't Want To Come Back<span>404 Error - Not Found </span></h1>
		</div>
		<!-- content -->
		<div id="content">
			<ul class="nav">
         	<li class="home"><a href="#" onclick="goback()">Home Page</a></li>
            <li class="site_map"><a href="#" onclick="goback()">Site Map</a></li>
            <li class="search"><a href="#" onclick="goback()">Website Search</a></li>
         </ul>
          <p>Hey, you're early! You don't belong here - at least not today. Besides, what you're looking for is not here anyways.<br />
         So why don't you go to our <a href="#" onclick="goback()">homepage</a>, check out our <a href="#" onclick="goback()">sitemap</a> or try using the<a href="#" onclick="goback()">website search</a>.</p>
		</div>
		<!-- footer -->
		<div id="footer">
      	copyright <a href="#" onclick="goback()">xfxmcy</a>
      </div>
	</div>
</body>
</html>