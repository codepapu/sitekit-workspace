<#assign courseName = (CourseName.getData())!(.vars["reserved-article-title"].data)!"" />
<#if courseName?has_content>
	<h1>${htmlUtil.escape(courseName)}</h1>
</#if>
<#if (Description.getData())?? && Description.getData()?has_content>
	<div>${Description.getData()}</div>
</#if>
