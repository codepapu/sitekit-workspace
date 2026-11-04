<#assign
	title = (Title.getData())!(.vars["reserved-article-title"].data)!""
	lede = (Subtitle.getData())!""
/>

<article class="nx-post">
	<div class="nx-post__media" aria-hidden="true"></div>
	<#if title?has_content>
		<h3>${htmlUtil.escape(title)}</h3>
	</#if>
	<#if lede?has_content>
		<p>${htmlUtil.escape(lede)}</p>
	</#if>
	<#if (Content.getData())?? && Content.getData()?has_content>
		<div class="nx-post__body">${Content.getData()}</div>
	</#if>
</article>
