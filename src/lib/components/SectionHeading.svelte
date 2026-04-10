<script lang="ts">
	import { reveal } from '$lib/actions/reveal';

	let { label, title, description = '', center = false }: {
		label: string;
		title: string;
		description?: string;
		center?: boolean;
	} = $props();
</script>

<div class="section-heading" class:center use:reveal>
	<span class="label">{label}</span>
	<h2 class="title">{@html title}</h2>
	{#if description}
		<p class="desc">{description}</p>
	{/if}
</div>

<style>
	.section-heading { margin-bottom: 2.5rem; }
	.center { text-align: center; }
	.center .desc { margin-left: auto; margin-right: auto; }
	.label { font-family: var(--font-display); font-size: 0.78rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.1em; color: var(--accent); display: block; margin-bottom: 0.75rem; }
	.title { font-size: clamp(2rem, 5vw, 3rem); font-weight: 800; color: var(--text); letter-spacing: -0.03em; margin-bottom: 0.75rem; }
	.desc { font-size: 1.05rem; color: var(--text-muted); line-height: 1.7; max-width: 600px; }
</style>
