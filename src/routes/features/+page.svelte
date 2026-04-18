<svelte:head>
	<title>Features — Nexus</title>
	<meta property="og:title" content="Features — Nexus" />
	<meta
		name="description"
		content="What Nexus actually does: unified library, cross-service search, adaptive streaming, in-browser reading, per-user accounts, and more — all self-hosted."
	/>
</svelte:head>

<script lang="ts">
	import { reveal } from '$lib/actions/reveal';
	import FeatureCard from '$lib/components/FeatureCard.svelte';
	import SectionHeading from '$lib/components/SectionHeading.svelte';

	// SVG icon strings, inline so they can live in the data arrays alongside
	// the copy. Loose lucide-style — single 24x24 viewBox, stroke-based.
	const SVG = {
		layers:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 2 7 12 12 22 7 12 2"/><polyline points="2 17 12 22 22 17"/><polyline points="2 12 12 17 22 12"/></svg>',
		film:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="2" width="20" height="20" rx="2.18" ry="2.18"/><line x1="7" y1="2" x2="7" y2="22"/><line x1="17" y1="2" x2="17" y2="22"/><line x1="2" y1="12" x2="22" y2="12"/><line x1="2" y1="7" x2="7" y2="7"/><line x1="2" y1="17" x2="7" y2="17"/><line x1="17" y1="7" x2="22" y2="7"/><line x1="17" y1="17" x2="22" y2="17"/></svg>',
		book:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg>',
		music:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M9 18V5l12-2v13"/><circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/></svg>',
		gamepad:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><line x1="6" y1="11" x2="10" y2="11"/><line x1="8" y1="9" x2="8" y2="13"/><line x1="15" y1="12" x2="15.01" y2="12"/><line x1="18" y1="10" x2="18.01" y2="10"/><path d="M17.32 5H6.68a4 4 0 0 0-3.978 3.59c-.006.052-.01.101-.017.152C2.604 9.416 2 14.456 2 16a3 3 0 0 0 3 3c1 0 1.5-.5 2-1l1.414-1.414A2 2 0 0 1 9.828 16h4.344a2 2 0 0 1 1.414.586L17 18c.5.5 1 1 2 1a3 3 0 0 0 3-3c0-1.545-.604-6.584-.685-7.258-.007-.05-.011-.1-.017-.151A4 4 0 0 0 17.32 5z"/></svg>',
		video:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2" ry="2"/></svg>',
		tv:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M2 16.1A5 5 0 0 1 5.9 20M2 12.05A9 9 0 0 1 9.95 20M2 8V6a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2h-6"/><line x1="2" y1="20" x2="2.01" y2="20"/></svg>',
		play:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><polygon points="5 3 19 12 5 21 5 3"/></svg>',
		captions:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="M7 15v-2a2 2 0 0 1 2-2h1"/><path d="M14 15v-2a2 2 0 0 1 2-2h1"/></svg>',
		bookOpen:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>',
		joystick:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M21 17a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-1a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2Z"/><path d="M6 15V9a6 6 0 1 1 12 0v6"/><path d="M12 12a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/></svg>',
		search:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>',
		resume:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><polygon points="10 8 16 12 10 16 10 8"/></svg>',
		sparkles:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="m12 3-1.9 5.8a2 2 0 0 1-1.3 1.3L3 12l5.8 1.9a2 2 0 0 1 1.3 1.3L12 21l1.9-5.8a2 2 0 0 1 1.3-1.3L21 12l-5.8-1.9a2 2 0 0 1-1.3-1.3z"/><path d="M5 3v4M19 17v4M3 5h4M17 19h4"/></svg>',
		chart:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="20" x2="18" y2="10"/><line x1="12" y1="20" x2="12" y2="4"/><line x1="6" y1="20" x2="6" y2="14"/></svg>',
		users:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>',
		request:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>',
		share:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/><line x1="8.59" y1="13.51" x2="15.42" y2="17.49"/><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"/></svg>',
		docker:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="8" width="20" height="11" rx="2"/><path d="M6 5v3M10 5v3M14 5v3M18 5v3"/></svg>',
		plug:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M9 2v6"/><path d="M15 2v6"/><path d="M7 10V8h10v2a5 5 0 0 1-5 5v4"/></svg>',
		shield:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>',
		bug:
			'<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"><path d="m8 2 1.88 1.88"/><path d="M14.12 3.88 16 2"/><path d="M9 7.13v-1a3.003 3.003 0 1 1 6 0v1"/><path d="M12 20c-3.3 0-6-2.7-6-6v-3a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v3c0 3.3-2.7 6-6 6"/><path d="M12 20v-9"/><path d="M6.53 9 4 8"/><path d="M6 13H2"/><path d="M3 21l3.11-1.55"/><path d="M20.47 9 22 8"/><path d="M22 13h-4"/><path d="M17.89 19.45 21 21"/></svg>',
	};

	const stats = [
		{ k: '12+', v: 'services integrated' },
		{ k: '6', v: 'media categories' },
		{ k: '1', v: 'login, one interface' },
		{ k: 'AGPL-3.0', v: 'open source' }
	];

	// Everything-in-one section: matches the Nexus sidebar
	const categories = [
		{
			icon: SVG.film,
			title: 'Movies & TV',
			description:
				'Unified video library across Jellyfin and Plex. Browse, play, and pick up where you left off on any device.'
		},
		{
			icon: SVG.music,
			title: 'Music',
			description:
				'Persistent music player that follows you across every page. Queue, playlists, and mini-player overlay while you browse.'
		},
		{
			icon: SVG.book,
			title: 'Books',
			description:
				'Calibre-Web integration over OPDS. Browse, read EPUBs / PDFs in-browser, sync progress across devices.'
		},
		{
			icon: SVG.gamepad,
			title: 'Games',
			description:
				'Your RomM library with platform browsing, cover art, and in-browser emulation via EmulatorJS.'
		},
		{
			icon: SVG.tv,
			title: 'Live TV',
			description:
				'Live IPTV / tuner playback with EPG guides. Watch channels inside the same interface as the rest of your library.'
		},
		{
			icon: SVG.video,
			title: 'Videos',
			description:
				'Privacy-respecting YouTube through Invidious, with a proxied transcode pipe that strips tracking before playback.'
		}
	];

	// Cross-service smarts — what you can only do when Nexus sees everything
	const intelligence = [
		{
			icon: SVG.search,
			title: 'Unified search',
			description:
				'One query across every connected service. Match movies, shows, music, books, games in a single result set; filter by type or request what is missing.'
		},
		{
			icon: SVG.resume,
			title: 'Continue anywhere',
			description:
				'Resume playback carries across service boundaries. Watched the first half of an episode on Jellyfin? Finish it on Plex — Nexus tracks progress per-item, not per-service.'
		},
		{
			icon: SVG.sparkles,
			title: 'Recommendations',
			description:
				'Personalized suggestions powered by your actual watch history — not an algorithm you do not control. Feeds your homepage and the "For you" rail.'
		},
		{
			icon: SVG.chart,
			title: 'Wrapped + analytics',
			description:
				'Yearly recaps across everything you watched, read, and played. Per-device, per-session breakdowns. Your data, hosted on your box.'
		}
	];

	// Playback-layer features
	const playback = [
		{
			icon: SVG.play,
			title: 'Adaptive HLS',
			description:
				'Single player for Jellyfin + Plex with adaptive bitrate, seamless quality switching, and a Rust byte-pipe that strips auth tokens before the browser sees them.'
		},
		{
			icon: SVG.captions,
			title: 'Subtitle intelligence',
			description:
				'Bazarr surfaces availability, history, and missing tracks per item. External subtitles inject as WebVTT <track>; burn-in fallback when native fails.'
		},
		{
			icon: SVG.bookOpen,
			title: 'In-browser reader',
			description:
				'Full EPUB and PDF reader built in. Reading progress, bookmarks, highlights — all sync to your Calibre-Web library.'
		},
		{
			icon: SVG.joystick,
			title: 'In-browser emulation',
			description:
				'Launch RomM titles in-browser via EmulatorJS. NES, SNES, Genesis, Game Boy, N64, PSX — no extra client to install.'
		}
	];

	// Social / multi-user features
	const social = [
		{
			icon: SVG.users,
			title: 'Per-user accounts',
			description:
				'Each user links their own service credentials. Private libraries, private recommendations, private stats. Admin controls for provisioning and approvals.'
		},
		{
			icon: SVG.request,
			title: 'Media requests',
			description:
				'Overseerr + Seerr integration for request-and-approve flows. Users submit, admins approve or deny from a unified queue with status tracking.'
		},
		{
			icon: SVG.share,
			title: 'Collections & sharing',
			description:
				'Share items and collections with friends. Activity feed surfaces what people you follow are watching, reading, playing.'
		},
		{
			icon: SVG.shield,
			title: 'Pending approvals',
			description:
				'Admin gate for new accounts when you open Nexus up to friends. Force-password-reset on first login, per-user pause, and forced logout.'
		}
	];

	// Self-hoster-oriented features
	const platform = [
		{
			icon: SVG.layers,
			title: 'Adapter architecture',
			description:
				'New services are one file, one line of registry code. Shared contract handles search, browse, negotiate, play, subtitles. Community adapters do not have to modify core.'
		},
		{
			icon: SVG.docker,
			title: 'Docker-native',
			description:
				'Multi-arch image (linux/amd64 + linux/arm64) on GHCR. Single-container deployment with an embedded Rust stream-proxy. Run on a Pi, run on a server, run anywhere.'
		},
		{
			icon: SVG.plug,
			title: 'Env-managed config',
			description:
				'Everything lives in env vars: encryption key, trusted proxy CIDRs, cache tuning, subtitle caps, rate-limit mode. Twelve-factor friendly.'
		},
		{
			icon: SVG.bug,
			title: 'Built-in bug reporter',
			description:
				'Cmd+Shift+B from any page opens a prefilled GitHub issue — URL, browser, build version, and any JS error auto-attached. Opt out with one env var.'
		}
	];
