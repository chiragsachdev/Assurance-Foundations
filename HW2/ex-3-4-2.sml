(************************************************************************)
(* Exercise 4.4.2							*)
(* Author: Chirag Sachdev						*)
(* Date: 01/29/2019							*)
(************************************************************************)

val (x1,x2,x3) = (1,true,"Alice");
val pair1 = (x1,x3);
val list1 = [0,x1,2];


(* -------------------------------------------------------------------------- *)
(* HOL lists have to be values of the same data type,                         *)
(* list2 cannot have a boolean and an integer type                            *)
(* Hence HOL gives an error saying it cannot unify the                        *) 
(* constructors with different data types                                     *)
(* -------------------------------------------------------------------------- *)

val list2 = [x2,x1];

(* -------------------------------------------------------------------------- *)
(* HOL lists have to be values of the same data type,                         *)
(* list3 cannot have an integer and a string type                             *)
(* Hence HOL gives an error saying it cannot unify the                        *) 
(* constructors with different data types                                     *)
(* x3 is of String data type and 1 is an integer			      *)
(* -------------------------------------------------------------------------- *)

val list3 = (1 :: [x3]);