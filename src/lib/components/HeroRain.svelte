<script lang="ts">
	import { onMount, onDestroy } from 'svelte';

	const COLUMN_COUNT = 10;
	// Number of posters rendered per column. Needs to be tall enough that
	// the column fills the viewport height after rotate/scale. 8 is enough
	// for a ~1200px viewport at 156px per slot × 1.4 scale.
	const SLOTS_PER_COL = 8;
	// Time (ms) for one poster to traverse one slot. Each column has a
	// slight offset on this so they don't all rotate in lock-step.
	const SLOT_MS_BASE = 4200;

	type Item =
		| { type: 'image'; src: string; key: string }
		| { type: 'gradient'; c1: string; c2: string; key: string };

	let posterFiles: string[] | null | undefined = $state(undefined);

	const SOFT_GRADIENTS: [string, string][] = [
		['#2a1518', '#14090a'], ['#152028', '#0a1014'], ['#282818', '#14140a'],
		['#182818', '#0a140a'], ['#28182a', '#14091a'], ['#1f2830', '#0f1418'],
	];

	// Durable running-counter for keys — Svelte's {#each ... (key)} needs
	// unique ids per list entry, and posters can repeat, so we tag each
	// slot with a monotonic counter.
	let kid = 0;
	function newKey(): string {
		return `k${++kid}`;
	}

	function pickPoster(avoid: Set<string>): Item {
		if (posterFiles && posterFiles.length > 0) {
			// Prefer a poster not currently in the column. Fall back to any
			// if the pool is smaller than the column height.
			const pool = posterFiles.filter((p) => !avoid.has(p));
			const src = pool.length > 0
				? pool[(Math.random() * pool.length) | 0]
				: posterFiles[(Math.random() * posterFiles.length) | 0];
			return { type: 'image', src: `/posters/${src}`, key: newKey() };
		}
		const [c1, c2] = SOFT_GRADIENTS[(Math.random() * SOFT_GRADIENTS.length) | 0];
		return { type: 'gradient', c1, c2, key: newKey() };
	}

	interface Column {
		id: number;
		items: Item[];
		direction: 'up' | 'down';
		slotMs: number;
	}

	const SLOT_PX = 156; // poster height (150) + gap (6)

	let columns: Column[] | null = $state(null);
	const colElements: HTMLDivElement[] = [];
	let rafId = 0;

	onMount(async () => {
		try {
			const res = await fetch('/posters/manifest.json');
			if (res.ok) {
				const list = await res.json();
				posterFiles = Array.isArray(list) && list.length >= 12 ? list : null;
			} else {
				posterFiles = null;
			}
		} catch {
			posterFiles = null;
		}

		// Seed columns with random initial content.
		const init: Column[] = [];
		for (let c = 0; c < COLUMN_COUNT; c++) {
			const items: Item[] = [];
			const seen = new Set<string>();
			for (let s = 0; s < SLOTS_PER_COL; s++) {
				const it = pickPoster(seen);
				if (it.type === 'image') seen.add(it.src.split('/').pop() ?? '');
				items.push(it);
			}
			init.push({
				id: c,
				items,
				direction: c % 2 === 0 ? 'up' : 'down',
				slotMs: SLOT_MS_BASE + ((c * 137) % 1800) // 4.2 – 6s, varied
			});
		}
		columns = init;

		// Single rAF drives BOTH translate and rotation. DOM mutation happens
		// in the exact frame the offset wraps, so the visual reset is
		// invisible. Perf-sensitive: runs every frame so avoid allocations
		// on the non-mutating hot path.
		//
		// - Cache direction sign + slotMs in local state (no hash lookups
		//   into the reactive proxy every frame).
		// - Write transform imperatively via translate3d to keep the column
		//   on its own compositor layer (zero layout cost per frame).
		// - Only clone `columns` when a column actually needs a mutation
		//   this frame. 98% of frames nothing mutates.
		const state: Array<{ offset: number; lastTs: number; slotMs: number; sign: 1 | -1 }> =
			init.map((col) => ({
				offset: 0,
				lastTs: 0,
				slotMs: col.slotMs,
				sign: col.direction === 'up' ? -1 : 1
			}));

		function frame(ts: number) {
			rafId = requestAnimationFrame(frame);
			const cols = columns;
			if (!cols) return;
			let pendingMutation: Column[] | null = null;
			for (let c = 0; c < COLUMN_COUNT; c++) {
				const s = state[c];
				if (s.lastTs === 0) s.lastTs = ts;
				const dt = ts - s.lastTs;
				s.lastTs = ts;
				s.offset += (dt / s.slotMs) * SLOT_PX;
				if (s.offset >= SLOT_PX) {
					s.offset -= SLOT_PX;
					const col = cols[c];
					const avoid = new Set<string>();
					for (const it of col.items) {
						if (it.type === 'image') avoid.add(it.src.split('/').pop() ?? '');
					}
					const incoming = pickPoster(avoid);
					const updated = col.items.slice();
					if (col.direction === 'up') {
						updated.shift();
						updated.push(incoming);
					} else {
						updated.pop();
						updated.unshift(incoming);
					}
					if (!pendingMutation) pendingMutation = cols.slice();
					pendingMutation[c] = { ...col, items: updated };
				}
				const el = colElements[c];
				if (el) {
					// translate3d parks the column on its own GPU composite
					// layer — transform updates are then zero-cost paint.
					el.style.transform = `translate3d(0, ${s.sign * s.offset}px, 0)`;
				}
			}
			if (pendingMutation) columns = pendingMutation;
		}
		rafId = requestAnimationFrame(frame);
	});

	onDestroy(() => {
		if (rafId) cancelAnimationFrame(rafId);
	});
