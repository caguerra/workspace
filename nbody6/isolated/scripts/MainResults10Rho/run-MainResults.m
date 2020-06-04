#!/usr/local/bin/MathematicaScript -script 

(*
  * Script to run example test.nb
  * To monitor evaluation of the notebook another Kernel should be used.
  * vnc server must be running:
  * > vncserver
*)

SetOptions[Developer`InstallFrontEnd, Developer`LaunchFlags -> "-display :2 -nogui -geometry 800x600+10+10 -default visual"];

SetOptions[$Output, FormatType -> StandardForm];

If[Length[$ScriptCommandLine] < 2,
	Print["No input notebook."];
	Quit[]
]

script`path = Directory[];
script`nbname = $ScriptCommandLine[[2]];
script`file = FileNameJoin[{script`path, script`nbname}];

script`stars = {1000} (* Union[{30,50,250}, Range[100,1000,100]] *);

Do[
	$RunNumber = script`i;
	Print["Evaluate notebook: ", $RunNumber];
        Print[MemoryInUse[]/1024./1024/1024];
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
