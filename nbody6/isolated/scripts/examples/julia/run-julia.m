#!/usr/bin/wolframscript -script

SetOptions[Developer`InstallFrontEnd, Developer`LaunchFlags -> "-display :1 -nogui -geometry 800x600+10+10 -default visual"];

SetOptions[$Output, FormatType -> StandardForm]

Print["Evaluate notebook ..."];
UsingFrontEnd[ 
   (
       nb = NotebookOpen["/home/cesarg/git/workspace/nbody6/isolated/scripts/examples/julia/julia.nb"];
       NotebookEvaluate[nb, InsertResults->True];
       (* NotebookSave[nb] *) (* save to the same file *)
       NotebookSave[nb, "/home/cesarg/git/workspace/nbody6/isolated/scripts/examples/julia/julia-evaluated.nb"];
       NotebookClose[nb];
   ) 
] 

Print["Evaluation done!"];

