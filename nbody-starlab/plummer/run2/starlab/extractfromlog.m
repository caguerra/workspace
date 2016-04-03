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

logFiles = FileNames["./results/*/log.dat"];

rhalf = ReadStarlabLogs[#, "rhalf ="~~x__ :> x]& /@ logFiles;
Export["./results/post/rhalf.dat", rhalf];

Print@"all done!"


