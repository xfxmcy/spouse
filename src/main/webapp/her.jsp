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
<script type="text/javascript" src="${cy}/js/primary/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/xfUtil.js"></script>
</head>
<body>
<script type="text/javascript">

function showDes(str){
	$('#memoryInfo').text(str);
}

$(document).ready(function(){	
	$.post("${cy}/ours/oursQuery.ajax", {
		queryType:'preface',
		flagEnAble:'1',
		model: cy.reverseModelInFront("her").status
		},function(data){
			if(data.total > 0){
				
				if(data.rows[0].image && data.rows[0].image != ''){
					$("#herPhoto").attr('src','${cy}' + cy.uploadPath + data.rows[0].image);	
				}
				$("#herContent").html(data.rows[0].content); 
				$("#herTitle").html(data.rows[0].title); 
			}
		
		},'json');
	
	$.post("${cy}/ours/oursQuery.ajax", {
		queryType:'memory',
		flagEnAble:'1',
		model: cy.reverseModelInFront("her").status
		},function(data){
			if(data.total > 0){
				var lis = "";
				for(var i = 0 ; i < data.rows.length ; i ++){
					if(data.rows[i].href != null && data.rows[i].href != ""){
						if(data.rows[i].href.substr(0,4) == "http"){
							var li = "<li>" + data.rows[i].formattedDate + "&nbsp;&nbsp;&nbsp;"
							+"<a onMouseOver=\"showDes('"+data.rows[i].description+"')\" href=\"javascript:window.open('" + data.rows[i].href + "');\">"
							+"<strong>" + data.rows[i].title + "</strong></a></li>";	
						}
						else{
							var li = "<li>" + data.rows[i].formattedDate + "&nbsp;&nbsp;&nbsp;"
							+"<a onMouseOver=\"showDes('"+data.rows[i].description+"')\" href=\"javascript:window.open('${cy}" + data.rows[i].href + "');\">"
							+"<strong>" + data.rows[i].title + "</strong></a></li>";
						}
						
					}
					else{
						var li = "<li>" + data.rows[i].formattedDate + "&nbsp;&nbsp;&nbsp;"
						+"<a onMouseOver=\"showDes('"+data.rows[i].description+"')\" href=\"#\">"
						+"<strong>" + data.rows[i].title + "</strong></a></li>";
					}
					lis += li;
				}
				$("#herIntroduce").html(lis);
			}
		
		},'json');
	
	
	
	var photosHtml = "";
	var rows ;
	$.post("${cy}/photo/queryHerPhotoInFront.do?",{"queryType":"queryOnBG","rows":"6","page":1},function(data){
		rows = data.rows;
		if(rows.length  <= 0)
			return ;
		for(var i = 0 ; i <rows.length ; i++){
			/* var oReq = new ActiveXObject("Microsoft.xmlHTTP")
			oReq.open("Get","${cy}/resource/upload"+rows[i].url,false);
			oReq.send();
			//alert(oReq.status)
			if(oReq.status==404)
			alert('不存在');
			else
			alert("存在") */
			//alert(object.FileExists("${cy}/resource/upload"+rows[i].url)); 
			if(rows[i].url){
				if(rows[i].title)
					photosHtml +=  "<li><a href=\"#\"><img src=\"${cy}/resource/upload"+rows[i].url+"\" alt=\"project 1\" width=\"303\" height=\"129\" border=\"0\" /></a><span>"+rows[i].title+"</span></li>";
				else	
					photosHtml +=  "<li><a href=\"#\"><img src=\"${cy}/resource/upload"+rows[i].url+"\" alt=\"project 1\" width=\"303\" height=\"129\" border=\"0\" /></a><span></span></li>";
			}
			
		}
		$("#project_her_photo").append(photosHtml);	
	},'json');	
		
});
</script>
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
      <div class="service_bg" style="word-break:break-all">
        <h3>her introduce</h3>
        <ul id="herIntroduce" class="link" style="font-size: 14px;">
        </ul>
         <p id="memoryInfo"  ></p>
      </div>
      <div class="clr"></div>
    </div>
    <div class="global_main">
      <div class="page_title_text">
        <h1>xx   
        	<span style="position: relative;float: right;"><a href="#" onclick="javascript:window.open('${cy}/spouse/managerment/xxPhoto.do')" style="cursor: pointer;font: 'normal 30px Times New Roman, Times, serif';color: #dbccd7;font-size: 16px;margin:0px;">the all</a></span>
        </h1>
      </div>
      <div class="clr"></div>
      <div class="project">
       <%--  <ul>
          <li><a href="#"><img src="${cy}/images/jing/xue.jpg" alt="project 1" width="303" height="430" border="0" /></a><span></span></li>
          <li><a href="#"><img src="${cy}/images/jing/xue.jpg" alt="project 1" width="303" height="430" border="0" /></a><span></span></li>
          <li><a href="#"><img src="${cy}/images/jing/xue.jpg" alt="project 1" width="303" height="430" border="0" /></a><span></span></li>
          <li><a href="#"><img src="${cy}/images/jing/xue.jpg" alt="project 1" width="303" height="430" border="0" /></a><span></span></li>
        </ul> --%>
        <ul id="project_her_photo">
        </ul>
        <div class="clr"></div>
      </div>
      <div class="block_text">
        <div class="block_full">
          <p class="title">
          	<img src="${cy}/images/tian.jpg" width="138" height="132" hspace="10" vspace="5" align="left" alt="herPhoto" id="herPhoto" />
          	<span id="herTitle"></span>
          </p>
          <p id="herContent"></p>
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
       <p>Copyright © 2013-2015 xfxmcy.com. All rights reserved.</p>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>