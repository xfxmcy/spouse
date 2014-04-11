<#--数据模型的变量   root-->
<#--模板的变量   assign-->
<#--局部的变量  指定中的变量-->
<#--循环的变量  循环中的变量-->

<#--模板的变量   数据模型的变量  相同时   不覆盖  but 模型的变量hide -->

<#assign user = "li"/>
${user}
<#--寻找模型的变量-->
${.globals.user} 

<#macro cy>
	<#--调用cy 时 user会被覆盖,不建议使用-->	
	<#--<#assign user = "mm"/>-->
	<#local user = "mm"/> <#--局部变量-->
	${user}
</#macro>
<@cy/>