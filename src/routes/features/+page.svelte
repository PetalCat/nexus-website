<svelte:head>
	<title>Features — Nexus</title>
	<meta property="og:title" content="Features — Nexus" />
</svelte:head>

<script lang="ts">
	import { reveal } from '$lib/actions/reveal';
	import SectionHeading from '$lib/components/SectionHeading.svelte';

	const features = [
		{
			label: 'Home',
			title: 'Cinematic Dashboard',
			description: 'Your entire media world at a glance. Nexus brings together everything you watch, read, play, and listen to into one fluid home screen designed around how you actually use media.',
			bullets: [
				'Continue watching across all your libraries',
				'Recently added content surfaced automatically',
				'Personalized recommendations via StreamyStats',
				'Live session monitoring for active streams',
			],
			icon: '⬡',
		},
		{
			label: 'Library',
			title: 'Movies & Shows',
			description: 'A full-featured video library powered by Jellyfin. Browse, stream, and manage your movie and TV collection with per-user authentication and adaptive HLS playback.',
			bullets: [
				'Jellyfin library integration',
				'HLS adaptive streaming',
				'Subtitle management and enrichment',
				'Per-user auth with resume playback',
			],
			icon: '▶',
		},
		{
			label: 'Reading',
			title: 'Books',
			description: 'Your Kavita library, unified into the Nexus interface. Track reading progress, browse collections, and discover books alongside the rest of your media.',
			bullets: [
				'Kavita library integration',
				'Reading progress tracking',
				'Collection and series management',
				'Cross-media discovery',
			],
			icon: '□',
		},
		{
			label: 'Gaming',
			title: 'Games',
			description: 'Browse and organize your ROM collection through RomM. Cover art, platform grouping, and clean collection views bring your game library up to the same standard as the rest.',
			bullets: [
				'RomM integration',
				'Platform browsing',
				'Cover art and metadata',
				'Collection organization',
			],
			icon: '◇',
		},
		{
			label: 'Audio',
			title: 'Music Player',
			description: 'Music plays on its own layer. It persists across page navigation, keeps going while you browse books or games, and steps back automatically when you start a video.',
			bullets: [
				'Persistent global playback',
				'Queue and playlist management',
				'Mini player overlay while browsing',
				'Auto-pause when video starts',
			],
			icon: '♪',
		},
		{
			label: 'Video',
			title: 'Video & Live TV',
			description: 'Privacy-first video via Invidious and live TV with IPTV/M3U support and EPG guides. Watch what you want without tracking or third-party dependencies.',
			bullets: [
				'Invidious integration for privacy-first video',
				'IPTV/M3U live channel support',
				'EPG electronic program guides',
				'No external tracking or account required',
			],
			icon: '◉',
		},
		{
			label: 'Discovery',
			title: 'Unified Search',
			description: 'One search box that reaches across every connected service. Find movies, shows, books, games, and music in a single query, then filter by type or request what\'s missing.',
			bullets: [
				'Cross-service search in one query',
				'Instant results as you type',
				'Filter results by media type',
				'Request missing content directly',
			],
			icon: '◎',
		},
		{
			label: 'Requests',
			title: 'Media Requests',
			description: 'Request management backed by Overseerr and Seerr. Users can request content, track status, and admins can approve, deny, or bulk-manage from a dedicated queue.',
			bullets: [
				'Overseerr and Seerr compatibility',
				'Admin approve / deny queue',
				'Multiselect bulk actions',
				'Per-request status tracking',
			],
			icon: '⊕',
		},
		{
			label: 'Insights',
			title: 'Analytics & Wrapped',
			description: 'Watch, read, play, and listen history tracked across all your services. Timelines, top content, and Wrapped summaries give you a full picture of how you actually use your media.',
			bullets: [
				'Cross-media consumption history',
				'Timeline and top content views',
				'Wrapped yearly summaries',
				'Per-device and per-session detail',
			],
			icon: '△',
		},
		{
			label: 'Streaming',
			title: 'Streaming & Subtitles',
			description: 'HLS streaming with both embedded and external subtitle track support. Bazarr enrichment surfaces availability, history, and missing tracks directly in the media detail view.',
			bullets: [
				'HLS adaptive streaming',
				'External subtitle track injection',
				'Bazarr enrichment and history',
				'Subtitle availability status per item',
			],
			icon: '≡',
		},
	];
</script>

