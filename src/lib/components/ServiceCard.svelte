<script lang="ts">
	import { reveal } from '$lib/actions/reveal';

	let { name, category, description, delay = 0 }: {
		name: string;
		category: string;
		description: string;
		delay?: number;
	} = $props();
</script>

<div class="service-card" use:reveal={{ delay }}>
	<div class="service-header">
		<h4>{name}</h4>
		<span class="category">{category}</span>
	</div>
	<p>{description}</p>
</div>

<style>
	.service-card { background: var(--bg-surface); border: 1px solid var(--border); border-radius: 16px; padding: 1.5rem; transition: all 0.3s ease; }
	.service-card:hover { border-color: var(--border-hover); transform: translateY(-2px); }
	.service-header { display: flex; align-items: center; gap: 0.75rem; margin-bottom: 0.5rem; }
	h4 { font-family: var(--font-display); font-weight: 700; color: var(--text); font-size: 1rem; }
	.category { font-size: 0.65rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.06em; padding: 0.15rem 0.5rem; background: rgba(200, 167, 106, 0.08); border: 1px solid rgba(200, 167, 106, 0.12); border-radius: 100px; color: var(--accent); }
	p { font-size: 0.9rem; color: var(--text-muted); line-height: 1.6; }
</style>
