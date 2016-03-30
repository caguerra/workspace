#!/bin/bash
tail -n +4 "$0" | math -noprompt
exit $?

(*
tail -n +4 "$0" | math -run "arg1=\"$1\"; arg2=\"$2\"; myDir = \"$(dirname $0)\"" -noprompt
exit $?
*)
AppendTo[$Echo, "stdout"];
SetOptions["stdout", FormatType -> InputForm];
SetOptions[$Output, FormatType -> OutputForm];
SetOptions["stderr", FormatType -> OutputForm];

astroDir = ToFileName[{$HomeDirectory,"ownCloud","code-test"}];
AppendTo[$Path, astroDir];
Get["AstroTools`"];

NBTMPDIR = ToFileName[{$InitialDirectory,"results","nbody-tmp"}];
NBDIR = ToFileName[{$InitialDirectory,"results","nbody"}]; 
outputDir[file_] := ToFileName[{NBDIR, StringReplace[FileBaseName[file], "ini" -> "run"]}];

SetDirectory[NBTMPDIR];
files = FileNames["*/*"];
ResetDirectory[];

Print["inputDir: ", NBTMPDIR];
Print["outputDir: ", FileNameDrop[outputDir["temp"],-1]];
Print["Creating files :", files];

StarlabSnapToNBody[#, 
	"InputDirectory" -> NBTMPDIR,
	"OutputDirectory" -> outputDir[#] ] & /@ files;

Print["All done!"];
Quit[];
