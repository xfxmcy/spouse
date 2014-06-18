<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>him</title>
<link rel="shortcut icon" href="${cy}/icon/favicon.ico" type="image/x-icon"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${cy}/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/jquery-1.9.1.js"></script>
<script type="text/javascript">
	var liFavorite = "";
	(function(){
		$.post("${cy}/favorite/favoriteQuery.do?queryType=frontGrid",null,function(data){
			if(data.rows && data.rows.length > 0){
				for(var i=0 ; i < data.rows.length ; i++){
					liFavorite += "<li>" + data.rows[i].title;
					liFavorite += "<a onclick='javascript:window.open(\""+data.rows[i].url+"\")' href='#'><strong>    " + data.rows[i].url;
					liFavorite += "</strong></a></li>";
				}	
			}
			$("#favorite").append(liFavorite);
		});
		
	})();
</script>
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
        <h3>my favorite</h3>
        <ul id="favorite" class="link">
        
        </ul>
        
      </div>
      <div class="clr"></div>
    </div>
    <div class="global_main">
      <div class="page_title_text">
        <h1>cy</h1>
      </div>
      <div class="clr"></div>
      <div class="project">
        <ul>
          <li><a href="#"><img src="${cy}/images/kdl.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>dream</span></li>
          <li><a href="#"><img src="${cy}/images/kdl.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>love</span></li>
          <li><a href="#"><img src="${cy}/images/kdl.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>together</span></li>
          <li><a href="#"><img src="${cy}/images/kdl.jpg" alt="project 1" width="303" height="129" border="0" /></a><span>you</span></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="block_text">
        <div class="block_full">
          <p>把昨天都作废,现在你在我眼前,我想love</p>
          <div class="line"></div>
          <p>请给我机会</p>
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