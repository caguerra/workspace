#!/usr/local/bin/wolframscript -script

SetOptions[Developer`InstallFrontEnd, Developer`LaunchFlags -> "-display :3 -nogui -geometry 800x600+10+10 -default visual"];

<< DataPacletTools`

(* No functions from FrontEnd *)
Print[FindStandardName["the green day"]]

(* Use FrontEnd functions  *)
UsingFrontEnd[CurationGrid[{{a -> b}, {c -> d}}, "FileName" -> "/home/usr2/cesarg/tmp/gridTest.nb"]]
