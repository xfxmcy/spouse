<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>happy birthday</title>
<link rel="shortcut icon" href="${cy}/icon/favicon.ico" type="image/x-icon"/>
<link href="${cy}/app/birthday/css/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="${cy}/app/birthday/js/jquery.js"></script>
<script type="text/javascript" src="${cy}/app/birthday/js/garden.js"></script>
<script type="text/javascript" src="${cy}/app/birthday/js/functions.js"></script> 
<style type="text/css">
@font-face {
	font-family: digit;
	src: url('digital-7_mono.ttf') format("truetype");
}
</style>
<body>
	<audio autoplay="autopaly"> 
		<source src="${cy}/app/love/renxi.mp3" type="audio/mp3" /> 
	</audio>
	<div id="mainDiv">
	<div id="content">
		<div id="code">
			<span class="comments">/**</span><br />
			<span class="space"/><span class="comments">*1992—10-19,</span><br />
			<span class="space"/><span class="comments">*2014-10-17. </span><br />
			<span class="space"/><span class="comments">*第22个... 9月24. </span><br />
			<span class="space"/><span class="comments">*/</span><br />
			Girl name = <span class="keyword">Miss</span> Yang<br />
			<span class="comments">// 辛集小学. </span><br />
			
			<span class="comments">// 青县二中.</span><br />
			
			<span class="comments">// 沧州七中.</span><br />
			<span class="comments">// 青县一中.</span><br />
			<span class="comments">// 对面经济贸易.</span><br />
			<span class="comments">// 22个春秋.</span><br />
			<span class="keyword">静</span> happy <span class="keyword">birthday</span>;<br />
			<span class="placeholder"/><span class="comments">// 越来越漂亮</span><br />
			<span class="placeholder"/><span class="comments">// 越来越开心.</span><br />
			<span class="placeholder"/>have a petty dream;<br />
			<span class="placeholder"/>// happiness ~ 幸福.</span><br />
			<br>
			<br>
			I want to say:<br />
			.... forever;<br />
			jing 来许愿吧...吼吼 
			<input type="button" value="许愿" onclick="javascript:window.open('${cy}/app/paperPlane/index.jsp');"/>
		</div>
		<div id="loveHeart">
			<canvas id="garden"></canvas>
			<div id="words">
				<div id="messages">
					静，这个世界拥有你,已经有
					<div id="elapseClock"></div>
				</div>
				<div id="loveu">
					永永远远<br/>
					<div class="signature">- 开心幸福</div>
				</div>
			</div>
		</div>
	</div>
	<div id="copyright">
		<!--<a href="#">....</a><br />
		<a href="#">....</a><br />-->
		
	</div>
</div>

<script type="text/javascript">
var offsetX = $("#loveHeart").width() / 2;
var offsetY = $("#loveHeart").height() / 2 - 55;
var together = new Date();
together.setFullYear(1992, 10, 19);
together.setHours(0);
together.setMinutes(0);
together.setSeconds(0);
together.setMilliseconds(0);

if (!document.createElement('canvas').getContext) {
	var msg = document.createElement("div");
	msg.id = "errorMsg";
	msg.innerHTML = "Your browser doesn't support HTML5!<br/>Recommend use Chrome 14+/IE 9+/Firefox 7+/Safari 4+"; 
	document.body.appendChild(msg);
	$("#code").css("display", "none")
	$("#copyright").css("position", "absolute");
	$("#copyright").css("bottom", "10px");
	document.execCommand("stop");
} else {
	setTimeout(function () {
		startHeartAnimation();
	}, 5000);

	timeElapse(together);
	setInterval(function () {
		timeElapse(together);
	}, 500);

	adjustCodePosition();
	$("#code").typewriter();
}

function sendEmail(){
	
	alert($("#contentEmail").html());
}

</script>
	
</body>
</html>