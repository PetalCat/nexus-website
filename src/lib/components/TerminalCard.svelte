<script lang="ts">
	let { code, comment = '' }: { code: string; comment?: string } = $props();
</script>

<div class="terminal">
	<div class="terminal-header">
		<div class="dots">
			<span style="background: #FF5F57"></span>
			<span style="background: #FFBD2E"></span>
			<span style="background: #27C93F"></span>
		</div>
		<span class="title">Terminal</span>
	</div>
	<div class="terminal-body">
		<pre><code>{@html code}</code></pre>
		{#if comment}
			<div class="comment">{comment}</div>
		{/if}
	</div>
</div>

<style>
	.terminal { max-width: 650px; margin: 0 auto; background: #08080a; border: 1px solid var(--border); border-radius: 12px; overflow: hidden; }
	.terminal-header { display: flex; align-items: center; gap: 0.75rem; padding: 0.75rem 1rem; background: rgba(255, 255, 255, 0.015); border-bottom: 1px solid var(--border); }
	.dots { display: flex; gap: 6px; }
	.dots span { width: 10px; height: 10px; border-radius: 50%; }
	.title { font-family: var(--font-display); font-size: 0.75rem; color: var(--text-muted); }
	.terminal-body { padding: 1.5rem; font-family: var(--font-mono); font-size: 0.85rem; line-height: 1.8; overflow-x: auto; }
	pre { margin: 0; }
	code { white-space: pre; color: var(--text); }
	.comment { margin-top: 0.75rem; color: var(--text-muted); font-size: 0.8rem; }
	:global(.t-prompt) { color: var(--accent); }
	:global(.t-flag) { color: #80b0c0; }
	:global(.t-val) { color: var(--accent-light); }
</style>
