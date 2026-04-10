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
		{ icon: '🎬', title: 'Movies & Shows', description: 'Browse and stream your entire video library across all connected services in one unified interface.' },
		{ icon: '📚', title: 'Books', description: 'Your e-book and audiobook collections, beautifully organized and ready to read or listen.' },
		{ icon: '🎮', title: 'Games', description: 'Manage and launch your game library with rich metadata, cover art, and collection tracking.' },
		{ icon: '🎵', title: 'Music', description: 'A persistent, cinematic music player that follows you across every page of your dashboard.' },
		{ icon: '📹', title: 'Video', description: 'Self-hosted video content and personal recordings, playable right inside Nexus.' },
		{ icon: '📡', title: 'Live TV', description: 'Watch live channels from your IPTV or tuner setup without ever leaving your dashboard.' },
	];

	const features = [
		{ icon: '✦', title: 'Cinematic Dashboard', description: 'A rich, dark hero interface with continue watching, recently added, and personalized recommendations front and center.' },
		{ icon: '🔍', title: 'Unified Search', description: 'Search every connected library at once. Find anything across movies, shows, books, games, and music in a single query.' },
		{ icon: '📥', title: 'Media Requests', description: 'Request missing content directly from Nexus. Integrated with Overseerr-compatible backends for seamless approval flows.' },
		{ icon: '📊', title: 'Analytics & Wrapped', description: 'See exactly what you\'ve been watching, reading, and playing — with yearly Wrapped stats and per-media breakdowns.' },
		{ icon: '▶', title: 'Streaming & Subtitles', description: 'Built-in HLS video player with full subtitle support, external track injection, and Bazarr integration for intelligent subtitle management.' },
		{ icon: '✨', title: 'Recommendations', description: 'Personalized suggestions powered by your actual watch history — not an algorithm you don\'t control.' },
	];

	const dockerCode = `<span class="t-prompt">$</span> docker run <span class="t-flag">-d</span> \\
    <span class="t-flag">--name</span> <span class="t-val">nexus</span> \\
    <span class="t-flag">-p</span> <span class="t-val">3000:3000</span> \\
    <span class="t-flag">-v</span> <span class="t-val">nexus-data:/data</span> \\
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
			Open Source &amp; Self-Hosted
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
				description="Add your Jellyfin, Plex, Sonarr, Radarr, Kavita, Romm, and other services from the admin panel. Nexus links automatically where it can."
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
	}

	.hero-sub {
		font-size: clamp(1rem, 2.5vw, 1.2rem);
		color: var(--text-muted);
		line-height: 1.7;
		max-width: 560px;
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