</script>

<section class="hero" use:reveal>
	<div class="container narrow">
		<p class="eyebrow">Features</p>
		<h1>
			Everything in one place.<br />
			<span class="gradient-text">Nothing duplicated.</span>
		</h1>
		<p class="sub">
			Nexus does not replace Jellyfin, Plex, Calibre, or the rest of your stack — it
			sits on top and gives you one homepage, one search, one player, one set of
			stats across everything.
		</p>
	</div>

	<div class="stats" use:reveal={{ delay: 120 }}>
		{#each stats as s}
			<div class="stat">
				<span class="stat-key">{s.k}</span>
				<span class="stat-val">{s.v}</span>
			</div>
		{/each}
	</div>
</section>

<section class="group">
	<div class="container">
		<SectionHeading
			eyebrow="Your library"
			title="Every type of media,<br /><span class='gradient-text'>one place to find it</span>"
		/>
		<div class="grid grid-3">
			{#each categories as { icon, title, description }, i}
				<FeatureCard {icon} {title} {description} delay={i * 60} />
			{/each}
		</div>
	</div>
</section>

<section class="group alt">
	<div class="container">
		<SectionHeading
			eyebrow="Built to play"
			title="A player for everything,<br /><span class='gradient-text'>not a menu of players</span>"
		/>
		<div class="grid grid-2">
			{#each playback as { icon, title, description }, i}
				<FeatureCard {icon} {title} {description} delay={i * 60} />
			{/each}
		</div>
	</div>
</section>

<section class="group">
	<div class="container">
		<SectionHeading
			eyebrow="Cross-service smarts"
			title="Features no single service<br /><span class='gradient-text'>can do alone</span>"
		/>
		<div class="grid grid-2">
			{#each intelligence as { icon, title, description }, i}
				<FeatureCard {icon} {title} {description} delay={i * 60} />
			{/each}
		</div>
	</div>
</section>

<section class="group alt">
	<div class="container">
		<SectionHeading
			eyebrow="Users + requests"
			title="Built for<br /><span class='gradient-text'>more than one user</span>"
		/>
		<div class="grid grid-2">
			{#each social as { icon, title, description }, i}
				<FeatureCard {icon} {title} {description} delay={i * 60} />
			{/each}
		</div>
	</div>
</section>

<section class="group">
	<div class="container">
		<SectionHeading
			eyebrow="For self-hosters"
			title="Boring, honest<br /><span class='gradient-text'>operator experience</span>"
		/>
		<div class="grid grid-2">
			{#each platform as { icon, title, description }, i}
				<FeatureCard {icon} {title} {description} delay={i * 60} />
			{/each}
		</div>
	</div>
</section>

<section class="cta" use:reveal>
	<div class="container narrow">
		<h2>Run one interface over every media service you already own.</h2>
		<div class="cta-btns">
			<a href="/install" class="btn-primary">Get Started</a>
			<a href="/integrations" class="btn-secondary">See integrations</a>
		</div>
	</div>
</section>

<style>
	.hero {
		padding: 9rem 0 3rem;
		text-align: center;
	}

	.container {
		max-width: 1150px;
		margin: 0 auto;
		padding: 0 2rem;
	}

	.container.narrow {
		max-width: 780px;
	}

	.eyebrow {
		font-family: var(--font-display);
		font-size: 0.78rem;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		color: var(--accent);
		margin-bottom: 1.25rem;
	}

	h1 {
		font-size: clamp(2.5rem, 7vw, 4.5rem);
		font-weight: 800;
		line-height: 1.1;
		letter-spacing: -0.03em;
		color: var(--text);
		margin-bottom: 1.5rem;
	}

	.sub {
		font-size: 1.15rem;
		color: var(--text-muted);
		max-width: 620px;
		margin: 0 auto;
		line-height: 1.7;
	}

	/* ── Stats strip ────────────────────────── */
	.stats {
		margin: 4rem auto 0;
		max-width: 900px;
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		gap: 1rem;
		padding: 1.5rem 2rem;
		background: var(--bg-surface);
		border: 1px solid var(--border);
		border-radius: 16px;
	}

	.stat {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 0.35rem;
	}

	.stat-key {
		font-family: var(--font-display);
		font-size: clamp(1.5rem, 3.5vw, 2.25rem);
		font-weight: 800;
		color: var(--accent-light);
		letter-spacing: -0.02em;
	}

	.stat-val {
		font-size: 0.78rem;
		color: var(--text-muted);
		text-transform: uppercase;
		letter-spacing: 0.08em;
		text-align: center;
	}

	/* ── Grouped feature sections ───────────── */
	.group {
		padding: 5rem 0;
	}

	.group.alt {
		background: linear-gradient(
			180deg,
			transparent 0%,
			rgba(255, 255, 255, 0.012) 50%,
			transparent 100%
		);
	}

	.grid {
		display: grid;
		gap: 1.25rem;
		margin-top: 3rem;
	}

	.grid-2 {
		grid-template-columns: repeat(2, 1fr);
	}

	.grid-3 {
		grid-template-columns: repeat(3, 1fr);
	}

	/* ── CTA ──────────────────────────────── */
	.cta {
		padding: 6rem 0 8rem;
		text-align: center;
	}

	.cta h2 {
		font-size: clamp(1.5rem, 3.5vw, 2.25rem);
		font-weight: 700;
		line-height: 1.3;
		color: var(--text);
		margin-bottom: 2rem;
	}

	.cta-btns {
		display: flex;
		gap: 1rem;
		justify-content: center;
		flex-wrap: wrap;
	}

	@media (max-width: 860px) {
		.grid-3 {
			grid-template-columns: repeat(2, 1fr);
		}
		.stats {
			grid-template-columns: repeat(2, 1fr);
		}
	}

	@media (max-width: 600px) {
		.grid-2,
		.grid-3 {
			grid-template-columns: 1fr;
		}
	}
</style>
