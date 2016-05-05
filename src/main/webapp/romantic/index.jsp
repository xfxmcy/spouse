<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>xue</title>
<link rel="shortcut icon" href="${cy}/icon/favicon.ico" type="image/x-icon"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="css/reset_y.css"/>
<script id="jquery_183" type="text/javascript" class="library" src="js/jquery-1.8.3.min.js"></script>
<script>
/* (function() {
    if (! 
    
    0) return;
    var e = "abbr, article, aside, audio, canvas, datalist, details, dialog, eventsource, figure, footer, header, hgroup, mark, menu, meter, nav, output, progress, section, time, video".split(', ');
    var i= e.length;
    while (i--){
        document.createElement(e[i])
    }
    
})(); */
	var lastId ;
	initialTimeSheet.call(this);
  
   /*initial timesheet*/
   function initialTimeSheet(){
	   $.post("${cy}/home/homeQuery.ajax","queryType=romaticPaged",function(data){
		   var rows = data.rows;
		   var dataXFirst = -600;
		   var dataX = 0;
		   var dataScale = 0.5;
		   var dataId = 0;
		   var jingHtml = "";
		   
		   $.each(rows,function(index,row){
			   if(index == 0){
				   if(row.isyear == 1){
					   jingHtml += "<div class='step year'  data-x='-600' data-y='0' data-scale ='0.5' id='"+dataId+"'>"
				        	+"<div class='year2012'>"+row.formattedYear+"</div>"
				        	+"<div class='"+row.contentclass+"'>"+row.title+"<br/>"
				        	+"</div>"
				      		+"</div>";
				   }
				   else{
					   jingHtml += "<div class='timeList_item step'  data-x='"+dataX+"' data-y='0'  id='"+dataId+"'>"
				        	+"<div class='circle'>"+row.formattedTime+"</div>"
				           	+"<h2 class='timeList_item_title'>"+row.title+"</h2>"
				        	+"<div class='"+row.contentclass+"' ><img src='${cy}/resource/upload"+row.imagefirst+"' width='500'>"
				            +"<h2>"+row.contentfirst+"</h2>";
				       if(row.imagesecond){
				    	   jingHtml +=  "<p><img src='${cy}/resource/upload"+row.imagesecond+"' ></p>"	
				       }    
				       else if(row.contentsecond){
				    	   jingHtml +=  "<p>"+row.contentsecond+"</p>";
				       }    
				       jingHtml += "</div></div>";  
				       dataX += 200;
				   }
				 
			   }else{
				   if(row.isyear == 1){
					   dataX -= 200;
					   jingHtml += "<div class='step year'  data-x='"+dataX+"' data-y='0' data-scale ='0.5' id='"+dataId+"'>"
					   		+"<div class='year2012'>"+row.formattedYear+"</div>"
			        		+"<div class='"+row.contentclass+"'>"+row.title+"<br/>"
				        	+"</div>"
				      		+"</div>";
					   dataX += 400;
				   }
				   else{
					   jingHtml += "<div class='timeList_item step'  data-x='"+dataX+"' data-y='0'  id='"+dataId+"'>"
			        	+"<div class='circle'>"+row.formattedTime+"</div>"
			           	+"<h2 class='timeList_item_title'>"+row.title+"</h2>"
			        	+"<div class='"+row.contentclass+"' ><img src='${cy}/resource/upload"+row.imagefirst+"' width='500'>"
			            +"<h2>"+row.contentfirst+"</h2>";
				       if(row.imagesecond){
				    	   jingHtml +=  "<p><img src='${cy}/resource/upload"+row.imagesecond+"' ></p>"	
				       }    
				       else if(row.contentsecond){
				    	   jingHtml +=  "<p>"+row.contentsecond+"</p>";
				       }    
				       jingHtml += "</div></div>";  
				       dataX += 200;	
				   }
			   }
			   dataId++ ;
		   }); 
		   
		   dataX += 200;
		   var last  = "<div class='timeList_item step refresh'  data-x='"+dataX+"' data-y='0' id='"+dataId+"'>"
		   					+"<div class='list_show'> <a href='javascript:replay();'><img src='images/refress.png'/></a>"
	          				+"<p class='end'>jing 的每一天离不开大家的支持！2014，我们会更加努力！</p>"
	        				+"</div>"
	        				+"</div>"; 
	       jingHtml += last;	        				
		   $("#timeList").append(jingHtml);
		  // document.write("<script src='${cy}/romantic/js/impress.js' type='text/javascript'/>");
		   //initialPage.call(this);
		   initialEffort.call(this);
		   lastId = dataId;
	   },'json');
   }
