<#macro pager url total curPage=1 showPage=10>
	<#-- gt 10-->
	<#local halfPage = (showPage/2)?int> 
	<#if total > showPage>
	
	
	
	<#else>
		<#list 1..total as page>
		  <#if curPage == page>
		  	[${page}]
		  <#else>
		  	[<a href="${url}">${page}</a>]
		  </#if>
		</#list>
	</#if>

	
</#macro> 