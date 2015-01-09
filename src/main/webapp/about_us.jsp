<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>about us</title>
<link rel="shortcut icon" href="${cy}/icon/favicon.ico" type="image/x-icon"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${cy}/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="container">
  <div class="header">
    <div class="logo"></div>
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
      </div>
      <div class="clr"></div>
    </div>
    
    <div class="global_main">
<!--       <div class="page_title"> -->
<!--         <h1>About our company</h1> -->
<!--       </div> -->

	  <!-- cusan -->
	  <SCRIPT language="JavaScript">

		function getLight(pars)
		{	
			//alert("播放器模式参数值："+string+"");
			if(pars == "open")
			{
				close_light(this);
			}
			else
			{
				close_light(this);
			}
		}
		//兼容性
		function thisMovie(movieName) {
	    	if (navigator.appName.indexOf("Microsoft") != -1) {
	        	return window[movieName]
	    	}
	    	else {
	        	return document[movieName]
	    	}
		}
	   </SCRIPT> 
	   <style type="text/css">
		.video { OVERFLOW: hidden;   margin-top:10px;margin-left:0px;  WIDTH: 100%; POSITION: relative}
		.close_light_bg {DISPLAY: none; BACKGROUND: #000; FILTER: alpha(opacity = 15); LEFT: 0px; WIDTH: 100%; POSITION: absolute; TOP: 0px; HEIGHT: 100%; opacity: .85}
		div.help { line-height:32px; font-size:14px;}
	   </style>
	  
	   <script type="text/javascript" src="${cy}/cuSunPlayer/images/swfobject.js"></script>	
	  	<div align="center" class="video" id="CuPlayer"><b>网页视频播放器加载中，请稍后...</b></div>
		<script type="text/javascript">
			var so = new SWFObject("${cy}/cuSunPlayer/player.swf","ply","700","350","9","#000000");
			so.addParam("allowfullscreen","true");
			so.addParam("allowscriptaccess","always");
			so.addParam("wmode","opaque");
			so.addParam("quality","high");
			so.addParam("salign","lt");
			//播放器设置文件-----------------------------
			so.addVariable("JcScpFile","${cy}/cuSunPlayer/CuSunV2set.xml?cy=1");
			//视频文件及略缩图--------------------------
			//so.addVariable("JcScpServer","rtmp://www.yoursite.com/vod")；
			so.addVariable("JcScpVideoPath","${cy}/cuSunPlayer/resource/1.f4v");
			so.addVariable("JcScpVideoPathHD","${cy}/cuSunPlayer/resource/1.f4v");
			so.addVariable("JcScpImg","${cy}/cuSunPlayer/images/flashChangfa2.jpg"); 
			//-前置Flash广告-----------------------------
			so.addVariable("ShowJcScpAFront","no");
			//so.addVariable("JcScpCountDownsPosition","top-left");
			//so.addVariable("JcScpCountDowns","4"); 
			//so.addVariable("JcScpAFrontW","520");
			//so.addVariable("JcScpAFrontH","325"); 
			//so.addVariable("JcScpAFrontPath","Images/SevenColorPlayer_650x418.swf"); 
			//so.addVariable("JcScpAFrontLink","http://yxp.163.com/act/20120214.html"); 
			//-视频广告参数-----------------------------
			//so.addVariable("ShowJcScpAVideo","no");
			//so.addVariable("JcScpAVideoPath","http://www.roewe.com.cn/download/roewew5/video/01/video/1.flv");
			//-暂停广告参数-----------------------------
			//so.addVariable("ShowJcScpAPause","yes");　
			//so.addVariable("JcScpAPauseW","375");　
			//so.addVariable("JcScpAPauseH","230");　
			//so.addVariable("JcScpAPausePath","Images/Apause375x250.jpg");　 
			//so.addVariable("JcScpAPauseLink","http://yxp.163.com/act/20120214.html"); 
			//-角标广告参数-----------------------------
			 so.addVariable("ShowJcScpACorner","no");
			//so.addVariable("JcScpACornerW","85");　
			//so.addVariable("JcScpACornerH","50");　
			//so.addVariable("JcScpACornerPath","Images/SevenColorPlayer_a10.swf");　
			//so.addVariable("JcScpACornerPosition","bottom-right");
			//so.addVariable("JcScpACornerLink","http://www.163.com"); 
			//-----------------------------------------
			//so.addVariable("JcScpSharetitle","标题信息"); 
			so.write("CuPlayer");
	</script>
	<!-- player --> 
      <div class="clr"></div>
      <div class="block_text">
        <div class="block_full">
          <p class="title">video title</p>
          <p>	video content  </p>
          <a href="javascript:void(0)" class="link2">jing</a>
          <div class="clr"></div>
        </div>
        <div class="block_list">
          <p class="title">jing</p>
          <p>cy </p>
          <a href="#" class="link2">jing er</a> </div>
        <div class="block_list">
          <p class="title">jing</p>
          <p>cy </p>
          <a href="#" class="link2">jing er</a> </div>
        <div class="block_list">
          <p class="title">jing</p>
          <p>cy </p>
          <a href="#" class="link2">jing er</a> </div>
        <div class="clr"></div>
        <div class="block_full">
          <p class="title"><img src="${cy}/images/tian.jpg" width="138" height="132" hspace="10" vspace="5" align="left" alt="picture" />title</p>
          <p>content</p>
          <div class="clr"></div>
        </div>
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
      <p>Copyright © 2013-2015 xfxmcy.com. All rights reserved.</p>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>