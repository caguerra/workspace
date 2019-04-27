#!/usr/local/bin/MathematicaScript -script 

(*
  * Script to run example test.nb
  * Variables in this script and the input nb share the Kernel
  * To monitor evaluation of the notebook another Kernel should be used.
*)

SetOptions[Developer`InstallFrontEnd, Developer`LaunchFlags -> "-display :1 -nogui -geometry 800x600+10+10 -default visual"];

SetOptions[$Output, FormatType -> StandardForm]

If[Length[$ScriptCommandLine] < 2,
	Print["No input notebook."];
	Quit[]
]

script`path = $InitialDirectory;
script`nbname = $ScriptCommandLine[[2]];
script`file = FileNameJoin[{script`path, script`nbname}]

Do[
	$RunNumber = script`i;
	Print["Evaluate notebook: ", $RunNumber];
	UsingFrontEnd[ 
		script`nb = NotebookOpen[script`file];
		NotebookEvaluate[script`nb, InsertResults->True];
		NotebookSave[script`nb, FileNameJoin[{script`path, "results", "Evaluated"<>ToString[$RunNumber]<>script`nbname}]];
		NotebookClose[script`nb];   
	]
	,
	{script`i, {100, 200} }
]	

Print["Evaluation done!"];
