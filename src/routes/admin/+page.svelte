<ul>
  <li><a on:click={goback}>Home</a></li>
  <li><a on:click={gotocustom}>Benchmark</a></li>
  <li><a on:click={gotoleaderboard}>Leaderboard</a></li>
  <!-- <li><a on:click={gotodonate}>Donate</a></li> -->
  <!-- <li><a>About</a></li> -->
</ul>

<center>
	<h1 style="padding: 10px; border-radius: 6px; background-color: #333;">Admin Panel</h1>
	{#if loginVisible}
		<button on:click={signIn} class="startbutton">Sign In With Google</button>
		
		<br><br><br>
		
		<button on:click={goback} class="startbutton">Go Home</button>
	{/if}
	
	{#if !loginVisible}
		<form id="form" on:submit="{Submit}">
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
			
			<h1>Score: {score}</h1>
			<select bind:value={type} id="type">
				<option value="Bedslinger">Bedslinger</option>
				<option value="corexy">Core XY</option>
				<option value="delta">Delta</option>
				<option value="other">Other</option>
			</select>
			<br><br><br>

			
			<label style="color: white; padding: 19px; border-radius: 5px; background-color: orange;">
				<input type="checkbox" bind:checked={modded}  />
				Modded 
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
					bind:value={ModInfo}
					style="width:17.5vw;height:12.5vh;font-size:1vw;font-family: printerFont;"
				></textarea>
			{/if}
			<br />

			<br />
			<h3 style="color: orange">Enter Print Volume:</h3>
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

			<br />
			<h3 style="color: orange">Enter Printer Speed:</h3>
			<input
				autocomplete="off"
				type="numbers"
				placeholder="mm/s"
				class="textInputSmall"
				id="mm/s"
				required
				bind:value={mms}
			/>
			<br />
		  

			<h3 style="color: orange">Printer Features</h3>
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={FS} />
				Filament Sensor 
			</label>
			
			<br><br><br>
			  
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={E} />
				Enclosure 
			</label>
			
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={DD} />
				Direct Drive 
			</label>
			
			<br /><br /><br />
			
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={C} />
				Printer Camera 
			</label>
			
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={IS} />
				Input Shaping 
			</label>
			
			<br /><br /><br />
			
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={BL} />
				Auto Bed Leveling 
			</label>
			
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={OS} />
				Open Source 
			</label>
			
			<br /><br /><br />
			
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={MC} />
				Multicolor 
			</label>
			
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={FL} />
				Auto First Layer Calibration 
			</label>
			
			<label style="color: white;padding: 10px;border-radius: 6px;background-color: orange;">
				<input type="checkbox" bind:checked={Cloud} />
				Cloud Services/Remote Access 
			</label>
			
			<br /><br /><br />
	 
			<h3 style="color: orange">Cost in USD (Include Upgrades)</h3>
			<input
				autocomplete="off"
				type="number"
				bind:value={cost}
				placeholder="Cost"
				class="textInputSmall"
				id="cost"
				required
			/>
			<br /><br /><button type="submit" class="button">Approve</button>
				<button on:click={Deny} class="button">Deny</button>
		</form>
		<br>

	
		<button on:click={Next} class="button">Get Next Doc</button>
		<button on:click={New} class="button">New Form</button>
		<button on:click={Recalc} class="button">Recalculate All</button>

	{/if}
</center>
<script lang="ts">
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
	// default
	let score = "";
	let notComplete = true;
	let ModInfo = "";
	// printer
	let name = "";
	let company = "";
	let type = "Bedslinger";
	//cost 
	let cost = "";
	// speed 
	let mms = "";
	let extrusionSpeed;
	// area
	let xmm = "";
	let ymm = "";
	let zmm = "";
	let mmCube;
	let mmCubeDelta;
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
	
	let loginVisible = true;

	function roundUp(num, precision) {
  		precision = Math.pow(10, precision)
  		return Math.ceil(num * precision) / precision
	};
	
	import { initializeApp } from "firebase/app";
	import { getFirestore, collection, updateDoc, addDoc, deleteDoc, getDoc, limit, onSnapshot, setDoc, getDocs, query, orderBy } from "firebase/firestore";
	import { GoogleAuthProvider, getAuth, signInWithPopup } from "firebase/auth";

	const firebaseConfig = {
	  apiKey: "AIzaSyDJY1qKU5FUroc2N_GWgd13JUV369ZmMvo",
	  authDomain: "printerbench-93bc1.firebaseapp.com",
	  projectId: "printerbench-93bc1",
	  storageBucket: "printerbench-93bc1.appspot.com",
	  messagingSenderId: "765620645081",
	  appId: "1:765620645081:web:6c338d0f8aabff3862e2c8",
	  measurementId: "G-ZQX9QSLZGV"
	};       
	const provider = new GoogleAuthProvider();
	const app = initializeApp(firebaseConfig);
	const db = getFirestore(app);
	const auth = getAuth();

  
	
	function signedIn()
	{
  		loginVisible = false;
	};
	
	function signIn()
	{
		signInWithPopup(auth, provider)
	  	.then((result) => {
		    // This gives you a Google Access Token. You can use it to access the Google API.
		    const credential = GoogleAuthProvider.credentialFromResult(result);
		    const token = credential.accessToken;
		    // The signed-in user info.
		    const user = result.user;
		    const email = user.email;
			  
			if (email == "wyattschmah@gmail.com" || email == "guy@sandler.co.il" || email == "gsan7047@moraga.k12.ca.us" || email == "wsch7054@moraga.k12.ca.us") 
			{
	      		signedIn();
			}
			else
			{
				location.href="https://www.youtube.com/watch?v=dQw4w9WgXcQ";	
			}
		    // IdP data available using getAdditionalUserInfo(result)
		    // ...
  		})
		.catch((error) => {
			// Handle Errors here.
			const errorCode = error.code;
			const errorMessage = error.message;
			// The email of the user's account used.
			const email = error.customData.email;
			// The AuthCredential type that was used.
			const credential = GoogleAuthProvider.credentialFromError(error);
			// ...
  		});
	}
    function gotodonate(){
        location.href="/donate";
    };
	function Submit() {
		// delete original doc, get new values, send off
		deleteDoc(Pdoc.ref);
		if (!modded)
		{
			addDoc(collection(db, "Published"), 
				{
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
					// ModInfo: ModInfo,
				});
		}
		else
		{
			addDoc(collection(db, "Published"), 
				{
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
					ModInfo: ModInfo,
				});
		}
		New();
	}
	function Deny() {
		deleteDoc(Pdoc.ref);
		New();
	}
	let que = query(collection(db, "InReview"), orderBy("time"), limit(1));
	let Fdoc;
	let Pdoc;
	async function Next() {
		getDocs(que).then((querySnapshot) => {
  			querySnapshot.forEach((doc) => {
				Pdoc = doc;
    			Fdoc = doc.data();
				console.log(Fdoc);
				score = Fdoc.score;
				// printer
				name = Fdoc.name;
				company = Fdoc.company;
				type = Fdoc.type;
				//cost 
				cost = Fdoc.cost;
				// speed 
				mms = Fdoc.mms;
				// area
				xmm = Fdoc.xmm;
				ymm = Fdoc.ymm;
				zmm = Fdoc.zmm;
				// features
				modded = Fdoc.Modded;
				FS = Fdoc.Fsense;
				BL = Fdoc.BL;
				FL = Fdoc.FL;
				MC = Fdoc.Multicolor;
				OS = Fdoc.opensource;
				E = Fdoc.Enclosure;
				DD = Fdoc.DirectDrive;
				C = Fdoc.Camera;
				IS = Fdoc.InputShaping;
				Cloud = Fdoc.Cloud;
				ModInfo = Fdoc.ModInfo;
  			});
		});
		
	}
	function New() {
		// get new values and send off
		// default
		score = "";
		notComplete = true;
		ModInfo = "";
		// printer
		name = "";
		company = "";
		type = "Bedslinger";
		//cost 
		cost = "";
		// speed 
		mms = "";
		// area
		xmm = "";
		ymm = "";
		zmm = "";
		// features
		modded = false;
		FS = false;
		BL = false;
		FL = false;
		MC = false;
		OS = false;
		E = false;
		DD = false;
		C = false;
		IS = false;
		Cloud = false;
	}
	function Recalc() {
		if (confirm("are you sure you want to recalc all printers in database?"))
		{
			let Getties = query(collection(db, "Published"));
			let score;
			// for each docs in published
			getDocs(Getties).then((querySnapshot) => {
	  			querySnapshot.forEach((doc) => {
					Fdoc = doc.data();
					score = 0;
			        let mmCubeDelta;
					// area
			      	if (type != "delta")
					{
			            mmCube = parseInt(Fdoc.xmm) * parseInt(Fdoc.ymm) * parseInt(Fdoc.zmm);
					}
					else if (type == "delta")
					{
			            mmCubeDelta = Math.round(((parseInt(Fdoc.xyD) / 2) ^ 2) * 3.14159265 * parseInt(Fdoc.zmm));
					}
					// stuff
					if (type != "delta")
					{
			            mmCube = parseInt(Fdoc.xmm) * parseInt(Fdoc.ymm) * parseInt(Fdoc.zmm);
					}
					else if (type == "delta")
					{
			            mmCubeDelta = Math.round(((parseInt(Fdoc.xyD) / 2) ^ 2) * 3.14159265 * parseInt(Fdoc.zmm));
					}
			
					// features
					if (Fdoc.FS)
					{ 
						score = score + 30;
					}
					if (Fdoc.BL)
					{
					
						score = score + 40;
					}
					if (Fdoc.FL)
					{
						score = score + 30;
					}
					if (Fdoc.MC)
					{
						score = score + 30;
					} 
			    	if (Fdoc.E)
					{
						score = score + 30;
					} 
			    	if (Fdoc.DD)
					{
						score = score + 40;
					} 
					if (Fdoc.C)
					{
						score = score + 30;
					} 
					if (Fdoc.IS)
					{
						score = score + 30;
					} 
					if (Fdoc.Cloud)
					{
						score = score + 30;
					} 
					console.log("passed feature calc, " + score)
			
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
			        if (Fdoc.type != "delta"){
			        	score = score + roundUp(mmCube/50000, 0) + roundUp(Fdoc.mms * 1.2, 0);
			        };
			        
			        if (Fdoc.type == "delta"){
			            score = score + roundUp(mmCubeDelta/50000, 0) + roundUp(Fdoc.mms * 1.2, 0);
			        };	
					console.log("passed speed and area calc, " + score)

					// update doc
					try 
					{
						updateDoc(doc.ref, {
							score: score
						})
						console.log("recalc complete for " + Fdoc.name + " with new score of " + score)
					}
					catch (error) 
					{
						console.error("something went wrong, " + name + " failed to update with the error:" + error)
					}
					
				});
				alert("done")
			});
		}
	}
</script>
