<section class="sitekit-ux-note">
	<header class="sitekit-ux-note__head">Learner feedback</header>
	<#if (ObjectField_comment.getData())??>
		<blockquote class="sitekit-ux-note__quote">${htmlUtil.escape(ObjectField_comment.getData())}</blockquote>
	</#if>
	<footer class="sitekit-ux-note__foot">
		<#if (ObjectField_answered.getData())??>
			<span>Resolved: ${ObjectField_answered.getData()}</span>
		</#if>
		<#if (ObjectField_date.getData())??>
			<time>${ObjectField_date.getData()}</time>
		</#if>
	</footer>
</section>
