<#if entries?has_content>
	<div class="sitekit-asset-mosaic">
		<#list entries as entry>
			<#assign
				assetRenderer = entry.getAssetRenderer()
				viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry)!""
				entryTitle = htmlUtil.escape(entry.getTitle(locale))
				summary = entry.getSummary(locale)!""
				publishDate = entry.getPublishDate()!""
			/>

			<article class="sitekit-asset-mosaic__tile">
				<div class="sitekit-asset-mosaic__body">
					<h3 class="sitekit-asset-mosaic__title">
						<#if viewURL?has_content>
							<a href="${viewURL}">${entryTitle}</a>
						<#else>
							${entryTitle}
						</#if>
					</h3>

					<#if summary?has_content>
						<p class="sitekit-asset-mosaic__summary">${htmlUtil.escape(summary)}</p>
					</#if>

					<#if publishDate?has_content>
						<span class="sitekit-asset-mosaic__meta">${publishDate?date}</span>
					</#if>
				</div>
			</article>
		</#list>
	</div>
	<style>
		.sitekit-asset-mosaic {
			display: grid;
			gap: 1rem;
			grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
		}
		.sitekit-asset-mosaic__body {
			padding: 1.1rem 1.15rem 1.2rem;
		}
		.sitekit-asset-mosaic__title {
			font-size: 1.05rem;
			letter-spacing: -.02em;
			line-height: 1.3;
			margin: 0 0 .45rem;
		}
		.sitekit-asset-mosaic__title a {
			color: inherit;
			text-decoration: none;
		}
		.sitekit-asset-mosaic__summary {
			font-size: .92rem;
			line-height: 1.45;
			margin: 0 0 .65rem;
			opacity: .75;
		}
		.sitekit-asset-mosaic__meta {
			font-size: .72rem;
			letter-spacing: .04em;
			opacity: .55;
			text-transform: uppercase;
		}
	</style>
</#if>