</script>
</head>
<body class="impress-not-supported">
<div class="bg"> <img src="images/bg04.jpg" width="100%"/> </div>
<header class="top" id="top">
  <h1><a href="${cy}/index.jsp"><!-- <img src="images/jing.png" alt="jing"/> -->阳春白雪</a>
  <%-- <a href="${cy}/index.jsp"><em>静花雪月</em></a> --%>
  </h1>
  <div class="music" id="bgMusicSwitch" title="stop music">
    <div class="triangle"></div>
    <div class="pause pause1"></div>
    <div class="pause pause2"></div>
  </div>
</header>

<section id="timeline" class="timeline">
  <div id="line" class="line_white"> </div>
  <div id="impress">
    <div id="timeList">
    </div>
  </div>
</section>
<div class="gotop"> <a href="#top"><img src="images/top.png" title="回顶部"/></a> </div>
<!--[if !IE]><!-->
<script type="text/javascript" src="js/impress.js"></script>
<!--<![endif]-->
</body>
</html>
<style>
body {
	font-family: 微软雅黑, Verdana, sans-serif, 宋体;
	color: #fff;
	background: #fff;
	background-size: 110% 110%;
	-webkit-transition: all 1s ease-in;
	-moz-transition:    all 1s ease-in;
	-ms-transition:     all 1s ease-in;
	-o-transition:      all 1s ease-in;
	transition:         all 1s ease-in;
	_background:#fff url(images/bg01.jpg) no-repeat;
	_background-attachment:fixed;
}
body.impress-not-supported {
	line-height: 200%;
	font-size: 18px;
}
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
	display: block;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
