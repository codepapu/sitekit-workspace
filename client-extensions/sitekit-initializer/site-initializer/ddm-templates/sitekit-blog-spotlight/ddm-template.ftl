<article class="nx-post sitekit-blog-spotlight">
	<div class="nx-post__media" aria-hidden="true"></div>
	<p class="sitekit-blog-spotlight__kicker">From the Sitekit journal</p>
	<#if (Title.getData())??>
		<h4 class="sitekit-blog-spotlight__title">${htmlUtil.escape(Title.getData())}</h4>
	<#elseif (.vars["reserved-article-title"].data)??>
		<h4 class="sitekit-blog-spotlight__title">${htmlUtil.escape(.vars["reserved-article-title"].data)}</h4>
	</#if>
	<#if (Subtitle.getData())?? && Subtitle.getData()?has_content>
		<p class="sitekit-blog-spotlight__lede">${htmlUtil.escape(Subtitle.getData())}</p>
	</#if>
</article>
<style>
	.sitekit-blog-spotlight__kicker {
		font-family: var(--mono, ui-monospace, monospace);
		font-size: .72rem;
		font-weight: 500;
		letter-spacing: .06em;
		margin: 0 0 .55rem;
		color: var(--muted, #666);
		text-transform: uppercase;
	}
	.sitekit-blog-spotlight__title {
		font-size: 1.2rem;
		font-weight: 600;
		letter-spacing: -.025em;
		line-height: 1.2;
		margin: 0 0 .5rem;
	}
	.sitekit-blog-spotlight__lede {
		margin: 0;
		color: var(--muted, #666);
	}
</style>
