<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>xfxmcy</title>
<link rel="shortcut icon" href="${cy}/icon/favicon.ico" type="image/x-icon"/> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${cy}/css/prize.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="${cy}/js/primary/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="${cy}/js/primary/easySlider1.5.js" charset="utf-8"></script>
<script type="text/javascript" src="${cy}/js/cy/prize.js" charset="utf-8"></script>
  
<script type="text/javascript">
function UrlConf(){
	this.prize = "${cy}/app/divination/index.jsp";
}
var urlConf = new UrlConf(); 

function openPrize() {
	 window.open('' + urlConf.prize + '',
					'window',
					'top=50px,left=500px,resizable=yes,scrollbars=no,height=590px,width=880px,status=no,toolbar=no,titlebar=no,location=no',
					false);
}

function blessCount(){
	alert("谢谢您! bless+1");
	$("#blessCount").html(parseInt($("#blessCount").html())+1);
}
</script>
<script type="text/javascript" charset="utf-8">
// <![CDATA[
$(document).ready(function(){	
	$("#slider").easySlider({
		controlsBefore:	'<p id="controls">',
		controlsAfter:	'</p>',
		auto: true, 
		continuous: true
	});	
	$.post("${cy}/ours/oursQuery.ajax", {
		queryType:'preface',
		model: cy.reverseModelInFront("index").status
		},function(data){
			if(data.total > 0){
				
				if(data.rows[0].image && data.rows[0].image != ''){
					$("#indexPhoto").attr('src','${cy}' + cy.uploadPath + data.rows[0].image);	
				}
				$("#indexContent").html(data.rows[0].content); 
				$("#indexTitle").html(data.rows[0].title); 
			}
		
		},'json');
});
// ]]>
</script>
<style type="text/css">
#slider {
	padding:10px 0 10px 0;
	margin:0;
	list-style:none;
	width:674px;
}
#slider ul, #slider li {
	margin:0;
	padding:0;
	list-style:none;
}

/* 
	define width and height of list item (slide)
	entire slider area will adjust according to the parameters provided here
*/ 
#slider li {
	width:674px;
	height:385px;
	overflow:hidden;
}
p#controls {
	margin:0;
	position:relative;
}
#prevBtn {
	display:none;
}
#nextBtn {
	display:block;
	margin:0;
	overflow:hidden;
	width:24px;
	height:24px;
	position:absolute;
	left:0;
	top:-40px;
}
#nextBtn {
	left:634px;
}
#nextBtn a {
	display:block;
	width:24px;
	height:24px;
	background:url(${cy}/images/button_next.gif) no-repeat 0 0;
}
</style>
</head>
<link href="${cy}/style.css" rel="stylesheet" type="text/css" /> 
<body>
<div id="container" style="width: 1132px;">
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
    <div class="services" >
      <div class="service_bg">
      	<div style="background-color: white;">
      		<!-- <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2&num=2" width="330" height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe> -->
      		<!-- <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2&num=1" width="220" height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe> -->
      		<iframe allowtransparency="true" frameborder="0" width="290" height="96" scrolling="no" src="http://tianqi.2345.com/plugin/widget/index.htm?s=2&z=1&t=0&v=0&d=2&bd=0&k=&f=&q=1&e=1&a=1&c=54511&w=290&h=96&align=center"></iframe>
      	</div>
        <%-- <a href="${cy}/romantic/index.jsp"> --%><h3>Our acquaintance</h3><!-- </a> -->
        <p><strong>2014年夏天......</strong></p>
      </div>
      <ul class="banner">
        <li><a href="#"><img src="${cy}/images/girl.jpg" width="104" height="104" border="0" alt="banner" /></a></li>
        <li><a href="#"><img src="${cy}/images/girl1.jpg" width="104" height="104" border="0" alt="banner" /></a></li>
      </ul>
      <div class="clr"></div>
      <h3>Give a bless!
      	<span class="block_text">
      		<a href="javascript:void(0)" onclick="blessCount()" class="link" style="color: #FFF">&nbsp;bless&nbsp;!</a>
      	</span>
      </h3>
      <p>bless &nbsp;:&nbsp;&nbsp;<span class="px22" id="blessCount">4578</span></p>
      <%-- <a href="${cy}/romantic/index.jsp"> --%><h3>About them</h3><!-- </a> -->
      <p><a href="${cy}/spouse/managerment/host.do"><img src="${cy}/images/xfxmcy.png" width="60%"  hspace="5" align="left" alt="picture" /></a>
      
        <!-- <a href="#"><strong></strong></a><br />
        silent and loneliness<br/>
        <a href="#"><strong>cy</strong></a><br /> -->
        
       </p>
    </div>
    <div class="global_main">
      <div class="featured_flag"><img src="${cy}/images/featured.gif" width="115" height="115" alt="featured" border="0" /></div>
      <div class="header_images">
        <div class="gallery" id="slider">
           <ul>
            <li><img src="${cy}/images/you.png" width="674" height="337" alt="鼬" /><br />
              <span><strong>brother</strong> 鼬   , 佐助 </span></li>
            <li><img src="${cy}/images/xiao.png" width="674" height="337" alt="xiao" /><br />
              <span><strong>晓</strong> from front to behind 迪达拉,带土,角都,飞段,小南,佩恩,大蛇丸or鼬,蠍,鬼鲛 </span></li>
            <li><img src="${cy}/images/zhangmen.jpg" width="674" height="337" alt="长门" /><br />
              <span><strong>小南</strong> 弥彦 , 长门 </span></li>
              	  
          </ul>
            
        </div>
      </div>
      <ul class="list_gallery">
        <li><a href="#"><img src="${cy}/images/lin.jpg" alt="screen 1" width="216" height="155" border="0" /></a></li>
        <li><a href="#"><img src="${cy}/images/daitu.jpg" alt="screen 1" width="216" height="155" border="0" /></a></li>
        <li class="last"><a href="#"><img src="${cy}/images/kakaxi.png" alt="screen 1" width="216" height="155" border="0" /></a></li>
     </ul>
      <div class="clr"></div>
      <div class="block_text">
        <div class="block_list">
          <p class="title">琳</p>
          <p>下忍 </p>
          <a href="javascript:void(0)" class="link">&nbsp;赞&nbsp;</a> </div>
        <div class="block_list">
          <p class="title">带土</p>
          <p>下忍 </p>
          <a href="javascript:void(0)" class="link">&nbsp;赞&nbsp;</a> </div>
        <div class="block_list">
         <p class="title">卡卡西</p>
          <p>上忍 </p>
          <a href="javascript:void(0)" class="link">&nbsp;赞&nbsp;</a> </div>
        <div class="clr"></div>
        <div class="block_full">
          <p class="title"><img src="${cy}/images/tian.jpg" width="138" height="132" hspace="10" vspace="5" align="left" alt="indexPhoto"  id="indexPhoto"/>
          <span id="indexTitle"></span>
          </p>
          <p id="indexContent"></p>
          <br/>
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