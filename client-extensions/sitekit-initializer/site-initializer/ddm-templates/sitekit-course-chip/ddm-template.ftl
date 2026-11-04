<article class="nx-course-row sitekit-course-chip">
	<div>
		<p class="nx-course-row__label">Course</p>
		<#if (.vars["reserved-article-title"].data)??>
			<strong class="sitekit-course-chip__name">${htmlUtil.escape(.vars["reserved-article-title"].data)}</strong>
		</#if>
		<#if (ShortDescription.getData())?? && ShortDescription.getData()?has_content>
			<span class="sitekit-course-chip__blurb">${htmlUtil.escape(ShortDescription.getData())}</span>
		<#elseif (Description.getData())?? && Description.getData()?has_content>
			<span class="sitekit-course-chip__blurb">${Description.getData()}</span>
		</#if>
	</div>
	<div class="nx-course-row__meta">Open</div>
</article>
<style>
	.sitekit-course-chip { width: 100%; }
	.sitekit-course-chip__name {
		display: block;
		font-size: 1.15rem;
		font-weight: 600;
		letter-spacing: -.02em;
		line-height: 1.25;
		margin-bottom: .3rem;
	}
	.sitekit-course-chip__blurb {
		display: block;
		font-size: .95rem;
		line-height: 1.45;
		color: var(--muted, #666);
	}
</style>
