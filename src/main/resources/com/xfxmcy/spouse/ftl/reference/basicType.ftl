
/*basic type   数字/日期/字符串/boolean*/

<#assign cy = 6/>

${cy + 10}


<#--不能随便输出值  but 数字/字符串
          转换方式   x?string
-->
<#assign c = false/>
${c?string}
${(xx.mm)?default('222')}
<#--${(xx.mm)???string('cc','kkk')} -->

${now?string('yyyy -- mm -- dd')}

${10 + cy}

<#--string convert to date-->
<#assign bb = "1991-08-25"?date("yyyy-mm-dd") />
${bb}

${"<br/>"?html} <#-- escape parse-->

${"2121"?left_pad(10,"-")}

<#--强转int-->
${1.4?int}