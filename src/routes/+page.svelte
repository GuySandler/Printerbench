<script lang="ts">
    import logo from '$lib/images/logo.png';
    import hex from '$lib/images/hex.png';
	import discord from '$lib/images/discord.png';
  
	function gotocustom()
	{
		location.href="/custom";		
	};
  	
	function gotoleaderboard()
	{
		location.href="/leaderboard";		
	};
    
	function gotohome()
	{
		location.href="..";			
	};
	
	function gotodonate()
	{
        location.href="/donate";
    };

	function discordLink() {
		location.href="https://discord.gg/bsFEKJSJkH";
	}

	
</script>
<svelte:head>
	<meta name="google-site-verification" content="rDjI7Wku_kUsS0hDCZK1PxxpfDLVC4jFMNE0p1SwgCE" />
	<meta name="description" content="Easily approximate how good your printer is and compare it to others on the leaderboard for free">
	<meta name="keywords" content="printerbench, 3d printerbench, printer bench, 3dprinter, 3d printer, 3dprinting, 3d printing, prusa, creality, anycubic, fdm, ender, printer, benchmark, 3d printer contest, 3d printer test, 3d printer comparison, 3d printer benchmark, 3d printer review">
</svelte:head>

<ul>
	<li><a on:click={gotohome}>Home</a></li>
	<li><a on:click={gotocustom}>Benchmark</a></li>
	<li><a on:click={gotoleaderboard}>Leaderboard</a></li>
	<!-- <li><a on:click={gotodonate}>Donate</a></li> -->
	<!-- <li><a>About</a></li> -->
</ul>

<center>
	<!-- <img src={hex} style="width: 37vw;"> -->
	<h1 style="text-shadow: 1px 1px  #ccc, 2px 2px  #ccc,
			3px 3px  #ccc, 4px 4px  #ccc,
			5px 5px  #ccc, 8px 8px rgba(0, 0, 0, 0.5);">
		PrinterBench
	</h1> 
	<br>
	<img src={logo} class="logo" style="height: auto;">
	<br>
	<button on:click={gotocustom} class="button">Start Benchmark</button>

	<h2>Future additions:</h2>
	<h3>- viewing mods for leaderboard</h3>
	<h3>- comments</h3>
	<h3>- filters</h3>
	<h3>- score system subject to change</h3>
	<img on:click={discordLink} style="height: auto;width:5vw;"src={discord}>
</center>