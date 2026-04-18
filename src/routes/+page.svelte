<svelte:head>
	<title>Nexus — All Your Media. One Home.</title>
	<meta name="description" content="Nexus is a unified, self-hosted media frontend. Movies, shows, books, games, music, and more — all under one cinematic dashboard you own. Open source." />
	<meta property="og:title" content="Nexus — All Your Media. One Home." />
	<meta property="og:description" content="Nexus is a unified, self-hosted media frontend. Movies, shows, books, games, music, and more — all under one cinematic dashboard you own. Open source." />
	<meta property="og:type" content="website" />
	<meta name="twitter:card" content="summary_large_image" />
	<meta name="twitter:title" content="Nexus — All Your Media. One Home." />
	<meta name="twitter:description" content="Nexus is a unified, self-hosted media frontend. Movies, shows, books, games, music, and more — all under one cinematic dashboard you own. Open source." />
</svelte:head>

<script lang="ts">
	import HeroRain from '$lib/components/HeroRain.svelte';
	import SectionHeading from '$lib/components/SectionHeading.svelte';
	import FeatureCard from '$lib/components/FeatureCard.svelte';
	import StepCard from '$lib/components/StepCard.svelte';
	import TerminalCard from '$lib/components/TerminalCard.svelte';
	import { reveal } from '$lib/actions/reveal';

	const mediaTypes = [
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="2.18" ry="2.18"/><line x1="7" y1="2" x2="7" y2="22"/><line x1="17" y1="2" x2="17" y2="22"/><line x1="2" y1="12" x2="22" y2="12"/><line x1="2" y1="7" x2="7" y2="7"/><line x1="2" y1="17" x2="7" y2="17"/><line x1="17" y1="7" x2="22" y2="7"/><line x1="17" y1="17" x2="22" y2="17"/></svg>', title: 'Movies & Shows', description: 'Browse and stream your entire video library across all connected services in one unified interface.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg>', title: 'Books', description: 'Your e-book and audiobook collections, beautifully organized and ready to read or listen.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><line x1="6" y1="11" x2="10" y2="11"/><line x1="8" y1="9" x2="8" y2="13"/><line x1="15" y1="12" x2="15.01" y2="12"/><line x1="18" y1="10" x2="18.01" y2="10"/><path d="M17.32 5H6.68a4 4 0 0 0-3.978 3.59c-.006.052-.01.101-.017.152C2.604 9.416 2 14.456 2 16a3 3 0 0 0 3 3c1 0 1.5-.5 2-1l1.414-1.414A2 2 0 0 1 9.828 16h4.344a2 2 0 0 1 1.414.586L17 18c.5.5 1 1 2 1a3 3 0 0 0 3-3c0-1.545-.604-6.584-.685-7.258-.007-.05-.011-.1-.017-.151A4 4 0 0 0 17.32 5z"/></svg>', title: 'Games', description: 'Manage and launch your game library with rich metadata, cover art, and collection tracking.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M9 18V5l12-2v13"/><circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/></svg>', title: 'Music', description: 'A persistent, cinematic music player that follows you across every page of your dashboard.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2" ry="2"/></svg>', title: 'Video', description: 'Self-hosted video content and personal recordings, playable right inside Nexus.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M2 16.1A5 5 0 0 1 5.9 20M2 12.05A9 9 0 0 1 9.95 20M2 8V6a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2h-6"/><line x1="2" y1="20" x2="2.01" y2="20"/></svg>', title: 'Live TV', description: 'Watch live channels from your IPTV or tuner setup without ever leaving your dashboard.' },
	];

	const features = [
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>', title: 'Cinematic Dashboard', description: 'A rich, dark hero interface with continue watching, recently added, and personalized recommendations front and center.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>', title: 'Unified Search', description: 'Search every connected library at once. Find anything across movies, shows, books, games, and music in a single query.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>', title: 'Media Requests', description: 'Request missing content directly from Nexus. Integrated with Overseerr-compatible backends for seamless approval flows.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>', title: 'Analytics & Wrapped', description: 'See exactly what you\'ve been watching, reading, and playing — with yearly Wrapped stats and per-media breakdowns.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="5 3 19 12 5 21 5 3"/></svg>', title: 'Streaming & Subtitles', description: 'Built-in HLS video player with full subtitle support, external track injection, and Bazarr integration for intelligent subtitle management.' },
		{ icon: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>', title: 'Recommendations', description: 'Personalized suggestions powered by your actual watch history — not an algorithm you don\'t control.' },
	];

	const dockerCode = `<span class="t-prompt">$</span> docker run <span class="t-flag">-d</span> \\
    <span class="t-flag">--name</span> <span class="t-val">nexus</span> \\
    <span class="t-flag">-p</span> <span class="t-val">8585:8585</span> \\
    <span class="t-flag">-v</span> <span class="t-val">nexus-data:/app/data</span> \\
    ghcr.io/petalcat/nexus:latest`;
