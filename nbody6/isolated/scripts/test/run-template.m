#!/usr/bin/wolframscript -script

(*
  * Script to run example test.nb
  * To monitor evaluation of the notebook another Kernel should be used.
*)

SetOptions[Developer`InstallFrontEnd, Developer`LaunchFlags -> "-display :1 -nogui -geometry 800x600+10+10 -default visual"];
SetOptions[$Output, FormatType -> StandardForm];

If[Length[$ScriptCommandLine] < 2,
	Print["No input notebook."];
	Quit[]
]

script`path = Directory[];
script`nbname = $ScriptCommandLine[[2]];
script`file = FileNameJoin[{script`path, script`nbname}];

Do[
	$RunNumber = script`i;
	Print["Evaluate notebook: ", $RunNumber];
	UsingFrontEnd[
		( 
		script`nb = NotebookOpen[script`file];
		NotebookEvaluate[script`nb, InsertResults->True];
		NotebookSave[script`nb, FileNameJoin[{script`path, "Evaluated"<>ToString[$RunNumber]<>script`nbname}]];
		NotebookClose[script`nb];  
		) 
	];
    Clear["Global`*"];
    Unprotect[In, Out];
    Clear[In];
    Clear[Out];
	,
	{script`i, {100, 200} }
];	

Print[$Version]
Print["Evaluation done!"];
