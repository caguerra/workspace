#!/usr/local/bin/wolframscript -print all

(* #!/usr/bin/env wolframscript *)

(* AppendTo[$Echo, "stdout"]; *)
SetOptions["stdout",FormatType->InputForm];

Echo[Directory[], "Directory: "];

cl2 = $ScriptCommandLine[[2]]

Print["Hello world: ", cl2]


