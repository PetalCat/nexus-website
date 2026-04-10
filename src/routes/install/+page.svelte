<svelte:head>
	<title>Install — Nexus</title>
	<meta property="og:title" content="Install — Nexus" />
</svelte:head>

<script lang="ts">
	import { reveal } from '$lib/actions/reveal';
	import SectionHeading from '$lib/components/SectionHeading.svelte';
	import TerminalCard from '$lib/components/TerminalCard.svelte';

	const dockerRunCode = `<span class="t-prompt">$</span> docker run <span class="t-flag">-d</span> \\
    <span class="t-flag">--name</span> <span class="t-val">nexus</span> \\
    <span class="t-flag">-p</span> <span class="t-val">3000:3000</span> \\
    <span class="t-flag">-v</span> <span class="t-val">nexus-data:/data</span> \\
    <span class="t-val">ghcr.io/petalcat/nexus:latest</span>`;

	const dockerComposeCode = `<span class="t-prompt">#</span> compose.yml
services:
  nexus:
    image: <span class="t-val">ghcr.io/petalcat/nexus:latest</span>
    ports:
      - <span class="t-val">"3000:3000"</span>
    volumes:
      - <span class="t-val">nexus-data:/data</span>
    restart: <span class="t-val">unless-stopped</span>

volumes:
  nexus-data:`;

	const sourceCode = `<span class="t-prompt">$</span> git clone <span class="t-val">https://github.com/petalcat/nexus</span>
<span class="t-prompt">$</span> cd <span class="t-val">nexus</span>
<span class="t-prompt">$</span> pnpm install
<span class="t-prompt">$</span> pnpm build
<span class="t-prompt">$</span> node <span class="t-val">build</span>`;
</script>

<section class="hero">
	<div class="container">
		<p class="eyebrow" use:reveal>Install</p>
		<h1 use:reveal={{ delay: 80 }}>Get <span class="gradient-text">started.</span></h1>
		<p class="sub" use:reveal={{ delay: 160 }}>Up and running in minutes. Docker or source — your choice.</p>
	</div>
</section>

<section class="install-section">
	<div class="container">

		<div class="install-block" use:reveal>
			<div class="install-meta">
				<span class="step-num">01</span>
				<h2>Quick Start</h2>
				<p>The fastest way to get Nexus running. One command pulls and starts the latest image.</p>
			</div>
			<TerminalCard code={dockerRunCode} comment="Nexus will be available at http://localhost:3000" />
		</div>

		<div class="install-block" use:reveal={{ delay: 60 }}>
			<div class="install-meta">
				<span class="step-num">02</span>
				<h2>Docker Compose</h2>
				<p>Recommended for persistent setups. Drop this into your existing compose stack or use it standalone.</p>
			</div>
			<TerminalCard code={dockerComposeCode} comment="Run: docker compose up -d" />
		</div>

		<div class="install-block" use:reveal={{ delay: 120 }}>
			<div class="install-meta">
				<span class="step-num">03</span>
				<h2>From Source</h2>
				<p>Build and run directly from the repository. Useful for development or if you want full control.</p>
			</div>
			<TerminalCard code={sourceCode} comment="Available at http://localhost:3000 after start" />
		</div>

		<div class="requirements" use:reveal={{ delay: 60 }}>
			<h3>Requirements</h3>
			<div class="req-grid">
				<div class="req-item">
					<span class="req-label">Docker</span>
					<span class="req-val">Docker 20+ or Podman</span>
				</div>
				<div class="req-item">
					<span class="req-label">From Source</span>
					<span class="req-val">Node.js 22+, pnpm</span>
				</div>
				<div class="req-item">
					<span class="req-label">Database</span>
					<span class="req-val">SQLite — bundled, no setup</span>
				</div>
				<div class="req-item">
					<span class="req-label">First Run</span>
					<span class="req-val">Open browser to port 3000</span>
				</div>
			</div>
		</div>

	</div>
</section>

<style>
	.hero {
		padding: 10rem 0 4rem;
		text-align: center;
	}

	.container {
		max-width: 900px;
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

	.install-section {
		padding: 4rem 0 8rem;
	}

	.install-block {
		margin-bottom: 5rem;
	}

	.install-meta {
		margin-bottom: 1.75rem;
	}

	.step-num {
		font-family: var(--font-display);
		font-size: 0.72rem;
		font-weight: 700;
		letter-spacing: 0.1em;
		color: var(--accent);
		display: block;
		margin-bottom: 0.5rem;
	}

	h2 {
		font-size: clamp(1.4rem, 3vw, 1.9rem);
		font-weight: 800;
		color: var(--text);
		letter-spacing: -0.03em;
		margin-bottom: 0.6rem;
	}

	.install-meta p {
		font-size: 1rem;
		color: var(--text-muted);
		line-height: 1.7;
		max-width: 560px;
	}

	.requirements {
		background: var(--bg-surface);
		border: 1px solid var(--border);
		border-radius: 16px;
		padding: 2rem 2.5rem;
		margin-top: 2rem;
	}

	.requirements h3 {
		font-family: var(--font-display);
		font-size: 0.78rem;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		color: var(--accent);
		margin-bottom: 1.5rem;
	}

	.req-grid {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
		gap: 1.25rem;
	}

	.req-item {
		display: flex;
		flex-direction: column;
		gap: 0.3rem;
	}

	.req-label {
		font-size: 0.78rem;
		font-weight: 600;
		text-transform: uppercase;
		letter-spacing: 0.06em;
		color: var(--text-muted);
	}

	.req-val {
		font-size: 0.95rem;
		color: var(--text);
		font-family: var(--font-mono);
	}
</style>
