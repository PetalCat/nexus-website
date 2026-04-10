<script lang="ts">
	import { reveal } from '$lib/actions/reveal';

	let { icon, title, description, delay = 0 }: {
		icon: string;
		title: string;
		description: string;
		delay?: number;
	} = $props();
</script>

<div class="feature-card" use:reveal={{ delay }}>
	<div class="icon">{icon}</div>
	<h4>{title}</h4>
	<p>{description}</p>
	<div class="glow"></div>
</div>

<style>
	.feature-card { position: relative; background: var(--bg-surface); border: 1px solid var(--border); border-radius: 16px; padding: 1.75rem; overflow: hidden; transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1); }
	.feature-card:hover { border-color: var(--border-hover); transform: translateY(-3px); }
	.feature-card:hover .glow { opacity: 1; }
	.icon { font-size: 1.5rem; margin-bottom: 1rem; }
	h4 { font-family: var(--font-display); font-size: 1.1rem; font-weight: 700; color: var(--text); margin-bottom: 0.5rem; }
	p { font-size: 0.9rem; color: var(--text-muted); line-height: 1.6; }
	.glow { position: absolute; top: -50%; left: -50%; width: 200%; height: 200%; background: radial-gradient(circle at 30% 30%, var(--accent), transparent 60%); opacity: 0; transition: opacity 0.4s ease; pointer-events: none; mix-blend-mode: overlay; filter: blur(40px); }
</style>
