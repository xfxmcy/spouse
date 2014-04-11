<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <#include "/layout/xm.ftl">
	<#list cys as cy>
	 ${cy.id} &nbsp;&nbsp;&nbsp; ${cy.name} <br/>
	</#list>
</body>
</html>