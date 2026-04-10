<script lang="ts">
	import { page } from '$app/state';

	let scrolled = $state(false);
	let mobileOpen = $state(false);

	const links = [
		{ href: '/', label: 'Home' },
		{ href: '/features', label: 'Features' },
		{ href: '/integrations', label: 'Integrations' },
		{ href: '/install', label: 'Install' },
		{ href: '/about', label: 'About' }
	];

	function handleScroll() {
		scrolled = window.scrollY > 20;
	}

	function closeMobile() {
		mobileOpen = false;
		document.body.style.overflow = '';
	}

	function toggleMobile() {
		mobileOpen = !mobileOpen;
		document.body.style.overflow = mobileOpen ? 'hidden' : '';
	}
</script>

<svelte:window onscroll={handleScroll} />

<nav class="nav" class:scrolled>
	<div class="nav-inner">
		<a href="/" class="logo" onclick={closeMobile}>
			<div class="logo-icon">N</div>
			<span class="logo-text">Nexus</span>
		</a>

		<!-- svelte-ignore a11y_no_static_element_interactions -->
		<div class="nav-links" class:open={mobileOpen} onclick={(e) => { if (e.target === e.currentTarget) closeMobile(); }}>
			{#each links as link}
				<a
					href={link.href}
					class="nav-link"
					class:active={page.url.pathname === link.href}
					onclick={closeMobile}
				>
					{link.label}
				</a>
			{/each}
			<a href="/install" class="btn-primary nav-cta">Get Started</a>
		</div>

		<button
			class="mobile-toggle"
			onclick={toggleMobile}
			aria-label={mobileOpen ? 'Close menu' : 'Open menu'}
			aria-expanded={mobileOpen}
		>
			<span class="bar" class:open={mobileOpen}></span>
			<span class="bar" class:open={mobileOpen}></span>
			<span class="bar" class:open={mobileOpen}></span>
		</button>
	</div>
</nav>

<style>
	.nav {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 100;
		padding: 1rem 0;
		transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
	}

	.nav.scrolled {
		background: rgba(5, 5, 7, 0.8);
		backdrop-filter: blur(20px);
		-webkit-backdrop-filter: blur(20px);
		border-bottom: 1px solid var(--border);
		padding: 0.6rem 0;
	}

	.nav-inner {
		max-width: 1200px;
		margin: 0 auto;
		padding: 0 1.5rem;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}

	.logo {
		display: flex;
		align-items: center;
		gap: 0.6rem;
		text-decoration: none;
		color: var(--text);
		z-index: 101;
	}

	.logo-icon {
		width: 28px;
		height: 28px;
		border-radius: 8px;
		background: linear-gradient(135deg, var(--accent), var(--accent-dark));
		display: grid;
		place-items: center;
		font-family: 'Playfair Display', Georgia, serif;
		font-size: 1rem;
		font-weight: 700;
		font-style: italic;
		color: var(--bg);
		line-height: 1;
		padding-right: 1px;
		padding-bottom: 2px;
	}

	.logo-text {
		font-family: var(--font-display);
		font-weight: 800;
		font-size: 1.2rem;
		letter-spacing: -0.03em;
	}

	.nav-links {
		display: flex;
		align-items: center;
		gap: 0.25rem;
	}

	.nav-link {
		font-family: var(--font-display);
		font-weight: 500;
		font-size: 0.9rem;
		color: var(--text-muted);
		text-decoration: none;
		padding: 0.5rem 0.85rem;
		border-radius: 8px;
		transition: all 0.2s ease;
	}

	.nav-link:hover { color: var(--text); background: rgba(255, 255, 255, 0.04); }
	.nav-link.active { color: var(--text); background: rgba(200, 167, 106, 0.1); }

	.nav-cta {
		margin-left: 0.75rem;
		padding: 0.55rem 1.3rem;
		font-size: 0.82rem;
	}

	.mobile-toggle {
		display: none;
		flex-direction: column;
		gap: 5px;
		background: none;
		border: none;
		cursor: pointer;
		padding: 4px;
		z-index: 101;
	}

	.bar {
		display: block;
		width: 22px;
		height: 2px;
		background: var(--text);
		border-radius: 2px;
		transition: all 0.3s ease;
	}

	.bar.open:nth-child(1) { transform: translateY(7px) rotate(45deg); }
	.bar.open:nth-child(2) { opacity: 0; }
	.bar.open:nth-child(3) { transform: translateY(-7px) rotate(-45deg); }

	@media (max-width: 768px) {
		.mobile-toggle { display: flex; }

		.nav-links {
			position: fixed;
			inset: 0;
			background: rgba(5, 5, 7, 0.95);
			backdrop-filter: blur(20px);
			-webkit-backdrop-filter: blur(20px);
			flex-direction: column;
			justify-content: center;
			gap: 0.5rem;
			opacity: 0;
			pointer-events: none;
			transition: opacity 0.3s ease;
		}

		.nav-links.open { opacity: 1; pointer-events: all; }
		.nav-link { font-size: 1.3rem; padding: 0.75rem 1.5rem; }
		.nav-cta { margin-left: 0; margin-top: 1rem; }
	}
</style>
