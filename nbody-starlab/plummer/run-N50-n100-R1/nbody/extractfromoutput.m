#!/bin/bash
tail -n +4 "$0" | math -noprompt
exit $?

SetOptions["stdout", FormatType -> InputForm];
SetOptions["stderr", FormatType -> OutputForm];
SetOptions[$Output, FormatType -> OutputForm];

gitDir = Environment["MYGITDIR"];
If[gitDir===$Failed, "env var MYGITDIR doesn't exists"; Return[]];

postDir = ToFileName[{Directory[], "results", "post"}];  
If[DirectoryQ[postDir]===False, CreateDirectory[postDir]];

AppendTo[$Path, gitDir];
Get["AstroTools`"];


strings = Import["end.log"][[All,2]];
strings = Rest /@ StringSplit[strings, "/"];
outputFiles = FileNameJoin[First[#]] & /@ GatherBy[strings, #[[-2]]& ];

data = ReadOutput /@ outputFiles;

Export["./results/post/time.dat", data[[All,All,20]] ];
Export["./results/post/rhalf.dat", data[[All,All,1]] ];
Export["./results/post/rcore.dat", data[[All,All,4]] ];

Print@"al ldone!"