</script>

<!-- ============================================================
     HERO
     ============================================================ -->
<section class="hero">
	<HeroRain />
	<div class="hero-content">
		<div class="hero-badge" use:reveal>
			<span class="badge-dot"></span>
			Public Beta · v0.1.0-beta.3 · Open Source
		</div>
		<h1 use:reveal={{ delay: 80 }}>
			All your media.<br />
			<span class="gradient-text">One home.</span>
		</h1>
		<p class="hero-sub" use:reveal={{ delay: 160 }}>
			Movies, shows, books, games, music — unified under one cinematic dashboard you own.
			Self-hostable. Open source.
		</p>
		<div class="hero-ctas" use:reveal={{ delay: 240 }}>
			<a href="/install" class="btn-primary">Get Started</a>
			<a
				href="https://github.com/PetalCat/Nexus"
				class="btn-secondary"
				target="_blank"
				rel="noopener noreferrer"
			>
				View on GitHub
			</a>
		</div>
	</div>
	<div class="hero-scroll-fade"></div>
</section>

<!-- ============================================================
     MEDIA TYPES
     ============================================================ -->
<section class="section media-types">
	<div class="container">
		<SectionHeading
			label="What Nexus unifies"
			title="Every type of media,<br /><span class='gradient-text'>one place to find it</span>"
			description="Nexus isn't just for movies. Connect your entire media ecosystem and access everything from a single, beautifully designed home."
		/>
		<div class="card-grid">
			{#each mediaTypes as { icon, title, description }, i}
				<FeatureCard {icon} {title} {description} delay={i * 60} />
			{/each}
		</div>
	</div>
</section>

<!-- ============================================================
     HOW IT WORKS
     ============================================================ -->
<section class="section how-it-works">
	<div class="container">
		<SectionHeading
			label="How it works"
			title="Up and running in<br /><span class='gradient-text'>minutes</span>"
			description="Nexus is designed to connect to the services you already run. No migration needed — just point and link."
			center
		/>
		<div class="steps-grid">
			<StepCard
				number={1}
				title="Connect your services"
				description="Add your Jellyfin, Plex, Sonarr, Radarr, Calibre-Web, RomM, and other services from the admin panel. Nexus links automatically where it can."
				delay={0}
			/>
			<StepCard
				number={2}
				title="Nexus unifies them"
				description="Your libraries, requests, analytics, and recommendations are merged into a single coherent interface — with per-user credentials and access control."
				delay={100}
			/>
			<StepCard
				number={3}
				title="Enjoy"
				description="Browse, stream, request, and track everything from one cinematic dashboard. Your media, your server, your data."
				delay={200}
			/>
		</div>
	</div>
</section>

<!-- ============================================================
     FEATURE HIGHLIGHTS
     ============================================================ -->
<section class="section feature-highlights">
	<div class="container">
		<SectionHeading
			label="Feature highlights"
			title="Built for people who<br /><span class='gradient-text'>take their media seriously</span>"
			description="From first-run streaming to per-user analytics, Nexus brings together the features you'd normally need half a dozen separate apps for."
		/>
		<div class="card-grid">
			{#each features as { icon, title, description }, i}
				<FeatureCard {icon} {title} {description} delay={i * 60} />
			{/each}
		</div>
	</div>
</section>

<!-- ============================================================
     TERMINAL
     ============================================================ -->
<section class="section terminal-section">
	<div class="container">
		<div class="terminal-wrap" use:reveal>
			<p class="terminal-label">Deploy in seconds</p>
			<TerminalCard
				code={dockerCode}
				comment="Or use docker compose — see the docs for a full compose example."
			/>
		</div>
	</div>
</section>

<!-- ============================================================
     FINAL CTA
     ============================================================ -->
<section class="section final-cta">
	<div class="container">
		<div class="cta-inner" use:reveal>
			<h2>Ready to unify your media?</h2>
			<p>Self-host Nexus and take back control of your entire media library — movies, shows, books, games, music, and more.</p>
			<div class="cta-buttons">
				<a href="/install" class="btn-primary">Get Started</a>
				<a
					href="https://github.com/PetalCat/Nexus"
					class="btn-secondary"
					target="_blank"
					rel="noopener noreferrer"
				>
					View on GitHub
				</a>
			</div>
		</div>
	</div>
</section>

<style>
	/* ---- Hero ---- */
	.hero {
		position: relative;
		min-height: 100svh;
		display: flex;
		align-items: center;
		justify-content: center;
		text-align: center;
		overflow: hidden;
		/* Nudge the content down so the h1 sits clear of the fixed nav.
		   Nav height ~72px + breathing room. */
		padding-top: 6rem;
	}

	.hero-content {
		position: relative;
		z-index: 2;
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 1.5rem;
		padding: 2rem 1.5rem;
		max-width: 820px;
	}

	/* Dark halo behind the hero text so it reads against the bright
	   poster rain. Stretched vertically to fully cover h1 + sub +
	   CTA row; fades to transparent at the edges so posters still
	   show through at the corners of the viewport. */
	.hero-content::before {
		content: '';
		position: absolute;
		inset: -12% -18%;
		background: radial-gradient(
			ellipse 60% 70% at center,
			rgba(5, 5, 7, 0.9) 0%,
			rgba(5, 5, 7, 0.75) 40%,
			rgba(5, 5, 7, 0.35) 70%,
			rgba(5, 5, 7, 0) 100%
		);
		z-index: -1;
		pointer-events: none;
		filter: blur(4px); /* softens the halo edges so it doesn't read as an oval panel */
	}

	.hero-badge {
		display: inline-flex;
		align-items: center;
		gap: 0.5rem;
		padding: 0.4rem 1rem;
		border: 1px solid rgba(200, 170, 130, 0.2);
		border-radius: 999px;
		font-size: 0.78rem;
		font-weight: 600;
		color: var(--accent-light);
		background: rgba(200, 167, 106, 0.05);
		letter-spacing: 0.04em;
		text-transform: uppercase;
	}

	.badge-dot {
		width: 6px;
		height: 6px;
		border-radius: 50%;
		background: var(--accent);
		box-shadow: 0 0 8px var(--accent);
		animation: pulse 2s ease-in-out infinite;
	}

	@keyframes pulse {
		0%, 100% { opacity: 1; transform: scale(1); }
		50% { opacity: 0.5; transform: scale(0.85); }
	}

	.hero h1 {
		font-size: clamp(3rem, 9vw, 6.5rem);
		font-weight: 800;
		line-height: 1.05;
		letter-spacing: -0.04em;
		color: var(--text);
		/* drop-shadow operates on rendered pixels, not the text fill —
		   so it plays nice with the gradient-clipped "One home." span
		   below (text-shadow would render over the transparent fill
		   and turn the gradient letters into muddy grey). */
		filter:
			drop-shadow(0 2px 10px rgba(0, 0, 0, 0.85))
			drop-shadow(0 8px 40px rgba(0, 0, 0, 0.55));
	}

	.hero-sub {
		font-size: clamp(1rem, 2.5vw, 1.2rem);
		color: var(--text-muted);
		line-height: 1.7;
		max-width: 560px;
		filter: drop-shadow(0 2px 8px rgba(0, 0, 0, 0.75));
	}

	.hero-ctas {
		display: flex;
		gap: 1rem;
		flex-wrap: wrap;
		justify-content: center;
	}

	.hero-scroll-fade {
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		height: 200px;
		background: linear-gradient(to bottom, transparent, var(--bg));
		pointer-events: none;
		z-index: 1;
	}

	/* ---- Shared Section ---- */
	.section {
		padding: 6rem 0;
	}

	.container {
		max-width: 1140px;
		margin: 0 auto;
		padding: 0 1.5rem;
	}

	/* ---- Media Types & Feature Cards Grid ---- */
	.card-grid {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
		gap: 1rem;
	}

	/* ---- How It Works ---- */
	.how-it-works {
		background: linear-gradient(180deg, transparent 0%, rgba(200, 167, 106, 0.02) 50%, transparent 100%);
	}

	.steps-grid {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
		gap: 1rem;
	}

	/* ---- Terminal ---- */
	.terminal-section {
		padding: 4rem 0;
	}

	.terminal-wrap {
		text-align: center;
	}

	.terminal-label {
		font-family: var(--font-display);
		font-size: 0.78rem;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		color: var(--accent);
		margin-bottom: 1.25rem;
	}

	/* ---- Final CTA ---- */
	.final-cta {
		padding: 8rem 0;
	}

	.cta-inner {
		text-align: center;
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 1.5rem;
		max-width: 680px;
		margin: 0 auto;
	}

	.cta-inner h2 {
		font-size: clamp(2rem, 5vw, 3.5rem);
		font-weight: 800;
		color: var(--text);
		letter-spacing: -0.03em;
	}

	.cta-inner p {
		font-size: 1.05rem;
		color: var(--text-muted);
		line-height: 1.7;
		max-width: 520px;
	}

	.cta-buttons {
		display: flex;
		gap: 1rem;
		flex-wrap: wrap;
		justify-content: center;
	}

	/* ---- Responsive ---- */
	@media (max-width: 640px) {
		.section { padding: 4rem 0; }
		.final-cta { padding: 5rem 0; }
		.card-grid { grid-template-columns: 1fr; }
		.steps-grid { grid-template-columns: 1fr; }
	}
</style>
