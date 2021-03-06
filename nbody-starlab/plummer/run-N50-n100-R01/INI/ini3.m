#!/bin/bash
tail -n +4 "$0" | math -noprompt
exit $?

SetOptions["stdout", FormatType -> InputForm];
SetOptions["stderr", FormatType -> OutputForm];
SetOptions[$Output, FormatType -> OutputForm];

gitDir = Environment["MYGITDIR"];
If[gitDir===$Failed, "env var MYGITDIR doesn't exists"; Return[]];

AppendTo[$Path, gitDir];
Get["AstroTools`"];

NBTMPDIR = ToFileName[{$InitialDirectory,"results","nbody-tmp"}];
NBDIR = ToFileName[{$InitialDirectory,"results","nbody"}]; 
outputDir[file_] := ToFileName[{NBDIR, DirectoryName[file]}];

If[DirectoryQ[NBTMPDIR] === False, Print[Missing["InputDirectory"]]; Return[]];
If[DirectoryQ[NBDIR] === False, CreateDirectory[NBDIR]];

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
