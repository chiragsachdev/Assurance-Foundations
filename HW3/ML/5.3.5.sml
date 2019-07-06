(******************************************************************************)
(* Exercise 4.6.3                                                             *)
(* Author: Chirag Sachdev                                                     *)
(* Date: February 5, 2019                                                     *)
(******************************************************************************)

(* ========================================================================== *)
(*                                                                            *)
(* Your code for addPairsGreaterThan here                                     *)
(*                                                                            *)
(* ========================================================================== *)

fun addpair (x,y)=x+y
fun Filter n xlist = filter(fn (x,y) => y>n andalso x>n ) xlist
fun addlist xlist = map addpair xlist
fun addPairsGreaterThan y xlist = (addlist (Filter y xlist)) 



addPairsGreaterThan 0 [(0,1),(2,0),(2,3),(4,5)];
