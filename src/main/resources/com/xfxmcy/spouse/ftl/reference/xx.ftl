<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		${cy.id} <br/>
	你好吗	
	
	<#if cy.age lt 12>
		${cy.name}
		
		<#elseif  cy.age == 12>
		提莫
		<#else>
		 德玛西亚 ${cy.name}
	</#if>
</body>
</html>