/**
 * Sitekit × Next.js scroll reveals
 */
(function () {
	const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

	function markTargets(root) {
		const selectors = [
			'.nx-section',
			'.nx-deploy',
			'.nx-grid',
			'.nx-tools',
			'.nx-logos',
			'.nx-course-row',
			'.sp-card',
			'.nx-post',
			'.sitekit-course-chip',
			'.sitekit-blog-spotlight',
			'.lfr-layout-structure-item-collection .page-editor__collection-item',
			'[data-reveal]',
			'[data-reveal-stagger]'
		];

		selectors.forEach((selector) => {
			root.querySelectorAll(selector).forEach((el, index) => {
				if (el.classList.contains('sitekit-reveal') || el.classList.contains('is-in')) {
					return;
				}

				el.classList.add('sitekit-reveal');

				if (index % 3 === 1) {
					el.classList.add('sitekit-reveal-delay-1');
				}
				else if (index % 3 === 2) {
					el.classList.add('sitekit-reveal-delay-2');
				}
			});
		});
	}

	function observe() {
		const nodes = document.querySelectorAll('.sitekit-reveal, [data-reveal], [data-reveal-stagger]');

		if (reduce) {
			nodes.forEach((el) => el.classList.add('is-in'));
			return;
		}

		const inView = (el) => {
			const r = el.getBoundingClientRect();
			return r.top < window.innerHeight * 0.92 && r.bottom > 0;
		};

		requestAnimationFrame(() => {
			nodes.forEach((el) => {
				if (inView(el)) el.classList.add('is-in');
			});
		});

		const io = new IntersectionObserver(
			(entries) => {
				entries.forEach((entry) => {
					if (entry.isIntersecting) {
						entry.target.classList.add('is-in');
						io.unobserve(entry.target);
					}
				});
			},
			{rootMargin: '0px 0px -4% 0px', threshold: 0.08}
		);

		nodes.forEach((el) => {
			if (!el.classList.contains('is-in')) io.observe(el);
		});
	}

	function boot() {
		markTargets(document);
		observe();
	}

	if (document.readyState === 'loading') {
		document.addEventListener('DOMContentLoaded', boot);
	}
	else {
		boot();
	}
})();
