
/*序列 哈希表*/

<#assign num=[1,2,3,4]/>
${num?first}
<#--12到14-->
<#assign num_second=12..100/>
<#list num as nu>
  ${nu}
</#list>

<#list num_second as nu>
  ${nu}
</#list>

<#--拆分-->
<#assign num_third=num_second[1..10]/>
<#list num_third as nu>
  ${nu}
</#list>
${"123456"[0..2]}


<#--hash表-->
<#assign maps={"1":"cy","2":"xx"}/>
${maps["1"]}
<#--map的key 转换为sequence-->
<#assign kes=maps?keys>
<#list kes as ke>
${ke} ... ${maps[ke]}
</#list>
<#>

<#assign cy={"name":"xx","id":"232"}/>
${cy.name}
