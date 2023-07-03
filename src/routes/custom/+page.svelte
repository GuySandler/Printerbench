<center>
		<ul>
			<li><a on:click={goback}>Home</a></li>
			<li><a on:click={gotocustom}>Benchmark</a></li>
			<li><a on:click={gotoleaderboard}>Leaderboard</a></li>
			<!-- <li><a on:click={gotodonate}>Donate</a></li> -->
			<!-- <li><a>About</a></li> -->
		</ul>
	{#if notComplete}
	<form id="form" on:submit="{Submit}">
		<h3 style="font-size: 4vw; padding: 10px; border-radius: 6px; background-color: #333;">Input Your Printer Information</h3>
		
		<input
			autocomplete="off"
			type="text"
			placeholder="Printer Name"
			class="textInput"
			id="name"
			required
			bind:value={name}
		/>
		<input
			autocomplete="off"
			type="text"
			placeholder="Company/Manufacturer"
			class="textInput"
			id="name"
			required
			bind:value={company}
		/>
		
		<select bind:value={type} id="type">
			<option value="Bedslinger">Bedslinger</option>
			<option value="CoreXY">Core XY</option>
			<option value="Delta">Delta</option>
			<option value="Other">Other</option>
		</select>
		<br><br><br>

		<label style="color: white; padding: 19px; border-radius: 5px; background-color: orange;">
			<input type="checkbox" bind:checked={modded}  />
			Modded/upgarded
		</label>
		{#if modded}
		<br><br><br>
			<textarea
				autocomplete="off"
				cols="40" rows="5"
				type="text"
				placeholder="Describe Your Printer Mods"
				class="TextArea"
				id="ModInfo"
				required
				bind:value={ModInfo}
				style="width:17.5vw;height:12.5vh;font-size:1vw;font-family: printerFont;"
			></textarea>
		{/if}
		<br />

		<br />
		<h3 style="color: orange">Enter Print Volume:</h3>
		{#if type != "delta"}    
			<input
				autocomplete="off"
				type="number"
				placeholder="X mm"
				class="textInputSmall"
				id="xmm"
				bind:value={xmm}
				required
			/>
			<input
				autocomplete="off"
				type="number"
				placeholder="Y mm"
				class="textInputSmall"
				id="ymm"
				required
				bind:value={ymm}
			/>
			<input
				autocomplete="off"
				type="number"
				placeholder="Z mm"
				class="textInputSmall"
				id="zmm"
				required
				bind:value={zmm}
			/>
		{/if}
		{#if type == "delta"}    
			<input
				autocomplete="off"
				type="number"
				placeholder="XY Diameter"
				class="textInputSmall"
				id="xy"
				bind:value={xyD}
				required
			/>
			<input
				autocomplete="off"
				type="number"
				placeholder="Z mm"
				class="textInputSmall"
				id="zmm"
				required
				bind:value={zmm}
			/>
		{/if}
		<br><br><br>
		<!-- <div class="flipswitch">
			<input type="checkbox" name="flipswitch" class="flipswitch-cb" id="fs" bind:checked={SpeedToggle}>
			<label class="flipswitch-label" for="fs">
				<div class="flipswitch-inner"></div>
				<div class="flipswitch-switch"></div>
			</label>
		</div> -->
		<!-- {#if !SpeedToggle}
			<h3 style="color: orange">Enter Your Printer's Max Volumetric Flow Rate <br> (Max Extrusion Speed) </h3>
			<input
				autocomplete="off"
				type="numbers"
				placeholder="mm/s^3"
				class="textInputSmall"
				id="mm/s"
				required
				bind:value={extrusionSpeed}
			/>
		{/if} -->
		<!-- {#if SpeedToggle} -->
			<!-- direct speed -->
			<h3 style="color: orange">Enter Your Printer's Speed</h3>
			<input
				autocomplete="off"
				type="numbers"
				placeholder="mm/s"
				class="textInputSmall"
				id="mm/s"
				required
				bind:value={mms}
			/>
		<!-- {/if} -->
		<br/>
		<!--NOTE TO SELF: ADD TOGGLE TO TOGGLE IN BETWEEN ENTER MAX SPEED AND ENTER MAX EXTRUSION SPEED  -->

		<h3 style="color: orange">Printer Features</h3>
		<label class="label">
			<input type="checkbox" bind:checked={FS} />
			Filament Sensor 
		</label>
		<br><br><br>
		  
		<label class="label">
			<input type="checkbox" bind:checked={E} />
			Enclosure 
		</label>
		
		<label class="label">
			<input type="checkbox" bind:checked={DD} />
			Direct Drive 
		</label>
		
		<br /><br /><br />
		
		<label class="label">
			<input type="checkbox" bind:checked={C} />
			Printer Camera 
		</label>
		
		<label class="label">
			<input type="checkbox" bind:checked={IS} />
			Input Shaping 
		</label>
		<br /><br /><br />


		
		<label class="label">
			<input type="checkbox" bind:checked={BL} />
			Auto Bed Leveling 
		</label>
		
		<label class="label">
			<input type="checkbox" bind:checked={OS} />
			Open Source 
		</label>
		
		<br /><br /><br />
		
		<label class="label">
			<input type="checkbox" bind:checked={MC} />
			Multicolor 
		</label>
		
		<label class="label">
			<input type="checkbox" bind:checked={FL} />
			Auto First Layer Calibration 
		</label>
		<br><br><br>
		<label class="label">
			<input type="checkbox" bind:checked={Cloud} />
			Cloud Services/Remote Access 
		</label>
		
		<br /><br /><br />
		
		<h3 style="color: orange">Cost in USD</h3>
		<input
			autocomplete="off"
			type="number"
			bind:value={cost}
			placeholder="Cost"
			class="textInputSmall"
			id="cost"
			required
		/>

		<br /><br /><button type="submit" class="button">Submit</button>
	</form>
 
	{/if}

	<!-- 		results -->
	{#if !notComplete}
		{#if !submittedToWeb}
			<h1 style="position: relative; top: 9vh; font-size: 100px">
				Congrats, {name} scored {score} points!
			</h1>
					
			<button on:click={Publish} class="startbutton">
				Publish to Web
			</button>
			
			<br><br>
			
			<button on:click={goback} class="startbutton">
				Go Home
			</button>
			
			<div style="position: fixed;top: -50px;left: 0;height: 120vh;width: 100vw;display: flex;justify-content: center;overflow: hidden;pointer-events: none;">
				<Confetti x={[-5, 5]} y={[0, 0.1]} delay={[500, 2000]} infinite duration=7000 amount=550 fallDistance="150vh" size=18/>
			</div>
		{/if}
		
		{#if submittedToWeb}       
			<h2 style="font-size: 70px; color: white;">Your Response Has Been Submitted!</h2>
			<h2 style="font-size: 20px; color: orange;">Your submission might take a couple of days to be processed.</h2>
			<button on:click={goback} class="startbutton">
				Go Home
			</button>
		{/if}
	{/if}

	
</center>


<script lang="ts">
	import { Confetti } from "svelte-confetti";
	import { initializeApp } from "firebase/app";
	import { getFirestore, collection, addDoc } from "firebase/firestore";

	let score;
	let notComplete = true;
    let submittedToWeb = false;
	let ModInfo;
	let Adv = false;
	let SpeedToggle = false;
	// printer
	let name;
	let company;
	let type;
	//cost 
	let cost; 
	// speed 
 
    let extrusionSpeed;
	let mms;
	// area
	let xmm;
	let ymm;
	let zmm;
	let xyD;
	// features
	let modded = false;
	let FS = false;
	let BL = false;
	let FL = false;
	let MC = false;
	let OS = false;
	let E = false;
	let DD = false;
	let C = false;
	let IS = false;
	let Cloud = false;
	
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
	};
	
	function roundUp(num, precision) {
  		precision = Math.pow(10, precision)
  		return Math.ceil(num * precision) / precision
	};
	
	function Submit() {
		if (modded)
		{
			let ModInfo = document.getElementById("ModInfo").value;
		}
		score = 0;
		let mmCube;
        let mmCubeDelta;
		// area
      	if (type != "delta")
		{
            mmCube = parseInt(xmm) * parseInt(ymm) * parseInt(zmm);
		}
		else if (type == "delta")
		{
            mmCubeDelta = Math.round(((parseInt(xyD) / 2) ^ 2) * 3.14159265 * parseInt(zmm));
		}

		// features
		if (FS)
		{ 
			score = score + 30;
		}
		if (BL)
		{
		
			score = score + 40;
		}
		if (FL)
		{
			score = score + 30;
		}
		if (MC)
		{
			score = score + 30;
		} 
    	if (E)
		{
			score = score + 30;
		} 
    	if (DD)
		{
			score = score + 40;
		} 
		if (C)
		{
			score = score + 30;
		} 
		if (IS)
		{
			score = score + 30;
		} 
		if (Cloud)
		{
			score = score + 30;
		} 

		// // speed
		// if (!SpeedToggle)
		// {
		// 	// flow rate
		// 	mmsToShow = roundUp(extrusionSpeed / (0.4 * 0.2), 0);
  //       	mms = mmsToShow;
		// }
        // else if (SpeedToggle)
        // {
			// direct speed
            // extrusionSpeed = roundUp(mms * (0.4 * 0.2), 0);
            // mmsToShow = mms;
        // }
		
		// final score calc
        if (type != "delta"){
        score = score + roundUp(mmCube/50000, 0) + roundUp(mms * 1.2, 0);
        notComplete = false;
        };
        
        if (type == "delta"){
            score = score + roundUp(mmCubeDelta/50000, 0) + roundUp(mms * 1.2, 0);
			notComplete = false;
        };	
			
  	};

	// firebase stuff
	const firebaseConfig = {
		apiKey: "AIzaSyDJY1qKU5FUroc2N_GWgd13JUV369ZmMvo",
		authDomain: "printerbench-93bc1.firebaseapp.com",
		projectId: "printerbench-93bc1",
		storageBucket: "printerbench-93bc1.appspot.com",
		messagingSenderId: "765620645081",
		appId: "1:765620645081:web:6c338d0f8aabff3862e2c8",
		measurementId: "G-ZQX9QSLZGV"
	};

	const app = initializeApp(firebaseConfig);
	const db = getFirestore(app);
	    
    function gotodonate(){
        location.href="/donate";
    };
    
	function Publish()
	{
        submittedToWeb = true;
		let Time = new Date();
		if (!modded)
		{
			if (type != "delta")
			{
				addDoc(collection(db, "InReview"), 
				{
					time: Time,
					name: name,
					company: company,
					type: type,
					score: score,
					cost: cost,
					mms: mms,
					xmm: xmm,
					ymm: ymm,
					zmm: zmm,
					Fsense: FS,
					BL: BL,
					FL: FL,
					Multicolor: MC,
					opensource: OS,
					Enclosure: E,
					DirectDrive: DD,
					Camera: C,
					InputShaping: IS,
					Cloud: Cloud,
					Modded: modded,
				});
			}
			else 
			{
				addDoc(collection(db, "InReview"), 
				{
					time: Time,
					name: name,
					company: company,
					type: type,
					score: score,
					cost: cost,
					mms: mms,
					xyD: xyD,
					zmm: zmm,
					Fsense: FS,
					BL: BL,
					FL: FL,
					Multicolor: MC,
					opensource: OS,
					Enclosure: E,
					DirectDrive: DD,
					Camera: C,
					InputShaping: IS,
					Cloud: Cloud,
					Modded: modded,
				});
			}
		}
		else
		{
			if (type != "delta")
			{
				addDoc(collection(db, "InReview"), 
				{
					time: Time,
					name: name,
					company: company,
					type: type,
					score: score,
					cost: cost,
					mms: mms,
					xmm: xmm,
					ymm: ymm,
					zmm: zmm,
					Fsense: FS,
					BL: BL,
					FL: FL,
					Multicolor: MC,
					opensource: OS,
					Enclosure: E,
					DirectDrive: DD,
					Camera: C,
					InputShaping: IS,
					Cloud: Cloud,
					// 
					Modded: modded,
					ModInfo: ModInfo,
				});
			}
			else
			{
				addDoc(collection(db, "InReview"), 
				{
					time: Time,
					name: name,
					company: company,
					type: type,
					score: score,
					cost: cost,
					mms: mms,
					xyD: xyD,
					zmm: zmm,
					Fsense: FS,
					BL: BL,
					FL: FL,
					Multicolor: MC,
					opensource: OS,
					Enclosure: E,
					DirectDrive: DD,
					Camera: C,
					InputShaping: IS,
					Cloud: Cloud,
					Modded: modded,
					ModInfo: ModInfo,
				});
			}
		}
	};
	
</script>