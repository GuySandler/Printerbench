<script>
	import './styles.css';
	import { dev } from '$app/environment';
	import { inject } from '@vercel/analytics';
	 
	inject({ mode: dev ? 'development' : 'production' });
</script>

<div class="app" data-sveltekit-preload-data="hover">

	<main>
		<slot />
	</main>
</div>
