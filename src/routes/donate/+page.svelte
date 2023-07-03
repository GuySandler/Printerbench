<body>
    <center>
    <ul>
  <li><a on:click={goback}>Home</a></li>
  <li><a on:click={gotocustom}>Benchmark</a></li>
  <li><a on:click={gotoleaderboard}>Leaderboard</a></li>
  <li><a on:click={gotodonate}>Donate</a></li>
  <li><a>About</a></li>
  
</ul>
</center>

		<center>	
			<h1 style="padding: 10px; border-radius: 6px; background-color: #333;">Donate</h1>
		<br>
        </center>
    
</body>

<script> 
    
    function gotodonate(){
        location.href="/donate";
    };
    function gotocustom()
	{
		location.href="/custom";		
	};

  function gotoleaderboard()
	{
		location.href="/leaderboard";		
	};
	function goback()
	{
		location.href="..";		
	}
</script>