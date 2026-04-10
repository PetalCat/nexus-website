<script lang="ts">
	import '../app.css';

	let { children } = $props();
</script>

<a href="#main-content" class="skip-link">Skip to content</a>
<main id="main-content">
	{@render children()}
</main>

<style>
	.skip-link {
		position: absolute;
		top: -100px;
		left: 0;
		background: var(--accent);
		color: var(--bg);
		padding: 0.5rem 1rem;
		z-index: 1000;
		font-weight: 700;
		font-size: 0.9rem;
		transition: top 0.2s;
	}
	.skip-link:focus {
		top: 0;
	}
</style>
