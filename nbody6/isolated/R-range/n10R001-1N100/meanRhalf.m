(* Created by Wolfram Mathematica 9.0 : www.wolfram.com *)
Transpose[Mean[GatherBy[StringCases[$Failed, 
     $Failed :> StringToNumbers[AstroTools`nbody6`Private`x]], 
    StringCases[$Failed, $Failed :> StringToNumbers[
       AstroTools`nbody6`Private`x]]][[All,All,1]]]]
