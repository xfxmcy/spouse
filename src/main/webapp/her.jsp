<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>project</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${cy}/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
  <div class="header">
        <div class="logo"  >
    		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="349" height="220">
			  <param name="movie" value="media.swf" />
			  <param name="quality" value="high" />
			  <param name="allowScriptAccess" value="always" />
			  <param name="wmode" value="transparent"/>
			     <embed src="${cy}/media/media.swf"
			      quality="high"
			      type="application/x-shockwave-flash"
			      WMODE="transparent"
			      width="349"
			      height="220"
			      pluginspage="http://www.macromedia.com/go/getflashplayer"
			      allowScriptAccess="always" />
			</object>
    	</div>
    <div class="menu">
      <ul>
        <li><a href="${cy}/spouse/managerment/guest.do">home</a></li>
        <li><a href="${cy}/spouse/managerment/ours.do">ours</a></li>
        <li><a href="${cy}/spouse/managerment/hers.do">her</a></li>
        <li><a href="${cy}/spouse/managerment/his.do">him</a></li>
        <li><a href="${cy}/spouse/managerment/message.do">Contact her/him</a></li>
      </ul>
    </div>
  </div>
  <div class="main">
    <div class="services">
      <div class="service_bg">
        <h3>Business info</h3>
        <ul class="link">
          <li>Lorem Ipsum is simply dummy text of the printing and <a href="#"><strong>typesetting industry</strong></a>.</li>
          <li>Lorem Ipsum is simply dummy text of the printing and <a href="#"><strong>typesetting industry</strong></a>.</li>
          <li>Lorem Ipsum is simply dummy text of the printing and <a href="#"><strong>typesetting industry</strong></a>.</li>
        </ul>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make </p>
        <p>a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release </p>
      </div>
      <div class="clr"></div>
    </div>
    <div class="global_main">
      <div class="page_title_text">
        <h1>Projects</h1>
      </div>
      <div class="clr"></div>
      <div class="project">
        <ul>
          <li><a href="#"><img src="${cy}/images/project_1.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>Lorem Ipsum is simply dummy text</span></li>
          <li><a href="#"><img src="${cy}/images/project_1.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>Lorem Ipsum is simply dummy text</span></li>
          <li><a href="#"><img src="${cy}/images/project_1.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>Lorem Ipsum is simply dummy text</span></li>
          <li><a href="#"><img src="${cy}/images/project_1.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>Lorem Ipsum is simply dummy text</span></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="block_text">
        <div class="block_full">
          <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
          <div class="line"></div>
          <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>
          <div class="clr"></div>
        </div>
        <div class="clr"></div>
      </div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="footer">
    <div class="footer_text">
      <ul>
        <li><a href="${cy}/spouse/managerment/guest.do">home</a></li>
        <li><a href="${cy}/spouse/managerment/ours.do">ours</a></li>
        <li><a href="${cy}/spouse/managerment/hers.do">her</a></li>
        <li><a href="${cy}/spouse/managerment/his.do">him</a></li>
        <li><a href="${cy}/spouse/managerment/message.do">Contact her/him</a></li>
      </ul>
      <div class="clr"></div>
       <p>author lcy</p>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>