<section class="hero">
	<div class="container">
		<p class="eyebrow" use:reveal>Features</p>
		<h1 use:reveal={{ delay: 80 }}>Built for <span class="gradient-text">your stack.</span></h1>
		<p class="sub" use:reveal={{ delay: 160 }}>Every feature designed for people who run their own media services.</p>
	</div>
</section>

<section class="features">
	<div class="container">
		{#each features as feature, i}
			<div class="feature-row" class:reverse={i % 2 === 1}>
				<div class="feature-content" use:reveal={{ delay: 60 }}>
					<span class="feature-label">{feature.label}</span>
					<h2 class="feature-title">{feature.title}</h2>
					<p class="feature-desc">{feature.description}</p>
					<ul class="feature-bullets">
						{#each feature.bullets as bullet}
							<li>
								<span class="check" aria-hidden="true">✓</span>
								{bullet}
							</li>
						{/each}
					</ul>
				</div>

				<div class="feature-visual" use:reveal={{ delay: 140 }} aria-hidden="true">
					<div class="visual-card">
						<div class="ring ring-outer"></div>
						<div class="ring ring-inner"></div>
						<div class="visual-icon">{feature.icon}</div>
					</div>
				</div>
			</div>
		{/each}
	</div>
</section>

<style>
	.hero {
		padding: 10rem 0 4rem;
		text-align: center;
	}

	.container {
		max-width: 1100px;
		margin: 0 auto;
		padding: 0 2rem;
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
		letter-spacing: -0.03em;
		color: var(--text);
		margin-bottom: 1.25rem;
	}

	.sub {
		font-size: 1.15rem;
		color: var(--text-muted);
		max-width: 520px;
		margin: 0 auto;
		line-height: 1.7;
	}

	.features {
		padding: 4rem 0 8rem;
	}

	.feature-row {
		display: flex;
		align-items: center;
		gap: 4rem;
		padding: 4rem 0;
		border-bottom: 1px solid var(--border);
	}

	.feature-row:last-child {
		border-bottom: none;
	}

	.feature-row.reverse {
		flex-direction: row-reverse;
	}

	.feature-content {
		flex: 1;
		min-width: 0;
	}

	.feature-label {
		font-family: var(--font-display);
		font-size: 0.75rem;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		color: var(--accent);
		display: block;
		margin-bottom: 0.75rem;
	}

	.feature-title {
		font-size: clamp(1.6rem, 3vw, 2.25rem);
		font-weight: 800;
		letter-spacing: -0.03em;
		color: var(--text);
		margin-bottom: 1rem;
	}

	.feature-desc {
		font-size: 1rem;
		color: var(--text-muted);
		line-height: 1.75;
		margin-bottom: 1.5rem;
		max-width: 480px;
	}

	.feature-bullets {
		list-style: none;
		display: flex;
		flex-direction: column;
		gap: 0.6rem;
	}

	.feature-bullets li {
		display: flex;
		align-items: flex-start;
		gap: 0.65rem;
		font-size: 0.95rem;
		color: var(--text-muted);
		line-height: 1.5;
	}

	.check {
		color: var(--accent);
		font-weight: 700;
		font-size: 0.85rem;
		margin-top: 0.1rem;
		flex-shrink: 0;
	}

	.feature-visual {
		flex-shrink: 0;
	}

	.visual-card {
		width: 260px;
		height: 260px;
		border-radius: 24px;
		background: var(--bg-surface);
		border: 1px solid var(--border);
		display: flex;
		align-items: center;
		justify-content: center;
		position: relative;
	}

	.ring {
		position: absolute;
		border-radius: 50%;
		border: 1px solid var(--border);
		pointer-events: none;
	}

	.ring-outer {
		width: 220px;
		height: 220px;
		border-color: rgba(200, 170, 130, 0.07);
	}

	.ring-inner {
		width: 148px;
		height: 148px;
		border-color: rgba(200, 170, 130, 0.12);
	}

	.visual-icon {
		font-size: 2.25rem;
		color: var(--accent);
		opacity: 0.6;
		position: relative;
		z-index: 1;
		line-height: 1;
	}

	@media (max-width: 700px) {
		.feature-row,
		.feature-row.reverse {
			flex-direction: column;
			gap: 2rem;
			padding: 3rem 0;
		}

		.feature-visual {
			align-self: center;
		}

		.visual-card {
			width: 200px;
			height: 200px;
		}

		.ring-outer {
			width: 170px;
			height: 170px;
		}

		.ring-inner {
			width: 110px;
			height: 110px;
		}
	}
</style>
