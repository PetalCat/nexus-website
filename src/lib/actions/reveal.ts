export function reveal(node: HTMLElement, options?: { delay?: number; threshold?: number }) {
	const delay = options?.delay ?? 0;
	const threshold = options?.threshold ?? 0.15;

	// Snap-reveal path: if the element is already in the viewport on mount
	// (very common — above-the-fold hero content, first-screen cards),
	// skip the fade-in transition entirely. The previous behavior was:
	//   1. SSR renders node at normal opacity
	//   2. Action runs on hydration, adds `.reveal` → node vanishes
	//   3. Observer fires next tick, adds `.visible` → node transitions back
	// Which produced a visible "flash to invisible then reappear" flicker
	// on above-fold content. Now we check the bounding rect before adding
	// the base class, and above-fold elements show instantly at final state.
	const rect = node.getBoundingClientRect();
	const viewportHeight = window.innerHeight || document.documentElement.clientHeight;
	const alreadyInView = rect.top < viewportHeight && rect.bottom > 0;

	if (alreadyInView) {
		node.classList.add('reveal', 'visible');
		return {
			destroy() {
				/* nothing to unobserve */
			}
		};
	}

	node.classList.add('reveal');
	if (delay) {
		node.style.transitionDelay = `${delay}ms`;
	}

	const observer = new IntersectionObserver(
		(entries) => {
			entries.forEach((entry) => {
				if (entry.isIntersecting) {
					node.classList.add('visible');
					observer.unobserve(node);
				}
			});
		},
		{ threshold }
	);

	observer.observe(node);

	return {
		destroy() {
			observer.unobserve(node);
		}
	};
}
