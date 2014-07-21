<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>her</title>
<link rel="shortcut icon" href="${cy}/icon/favicon.ico" type="image/x-icon"/>
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
        <li><a href="${cy}/spouse/managerment/schedule.do">schedule</a></li>
      </ul>
    </div>
  </div>
  <div class="main">
    <div class="services">
      <div class="service_bg">
        <h3>our memory</h3>
        <ul class="link" style="font-size: 14px;">
          <li>5/4/2014 &nbsp;&nbsp;&nbsp;<a href="#"><strong>first acquaintance</strong></a>.</li>
          <li>14/4/2014&nbsp;&nbsp;&nbsp;<a href="#"><strong>first phone</strong></a>.</li>
          <li>18/4/2014&nbsp;&nbsp;&nbsp;<a href="#"><strong>first date</strong></a>.</li>
          <li>17/10/2014&nbsp;&nbsp;&nbsp;<a href="javascript:window.open('${cy}/app/birthday/index.jsp');"><strong>jing's birthday</strong></a>.</li>
        </ul>
        <p>snapshot </p>
        <p>release</p>
      </div>
      <div class="clr"></div>
    </div>
    <div class="global_main">
      <div class="page_title_text">
        <h1>Jing</h1>
      </div>
      <div class="clr"></div>
      <div class="project">
       <%--  <ul>
          <li><a href="#"><img src="${cy}/images/jing/jing.jpg" alt="project 1" width="303" height="430" border="0" /></a><span>看着我的眼睛....</span></li>
          <li><a href="#"><img src="${cy}/images/jing/jing3.jpg" alt="project 1" width="303" height="430" border="0" /></a><span>老师不在,快抄啊! 1+1=？  看看同桌的答案..哈哈 2</span></li>
          <li><a href="#"><img src="${cy}/images/jing/jing8.jpg" alt="project 1" width="303" height="430" border="0" /></a><span>smile</span></li>
          <li><a href="#"><img src="${cy}/images/jing/jing11.jpg" alt="project 1" width="303" height="430" border="0" /></a><span>tenderness</span></li>
        </ul> --%>
        <ul>
          <li><a href="#"><img src="${cy}/images/kdl.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>Lorem Ipsum is simply dummy text</span></li>
          <li><a href="#"><img src="${cy}/images/kdl.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>Lorem Ipsum is simply dummy text</span></li>
          <li><a href="#"><img src="${cy}/images/kdl.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>Lorem Ipsum is simply dummy text</span></li>
          <li><a href="#"><img src="${cy}/images/kdl.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>Lorem Ipsum is simply dummy text</span></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="block_text">
        <div class="block_full">
          <p style="font-size: 14px;"><!-- 静 ,美丽,体贴,孝顺,勤劳,善良,爱与智慧的结合体 ....prefect --></p>
          <div class="line"></div>
          <p style="font-size: 14px;"><!-- cy想做,土豆辣子,土豆炒土豆,走在通向西藏的路上,抱着熊,欣赏薰衣草的芬芳,目的地云南!<br/>(有静&nbsp;足迹的地方) ...welfare --></p>
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
        <li><a href="${cy}/spouse/managerment/schedule.do">schedule</a></li>
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