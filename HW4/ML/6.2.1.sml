
(* ========================================================================== *)
(* Ex 6.2.1                                                                   *)
(* Chirag Sachdev                                                             *)
(*                                                                            *)
(* ========================================================================== *)
(*1*)
``P x ==> Q y``;
(*2*)
``P (x:num) ==> Q (y:bool)``;
(*3*)
``!x. !y. P x ==> Q y``;
(*4*)
``?x. R (x:num)``;
(*5*)
``~!x.(P x \/ Q x) = ?x.(~P x /\ ~Q x)``
(*6*)
(* All people are mortal*)
``!x. P x ==> M x``
(*7*)
(*Some people are funny*)
``!x. P x ==> ?x.Funny x``