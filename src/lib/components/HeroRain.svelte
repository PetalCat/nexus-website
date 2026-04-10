<script lang="ts">
	import { onMount } from 'svelte';

	const COLUMN_COUNT = 10;
	const POSTERS_PER_COL = 4;

	const gradients = [
		['#4a2020', '#2a1010'], ['#203848', '#102028'], ['#484020', '#282010'],
		['#204038', '#102018'], ['#402040', '#201020'], ['#384820', '#182810'],
		['#2a3050', '#151828'], ['#503828', '#281810'], ['#383050', '#1c1828'],
		['#204830', '#102818'], ['#482828', '#281414'], ['#283848', '#141c28'],
		['#484028', '#282014'], ['#3a2848', '#1d1428'], ['#284838', '#142818'],
		['#483828', '#281c14'], ['#304828', '#182814'], ['#482838', '#28141c'],
		['#384028', '#1c2014'], ['#283048', '#141828'], ['#402830', '#201418'],
		['#304030', '#182018'], ['#483048', '#281828'], ['#203040', '#101820'],
		['#284028', '#142014'], ['#402840', '#201420'], ['#384038', '#1c201c'],
		['#482038', '#28101c'], ['#304830', '#182818'], ['#402030', '#201018'],
		['#283848', '#141c28'], ['#484028', '#282014'], ['#204030', '#102018'],
		['#4a2830', '#2a1418'], ['#303850', '#181c28'], ['#483028', '#281814'],
		['#204840', '#102820'], ['#402048', '#201028'], ['#304028', '#182014'],
		['#284040', '#142020']
	];

	let posterFiles: string[] = $state([]);
	let useImages = $derived(posterFiles.length >= 20);

	onMount(async () => {
		try {
			const res = await fetch('/posters/manifest.json');
			if (res.ok) {
				posterFiles = await res.json();
			}
		} catch {
			// No manifest yet — use gradient placeholders
		}
	});

	function getColumns() {
		const cols = [];
		let gi = 0;
		for (let c = 0; c < COLUMN_COUNT; c++) {
			const posters = [];
			for (let p = 0; p < POSTERS_PER_COL * 2; p++) {
				if (useImages) {
					const idx = (c * POSTERS_PER_COL + p) % posterFiles.length;
					posters.push({ type: 'image' as const, src: `/posters/${posterFiles[idx]}` });
				} else {
					const [c1, c2] = gradients[gi % gradients.length];
					posters.push({ type: 'gradient' as const, c1, c2 });
					gi++;
				}
			}
			cols.push({
				posters,
				direction: c % 2 === 0 ? 'up' : 'down',
				duration: 20 + (c % 3) * 5
			});
		}
		return cols;
	}

	let columns = $derived(getColumns());
</script>

<div class="hero-rain-container">
	<div class="poster-rain">
		{#each columns as col, ci}
			<div
				class="poster-col"
				class:drift-up={col.direction === 'up'}
				class:drift-down={col.direction === 'down'}
				style="animation-duration: {col.duration}s"
			>
				{#each col.posters as poster}
					{#if poster.type === 'image'}
						<div class="poster">
							<img src={poster.src} alt="" loading="lazy" />
						</div>
					{:else}
						<div class="poster" style="background: linear-gradient(135deg, {poster.c1}, {poster.c2})"></div>
					{/if}
				{/each}
			</div>
		{/each}
	</div>
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

	.poster-col {
		display: flex;
		flex-direction: column;
		gap: 6px;
		width: 100px;
		flex-shrink: 0;
	}

	.drift-up { animation: drift-up linear infinite; }
	.drift-down { animation: drift-down linear infinite; }

	@keyframes drift-up {
		0% { transform: translateY(0); }
		100% { transform: translateY(calc(-50%)); }
	}

	@keyframes drift-down {
		0% { transform: translateY(calc(-50%)); }
		100% { transform: translateY(0); }
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
		filter: brightness(0.5) saturate(0.6) sepia(0.15);
	}

	.vignette {
		position: absolute;
		inset: 0;
		background: radial-gradient(
			ellipse 65% 60% at 50% 45%,
			rgba(5, 5, 7, 0.3) 0%,
			rgba(5, 5, 7, 0.75) 50%,
			#050507 80%
		);
		pointer-events: none;
	}

	@media (prefers-reduced-motion: reduce) {
		.drift-up, .drift-down { animation: none !important; }
	}
</style>
