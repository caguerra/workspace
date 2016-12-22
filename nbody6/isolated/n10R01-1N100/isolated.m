#!/bin/bash
tail -n +4 "$0" | math -noprompt
exit $?

SetOptions["stdout", FormatType -> InputForm];
SetOptions["stderr", FormatType -> OutputForm];
SetOptions[$Output, FormatType -> OutputForm];

(* Code to process simulations with variable number of stars *)
(* Load AstroTools *)
$MYGITDIR = "~/git/";
AppendTo[$Path, $MYGITDIR];
Get["AstroTools`nbody6`"];

(* Set working directory *)
SetDirectory["~/git/workspace/nbody6/isolated/n10R01-1N100/results"];
virialRadiusIndex=Range[8,20];
virialRadius = virialRadiusIndex/20.;

VRDirs = "VR-" <> ToString[#] & /@ virialRadiusIndex;

len = Length[VRDirs];

energyFromPairs = 
Compile[{{mass,_Real,1},{pos,_Real,2},{vel,_Real,2}},
	Block[{nmax, distance,squaredSpeed,massProduct,list,energy,BIG,aaxis},
		nmax = Length@mass;
		BIG=10.^6;
		squaredSpeed=Table[0.,{i,1,nmax},{j,1,nmax}];
		distance=Table[0.,{i,1,nmax},{j,1,nmax}];
		energy=Table[0.,{i,1,nmax},{j,1,nmax}];
		aaxis=Table[0.,{i,1,nmax},{j,1,nmax}];
		Do[
			If[i!=j,
				distance[[i,j]]=(\[Sqrt]((pos[[i,1]]-pos[[j,1]])^2+(pos[[i,2]]-pos[[j,2]])^2+(pos[[i,3]]-pos[[j,3]])^2));
				squaredSpeed[[i,j]]= ((vel[[i,1]]-vel[[j,1]])^2+(vel[[i,2]]-vel[[j,2]])^2+(vel[[i,3]]-vel[[j,3]])^2);
				massProduct = mass[[i]]mass[[j]];
				energy[[i,j]] = massProduct(0.5/(mass[[i]]+mass[[j]]) squaredSpeed[[i,j]]-1./distance[[i,j]]);
				aaxis[[i,j]] = massProduct/(2 Abs[energy[[i,j]]]);
			];
			,
			{i,1,nmax},{j,1,nmax}
		];
		{energy, distance, squaredSpeed, aaxis}
	],
	CompilationTarget->"C"
];


(* Code to calculate them at specific time *)
giveMeBinaries[mass_,position_,velocity_]:=
	Module[{pairs, binaries,energy,distance,squaredSpeed,aaxis},
		{energy,distance,squaredSpeed,aaxis}=energyFromPairs[mass,position,velocity];
		pairs=
			Table[
				Flatten[{i,Position[energy[[i]],Min[energy[[i]]]]}],
			{i,1,Length[mass]}];
		binaries=
			Select[Gather[pairs,#1==Reverse[#2]&],
				Length[#]==2&][[All,All,1]];
		{binaries,Extract[energy,binaries],Extract[distance,binaries],
			Extract[squaredSpeed,binaries], Extract[aaxis,binaries]}
	];
	

Do[
	SetDirectory[VRDirs[[i]]];
	Print["Directory: ", VRDirs[[i]]];
	goodFiles = FileNameJoin[First[#]]& /@ 
		GatherBy[StringSplit[Import["goodRuns.log"][[All,2]], "/"], #[[-2]]&];
	Print["Number of good files: ", Length[goodFiles]];
	Off[ReadList::readn];
	data = ReadOutput /@ goodFiles;
	Print["Time steps :", Union[Length /@ data]];
	
	(*  compute mean rhalf and rcore, discard failures *)
	meanRhalf =  Mean /@ DeleteCases[Transpose[data[[All,All,1]]], $Failed, {2}];
	Export["meanRhalf.m", meanRhalf];
	
	meanRcore = Mean /@ DeleteCases[Transpose[data[[All,All,4]]], $Failed, {2}];
	Export["meanRcore.m", meanRcore]; 
	
	(* Compute binaries using my algorithm *)
	dirs = DirectoryName /@ goodFiles;
	
	(* particles[prop, sim, time ] *)
	particles =
		Reap[
			Do[
				SetDirectory[dirs[[i]]];
				{vars, as, bodys, xs, vs, name} = Flatten[ReadOUT3["OUT3"],1];
				xs = Partition[#,3]& /@ xs;
				vs = Partition[#,3]& /@ vs;
				Sow[bodys,"mass"];
				Sow[xs,"pos"];
				Sow[vs,"vel"];
				ResetDirectory[]
				,
				{i, 1, Length[dirs]}
			]
		][[-1]];
	
	Export["particles.m", particles];	
	Print["Particles dimensions {3, #files}: ", Dimensions @ particles];
	times = Length /@ particles[[2]];
	Print["End times of runs: ", Union[times]];
	minTime = Min[times];
	timeList = With[{t=Sort[{20,50,80,110,150,minTime}]},Take[t,Prepend[Flatten[Position[t,minTime]],1]]];

	(* Binaries at the end *)
	(* giveMeBinaries[mass, position, velocity] at particular time with particular run *)
	finallyBinaries = 
		Table[
			giveMeBinaries[
				particles[[1, sim, j]],
				particles[[2, sim, j]],
				particles[[3, sim, j]]
			],
			{sim, 1, Length[dirs]}, {j, timeList}
		];
		
	Export["finallyBinaries.m", finallyBinaries];
	ResetDirectory[];
	,
	{i, len}
];

Print@"all done!"
	
