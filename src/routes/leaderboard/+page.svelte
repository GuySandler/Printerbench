<style>
	body {
		margin: 0;
	}
</style>
<center>	
	<ul>

		<li><a on:click={goback}>Home</a></li>
		<li><a on:click={gotocustom}>Benchmark</a></li>
		<li><a on:click={gotoleaderboard}>Leaderboard</a></li>
		<!-- <li><a on:click={gotodonate}>Donate</a></li> -->
	<!-- <li><a>About</a></li> -->
	</ul>

	<h1 style="padding: 10px;width:55vw; border-radius: 6px; background-color: #333;">Leaderboard</h1>
	{#if !SelectedPrinter}
		<h2>click on a printer to see more info</h2>
	{/if}

	{#if SelectedPrinter}
		<div style="background-color:gray;width:50vw;margin:1vw;">
			<h1 class="info" style="padding: 10px; width: 25vw; border-radius: 6px; background-color: #ff9900; border: 2px solid gray;">{name} made by {company}</h1>
			<div style="padding:10px;background-color: #333:width:75vw;" id="InfoBox">
				<h4 class="info">Score: {score}</h4>
				<br>
				{#if type!="delta"}
					<h4 class="info" style="background-color:red;">Xmm: {xmm}</h4>
					<h4 class="info" style="background-color:blue;">Ymm: {ymm}</h4>
				{/if}
				{#if type=="delta"}
					<h4 class="info" style="background-color:blue;">XYØ: {xyD}</h4>
				{/if}
				<h4 class="info" style="background-color:green;">Zmm: {zmm}</h4>
				<br>
				<br>
				<h4 class="info">Speed: {mms}</h4>
				<h4 class="info">Cost: {cost}$</h4>
				<h4 class="info">Type: {type}</h4>
				<br>
				<h4 class="info">Features:</h4>
				<br>
				<h5 class="info">Bed Leveling: {BL}</h5>
				<h5 class="info">First Layer: {FL}</h5>
				<h5 class="info">Filament Sensor: {FS}</h5>
				<h5 class="info">Enclosure: {E}</h5>
				<h5 class="info">Input Shaping: {IS}</h5>
				<br>
				<h5 class="info">Camera: {C}</h5>
				<h5 class="info">Direct Drive: {DD}</h5>
				<h5 class="info">Multicolor: {MC}</h5>
				<h5 class="info">OS: {OS}</h5>
				<h5 class="info">Remote/Cloud: {Cloud}</h5><br>
			</div>
			<br>
			<button on:click={close} class="button" style="display:inline-block;margin-bottom:5px; outline: none;">Close</button>
			<br>
		</div>
	{/if}
	<div>
		<img src={goldenTrophy}  style="padding: 3px; background-color: #333; border-radius: 6px; border: 2px solid gray; display:inline-block;">
		<button on:click={S1} style="outline: none; background-color: #fee01b; display:inline-block; margin-right:10px;" class="Printer" >
			<h4 class="LeadText left">{printer1}</h4>
			<h4 class="LeadText right">{item1}</h4>
		</button>         
		<br><br>
	</div>
	

	<div>
		<img src={silverTrophy}  style="padding: 3px; background-color: #333; border-radius: 6px; border: 2px solid gray; outline: none; display:inline-block;">
		<button on:click={S2} style="outline: none; background-color:#727475; display:inline-block; margin-right:10px;" class="Printer">
			<h4 class="LeadText left">{printer2}</h4>
			<h4 class="LeadText right">{item2}</h4>
		</button>
		<br><br>
	</div>

	<div>
		<img src={bronzeTrophy}  style=" padding: 3px; background-color: #333; border-radius: 6px; border: 2px solid gray; outline: none; display:inline-block;">
		<button on:click={S3} style="background-color:#e08d45;display:inline-block; margin-right:10px;" class="Printer">
			<h4 class="LeadText left">{printer3}</h4>
			<h4 class="LeadText right">{item3}</h4>
		</button>
		<br><br>
	</div>
		
	<button on:click={S4} style="width: 56vw" class="Printer">
		<h4 class="LeadText left">{printer4}</h4>
		<h4 class="LeadText right">{item4}</h4>
	</button>
	<br><br>
	<button on:click={S5} style="width: 56vw" class="Printer">
		<h4 class="LeadText left">{printer5}</h4>
		<h4 class="LeadText right">{item5}</h4>
	</button>
	<br><br>
	<button on:click={S6} style="width: 56vw" class="Printer">
		<h4 class="LeadText left">{printer6}</h4>
		<h4 class="LeadText right">{item6}</h4>
	</button>
	<br><br>
	<button on:click={S7} style="width: 56vw" class="Printer">
		<h4 class="LeadText left">{printer7}</h4>
		<h4 class="LeadText right">{item7}</h4>
	</button>
	<br><br>
	<button on:click={S8} style="width: 56vw" class="Printer">
		<h4 class="LeadText left">{printer8}</h4>
		<h4 class="LeadText right">{item8}</h4>
	</button>
	<br><br>
	<button on:click={S9} style="width: 56vw" class="Printer">
		<h4 class="LeadText left">{printer9}</h4>
		<h4 class="LeadText right">{item9}</h4>
	</button>
	<br><br>
	<button on:click={S10} style="width: 56vw" class="Printer">
		<h4 class="LeadText left">{printer10}</h4>
		<h4 class="LeadText right">{item10}</h4>
	</button>
	<!-- <br><br> -->
</center>

<script lang="ts">
	import goldenTrophy from '../../lib/images/Golden Trophy 2.gif'
    import silverTrophy from '../../lib/images/Silver Trophy 2.gif'
    import bronzeTrophy from '../../lib/images/Bronze Trophy 2.gif'

	import { getFirestore, where, collection, addDoc, deleteDoc, getDoc, limit, onSnapshot, getDocs, query, orderBy } from "firebase/firestore";
	import { initializeApp } from "firebase/app";
	
	let sortByFilter;
	let SelectedPrinter = false;
	let SP = false;

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
    function gotodonate(){
        location.href="/donate";
    };

	let selected;
	let mods;

	let score;
	let ModInfo;
	// printer
	let name;
	let company;
	let type;
	//cost 
	let cost; 
	// speed 
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

    let currentPage = 1;
    
	let data1;
	let data2;
	let data3;
	let data4;
	let data5;
	let data6;
	let data7;
	let data8;
	let data9;
	let data10;

	let printer1;
	let printer2;
	let printer3;
	let printer4;
	let printer5;
	let printer6;
	let printer7;
	let printer8;
	let printer9;
	let printer10;
	
	let item1;
	let item2;
	let item3;
	let item4;
	let item5;
	let item6;
	let item7;
	let item8;
	let item9;
	let item10;

	function S1() {selected = 1;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function S2() {selected = 2;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function S3() {selected = 3;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function S4() {selected = 4;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function S5() {selected = 5;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function S6() {selected = 6;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function S7() {selected = 7;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function S8() {selected = 8;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function S9() {selected = 9;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function S10() {selected = 10;Expand();SelectedPrinter = true;window.scrollTo(0, 0);}
	function close() {SelectedPrinter = false}

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

	const q = query(collection(db, "Published"), where("Modded", "==", false), orderBy("score", "desc"), limit(10));
	// , orderBy("score", "asce")
	let docData;
	let DataList = [];
	let snap = 0
	async function GetStuff()
		{
			const querySnapshot = await getDocs(q);
			querySnapshot.forEach((doc) => {
				docData = doc.data();
				DataList.push(docData);
			});
			// console.log(docData);
			// console.log(DataList);
			// console.log(DataList[0].name)
			// console.log(DataList[0].score)

			printer1 = DataList[0].name;
			printer2 = DataList[1].name;
			printer3 = DataList[2].name;
			printer4 = DataList[3].name;
			printer5 = DataList[4].name;
			printer6 = DataList[5].name;
			printer7 = DataList[6].name;
			printer8 = DataList[7].name;
			printer9 = DataList[8].name;
			printer10 = DataList[9].name;
			
			item1 = DataList[0].score;
			item2 = DataList[1].score;
			item3 = DataList[2].score;
			item4 = DataList[3].score;
			item5 = DataList[4].score;
			item6 = DataList[5].score;
			item7 = DataList[6].score;
			item8 = DataList[7].score;
			item9 = DataList[8].score;
			item10 = DataList[9].score;

			// console.log()
			// console.log()
		}
	function Expand()
		{
			score = DataList[selected-1].score;
			// let ModInfo;
			// printer
			name = DataList[selected-1].name;
			company = DataList[selected-1].company;
			type = DataList[selected-1].type;
			//cost 
			cost = DataList[selected-1].cost; 
			// speed 
			mms = DataList[selected-1].mms;
			// area
			if (type != "delta")
			{
				xmm = DataList[selected-1].xmm;
				ymm = DataList[selected-1].ymm;	
			}
			else 
			{
				xyD = DataList[selected-1].zmm
			}
			zmm = DataList[selected-1].zmm;
			// xyD;
			// features
			// let modded = false;
			FS = DataList[selected-1].Fsense;
			BL = DataList[selected-1].BL;
			FL = DataList[selected-1].FL;
			MC = DataList[selected-1].Multicolor;
			OS = DataList[selected-1].opensource;
			E = DataList[selected-1].Enclosure;
			DD = DataList[selected-1].DirectDrive;
			C = DataList[selected-1].Camera;
			IS = DataList[selected-1].InputShaping;
			Cloud = DataList[selected-1].Cloud;
		}
	GetStuff()
</script>
 