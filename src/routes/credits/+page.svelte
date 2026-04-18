<svelte:head>
	<title>Credits — Nexus</title>
	<meta
		name="description"
		content="Credits, licensing, and attribution for the Nexus marketing site."
	/>
</svelte:head>

<script lang="ts">
	import { reveal } from '$lib/actions/reveal';
</script>

<section class="page">
	<div class="container">
		<p class="eyebrow" use:reveal>Credits</p>
		<h1 use:reveal={{ delay: 60 }}>Licensing &amp; attribution.</h1>
		<p class="sub" use:reveal={{ delay: 120 }}>
			Straight answers on what's licensed how, and where the art comes from.
		</p>

		<div class="prose" use:reveal={{ delay: 180 }}>
			<h2>Nexus (the application)</h2>
			<p>
				<strong>Nexus</strong> is licensed under the
				<a
					href="https://www.gnu.org/licenses/agpl-3.0.html"
					target="_blank"
					rel="noopener noreferrer">GNU Affero General Public License v3.0</a
				>. That's a strong copyleft license — derivative works must remain open
				source and any network-accessible deployment must make source available
				to its users. Full text at <a
					href="https://github.com/PetalCat/Nexus/blob/main/LICENSE"
					target="_blank"
					rel="noopener noreferrer">github.com/PetalCat/Nexus/blob/main/LICENSE</a
				>.
			</p>
			<p>
				Copyright &copy; {new Date().getFullYear()}
				<a href="https://github.com/PetalCat" target="_blank" rel="noopener noreferrer"
					>PetalCat</a
				> and Nexus contributors.
			</p>

			<h2>This website</h2>
			<p>
				The source for this marketing site (nexus-website) is also
				<a
					href="https://www.gnu.org/licenses/agpl-3.0.html"
					target="_blank"
					rel="noopener noreferrer">AGPL-3.0</a
				>, matching the app. Source: <a
					href="https://github.com/PetalCat/nexus-website"
					target="_blank"
					rel="noopener noreferrer">github.com/PetalCat/nexus-website</a
				>.
			</p>

			<h2>Poster art in the hero</h2>
			<p>
				The rotating poster art on the homepage is drawn from
				<a href="https://commons.wikimedia.org" target="_blank" rel="noopener noreferrer"
					>Wikimedia Commons</a
				>, filtered to files whose
				<a
					href="https://www.wikidata.org/wiki/Property:P6216"
					target="_blank"
					rel="noopener noreferrer">copyright-status statement (P6216)</a
				>
				is
				<a
					href="https://www.wikidata.org/wiki/Q19652"
					target="_blank"
					rel="noopener noreferrer">public domain (Q19652)</a
				>. The set is biased toward silent-era film posters (1900–1928), which
				are public domain in the United States by age, plus individual PD book
				covers, opera posters, and 2024-PD Steamboat Willie.
			</p>
			<p>
				The fetch script — <code>scripts/fetch-posters.sh</code> in this repo —
				is transparent about its queries and is re-runnable. Individual files
				retain their original filenames so each can be traced back to
				Wikimedia Commons via <code
					>https://commons.wikimedia.org/wiki/File:&lt;filename&gt;</code
				>.
			</p>
			<p>
				If you see a file that's <em>not</em> actually in the public domain,
				<a
					href="https://github.com/PetalCat/nexus-website/issues/new?title=Non-PD+poster+in+hero"
					target="_blank"
					rel="noopener noreferrer">file an issue</a
				> and we'll pull it.
			</p>

			<h2>Third-party trademarks</h2>
			<p>
				<strong>Jellyfin</strong>, <strong>Plex</strong>,
				<strong>Calibre</strong>, <strong>Sonarr</strong>,
				<strong>Radarr</strong>, <strong>Lidarr</strong>,
				<strong>Bazarr</strong>, <strong>Prowlarr</strong>,
				<strong>Overseerr</strong>, <strong>RomM</strong>,
				<strong>Invidious</strong>, <strong>StreamyStats</strong>, and
				<strong>Docker</strong> are trademarks or registered marks of their
				respective owners. Nexus integrates with these projects but is not
				affiliated with, endorsed by, or sponsored by any of them.
			</p>

			<h2>Fonts</h2>
			<p>
				<strong>Playfair Display</strong>,
				<strong>DM Sans</strong>, and <strong>JetBrains Mono</strong> —
				all SIL Open Font License (<a
					href="https://openfontlicense.org/"
					target="_blank"
					rel="noopener noreferrer">OFL</a
				>).
			</p>
		</div>
	</div>
</section>

<style>
	.page {
		padding: 8rem 0 5rem;
	}

	.container {
		max-width: 820px;
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
		font-size: clamp(2rem, 5vw, 3.2rem);
		font-weight: 800;
		letter-spacing: -0.03em;
		color: var(--text);
		margin-bottom: 1rem;
	}

	.sub {
		font-size: 1.1rem;
		color: var(--text-muted);
		line-height: 1.7;
		max-width: 620px;
		margin-bottom: 3rem;
	}

	.prose h2 {
		font-family: var(--font-display);
		font-size: 1.35rem;
		font-weight: 700;
		color: var(--text);
		margin: 2.5rem 0 1rem;
	}

	.prose p {
		color: var(--text-muted);
		font-size: 1rem;
		line-height: 1.75;
		margin-bottom: 1rem;
	}

	.prose a {
		color: var(--accent-light);
		text-decoration: underline;
		text-decoration-color: rgba(200, 167, 106, 0.3);
		text-underline-offset: 3px;
	}

	.prose a:hover {
		text-decoration-color: var(--accent);
	}

	.prose code {
		font-family: var(--font-mono, 'JetBrains Mono', monospace);
		font-size: 0.85em;
		background: rgba(255, 255, 255, 0.04);
		padding: 0.15em 0.4em;
		border-radius: 4px;
	}
</style>
