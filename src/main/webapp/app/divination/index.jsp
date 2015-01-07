<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Jing</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=2.0">
		<link rel="shortcut icon" href="../../icon/favicon.ico" type="image/x-icon"/>
		<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.slotmachine.js"></script>
	</head>
	<body style="height:100%">
		<%-- <audio autoplay="autopaly"> 
			<source src="${cy}/app/love/renxi.mp3" type="audio/mp3" /> 
		</audio> --%>
		<div class="line">
			<div class="content" style="text-align: center">
				
				<div style="clear:both;">
					<p class="title">Luck forward today: </p>
				</div>
				
				<div style="clear:both;">
					<div id="machine1" class="slotMachine">
						<div class="slot slot1"></div>
						<div class="slot slot2"></div>
						<div class="slot slot3"></div>
						<div class="slot slot4"></div>
						<div class="slot slot5"></div>
						<div class="slot slot6"></div>
					</div>
					
					<div id="machine2" class="slotMachine">
						<div class="slot slot1"></div>
						<div class="slot slot2"></div>
						<div class="slot slot3"></div>
						<div class="slot slot4"></div>
						<div class="slot slot5"></div>
						<div class="slot slot6"></div>
						<div class="slot slot7"></div>
					</div>
					
					<div id="machine3" class="slotMachine">
						<div class="slot slot1"></div>
						<div class="slot slot2"></div>
						<div class="slot slot3"></div>
						<div class="slot slot4"></div>
						<div class="slot slot5"></div>
						<div class="slot slot6"></div>
					</div>
					
					<div id="slotMachineButton1" class="slotMachineButton">GO!</div>
					
					<script>
						$(document).ready(function(){
							var machine1 = $("#machine1").slotMachine({
								active	: 3,
								delay	: 500
							});
							
							var machine2 = $("#machine2").slotMachine({
								active	: 3,
								delay	: 500
							});
							
							var machine3 = $("#machine3").slotMachine({
								active	: 3,
								delay	: 500
							});
							
							function onComplete($el, active){
								
								switch($el[0].id){
									case 'machine1':
										$("#machine1Result").text(overDescription(active.index));
										$("#machine1Result").attr("cy",active.index);
										break;
									case 'machine2':
										$("#machine2Result").text(overDescription(active.index));
										$("#machine2Result").attr("cy",active.index);
										break;
									case 'machine3':
										$("#machine3Result").text(overDescription(active.index));
										$("#machine3Result").attr("cy",active.index);
										if($("#machine1Result").attr("cy") == "0" && $("#machine2Result").attr("cy") == "0" && $("#machine3Result").attr("cy") == "0"){
					
											alert("今天运气碉堡了,心想事成,万事如意,吉星高照,财源广进!!!");
										}
										break;
								}
							}
							function overDescription(index){
								if(index == 0)
								  return "心想事成";
								else if (index == 1)  
									return "新福美满";
								else if (index == 2)
									return "美丽动人";
								else if (index == 3)  
									return "精神焕发";
								else if (index == 4) 
									return "大智若愚"; 
								else if (index == 5)  
									return "弄巧成拙"; 
								else if (index == 6)  
									return "祸不单行"; 
							}
							$("#slotMachineButton1").click(function(){
								
								machine1.shuffle(3, onComplete);
								
								setTimeout(function(){
									machine2.shuffle(3, onComplete);
								}, 500);
								
								setTimeout(function(){
									machine3.shuffle(3, onComplete);
								}, 1000);
								
							})
						});
					</script>
				</div>
				
				<div style="clear:both;">
					<div id="machine1Result" class="slotMachine noBorder" style="text-align:left" cy="3">精神焕发</div>
					<div id="machine2Result" class="slotMachine noBorder" style="text-align:left" cy="3">精神焕发</div>
					<div id="machine3Result" class="slotMachine noBorder" style="text-align:left" cy="3">精神焕发</div>
					<div class="slotMachine noBorder"></div>
				</div>
				
			</div>
		</div>
		
	</body>
</html>