</script>

<div class="hero-rain-container">
	{#if columns}
		<div class="poster-rain">
			{#each columns as col, i (col.id)}
				<div
					class="poster-col"
					bind:this={colElements[i]}
				>
					{#each col.items as item (item.key)}
						{#if item.type === 'image'}
							<div class="poster">
								<img src={item.src} alt="" loading="eager" />
							</div>
						{:else}
							<div
								class="poster"
								style="background: linear-gradient(135deg, {item.c1}, {item.c2})"
							></div>
						{/if}
					{/each}
				</div>
			{/each}
		</div>
	{/if}
	<div class="vignette"></div>
</div>

<style>
	.hero-rain-container {
		position: absolute;
		inset: 0;
		overflow: hidden;
	}

	.poster-rain {
		display: flex;
		gap: 6px;
		justify-content: center;
		transform: rotate(-12deg) scale(1.4);
		transform-origin: center 40%;
		position: absolute;
		inset: -20%;
	}

	/*
	 * Columns are driven by a single requestAnimationFrame loop in the
	 * script. Each column's transform is set imperatively every frame,
	 * and the items array rotates in the same frame that the transform
	 * wraps back to 0 — no CSS animation involved. That keeps the
	 * DOM mutation perfectly synced with the visual reset, which was
	 * the source of the prior "flicker every slotMs" bug.
	 *
	 * will-change + translate3d promote each column to its own
	 * compositor layer so transform updates are composite-only (no
	 * layout, no paint) — critical for keeping the rain at 60fps with
	 * 80 posters moving simultaneously.
	 */
	.poster-col {
		display: flex;
		flex-direction: column;
		gap: 6px;
		width: 100px;
		flex-shrink: 0;
		will-change: transform;
		transform: translate3d(0, 0, 0);
		backface-visibility: hidden;
	}

	.poster {
		width: 100px;
		height: 150px;
		border-radius: 4px;
		flex-shrink: 0;
		overflow: hidden;
	}

	.poster img {
		width: 100%;
		height: 100%;
		object-fit: cover;
		/* Make the posters actually show as art, not mood fog. Amp saturation
		   + contrast so the color in the reds/ambers comes through; vignette
		   below still keeps the hero text the focal point. */
		filter: brightness(0.95) saturate(1.6) contrast(1.1);
	}

	.vignette {
		position: absolute;
		inset: 0;
		/* Keep the hero text legible without blacking out the posters. The
		   center reads as a softly dimmed area; edges fade to the page
		   background so the rain blends into the next section. */
		background:
			radial-gradient(
				ellipse 55% 45% at 50% 45%,
				rgba(5, 5, 7, 0.55) 0%,
				rgba(5, 5, 7, 0.15) 60%,
				rgba(5, 5, 7, 0.05) 90%
			),
			linear-gradient(
				to bottom,
				rgba(5, 5, 7, 0) 0%,
				rgba(5, 5, 7, 0) 65%,
				#050507 100%
			);
		pointer-events: none;
	}

	@media (prefers-reduced-motion: reduce) {
		.drift-up, .drift-down { animation: none !important; }
	}
</style>
