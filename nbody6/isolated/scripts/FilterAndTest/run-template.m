#!/usr/local/bin/MathematicaScript -script 

(*
  * Script to run example test.nb
  * To monitor evaluation of the notebook another Kernel should be used.
*)

SetOptions[Developer`InstallFrontEnd, Developer`LaunchFlags -> "-display :3 -nogui -geometry 800x600+10+10 -default visual"];

SetOptions[$Output, FormatType -> StandardForm];

If[Length[$ScriptCommandLine] < 2,
	Print["No input notebook."];
	Quit[]
]

script`path = Directory[];
script`nbname = $ScriptCommandLine[[2]];
script`file = FileNameJoin[{script`path, script`nbname}];

script`stars = {30};

Do[
	$RunNumber = script`i;
	Print["Evaluate notebook: ", $RunNumber];
	UsingFrontEnd[
		( 
		script`nb = NotebookOpen[script`file];
		NotebookEvaluate[script`nb, InsertResults->True];
		NotebookSave[script`nb, FileNameJoin[{script`path, "results", "Evaluated"<>ToString[$RunNumber]<>script`nbname}]];
		NotebookClose[script`nb];  
		) 
	]
	,
	{script`i, script`stars }
];	

Print["Evaluation done!"];
