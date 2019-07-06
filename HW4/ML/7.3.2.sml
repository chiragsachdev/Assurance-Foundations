(* ========================================================================== *)
(* Ex 7.3.2                                                                   *)
(* Chirag Sachdev                                                             *)
(*                                                                            *)
(* ========================================================================== *)

fun andImp2Imp term = ``p==>q==>r``;

fun impImpAnd term = ``p/\q==>r``;

val v1 = andImp2Imp ``p/\q==>r``;
val v2 = impImpAnd v1;
val v3 = andImp2Imp v2;
