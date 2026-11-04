<#if entries?has_content>
	<ul class="navbar-nav sitekit-top-nav">
		<#list entries as item>
			<li class="nav-item sitekit-top-nav__item<#if item.isSelected()> active is-current</#if>">
				<a class="nav-link sitekit-top-nav__link" href="${item.getURL()!""}">${htmlUtil.escape(item.getName())}</a>
			</li>
		</#list>
	</ul>
</#if>
