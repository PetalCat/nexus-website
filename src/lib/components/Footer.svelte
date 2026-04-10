<footer class="footer">
	<div class="footer-glow"></div>
	<div class="footer-inner">
		<div class="footer-grid">
			<div class="footer-brand">
				<div class="footer-logo">
					<div class="footer-icon">N</div>
					<span>Nexus</span>
				</div>
				<p class="footer-tagline">Unified self-hosted media frontend.<br />Your services. One interface.</p>
			</div>

			<div class="footer-col">
				<h4>Product</h4>
				<a href="/features">Features</a>
				<a href="/integrations">Integrations</a>
				<a href="/install">Install</a>
			</div>

			<div class="footer-col">
				<h4>Community</h4>
				<a href="https://github.com/PetalCat/Nexus" target="_blank" rel="noopener">GitHub</a>
				<a href="https://github.com/PetalCat/Nexus/issues" target="_blank" rel="noopener">Issues</a>
				<a href="https://github.com/PetalCat/Nexus/discussions" target="_blank" rel="noopener">Discussions</a>
			</div>

			<div class="footer-col">
				<h4>Legal</h4>
				<a href="/about">About</a>
			</div>
		</div>

		<div class="footer-bottom">
			<p>&copy; {new Date().getFullYear()} Nexus by PetalCat. <a href="https://github.com/PetalCat/Nexus" target="_blank" rel="noopener">Open source.</a></p>
		</div>
	</div>
</footer>

<style>
	.footer {
		position: relative;
		border-top: 1px solid var(--border);
		padding: 4rem 0 2rem;
		margin-top: 6rem;
		overflow: hidden;
	}

	.footer-glow {
		position: absolute;
		top: -100px;
		left: 50%;
		transform: translateX(-50%);
		width: 600px;
		height: 200px;
		background: radial-gradient(ellipse, rgba(200, 167, 106, 0.06) 0%, transparent 70%);
		pointer-events: none;
	}

	.footer-inner {
		max-width: 1200px;
		margin: 0 auto;
		padding: 0 1.5rem;
		position: relative;
	}

	.footer-grid {
		display: grid;
		grid-template-columns: 2fr 1fr 1fr 1fr;
		gap: 3rem;
	}

	.footer-logo {
		display: flex;
		align-items: center;
		gap: 0.5rem;
		font-family: var(--font-display);
		font-weight: 800;
		font-size: 1.2rem;
		color: var(--text);
		margin-bottom: 0.75rem;
	}

	.footer-icon {
		width: 24px;
		height: 24px;
		border-radius: 6px;
		background: linear-gradient(135deg, var(--accent), var(--accent-dark));
		display: grid;
		place-items: center;
		font-family: 'Playfair Display', Georgia, serif;
		font-size: 0.85rem;
		font-weight: 700;
		font-style: italic;
		color: var(--bg);
		line-height: 1;
		padding-right: 1px;
	}

	.footer-tagline {
		color: var(--text-muted);
		font-size: 0.9rem;
		line-height: 1.6;
	}

	.footer-col {
		display: flex;
		flex-direction: column;
		gap: 0.6rem;
	}

	.footer-col h4 {
		font-family: var(--font-display);
		font-weight: 600;
		font-size: 0.85rem;
		color: var(--text);
		text-transform: uppercase;
		letter-spacing: 0.08em;
		margin-bottom: 0.5rem;
	}

	.footer-col a {
		color: var(--text-muted);
		text-decoration: none;
		font-size: 0.9rem;
		transition: color 0.2s ease;
	}

	.footer-col a:hover { color: var(--accent); }

	.footer-bottom {
		margin-top: 3rem;
		padding-top: 1.5rem;
		border-top: 1px solid var(--border);
		text-align: center;
	}

	.footer-bottom p { color: var(--text-muted); font-size: 0.8rem; }
	.footer-bottom a { color: inherit; text-decoration: underline; }

	@media (max-width: 768px) {
		.footer-grid { grid-template-columns: 1fr 1fr; gap: 2rem; }
		.footer-brand { grid-column: 1 / -1; }
	}

	@media (max-width: 480px) {
		.footer-grid { grid-template-columns: 1fr; }
	}
</style>
