(******************************************************************************)
(* Exercise 4.6.3                                                             *)
(* Author: Chirag Sachdev                                                     *)
(* Date: February 5, 2019                                                     *)
(******************************************************************************)

(* ========================================================================== *)
(*                                                                            *)
(* Your code for Filter here                                                  *)
(*                                                                            *)
(* ========================================================================== *)

fun less_than5 xlist=
let
val templist = []:int list
val helper = 1
fun lessthan x = (if(x<5)then (templist@[x]) else (templist@([]:in)))

in
(map lessthan xlist) 
end;

val testResults = Filter (fn x => x < 5) [1,2,3,4,5,6,7,8,9]