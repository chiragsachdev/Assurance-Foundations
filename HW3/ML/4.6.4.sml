(******************************************************************************)
(* Exercise 4.6.3                                                             *)
(* Author: Chirag Sachdev                                                     *)
(* Date: February 5, 2019                                                     *)
(******************************************************************************)

(* ========================================================================== *)
(*                                                                            *)
(* Your code for listSquares here                                             *)
(*                                                                            *)
(* ========================================================================== *)

fun listSquares xlist=
let
fun square x =x*x
(*fun outList [] = []  | outList (y::ys) = (square y)::(outList ys) *)
in
(map square xlist)
end;
val testList = [1,2,3,4,5]

val testResults = listSquares testList