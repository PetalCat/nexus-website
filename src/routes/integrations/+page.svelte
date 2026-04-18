<svelte:head>
	<title>Integrations — Nexus</title>
	<meta property="og:title" content="Integrations — Nexus" />
</svelte:head>

<script lang="ts">
	import { reveal } from '$lib/actions/reveal';
	import SectionHeading from '$lib/components/SectionHeading.svelte';
	import ServiceCard from '$lib/components/ServiceCard.svelte';

	const services = [
		{
			name: 'Jellyfin',
			category: 'Media Server',
			description: 'Core media server integration. Handles library browsing, HLS streaming, user authentication, and live session monitoring.',
		},
		{
			name: 'Plex',
			category: 'Media Server',
			description: 'Plex Media Server integration. Movies, shows, music, and playback via HLS with the same UI and negotiation path as Jellyfin.',
		},
		{
			name: 'Sonarr',
			category: 'Automation',
			description: 'TV show management and monitoring. Tracks series, seasons, and episodes with automatic download handling.',
		},
		{
			name: 'Radarr',
			category: 'Automation',
			description: 'Movie management and monitoring. Automates movie acquisition and enriches request metadata.',
		},
		{
			name: 'Lidarr',
			category: 'Automation',
			description: 'Music library management. Tracks artists and albums alongside your broader collection.',
		},
		{
			name: 'Overseerr / Seerr',
			category: 'Requests',
			description: 'Media request management. Users request content, admins approve or deny from a unified queue with status tracking.',
		},
		{
			name: 'Calibre-Web',
			category: 'Books',
			description: 'Book library integration via OPDS. Browse, search, and read EPUBs / PDFs in-browser with reading-progress sync.',
		},
		{
			name: 'RomM',
			category: 'Games',
			description: 'ROM and game collection management. Platform browsing, cover art, and metadata for your game library.',
		},
		{
			name: 'Bazarr',
			category: 'Subtitles',
			description: 'Subtitle management and enrichment. Surfaces availability, missing tracks, and subtitle history per media item.',
		},
		{
			name: 'Prowlarr',
			category: 'Search',
			description: 'Indexer management and search aggregation. Powers the search backbone for your automation stack.',
		},
		{
			name: 'StreamyStats',
			category: 'Analytics',
			description: 'Viewing analytics and personalized recommendations. Connects via your Jellyfin token — no separate account needed.',
		},
		{
			name: 'Invidious',
			category: 'Video',
			description: 'Privacy-respecting video integration. Watch video content without direct platform tracking or API dependencies.',
		},
	];
</script>

<section class="hero">
	<div class="container">
		<p class="eyebrow" use:reveal>Integrations</p>
		<h1 use:reveal={{ delay: 80 }}>Your services. <span class="gradient-text">Connected.</span></h1>
		<p class="sub" use:reveal={{ delay: 160 }}>Nexus integrates with the tools you already run.</p>
	</div>
</section>

<section class="services-section">
	<div class="container">
		<SectionHeading label="Services" title="What plugs in" center />
		<div class="grid">
			{#each services as service, i}
				<ServiceCard
					name={service.name}
					category={service.category}
					description={service.description}
					delay={i * 40}
				/>
			{/each}
		</div>

		<div class="disclaimer" use:reveal>
			<p>
				Nexus is an independent open-source project. It is not affiliated with, endorsed by, or
				officially connected to any of the third-party services listed above. All product names,
				logos, and brands are property of their respective owners and are used here solely for
				compatibility identification purposes.
			</p>
		</div>
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
		max-width: 480px;
		margin: 0 auto;
		line-height: 1.7;
	}

	.services-section {
		padding: 4rem 0 8rem;
	}

	.grid {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		gap: 1.25rem;
		margin-bottom: 4rem;
	}

	.disclaimer {
		background: var(--bg-surface);
		border: 1px solid var(--border);
		border-radius: 16px;
		padding: 1.5rem 2rem;
		max-width: 780px;
		margin: 0 auto;
	}

	.disclaimer p {
		font-size: 0.85rem;
		color: var(--text-muted);
		line-height: 1.7;
		text-align: center;
	}
</style>
