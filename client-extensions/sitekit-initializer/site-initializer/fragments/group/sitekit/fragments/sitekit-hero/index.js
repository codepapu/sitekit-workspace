(function () {
	const heroes = document.querySelectorAll('.sitekit-hero');

	heroes.forEach((hero) => {
		requestAnimationFrame(() => hero.classList.add('is-ready'));

		const wm = hero.querySelector('[data-watermark]');
		if (wm) {
			window.addEventListener(
				'scroll',
				() => {
					const y = Math.min(window.scrollY * 0.18, 80);
					wm.style.transform = 'translateX(-50%) translateY(' + y + 'px)';
				},
				{passive: true}
			);
		}

		const copyBtn = hero.querySelector('[data-copy]');
		if (copyBtn) {
			copyBtn.addEventListener('click', async () => {
				const text = copyBtn.getAttribute('data-copy') || '';
				try {
					await navigator.clipboard.writeText(text);
					copyBtn.setAttribute('aria-label', 'Copied');
					setTimeout(() => copyBtn.setAttribute('aria-label', 'Copy command'), 1600);
				}
				catch (e) {}
			});
		}
	});
})();
