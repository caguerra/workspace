(* ::Package:: *)

(* ::Input:: *)
(*strings=Import["C:\\cygwin64\\home\\cesar\\git\\workspace\\nbody-starlab\\plummer\\run2\\nbody\\end.log"][[All,2]]*)


(* ::Input:: *)
(*nums=StringReplace[strings,__~~"run-"~~n:NumberString~~__:>n]*)


(* ::Input:: *)
(*ToExpression/@nums//Sort//Length*)


(* ::Input:: *)
(*ToExpression/@nums//Sort//DeleteDuplicates//Length*)
