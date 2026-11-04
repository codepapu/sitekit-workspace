<#assign
	name = (Name.getData())!(.vars["reserved-article-title"].data)!""
	blurb = (ShortDescription.getData())!(Description.getData())!""
/>

<article class="nx-course-row">
	<div>
		<p class="nx-course-row__label">Course</p>
		<#if name?has_content>
			<h3>${htmlUtil.escape(name)}</h3>
		</#if>
		<#if blurb?has_content>
			<p>${htmlUtil.escape(blurb)}</p>
		</#if>
	</div>
	<div class="nx-course-row__meta">View</div>
</article>
