
(******************************************************************************)
(* Chirag Sachdev                                                             *)
(* Exercise: 13.10.1, 13.10.2                                                 *)
(******************************************************************************)

structure solutions1Script = struct
open HolKernel Parse boolLib bossLib
open acl_infRules aclrulesTheory aclDrulesTheory example1Theory
val _ = new_theory "solutions1";

(*Ex. 1*)

val aclExercise1 =
let
 val th1 = ACL_ASSUM``((Name Alice) says (prop go)):(commands,staff,'d,'e)Form``
 val th2 = ACL_ASSUM``((Name Bob) says (prop go)):(commands,staff,'d,'e)Form``
 val th3 = ACL_CONJ th1 th2
 val th4 = AND_SAYS_RL th3
 val th5 = DISCH(hd(hyp th2)) th4
in
 DISCH(hd(hyp th1)) th5
end;
val _ = save_thm("aclExercise1",aclExercise1)


val aclExercise1A =
TAC_PROOF(([],
``((M :(commands, 'b, staff, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po)) sat
   Name Alice says (prop go) ==>
  (M,Oi,Os) sat Name Bob says (prop go) ==>
  (M,Oi,Os) sat (Name Alice) meet (Name Bob) says (prop go)``),
PROVE_TAC[Conjunction, And_Says_Eq])
val _ = save_thm("aclExercise1A",aclExercise1A)


val aclExercise1B = 
TAC_PROOF(([],
``((M :(commands, 'b, staff, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po)) sat
   Name Alice says (prop go) ==>
  (M,Oi,Os) sat Name Bob says (prop go) ==>
  (M,Oi,Os) sat (Name Alice) meet (Name Bob) says (prop go)``),
REPEAT STRIP_TAC THEN
ACL_AND_SAYS_RL_TAC THEN
ACL_CONJ_TAC THEN
PROVE_TAC[])
val _ = save_thm("aclExercise1B",aclExercise1B)

(*Ex. 2*)

val aclExercise2 =
let
 val th1 = ACL_ASSUM``((Name Alice) says (prop go)):(commands,staff,'d,'e)Form``
 val th2 = ACL_ASSUM``((Name Alice) controls (prop go)):(commands,staff,'d,'e)Form``
 val th3 = ACL_ASSUM``((prop go) impf (prop launch)):(commands,staff,'d,'e)Form``
 val th4 = CONTROLS th2 th1
 val th5 = ACL_MP th4 th3
 val th6 = SAYS ``(Name Bob):staff Princ`` th5
 val th7 = DISCH(hd(hyp th3)) th6
 val th8 = DISCH(hd(hyp th2)) th7
in
 DISCH(hd(hyp th1)) th8
end;
val _ = save_thm("aclExercise2",aclExercise2)


val aclExercise2A =
TAC_PROOF(([],
``((M :(commands, 'b, staff, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po)) sat
   Name Alice says (prop go) ==>
  (M,Oi,Os) sat Name Alice controls (prop go) ==>
  (M,Oi,Os) sat (prop go) impf (prop launch) ==>
  (M,Oi,Os) sat Name Bob says (prop launch)``),
PROVE_TAC[Controls, Modus_Ponens, Says]);
val _ = save_thm("aclExercise2A",aclExercise2A)


val aclExercise2B =
TAC_PROOF(([],
``((M :(commands, 'b, staff, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po)) sat
   Name Alice says (prop go) ==>
  (M,Oi,Os) sat Name Alice controls (prop go) ==>
  (M,Oi,Os) sat (prop go) impf (prop launch) ==>
  (M,Oi,Os) sat Name Bob says (prop launch)``),
REPEAT STRIP_TAC THEN
ACL_SAYS_TAC THEN
PAT_ASSUM
``(M,Oi,Os) sat Name Alice says (prop go)``
(fn th1 =>
(PAT_ASSUM
``(M,Oi,Os) sat Name Alice controls (prop go)``
(fn th2 => ASSUME_TAC(CONTROLS th2 th1)))) THEN
PAT_ASSUM
``(M,Oi,Os) sat (prop go)``
(fn th1 =>
(PAT_ASSUM
``(M,Oi,Os) sat (prop go) impf (prop launch)``
(fn th2 => PROVE_TAC[(ACL_MP th1 th2)]))))
val _ = save_thm("aclExercise2B",aclExercise2B)


val _ = export_theory();

val _ = print_theory "-";

end (* structure *)