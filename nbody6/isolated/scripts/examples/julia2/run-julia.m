#!/usr/local/bin/MathematicaScript -script 

SetOptions[Developer`InstallFrontEnd, Developer`LaunchFlags -> "-display :8 -nogui -geometry 800x600+10+10 -default visual"];

SetOptions[$Output, FormatType -> StandardForm]

(* waits for kernel evaluations to finish in the notebook *)
NotebookPauseForEvaluation[nb_] := While[ NotebookEvaluatingQ[nb], Pause[.25] ]

(* checks if any cell in the notebook is still under evaluation  *)
NotebookEvaluatingQ[nb_]:=
    (SelectionMove[nb,All,Notebook];
     Or @@ Map[ "Evaluating" /. #&, Developer`CellInformation[nb]])

AddTestEvaluator::exists = "Evaluator `1` is already defined, but has a definition that is `2` and not the expected `3`.";

AddTestEvaluator[evaluator_String] := Module[
 {evaluatornames, testevaluator},
 evaluatornames = EvaluatorNames /. Options[$FrontEnd, EvaluatorNames];
 testevaluator = evaluator -> {"AutoStartOnLaunch" -> False};
 Which[
  MemberQ[evaluatornames, evaluator -> {"AutoStartOnLaunch" -> False}],
  Null,
  MemberQ[evaluatornames, evaluator -> _],
  Message[AddTestEvaluator::exists,
  evaluator,
  evaluator /. (EvaluatorNames /. Options[$FrontEnd, EvaluatorNames]),
  {"AutoStartOnLaunch" -> False}
 ],
 True,
 AppendTo[evaluatornames, testevaluator];
 SetOptions[$FrontEnd, EvaluatorNames -> evaluatornames]
 ]
]


Print["Evaluate notebook ..."];

(*
Print["Loading JLINK ..."]
Needs["JLink`"];


Print["Define FrontEnd ..."]
$FrontEndLaunchCommand = "/usr/local/Wolfram/Mathematica/11.1/Executables/Mathematica";
*)

Print["Evaluate notebook ..."];
file  = "/home/usr2/cesarg/tmp/scripts/julia2/julia.nb";
file2 = "/home/usr2/cesarg/tmp/scripts/julia2/julia-evaluated.nb";

UsingFrontEnd[ 
    AddTestEvaluator["RunNotebook"];
    nb = NotebookOpen[file];
    SetOptions[nb, Evaluator->"RunNotebook"];
    SelectionMove[nb, All, Notebook];
    SelectionEvaluate[nb];
    NotebookPauseForEvaluation[nb];
    NotebookSave[nb, file2];
];

Print["Evaluation done!"];


