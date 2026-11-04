<#assign
	name = (Name.getData())!(.vars["reserved-article-title"].data)!""
	role = (Info.getData())!""
	imageData = (Image.getData())!""
/>

<a class="sp-card" href="#">
	<div class="sp-card__media">
		<#if imageData?has_content>
			<img class="sp-card__photo" alt="${htmlUtil.escape(name)}" src="${htmlUtil.escape(imageData)}" />
		<#else>
			<div class="sp-ph" aria-hidden="true"></div>
		</#if>
	</div>
	<div class="sp-card__body">
		<#if name?has_content>
			<h2 class="sp-card__name">${htmlUtil.escape(name)}</h2>
		</#if>
		<#if role?has_content>
			<p class="sp-card__role">${htmlUtil.escape(role)}</p>
		</#if>
	</div>
</a>