a {
	color: inherit;
	text-decoration: none;
	padding: 0 0.1em;
	text-shadow: 1px 1px 5px rgba(100, 100, 100, 0.5);
	border-radius: 0.2em;
	-webkit-transition: 0.5s;
	-moz-transition:    0.5s;
	-ms-transition:     0.5s;
	-o-transition:      0.5s;
	transition:         0.5s;
}
a:hover, a:focus {
	text-shadow: 1px 1px 5px rgba(100, 100, 100, 0.2);
}
.mt10 {
	margin-top: 10px;
}
.opacity7 {
	opacity: 0.7;
}
.opacity9 {
	opacity: 0.9;
}
.rotate45 {
	-webkit-transform: rotate(720deg);
	-moz-transform: rotate(360deg);
	-ms-transform: rotate(360deg);
	-o-transform: rotate(360deg);
	transition: rotate(360deg);
	-webkit-transition: all 0.2s ease-in;
	-moz-transition:    all 0.2s ease-in;
	-ms-transition:     all 0.2s ease-in;
	-o-transition:      all 0.2s ease-in;
	transition:         all 0.2s ease-in;
}
.step {
	position: relative;
	width: 900px;
	padding: 40px;
	margin: 20px auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing:    border-box;
	-ms-box-sizing:     border-box;
	-o-box-sizing:      border-box;
	box-sizing:         border-box;
	font-size: 48px;
	line-height: 1.5;
	cursor: pointer;
}
.impress-not-supported .step {
	font-size: 18px
}
.impress-enabled .step {
	margin: 0;
	-webkit-transition: opacity 1s;
	-moz-transition:    opacity 1s;
	-ms-transition:     opacity 1s;
	-o-transition:      opacity 1s;
	transition:         opacity 1s;
}
.impress-enabled .step.active {
	opacity: 1;
}
/*  header   */
header {
	background:transparent;
filter:
progid:DXImageTransform.Microsoft.gradient(startColorstr=#51ffffff, endColorstr=#51ffffff);
	background-color: rgba(255, 255, 255, 0.2);
	_background-color:#f3f3f3;
	padding: 10px 0;
	top: 0;
	left: 0;
	width:100%;
	z-index: 100;
}
.top h1 {
	width: 1000px;
	margin: 0 auto;
	font-size: 28px;
	-webkit-transition: all 1s ease-in-out 0.5s;
	-moz-transition:    all 1s ease-in-out 0.5s;
	-ms-transition:     all 1s ease-in-out 0.5s;
	-o-transition:      all 1s ease-in-out 0.5s;
	transition:         all 1s ease-in-out 0.5s;
}
.top h1 a {
	display: inline-block;
}
.top h1 img {
	display: inline-block;
	zoom: 1;
	width: 160px;
	height: 47px;
	border-right: 1px solid rgba(255, 255, 255, .1);
	margin-right: 10px;
	padding-right: 10px;
}
.top h1 em {
	vertical-align: top;
	display: inline-block;
	color: #40AA53;
	line-height: 48px;
	font-style: normal;
	-webkit-transition: all 1s ease-in-out 0.5s;
	-moz-transition:    all 1s ease-in-out 0.5s;
	-ms-transition:     all 1s ease-in-out 0.5s;
	-o-transition:      all 1s ease-in-out 0.5s;
	transition:         all 1s ease-in-out 0.5s;
}
/*   bg    */
.impress-supported .bg {
	overflow: hidden;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -100;
	background:#fff url(images/bg04.jpg) no-repeat;
	-webkit-transition: all 0.5s ease-in;
	-moz-transition:    all 0.5s ease-in;
	-ms-transition:     all 0.5s ease-in;
	-o-transition:      all 0.5s ease-in;
	transition:         all 0.5s ease-in;
}
.impress-not-supported .bg {
	background: #333;
	position: fixed;
	top: 0;
	left: 0;
	z-index: -100;
	-webkit-transition: all 0.5s ease-in;
	-moz-transition:    all 0.5s ease-in;
	-ms-transition:     all 0.5s ease-in;
	-o-transition:      all 0.5s ease-in;
	transition:         all 0.5s ease-in;
	_display: none;
}
.impress-not-supported .bg img {
	height:1200px;
}
.impress-supported .bg img {
	-webkit-transition: all 0.5s ease-in;
	-moz-transition:    all 0.5s ease-in;
	-ms-transition:     all 0.5s ease-in;
	-o-transition:      all 0.5s ease-in;
	transition:         all 0.5s ease-in;
}
/*    timeline   */
.impress-supported .timeline {
	position: absolute;
	bottom: 20%;
	left: 0;
	width: 100%;
	padding: 0 100px;
	font-size: 18px;
	-webkit-transition: all 1s ease-in-out 1.5s;
	-moz-transition:    all 1s ease-in-out 0.5s;
	-ms-transition:     all 1s ease-in-out 0.5s;
	-o-transition:      all 1s ease-in-out 0.5s;
	transition:         all 1s ease-in-out 0.5s;
}
.impress-not-supported .timeline {
	margin-top: 30px;
}
.impress-supported .line_white {
	height: 5px;
	width: 100%;
	background: rgba(255, 255, 255, .2);
	position: absolute;
	bottom: 50%;
	left: 0;
	z-index: -10;
}
/*    timeList_item   */
.impress-supported .timeList_item {
	position:relative;
	float: left;
}
.impress-not-supported .timeList_item {
	background:transparent;
filter:
progid:DXImageTransform.Microsoft.gradient(startColorstr=#51000000, endColorstr=#51000000);
	background: rgba(0, 0, 0, .2);
 _filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a6000000', endColorstr='#00000000', GradientType=0 );
	_background-color:#333;
	padding: 30px;
	border-radius: 10px;
}
.impress-supported .present {
	margin-top: -20px;
	-webkit-transition: all 0.5s ease-in;
	-moz-transition:    all 0.5s ease-in;
	-ms-transition:     all 0.5s ease-in;
	-o-transition:      all 0.5s ease-in;
	transition:         all 0.5s ease-in;
}
.impress-supported .circle {
	margin-right: 100px;
	width:64px;
	height: 64px;
	background-color: rgba(0, 0, 0, 0.9);
	border-radius: 50%;
	border: 5px solid rgba(255, 255, 255, 0.8);
	font-size: 20px;
	color: #fff;
	text-align: center;
	line-height: 64px;
	cursor: pointer;
	-webkit-transition: all 0.5s ease-in;
	-moz-transition:    all 0.5s ease-in;
	-ms-transition:     all 0.5s ease-in;
	-o-transition:      all 0.5s ease-in;
	transition:         all 0.5s ease-in;
}
.impress-supported .present .circle {
	width:90px;
	height: 90px;
	background-color: rgba(235, 0, 0, 0.9);
	line-height:90px;
	font-size: 24px;
	-webkit-transition: all 0.5s ease-in;
	-moz-transition:    all 0.5s ease-in;
	-ms-transition:     all 0.5s ease-in;
	-o-transition:      all 0.5s ease-in;
	transition:         all 0.5s ease-in;
	border: none;
}
.impress-not-supported .circle {
	font-size: 48px;
}
.impress-supported .timeList_item_title {
	width: 150px;
	position: absolute;
	top: 158px;
	left: -84px;
	-webkit-transform:rotate(-45deg);
	-moz-transform:rotate(-45deg);
	-ms-transform:rotate(-45deg);
	-o-transform:rotate(-45deg);
	transform:rotate(-45deg);
	text-align: right;
	font-size: 14px;
	letter-spacing: 1px;
	-webkit-transition: all 1s ease-in-out 0.5s;
	-moz-transition:    all 1s ease-in-out 0.5s;
	-ms-transition:     all 1s ease-in-out 0.5s;
	-o-transition:      all 1s ease-in-out 0.5s;
	transition:         all 1s ease-in-out 0.5s;
}
.impress-not-supported .timeList_item_title {
	font-size: 24px;
	line-height: 200%;
	color: #ff9900;
	font-size: 30px;
}
.impress-supported .present .timeList_item_title {
	width: 500px;
	top: -10px;
	left: 280px;
	line-height: 100%;
	-webkit-transform: none;
	-moz-transform: none;
	-ms-transform: none;
	-o-transform: none;
	transform: none;
	font-size: 24px;
	color: #fff;
	text-align: center;
	margin-left: -50%;
	text-shadow: 0 0 10px rgba(0, 0, 0, .5);
	-webkit-transition: all 0.5s ease-in;
	-moz-transition:    all 0.5s ease-in;
	-ms-transition:     all 0.5s ease-in;
	-o-transition:      all 0.5s ease-in;
	transition:         all 0.5s ease-in;
}
.impress-supported .year2012, .impress-supported .year2013 {
	position: absolute;
	top: -120px;
	color: rgba(255, 255, 255, .5);
	font-size: 120px;
	color: #fff;
}
.impress-not-supported .year2012, .impress-not-supported .year2013 {
	padding: 0;
	width: 110px;
	height: 38px;
	line-height: 38px;
	font-size: 24px;
	background-color: #2f9dcc;
	text-align: center;
	border-radius: 5px;
}
.impress-not-supported .year {
	padding: 0;
}
.impress-supported .list_show {
	position: absolute;
	top: -540px;
	left: -130px;
	width: 980px;
	height: 400px;
}
.impress-supported .list_show img {
	background: rgba(255, 255, 255, .2);
	border-radius: 10px;
	float: left;
	margin-right: 30px;
	position: absolute;
	width: 500px;
	height: auto;
}
.impress-enabled .step .list_show {
	opacity: 0;
	-webkit-transition: all 0.5s ease-in;
	-moz-transition:    all 0.5s ease-in;
	-ms-transition:     all 0.5s ease-in;
	-o-transition:      all 0.5s ease-in;
	transition:         all 0.5s ease-in;
	-webkit-transform:scale(0.5);
	-moz-transform:   scale(0.5);
	-ms--transform:   scale(0.5);
	-o--transform:    scale(0.5);
	transform:        scale(0.5);
	color: #fff;
}
.impress-enabled .step.active .list_show {
	opacity: 1;
	-webkit-transform:scale(1);
	-moz-transform:   scale(1);
	-ms--transform:   scale(1);
	-o--transform:    scale(1);
	transform:        scale(1);
	-webkit-transition: all 1s ease-in-out 1s;
	-moz-transition:    all 1s ease-in-out 1s;
	-ms-transition:     all 1s ease-in-out 1s;
	-o-transition:      all 1s ease-in-out 1s;
	transition:         all 1s ease-in-out 1s;
}
.impress-supported .list_show h2 {
	font-size: 46px;
	color: #0087f1;
	-webkit-transition: all 1s ease-in;
	-moz-transition:    all 1s ease-in;
	-ms-transition:     all 1s ease-in;
	-o-transition:      all 1s ease-in;
	transition:         all 1s ease-in;
}
.impress-not-supported .list_show h2 {
	display: none;
}
.impress-supported .list_show p {
	color: rgba(255, 255, 255, .8);
	color: #fff;
	font-size: 24px;
	-webkit-transition: all 1s ease-in;
	-moz-transition:    all 1s ease-in;
	-ms-transition:     all 1s ease-in;
	-o-transition:      all 1s ease-in;
	transition:         all 1s ease-in;
	margin-left: 530px;
}
/*  list_show布局  */
.impress-enabled .step.active .list_show img {
	position: absolute;
	top: 0;
	left: 0;
	-webkit-transition: all 1s ease-in;
	-moz-transition:    all 1s ease-in;
	-ms-transition:     all 1s ease-in;
	-o-transition:      all 1s ease-in;
	transition:         all 1s ease-in;
}
.impress-enabled .step.active .list_show h2 {
	position: absolute;
	top: 0;
	left: 530px;
	margin: 0;
	width: 460px;
}
.impress-enabled .step.active .list_show p {
	position: absolute;
	top: 90px;
	left: 530px;
	margin: 0;
	text-shadow: 1px 1px 5px rgba(0, 0, 0, .5);
}
.impress-enabled .step.active .list_show p img {
	padding: 5px;
	background-color: #fff;
	width: 460px;
}
.impress-enabled .step.active .show1 img {
	left: auto;
	right: 0;
}
.impress-enabled .step.active .show1 h2 {
	left: 0;
}
.impress-enabled .step.active .show1 p {
	top: 90px;
	left: 0;
}
.impress-enabled .step.active .show2 img {
	left: 0;
	top: 90px;
}
.impress-enabled .step.active .show2 h2 {
	left: 0;
	top: 0;
	width: auto;
}
.impress-enabled .step.active .show2 p {
	top: 90px;
	left: 530px;
}
.impress-enabled .step.active .show3 img {
	left: 0;
}
.impress-enabled .step.active .show3 h2 {
	left: 530px;
	top: 0;
}
.impress-enabled .step.active .show3 p, .impress-enabled .step.active .show4 3 img {
 left: auto;
 right: 0;
 width: 460px;
}
.impress-enabled .step.active .show3 p {
	top:90px;
}
.impress-enabled .step.active .show4 img {
	left: auto;
	right: 0;
	width: 400px;
}
.impress-enabled .step.active .show4 h2 {
	left: 0;
	top: 0;
}
.impress-enabled .step.active .show4 p, .impress-enabled .step.active .show4 p img {
	left: 0;
}
.impress-enabled .step.active .show4 p {
	top:90px;
}
.impress-supported .list_show p img {
	width: 460px;
}
.impress-enabled .step.active .show5 img {
	left: auto;
	right: 0;
	width: 300px;
	box-shadow: 5px 0 10px rgba(0, 0, 0, .2);
}
.impress-enabled .step.active .show5 h2 {
	left: 0;
	top: 0;
}
.impress-enabled .step.active .show5 p, .impress-enabled .step.active .show5 p img {
	top: 40px;
	left: 0;
	width: 700px;
}
.impress-enabled .step.active .list_show p.m160, .impress-enabled .step.active .show1 p.m160, .impress-enabled .step.active .show2 p.m160, .impress-enabled .step.active .show3 p.m160, .impress-enabled .step.active .show4 p.m160, .impress-enabled .step.active .show5 p.m160 {
	top: 160px;
}
.impress-enabled .step.active .list_show p.end {
	top: 0;
	left: 0;
	font-size: 36px;
}
.gotop {
	display: none;
}
.impress-supported .refresh img {
	width: 160px;
	height: 160px;
	opacity: 0.8;
	left: 290px;
	top: 100px;
	cursor: pointer;
}
.impress-not-supported .refresh {
	display: none;
}
.impress-not-supported .gotop {
	position: fixed;
	width: 60px;
	height: 60px;
	right:120px;
	bottom: 60px;
}
.impress-not-supported .gotop img {
	background:transparent;
 filter:
progid:DXImageTransform.Microsoft.gradient(startColorstr=#51ffffff, endColorstr=#51ffffff);
	background: rgba(255, 255, 255, .2);
	border-radius: 10px;
	padding: 10px;
}
/*    music   */
.music {
	position: fixed;
	top: 8px;
	right: 40px;
	width: 50px;
	height:50px;
	cursor:pointer;
	font-size: 24px;
 font-weight：bold;
	border-radius: 50%;
	background-color: rgba(255, 255, 255, .2);
	-webkit-transition: all 0.2s ease-in;
	-moz-transition:    all 0.2s ease-in;
	-ms-transition:     all 0.2s ease-in;
	-o-transition:      all 0.2s ease-in;
	transition:         all 0.2s ease-in;
}
.triangle {
	width:0;
	height:0;
	border-bottom:20px transparent solid;
	border-top:12px transparent solid;
	border-left:24px #333 solid;
	border-left:24px rgba(0, 0, 0, .8) solid;
	border-right:12px transparent solid;
	position: absolute;
	top: 10px;
	left: 18px;
}
.pause {
	width:8px;
	height:25px;
	background:#333;
	background:rgba(0, 0, 0, .8);
	float:left;
	display: none;
}
.pause1 {
	margin:12px 0px 0 13px;
}
.pause2 {
	margin:12px 10px 0 8px;
}
 @media (max-height: 900px) {
 .impress-supported .list_show img {
 width: 400px;
}
.impress-enabled .step.active .list_show p img {
max-width: 300px;
}
.impress-enabled .step.active .show5 p, .impress-enabled .step.active .show5 p img {
max-width: 540px;
}
 .impress-supported .list_show p, .impress-supported .list_show h2 {
 margin-left: 420px;
}
 .impress-supported .list_show {
top: -410px;
}
.impress-enabled .step.active .list_show h2, .impress-enabled .step.active .list_show p {
 left: 430px;
}
.impress-enabled .step.active .show3 h2, .impress-enabled .step.active .show3 p {
left: 430px;
}
.impress-enabled .step.active .show4 h2, .impress-enabled .step.active .show4 p, .impress-enabled .step.active .show4 p img, .impress-enabled .step.active .list_show .show1 h2, .impress-enabled .step.active .list_show .show1 p {
 left: 0;
}
.impress-enabled .step.active .show1 h2, .impress-enabled .step.active .list_show .show1 p {
left: 0;
}
.impress-enabled .step.active .show1 p {
left: 0;
}
 .impress-enabled .step.active .show4 img, .impress-enabled .step.active .show1 img {
 left: 460px;
}
.impress-enabled .step.active .show5 h2, .impress-enabled .step.active .show5 p {
left: 0;
}
}
 @media (mix-height: 900px) {
 .impress-supported .list_show img {
 width: 500px;
}
 .impress-supported .list_show p, .impress-supported .list_show h2 {
 margin-left: 520px;
}
 .impress-supported .list_show {
top: -500px;
}
}
.impress-enabled .refresh .list_show img, .impress-enabled .step.active.refresh .list_show img {
	width: 160px;
	left: 250px;
	top: 100px;
}
</style>
<script>
var impress = $.browser.msie?undefined:impress();

//预加载图片
new Image().src = "images/bg04.jpg";
new Image().src = "images/bg01.jpg";
new Image().src = "images/bg02.jpg";
new Image().src = "images/bg03.jpg";

var replay = function(){
	if(impress){
		impress.goto($("#0")[0]);
	}else{
		location.reload();
	}
};


var event_cache = null;

var loop = true,timing=null;

$(function(){			
	
	 $(window).bind('scroll resize',function(){
        if($(window).scrollTop() >= 1)
            $('.gotop').css('display','block');
        else
            $('.gotop').css('display','none');
    });   
	
	var cache_event_top = function(){
		if(event_cache!=null)
			return;
		event_cache = new Array(24);
		var i = 0;
		var length = event_cache.length;
		for(;i<length;i++){
			var id = i+1;
			event_cache[i] = $("#"+id).position().top;
		}
	}
		
	var resize = function(){
		
		var width = $(window).width();
		var height = $(window).height();
		$(".bg img").css("width",width);
		$(".bg img").css("height",height);
		
	};
		
	var cur_month = 2;

	var getMonthByTop = function(top){
		for(var i=0,event=event_cache[i];i<event_cache.length;i++){
				if(i==event_cache.length-1 && top>=event || top>=event && top<event_cache[i+1]){
					var date = $("#"+(i+1)).find(".circle").html();
					if(date){
						var month = +date.split("/")[0];
						return month;
					}
				}
		}
		return cur_month;
	};
		
	var scroll = function(){
		if($.browser.msie){
			cache_event_top();
			var st = $(window).scrollTop();
			var month = getMonthByTop(st);
			if(month!=cur_month){
				changeBackground(month);
				cur_month = month;
			}
		}
	};
	
	resize();
	
	$(window).resize(function(){
		resize();
	});
	
	$(window).scroll(function(){
		scroll();
	});
	
	$(".circle").click(function(){
			loop = false;
		if(timing)
			clearInterval(timing);
	});
	$(".refresh img").click(function(){
		loop = true;
		$(".refresh img").addClass("rotate45");
		setTimeout(function(){
			$(".refresh img").removeClass("rotate45");
		},2000);	
	});
	if(!$.browser.msie){
		if($.browser.safari)
			bgMusic = new Audio('music/music.mp3');
		else
			bgMusic = new Audio('music/music.mp3');
		bgMusic.loop = true;
		bgMusic.volume = 0.7;
		$('#bgMusicSwitch').click(function(){
			if(bgMusic.paused){
				bgMusic.play();
				$(".triangle").css("display","none");
				$(".pause").css("display","block");
				$("#bgMusicSwitch").attr("title","暂停背景音乐");
			}else{
				bgMusic.pause();
				$(".pause").css("display","none");
				$(".triangle").css("display","block");
				$("#bgMusicSwitch").attr("title","播放背景音乐");
			}});
		var bgSwitch = function(){
			$('#bgMusicSwitch').trigger('click');
		}
				
		bgSwitch();
	}else{
		$(".music").hide();
	}		
	
});

	
function initialEffort(){
	if(impress)impress.init();
	
	var last_month = 4;
	
	var changeBackground = function(month){
		var body = $("body");
		var url = "";
		if(month == 12 || month == 1 || month==2){
			if(last_month==4)
				return;
			last_month = 4;
			url = "images/bg04.jpg";
			$("header").css("background-color","rgba(255,255,255,0.2)");
			$(".impress-supported .list_show h2").css("color","#0087f1");
			$(".impress-not-supported .timeList_item_title").css("color","#0087f1");
		}else if(month>=3 && month<=5){
			if(last_month==1)
				return;
			last_month = 1;
			url = "images/bg01.jpg";
			$("header").css("background-color","rgba(255,255,255,0.2)");
			$(".impress-supported .list_show h2").css("color","#fff");
			$(".impress-not-supported .timeList_item_title").css("color","#eca200");
		}else if(month>=6 && month<=8){
			if(last_month==2)
				return;
			last_month = 2;
			url = "images/bg02.jpg";
			$("header").css("background-color","rgba(0,0,0,0.2)");
			$(".impress-supported .list_show h2").css("color","#82e211");
			$(".impress-not-supported .timeList_item_title").css("color","#82e211");
		}else{
			if(last_month==3)
				return;
			last_month = 3;
			url = "images/bg03.jpg";
			$("header").css("background-color","rgba(255,255,255,0.2)");
			$(".impress-supported .list_show h2").css("color","#ffca00");
			$(".impress-not-supported .timeList_item_title").css("color","#ffca00");
		}
		$(".bg img").attr("src",url);
	};
	
	if(!$.browser.msie){
		document.addEventListener('impress:stepenter', function(e){
			var cur = arguments[0].target;
			var date = $(cur).find(".circle").html();
			if(date){
				var month = +date.split("/")[0];
				changeBackground(month);
			}
			if(!loop)
				return;
			if (typeof timing !== 'undefined') clearInterval(timing);
			var duration = 4000;
			timing = setInterval(function(){
				var dom = impress.next();
				var id = +$(dom).attr("id");
				if(id == lastId){
					clearInterval(timing);
					loop = false;
				}
			}, duration);
		});
	}
}

</script>
