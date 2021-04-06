#!/usr/bin/wolframscript -script

(* 
  - Without script option, graphics are not displayed
  - In M11, this used to work:
    #!/usr/local/bin/MathematicaScript -script 
*)

(*
  - Script to run example test.nb
  - To monitor evaluation of the notebook another Kernel should be used.
*)

SetOptions[Developer`InstallFrontEnd, Developer`LaunchFlags -> "-display :1 -nogui -geometry 800x600+10+10 -default visual"];

SetOptions[$Output, FormatType -> StandardForm];

If[Length[$ScriptCommandLine] < 2,
	Print["No input notebook."];
	Quit[]
]

script`date = DateString[{"Year", "Month", "Day"}];
script`path = Directory[];
script`nbname = $ScriptCommandLine[[2]];
script`file = FileNameJoin[{script`path, script`nbname}];

script`stars = {300};

CreateDirectory[FileNameJoin[{script`path, "results-"<>script`date}]];

Print["Begin evaluation ..."];
Print[DateString[]];

Do[
	$RunNumber = script`i;
	Print["Evaluate notebook: ", $RunNumber];
	UsingFrontEnd[
		( 
		script`nb = NotebookOpen[script`file];
		NotebookEvaluate[script`nb, InsertResults->True];
		NotebookSave[script`nb, FileNameJoin[{script`path, "results-"<>script`date, "Evaluated"<>ToString[$RunNumber]<>script`nbname}]];
		NotebookClose[script`nb];  
		) 
	];
    Clear["Global`*"];
    Unprotect[In, Out];
    Clear[In];
    Clear[Out];
	,
	{script`i, script`stars }
];	

Print["Evaluation done!"];
Print[DateString[]];
