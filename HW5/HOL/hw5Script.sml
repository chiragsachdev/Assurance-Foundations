

(* ========================================================================== *)
(* Chirag Sachdev                                                             *)
(* 02/19/19                                                                   *)
(* ========================================================================== *)

structure hw5Script = struct

open HolKernel Parse boolLib bossLib;

val _ = new_theory "hw5";


(******************************************************************************)
(* 8.4.1                                                                      *)
(******************************************************************************)

val problem1Thm =
let
 val th1 = ASSUME ``p:bool``
 val th2 = ASSUME ``p ==> q``
 val th3 = ASSUME ``q ==> r``
 val th4 = MP th2 th1 (*Modus Ponens*)
 val th5 = MP th3 th4 (*Modus Ponens*)
 val t1  = hd(hyp th1)
 val t2  = hd(hyp th2)
 val t3  = hd(hyp th3)
 val th6 = DISCH t3 th4
 val th7 = DISCH t2 th6
in
 DISCH t3 th7
end

val _ = save_thm("problem1Thm",problem1Thm);



(******************************************************************************)
(*8.4.2                                                                       *)
(******************************************************************************)

val conjSymThm =
let
 val th1 = ASSUME ``p/\q``
 val th2 = ASSUME ``q/\p``
 val xp  = CONJUNCT1 th1
 val xq  = CONJUNCT2 th1
 val yp  = CONJUNCT2 th2
 val yq  = CONJUNCT1 th2
 val th3 = CONJ xq xp
 val th4 = CONJ yp yq
 val t1  = hd(hyp th1)
 val t2  = hd(hyp th2)
 val th5 = DISCH t1 th3
 val th6 = DISCH t2 th4
in
 IMP_ANTISYM_RULE th5 th6
end

val _ = save_thm("conSymThm",conjSymThm);



(******************************************************************************)
(*8.4.3                                                                       *)
(******************************************************************************)

val conjSymThmAll = GENL [``p:bool``,``q:bool``] conjSymThm;
val _ = save_thm("conSymThmAll",conjSymThmAll);

val _ = export_theory();

end (* structure *)


