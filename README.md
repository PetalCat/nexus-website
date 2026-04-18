# Nexus website

Marketing + documentation site for [Nexus](https://github.com/PetalCat/Nexus) — the unified self-hosted media frontend.

- **Live:** https://nexus.petalcat.net
- **Stack:** SvelteKit + Tailwind 4, `@sveltejs/adapter-static`
- **Hosting:** GitHub Pages (auto-deploy from `main` via `.github/workflows/deploy.yml`)
- **License:** [AGPL-3.0](LICENSE), matching the Nexus app

## Local dev

```bash
pnpm install
pnpm dev          # localhost:5173
pnpm build        # produces build/ for static hosting
```

## Updating the hero poster rain

All the rotating poster art is public-domain content pulled from Wikimedia Commons via the `copyright status = public domain` (P6216=Q19652) statement filter. See `scripts/fetch-posters.sh`.

```bash
bash scripts/fetch-posters.sh
```

The script is idempotent — re-running skips already-downloaded files, then regenerates `static/posters/manifest.json` which the `HeroRain.svelte` component reads at runtime.

If a non-PD file slips through (Commons metadata is not always perfect), just `rm` it and re-run to refresh the manifest.

## License & attribution

See [/credits](src/routes/credits/+page.svelte) on the live site for the full provenance breakdown — AGPL-3.0 for the app + this site, Wikimedia PD for the poster art, trademarks belong to their respective projects.
