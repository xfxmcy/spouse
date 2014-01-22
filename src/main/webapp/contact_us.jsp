<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cy" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>contact us</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${cy}/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${cy}/js/primary/jquery.js"></script>
<script type="text/javascript">
// <![CDATA[
jQuery(document).ready(function(){
	$('#contactform').submit(function(){				  
		var action = $(this).attr('action');
		//$('#contactform')
		//	.before('<div class="loader"><img src="images/ajax-loader.gif" align="center" /></div>')
		//	.attr('disabled','disabled');
		$.post(action, { 
			name: $('#name').val(),
			email: $('#email').val(),
			//phone: $('#phone').val(),
			//concerning: $('#concerning').val(),
			message: $('#message').val()
		},
			function(data){
				$('#contactform #submit').attr('disabled','');
				$('.response').remove();
				$('#contactform').before('<div class="response">'+data+'</div>');
				$('.response').slideDown();
				//$('.loader').fadeOut(500,function(){$(this).remove()});
				if(data=='Message sent!') $('#contactform').slideUp();
			}
		); 
		return false;
	});
});
// ]]>
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
      </ul>
    </div>
  </div>
  <div class="main">
    <div class="services">
      <div class="service_bg">
        <h3>Get in touch!</h3>
        <ul class="link">
          <li>Lorem Ipsum is simply dummy text of the printing and <a href="#"><strong>typesetting industry.</strong></a></li>
        </ul>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been</p>
        <p><span class="px22">+ 800 258 4578</span></p>
        <p><img src="${cy}/images/picture_3.jpg" width="204" height="205" alt="picture 1" /></p>
      </div>
      <div class="clr"></div>
    </div>
    <div class="global_main">
      <div class="page_title_text">
        <h1>Our services</h1>
        <div class="clr"></div>
        <div class="block_text">
          <h2></h2>
          <p><img src="${cy}/images/service_1.jpg" width="150" height="110" hspace="10" vspace="0" align="left" alt="picture 1" /><strong>It is a long established fact that a reader will be</strong> distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.</p>
          <p><a href="#">&gt;&gt; oreder now </a></p>
          <p>&nbsp;</p>
          <form action="" method="post" id="contactform">
        <ol>
          <li>
            <label for="name">Your Name*<br />
              <span>Add your name </span></label>
            <input id="name" name="name" class="text" />
          </li>
          <li>
            <label for="email">Your Email Address*<br />
              <span> Add a valid address</span></label>
            <input id="email" name="email" class="text" />
          </li>
          <li>
            <label for="message">Your Message*<br />
              <span> Communicate with us</span></label>
            <textarea id="message" name="message" rows="6" cols="50"></textarea>
          </li>
          <li class="buttons">
            <input type="submit" value="send message" id="submit" />
          </li>
        </ol>
      </form>
          <div class="clr"></div>
        </div>
      </div>
      <div class="clr"></div>
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