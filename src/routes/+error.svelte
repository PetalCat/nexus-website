<script lang="ts">
	import { page } from '$app/state';
</script>

<svelte:head>
	<title>Error — Nexus</title>
</svelte:head>

<section class="error-page">
	<h1>{page.status}</h1>
	<p>{page.error?.message ?? 'Something went wrong.'}</p>
	<a href="/" class="btn-primary">Back to Home</a>
</section>

<style>
	.error-page {
		min-height: 80vh;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		text-align: center;
		gap: 1rem;
		padding: 2rem;
	}
	h1 {
		font-size: 5rem;
		font-weight: 900;
		color: var(--accent);
	}
	p {
		color: var(--text-muted);
		font-size: 1.1rem;
	}
</style>
