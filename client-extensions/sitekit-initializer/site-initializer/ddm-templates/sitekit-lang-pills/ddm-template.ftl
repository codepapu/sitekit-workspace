<#if entries?has_content>
	<div class="sitekit-lang-pills" role="navigation" aria-label="Languages">
		<#list entries as entry>
			<#if entry.isSelected()>
				<span class="sitekit-lang-pills__pill is-active" aria-current="true">${entry.getLongDisplayName()}</span>
			<#else>
				<a class="sitekit-lang-pills__pill" href="${entry.getURL()}" hreflang="${entry.getLanguageId()}">${entry.getLongDisplayName()}</a>
			</#if>
		</#list>
	</div>
	<style>
		.sitekit-lang-pills { display:inline-flex; flex-wrap:wrap; gap:.4rem; }
		.sitekit-lang-pills__pill { border:1px solid currentColor; border-radius:999px; padding:.2rem .7rem; font-size:.75rem; text-decoration:none; color:inherit; }
		.sitekit-lang-pills__pill.is-active { background:currentColor; color:#fff; }
	</style>
</#if>
