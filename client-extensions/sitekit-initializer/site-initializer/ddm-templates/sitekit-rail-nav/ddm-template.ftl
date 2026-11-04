<#if entries?has_content>
	<aside class="sitekit-rail-nav" aria-label="Sitekit sections">
		<#list entries as item>
			<#assign itemURL = item.getURL()!"" />
			<#if itemURL?has_content>
				<a class="sitekit-rail-nav__row<#if item.isSelected()> is-current</#if>" href="${itemURL}">
					<span class="sitekit-rail-nav__label">${htmlUtil.escape(item.getName())}</span>
				</a>
			<#else>
				<span class="sitekit-rail-nav__row<#if item.isSelected()> is-current</#if>">
					<span class="sitekit-rail-nav__label">${htmlUtil.escape(item.getName())}</span>
				</span>
			</#if>
			<#if item.hasBrowsableChildren()>
				<div class="sitekit-rail-nav__children">
					<#list item.getBrowsableChildren() as child>
						<a class="sitekit-rail-nav__child<#if child.isSelected()> is-current</#if>" href="${child.getURL()}">
							${htmlUtil.escape(child.getName())}
						</a>
					</#list>
				</div>
			</#if>
		</#list>
	</aside>
	<style>
		.sitekit-rail-nav { display:flex; flex-direction:column; gap:.25rem; }
		.sitekit-rail-nav__row, .sitekit-rail-nav__child { display:block; padding:.55rem .75rem; border-radius:.4rem; text-decoration:none; color:inherit; }
		.sitekit-rail-nav__row.is-current, .sitekit-rail-nav__child.is-current { background:rgba(0,0,0,.06); font-weight:700; }
		.sitekit-rail-nav__children { margin-left:.75rem; display:flex; flex-direction:column; gap:.15rem; }
		.sitekit-rail-nav__child { font-size:.92rem; opacity:.9; }
	</style>
</#if>
