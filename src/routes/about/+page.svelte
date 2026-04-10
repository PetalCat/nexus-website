<svelte:head>
	<title>About — Nexus</title>
	<meta property="og:title" content="About — Nexus" />
</svelte:head>

<script lang="ts">
	import { reveal } from '$lib/actions/reveal';
</script>

<section class="hero">
	<div class="container">
		<p class="eyebrow" use:reveal>About</p>
		<h1 use:reveal={{ delay: 80 }}>About <span class="gradient-text">Nexus.</span></h1>
	</div>
</section>

<section class="content-section">
	<div class="container narrow">

		<div class="prose" use:reveal>
			<h2>What Nexus is</h2>
			<p>
				Nexus is a unified media frontend for people who self-host their own services. It sits on
				top of your existing stack — Jellyfin, Sonarr, Radarr, Kavita, RomM, Bazarr, and more —
				and brings everything into a single, coherent interface. You browse your movies, books,
				games, and music in one place, with one login, without switching between a dozen different
				apps.
			</p>
			<p>
				It is not a replacement for the services underneath it. Jellyfin still streams your media.
				Sonarr still manages your TV shows. Bazarr still handles your subtitles. Nexus connects
				them, surfaces the parts that matter for daily use, and gets out of the way of everything
				else.
			</p>
		</div>

		<div class="prose" use:reveal={{ delay: 60 }}>
			<h2>Open Source</h2>
			<p>
				Nexus is licensed under the AGPL-3.0 and developed in the open. The full source is on
				GitHub. Contributions, bug reports, and feedback are welcome. The copyleft license
				ensures that any derivative work remains open source too.
			</p>
		</div>

		<div class="link-cards" use:reveal={{ delay: 80 }}>
			<h3>Community</h3>
			<div class="card-row">
				<a href="https://github.com/petalcat/nexus" class="link-card" target="_blank" rel="noopener noreferrer">
					<span class="link-card-title">GitHub</span>
					<span class="link-card-desc">Source code, releases, and development history</span>
				</a>
				<a href="https://github.com/petalcat/nexus/issues" class="link-card" target="_blank" rel="noopener noreferrer">
					<span class="link-card-title">Issues</span>
					<span class="link-card-desc">Bug reports and feature requests</span>
				</a>
				<a href="https://github.com/petalcat/nexus/discussions" class="link-card" target="_blank" rel="noopener noreferrer">
					<span class="link-card-title">Discussions</span>
					<span class="link-card-desc">Questions, ideas, and community conversation</span>
				</a>
			</div>
		</div>

		<div class="prose" use:reveal={{ delay: 60 }}>
			<h2>Built by PetalCat</h2>
			<p>
				Nexus is built and maintained by PetalCat. It started as a personal project to solve the
				fragmentation problem in self-hosted media stacks, and grew into something worth sharing.
			</p>
		</div>

		<div class="disclaimer-card" use:reveal={{ delay: 80 }}>
			<p class="disclaimer-title">User Responsibility</p>
			<p>
				Nexus is a tool that connects to services you run and control. What you do with those
				services is your responsibility. Nexus does not manage, audit, or take responsibility for
				the content in your libraries, the services you connect, or how you use them. Use it
				in accordance with the terms of any services it connects to and the laws that apply to you.
			</p>
		</div>

	</div>
</section>

<style>
	.hero {
		padding: 10rem 0 3rem;
		text-align: center;
	}

	.container {
		max-width: 1100px;
		margin: 0 auto;
		padding: 0 2rem;
	}

	.container.narrow {
		max-width: 700px;
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
	}

	.content-section {
		padding: 3rem 0 8rem;
	}

	.prose {
		margin-bottom: 3.5rem;
	}

	.prose h2 {
		font-size: 1.4rem;
		font-weight: 800;
		color: var(--text);
		letter-spacing: -0.02em;
		margin-bottom: 1rem;
	}

	.prose p {
		font-size: 1rem;
		color: var(--text-muted);
		line-height: 1.8;
		margin-bottom: 1rem;
	}

	.prose p:last-child {
		margin-bottom: 0;
	}

	.link-cards {
		margin-bottom: 3.5rem;
	}

	.link-cards h3 {
		font-family: var(--font-display);
		font-size: 0.78rem;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		color: var(--accent);
		margin-bottom: 1.25rem;
	}

	.card-row {
		display: flex;
		flex-direction: column;
		gap: 0.75rem;
	}

	.link-card {
		display: flex;
		flex-direction: column;
		gap: 0.3rem;
		padding: 1.25rem 1.5rem;
		background: var(--bg-surface);
		border: 1px solid var(--border);
		border-radius: 16px;
		text-decoration: none;
		transition: all 0.25s ease;
	}

	.link-card:hover {
		border-color: var(--border-hover);
		transform: translateY(-2px);
		box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
	}

	.link-card-title {
		font-family: var(--font-display);
		font-weight: 700;
		font-size: 0.95rem;
		color: var(--text);
	}

	.link-card-desc {
		font-size: 0.875rem;
		color: var(--text-muted);
		line-height: 1.5;
	}

	.disclaimer-card {
		background: var(--bg-surface);
		border: 1px solid var(--border);
		border-radius: 16px;
		padding: 1.5rem 2rem;
	}

	.disclaimer-title {
		font-family: var(--font-display);
		font-size: 0.75rem;
		font-weight: 700;
		text-transform: uppercase;
		letter-spacing: 0.08em;
		color: var(--text-muted);
		margin-bottom: 0.75rem;
	}

	.disclaimer-card p:last-child {
		font-size: 0.875rem;
		color: var(--text-muted);
		line-height: 1.75;
	}
</style>
