<%@ page  language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cy" value="${pageContext.request.contextPath}" ></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">	
<head>
<link rel="shortcut icon" href="${cy}/icon/favicon.ico" type="image/x-icon"/>
<!-- css -->
<link rel="stylesheet" href="${cy}/js/jquery-easyui-cy/themes/icon.css"/>
<link rel="stylesheet" href="${cy}/js/jquery-easyui-cy/themes/style.css"/>
<link rel="stylesheet" href="${cy}/js/jquery-easyui-cy/themes/main/my.css"/>
<link rel="stylesheet" href="${cy}/js/jquery-easyui-cy/themes/main/business.css"/>

<%-- <link rel="stylesheet" type="text/css" href="${cy}/style/course/css/head-footer.css" />
<link rel="stylesheet" type="text/css" href="${cy}/style/course/css/superfish.css" />
<link rel="stylesheet" type="text/css" href="${cy}/style/course/css/left-tree.css" />
<link rel="stylesheet" type="text/css" href="${cy}/style/course/css/font-awesome.css" media="screen"/>

<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
 --%>
<link rel="stylesheet" href="${cy}/js/jquery-easyui-cy/themes/main/tip.css"/>


<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/easyloader.js"></script>
<%-- <script type="text/javascript" src="${cy}/js/jquery-easyui-cy/utils.core.js"></script> --%>
<%-- <script type="text/javascript" src="${cy}/js/sms/tjise_iss_sms.js"></script>
<script type="text/javascript" src="${cy}/js/sms/config.js"></script> --%>

<!-- full canlendar -->
<link rel='stylesheet' href='${cy}/js/fullcalendar/cupertino/jquery-ui.min.css' />
<link rel="stylesheet" href="${cy}/js/fullcalendar/fullcalendar.css"/>
<link rel="stylesheet" href="${cy}/js/fullcalendar/fancybox.css"/>
<%-- <script type="text/javascript" src="${cy}/js/jquery-easyui-cy/jquery-1.9.1.js"></script> --%>
<script type="text/javascript" src="${cy}/js/fullcalendar/jquery-ui.custom.min.js"></script>
<script type="text/javascript" src="${cy}/js/fullcalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="${cy}/js/fullcalendar/jquery.fancybox-1.3.1.pack.js"></script>



<!-- load  -->
<script type="text/javascript" src="${cy}/js/jquery-easyui-cy/xfUtil.js"></script> 
<link rel="stylesheet" href="${cy}/css/font.css"/>
<script type="text/javascript">
	easyloader.locale = 'zh_CN';
	easyloader.theme = "bootstrap";
	window._contextPath = "${cy}";
	
	/*trim*/
	if(!String.prototype.trim) {
        String.prototype.trim = function () {
            return this.replace(/^\s+|\s+$/g,'');
       };
   }
</script>
