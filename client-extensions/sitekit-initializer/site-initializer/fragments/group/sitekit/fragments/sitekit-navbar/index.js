(function () {
	const nav = document.querySelector('[data-nav]');
	const menuBtn = document.querySelector('[data-sitekit-menu]');
	const drawer = document.querySelector('[data-sitekit-drawer]');
	const searchBtn = document.querySelector('[data-sitekit-search]');

	const onScroll = () => {
		if (!nav) return;
		nav.classList.toggle('is-scrolled', window.scrollY > 4);
	};

	onScroll();
	window.addEventListener('scroll', onScroll, {passive: true});

	const setDrawer = (open) => {
		if (!drawer || !menuBtn) return;
		drawer.classList.toggle('is-open', open);
		menuBtn.classList.toggle('is-open', open);
		menuBtn.setAttribute('aria-expanded', String(open));
		document.body.style.overflow = open ? 'hidden' : '';
	};

	menuBtn && menuBtn.addEventListener('click', () => {
		setDrawer(!drawer.classList.contains('is-open'));
	});

	drawer && drawer.querySelector('[data-sitekit-drawer-close]') &&
		drawer.querySelector('[data-sitekit-drawer-close]').addEventListener('click', () => setDrawer(false));

	drawer && drawer.querySelectorAll('a').forEach((a) => a.addEventListener('click', () => setDrawer(false)));

	searchBtn && searchBtn.addEventListener('click', () => {
		searchBtn.classList.add('is-active');
		setTimeout(() => searchBtn.classList.remove('is-active'), 400);
	});

	document.addEventListener('keydown', (e) => {
		if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === 'k') {
			e.preventDefault();
			searchBtn && searchBtn.click();
		}
		if (e.key === 'Escape') setDrawer(false);
	});
})();
