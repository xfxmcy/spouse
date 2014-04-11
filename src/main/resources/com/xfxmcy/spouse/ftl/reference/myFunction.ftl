/*自定义指令*/
<#--函数名 参数-->
<#macro hi num ok>
  <#list 1..num as n>
    ${ok}
  </#list>
</#macro>
<@hi num=10 ok="hi"/>

<#-- defined default value-->
<#macro repeat num=10 ok="ok">
  <#list 1..num as n>
    ${ok}
  </#list>
</#macro>


<@repeat/>

<#--输出 调用指定的内容-->
<#macro content>
	<#--	<#nested 12 33/> 
		<#nested 11 22/>-->
</#macro>
<#--x y 可以获取自定义指令的变量
<#--<@content;x,y>
  德玛西亚  ${x} ${y}
<#--</@content>-->



