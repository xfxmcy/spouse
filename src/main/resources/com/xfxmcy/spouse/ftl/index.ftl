<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${r"${pageContext.request.contextPath}"}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>xfxmcy</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${r"${cy}"}/style.css" rel="stylesheet" type="text/css" />
<link href="${r"${cy}"}/css/prize.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${r"${cy}"}/js/primary/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="${r"${cy}"}/js/primary/easySlider1.5.js" charset="utf-8"></script>
<script type="text/javascript" src="${r"${cy}"}/js/cy/prize.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8">
function UrlConf(){
	this.prize = "${r"${cy}"}/app/prize/jing_prize.jsp";
}
var urlConf = new UrlConf(); 

function openPrize() {
	window.open('' + urlConf.prize + '',
					'window',
					'top=50px,left=500px,resizable=yes,scrollbars=no,height=590px,width=880px,status=no,toolbar=no,titlebar=no,location=no',
					false);
}

// <![CDATA[
$(document).ready(function(){	
	$("#slider").easySlider({
		controlsBefore:	'<p id="controls">',
		controlsAfter:	'</p>',
		auto: true, 
		continuous: true
	});	
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
	background:url(${r"${cy}"}/images/button_next.gif) no-repeat 0 0;
}
</style>
</head>
<body>
<link href="${r"${cy}"}/style.css" rel="stylesheet" type="text/css" />
<div id="container" style="width: 1132px;">
  <div class="header">
    <div class="logo"  >
    	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="349" height="220">
		  <param name="movie" value="media.swf" />
		  <param name="quality" value="high" />
		  <param name="allowScriptAccess" value="always" />
		  <param name="wmode" value="transparent"/>
		     <embed src="${r"${cy}"}/media/media.swf"
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
        <li><a href="${r"${cy}"}/spouse/managerment/guest.do">home</a></li>
        <li><a href="${r"${cy}"}/spouse/managerment/ours.do">ours</a></li>
        <li><a href="${r"${cy}"}/spouse/managerment/hers.do">her</a></li>
        <li><a href="${r"${cy}"}/spouse/managerment/his.do">him</a></li>
        <li><a href="${r"${cy}"}/spouse/managerment/message.do">Contact her/him</a></li>
        <li><a href="${r"${cy}"}/spouse/managerment/schedule.do">schedule</a></li>
      </ul>
    </div>
  </div>
  <div class="main">
    <div class="services">
      <div class="service_bg">
        <a href="${r"${cy}"}/romantic/index.jsp"><h3>Our acquaintance</h3></a>
        <p><a href="${r"${cy}"}/romantic/index.jsp"><u>2014年夏天......</u></a></p>
        <p><a href="${r"${cy}"}/romantic/index.jsp"><strong>expected</strong></a></p>
      </div>
      <ul class="banner">
        <li><a href="#"><img src="${r"${cy}"}/images/girl.jpg" width="104" height="104" border="0" alt="banner" /></a></li>
        <li><a href="#"><img src="${r"${cy}"}/images/girl1.jpg" width="104" height="104" border="0" alt="banner" /></a></li>
      </ul>
      <div class="clr"></div>
      <h3>Give a bless!</h3>
      <p>a statistics of blessing them</p>
      <p><span class="px22">+ 800 258 4578</span></p>
      <a href="${r"${cy}"}/romantic/index.jsp"><h3>About them</h3></a>
      <p><a href="${r"${cy}"}/spouse/managerment/host.do"><img src="${r"${cy}"}/images/xfxmcy.png" width="50%"  hspace="5" align="left" alt="picture" /></a>
      <a href="#"><strong></strong></a><br />
        silent and loneliness<br/>
        <a href="#"><strong>cy</strong></a><br />
        await
       </p>
    </div>
    <div class="global_main">
      <div class="featured_flag"><img src="${r"${cy}"}/images/featured.gif" width="115" height="115" alt="featured" border="0" /></div>
      <div class="header_images">
        <div class="gallery" id="slider">
           <ul>
           <#--大图-->
           <#list bigPhoto as big>
	            <li>
	            <img src="${r"${cy}"}/resource/upload/${big.path}" width="674" height="337" alt="${big.name}" /><br />
	              <span>
	              	<strong> 
	              	${big.name} 
	              	</strong> 
	              	${big.descri}
	              </span>
	            </li>
           </#list>
          </ul>
        </div>
      </div>
      
      <ul class="list_gallery">
       <#--小图-->
  	   <#list smallPhoto as small>
  	   		 <#if small.showLocation  == "3">
  	   		 	<li class="last">
           	 		<img src="${r"${cy}"}/resource/upload/${small.path}" alt="screen 1" width="216" height="155" border="0"  />
            	</li>
             <#else>
            	<li>
           	 		<img src="${r"${cy}"}/resource/upload/${small.path}" alt="screen 1" width="216" height="155" border="0"  />
            	</li>	 
  	   		 </#if>
            
       </#list>
        
     </ul>
      <div class="clr"></div>
      <div class="block_text">
      <#--小图-->
      <#list smallPhoto as small>
	        <div class="block_list">
	          	<p class="title">${small.name} </p>
	          		<p>${small.descri}(+${small.preCount})</p>
	          	<a href="#" onclick="" class="link">&nbsp;赞&nbsp;</a> 
	        </div>
      </#list>
        
        <#--
	        <div class="block_list">
	          <p class="title">带土</p>
	          <p>下忍 </p>
	          <a href="#" class="link">&nbsp;赞&nbsp;</a> </div>
	        <div class="block_list">
	         <p class="title">卡卡西</p>
	          <p>上忍 </p>
	          <a href="#" class="link">&nbsp;赞&nbsp;</a> </div>
          -->
          
        <div class="clr"></div>
        <div class="block_full">
           <p class="title">team</p>
           
          <p>隶属于四代下的team</p>
          <p>4次B级任务,28次C级任务,289次D级任务</p>
          <a href="#" class="link">&nbsp;赞&nbsp;</a> 
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
        <li><a href="${r"${cy}"}/spouse/managerment/guest.do">home</a></li>
        <li><a href="${r"${cy}"}/spouse/managerment/ours.do">ours</a></li>
        <li><a href="${r"${cy}"}/spouse/managerment/hers.do">her</a></li>
        <li><a href="${r"${cy}"}/spouse/managerment/his.do">him</a></li>
        <li><a href="${r"${cy}"}/spouse/managerment/message.do">Contact her/him</a></li>
        <li><a href="${r"${cy}"}//spouse/managerment/schedule.do">schedule</a></li>
      </ul>
      <div class="clr"></div>
      <p>Copyright © 2001-2007 xfxmcy.com. All rights reserved.</p>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>