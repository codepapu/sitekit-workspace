(() => {
  const nav = document.querySelector("[data-nav]");
  const menuBtn = document.querySelector("[data-menu]");
  const drawer = document.querySelector("[data-drawer]");
  const brandBtn = document.querySelector("[data-brand-toggle]");
  const drop = document.querySelector("[data-drop]");
  const toast = document.querySelector("[data-toast]");
  const copyBtn = document.querySelector("[data-copy]");
  const searchBtn = document.querySelector("[data-search]");

  const onScroll = () => {
    if (!nav) return;
    nav.classList.toggle("is-scrolled", window.scrollY > 4);
  };
  onScroll();
  window.addEventListener("scroll", onScroll, { passive: true });

  // Subtle watermark parallax (Next.js hero feel)
  const wm = document.querySelector("[data-watermark]");
  if (wm) {
    window.addEventListener(
      "scroll",
      () => {
        const y = Math.min(window.scrollY * 0.18, 80);
        wm.style.transform = `translateX(-50%) translateY(${y}px)`;
      },
      { passive: true }
    );
  }

  const setDrawer = (open) => {
    if (!drawer || !menuBtn) return;
    drawer.classList.toggle("is-open", open);
    menuBtn.classList.toggle("is-open", open);
    menuBtn.setAttribute("aria-expanded", String(open));
    document.body.style.overflow = open ? "hidden" : "";
  };

  menuBtn?.addEventListener("click", () => {
    setDrawer(!drawer.classList.contains("is-open"));
  });

  drawer?.querySelector("[data-drawer-close]")?.addEventListener("click", () => setDrawer(false));
  drawer?.querySelectorAll("a").forEach((a) => a.addEventListener("click", () => setDrawer(false)));

  brandBtn?.addEventListener("click", (e) => {
    e.preventDefault();
    const open = !drop?.classList.contains("is-open");
    drop?.classList.toggle("is-open", open);
    brandBtn.setAttribute("aria-expanded", String(open));
  });

  document.addEventListener("click", (e) => {
    if (!drop || !brandBtn) return;
    if (!brandBtn.contains(e.target) && !drop.contains(e.target)) {
      drop.classList.remove("is-open");
      brandBtn.setAttribute("aria-expanded", "false");
    }
  });

  const showToast = (msg) => {
    if (!toast) return;
    toast.textContent = msg;
    toast.classList.add("is-visible");
    clearTimeout(showToast._t);
    showToast._t = setTimeout(() => toast.classList.remove("is-visible"), 2400);
  };

  copyBtn?.addEventListener("click", async () => {
    const text = copyBtn.getAttribute("data-copy") || "";
    try {
      await navigator.clipboard.writeText(text);
      showToast("Copied to clipboard");
    } catch {
      showToast(text);
    }
  });

  searchBtn?.addEventListener("click", () => showToast("Search — wireframe (⌘K)"));

  document.addEventListener("keydown", (e) => {
    if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === "k") {
      e.preventDefault();
      showToast("Search — wireframe (⌘K)");
    }
    if (e.key === "Escape") {
      setDrawer(false);
      drop?.classList.remove("is-open");
      brandBtn?.setAttribute("aria-expanded", "false");
    }
  });

  const revealEls = document.querySelectorAll("[data-reveal], [data-reveal-stagger]");
  const markIn = (el) => el.classList.add("is-in");
  const inView = (el) => {
    const r = el.getBoundingClientRect();
    return r.top < window.innerHeight * 0.92 && r.bottom > 0;
  };
  // Paint first screen immediately (Next.js-style soft entrance)
  requestAnimationFrame(() => {
    revealEls.forEach((el) => {
      if (inView(el)) markIn(el);
    });
  });
  if ("IntersectionObserver" in window) {
    const io = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            markIn(entry.target);
            io.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.08, rootMargin: "0px 0px -4% 0px" }
    );
    revealEls.forEach((el) => {
      if (!el.classList.contains("is-in")) io.observe(el);
    });
  } else {
    revealEls.forEach(markIn);
  }

  document.querySelectorAll("[data-auth-form], [data-apply-form]").forEach((form) => {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const label =
        form.getAttribute("data-auth-form") ||
        form.getAttribute("data-apply-form") ||
        "Submitted";
      showToast(`${label} — wireframe only`);
      form.reset();
    });
  });
})();
