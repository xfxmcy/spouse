<#--<#include "/layout/var.ftl"> --> 
<#--<#include "/layout/var2.ftl"> -->
<#--include 后者变量覆盖前者-->
<#--resolve plan 使用import and namespace-->
<#import "/layout/var2.ftl" as var2/>
<#import "/layout/var.ftl" as var/>
${user}

${var2.user}
${var.user}
<#--定义在  namespace-->
<#assign age=12 in var/>