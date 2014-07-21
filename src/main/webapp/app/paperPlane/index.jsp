<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>happy birthday</title>
<link rel="shortcut icon" href="${cy}/icon/favicon.ico" type="image/x-icon"/>
<link type="text/css" rel="stylesheet" href="${cy}/app/paperPlane/css/zzsc.css">
<script src="${cy}/app/paperPlane/js/jquery-1.8.3.min.js"></script>

<body>
	<audio autoplay="autopaly"> 
		<source src="${cy}/app/love/renxi.mp3" type="audio/mp3" /> 
	</audio>
	
<div id="plate" class="front">  
<textarea class="message" id="jingContent">亲爱的,有些事情不是看到希望才去坚持，而是坚持了才有希望,快写下你的愿望...</textarea>
<button class="send"> 许愿 </button> <br/>
<div id="bottom"></div>
</div>

<div id="container" class="beginning">
<div id="left-wing">
<div class="top_left curvable"> </div>
<div class="bottom_left curvable"> </div>
<div class="wing wing1"></div>
<div class="wing wing2"></div>
</div>

<div id="right-wing">
<div class="top_right curvable"> </div>
<div class="bottom_right curvable"> </div>
<div class="wing wing3"></div>
<div class="wing wing4"></div>
</div>

</div>
<%-- <script src="${cy}/app/paperPlane/js/zzsc.js"></script> --%>
<script type="text/javascript" >
$().ready(function() {
	$('.send').click(function() {
		$.post("${cy}/romantic/dreamBirthday.do","queryType=simpleSave&text="+$("#jingContent").val()+"&subject=dear jing",function(data){
			
		});
		setTimeout(function() {
			$('#plate').removeClass('front');
			$('#container').removeClass('beginning');
			$('.curvable').addClass('curved');
				setTimeout(function() {
					$('#container').addClass('hover');
						setTimeout(function() {
							$('#container').addClass('fly_away_first');
								setTimeout(function() {
									$('#container').addClass('fly_away');
									setTimeout(function(){
										alert("静的愿望种子,已搭载诺亚方舟,飞向太空,一定会实现的...下一个愿望...");
										$('#plate').addClass('front');
										$('#container').removeClass('fly_away fly_away_first hover').addClass('beginning');
									    $('.curvable').removeClass('curved');
									},3000);
								}, 600);
						}, 2000);
				}, 2800);
		}, 200);
	});
	});
</script>
<div style="text-align:center;clear:both">

</div>
</body>
</html>