<script lang="ts">
	import { reveal } from '$lib/actions/reveal';

	let { number, title, description, delay = 0 }: {
		number: number;
		title: string;
		description: string;
		delay?: number;
	} = $props();
</script>

<div class="step" use:reveal={{ delay }}>
	<div class="step-num">{number}</div>
	<h4>{title}</h4>
	<p>{description}</p>
</div>

<style>
	.step { text-align: center; padding: 1.5rem; }
	.step-num { width: 48px; height: 48px; border-radius: 14px; background: rgba(200, 167, 106, 0.08); border: 1px solid rgba(200, 167, 106, 0.15); display: flex; align-items: center; justify-content: center; font-family: var(--font-display); font-weight: 800; font-size: 1.1rem; color: var(--accent); margin: 0 auto 1rem; }
	h4 { font-family: var(--font-display); font-size: 1.1rem; font-weight: 700; color: var(--text); margin-bottom: 0.5rem; }
	p { font-size: 0.9rem; color: var(--text-muted); line-height: 1.6; max-width: 280px; margin: 0 auto; }
</style>
