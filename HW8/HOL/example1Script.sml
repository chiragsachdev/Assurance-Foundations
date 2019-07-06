(***************************************************)
(* Engineering Assurance Lab: example1Script.sml   *)
(* Shiu-Kai Chin                                   *)
(* Date: 23 September 2013                         *)
(***************************************************)

(* Interactive mode: these are theories that are in the ACL  *)
(* subdirectory pointed to in the Holmakefile file. The file *)
(* acl_infRules contains the ML functions that are the       *)
(* inference rules in the access control logic.              *)

(* only necessary when working interactively
app load ["acl_infRules","aclrulesTheory","aclDrulesTheory","example1Theory"];
open acl_infRules aclrulesTheory aclDrulesTheory example1Theory
*)

(* The following structure is similar to the module command in Haskell *)
structure example1Script = struct

open HolKernel boolLib Parse bossLib (* used by Holmake, not in interactive  *)
open acl_infRules aclrulesTheory aclDrulesTheory (* used by Holmake and interactive mode *)

(***********
* create a new theory
***********)
val _ = new_theory "example1";

(* Example 1: Practice with ACL syntax in HOL *)
(************************************************************)
(* let's define a concrete example of a set of instructions *)
(************************************************************)
val _ =
Datatype
`commands = go | nogo | launch | abort`

(******************************************************)
(* Define some names of people who will be principals *)
(******************************************************)
val _ =
Datatype
`staff = Alice | Bob | Carol | Dan`

(* The simplest access-control logic formula is a proposition *)
val commandProp = ``(prop go):(commands,staff,'d,'e)Form``;

(* We can still use type variables for propositions *)
val xProposition = ``(prop x):('a,'c,'d,'e)Form``

(* We can be completely general *)
val x = ``x:('a,'c,'d,'e)Form``

(* Mapping type :staff to type :staff Princ *)
val princTerm = ``Name Alice``;
(* Principals make statements *)
val term1 = ``((Name Alice) says (prop go)):(commands,staff,'d,'e)Form``;

(* Principals have jurisdiction *)
val term2 = ``((Name Alice) controls (prop go)):(commands,staff,'d,'e)Form``;

(* Alice with Bob says <go> *)
val term3 = 
 ``((Name Alice) meet (Name Bob) says (prop launch)):(commands,staff,'d,'e)Form``;

(* Carol | Dan says <nogo> *)
val term4 =
 ``((Name Carol) quoting (Name Dan) says (prop nogo)):(commands,staff,'d,'e)Form``;

(* Dan => Carol *)
val term5 =
 ``((Name Dan) speaks_for (Name Carol)):(commands,staff,'d,'e)Form``;

(*******************)
(* Our first proof *)
(*******************)
(* Develop the proof line by line *)


val th1 = ACL_ASSUM``((Name Alice) says (prop go)):(commands,staff,'d,'e)Form``;
val th2 = ACL_ASSUM``((Name Alice) controls (prop go)):(commands,staff,'d,'e)Form``;
val th3 = CONTROLS th2 th1;
val th4 = DISCH(hd(hyp th2)) th3;
val th5 = DISCH(hd(hyp th1)) th4;


(* Package up the proof into a single function *)
val example1Theorem =
let
 val th1 = ACL_ASSUM``((Name Alice) says (prop go)):(commands,staff,'d,'e)Form``
 val th2 = ACL_ASSUM``((Name Alice) controls (prop go)):(commands,staff,'d,'e)Form``
 val th3 = CONTROLS th2 th1
 val th4 = DISCH(hd(hyp th2)) th3
in
 DISCH(hd(hyp th1)) th4
end;

(* We save the theorem by using save_thm *)
val _ = save_thm("example1Theorem",example1Theorem)



(******************************************************************************)
(* A goal-oriented proof                                                      *)
(******************************************************************************)

val example1TheoremA =
TAC_PROOF(([],
``((M :(commands, 'b, staff, 'd, 'e) Kripke),(Oi :'d po),(Os :'e po)) sat
   Name Alice says (prop go) ==>
  (M,Oi,Os) sat Name Alice controls (prop go) ==>
  (M,Oi,Os) sat (prop go)``),
PROVE_TAC[Controls])

val _ = save_thm("example1TheoremA",example1TheoremA)



(******************************************************************************)
(* A proof using ACL_CONTROLS_TAC                                             *)
(******************************************************************************)
val example1TheoremB =
TAC_PROOF(([],
``((M :(commands, 'b, staff, 'd, 'e) Kripke),(Oi :'d po),(Os :'e po)) sat
   Name Alice says (prop go) ==>
  (M,Oi,Os) sat Name Alice controls (prop go) ==>
  (M,Oi,Os) sat (prop go)``),
REPEAT STRIP_TAC THEN
ACL_CONTROLS_TAC ``Name Alice`` THEN
ASM_REWRITE_TAC[])

val _ = save_thm("example1TheoremB",example1TheoremB)

(* Example 2 *)
(* develop the proof line by line *)

 val th1 = ACL_ASSUM``((Name Alice) says (prop go)):(commands,staff,'d,'e)Form``;
 val th2 = ACL_ASSUM``((Name Alice) speaks_for (Name Bob)):(commands,staff,'d,'e)Form``;
 val th3 = ACL_ASSUM``((Name Bob) controls (prop go)):(commands,staff,'d,'e)Form``;
 val th4 = SPEAKS_FOR th2 th1;
 val th5 = CONTROLS th3 th4;
 val th6 = DISCH(hd(hyp th3)) th5;
 val th7 = DISCH(hd(hyp th2)) th6;
 val th8 = DISCH(hd(hyp th1)) th7;

(* Package up the proof into a single function *)
val example2Theorem =
let
 val th1 = ACL_ASSUM``((Name Alice) says (prop go)):(commands,staff,'d,'e)Form``
 val th2 = ACL_ASSUM``((Name Alice) speaks_for (Name Bob)):(commands,staff,'d,'e)Form``
 val th3 = ACL_ASSUM``((Name Bob) controls (prop go)):(commands,staff,'d,'e)Form``
 val th4 = SPEAKS_FOR th2 th1
 val th5 = CONTROLS th3 th4
 val th6 = DISCH(hd(hyp th3)) th5
 val th7 = DISCH(hd(hyp th2)) th6
in
 DISCH(hd(hyp th1)) th7
end;

(* We save the theorem by using save_thm *)
val _ = save_thm("example2Theorem",example2Theorem)

(******************************************************************************)
(* A goal-oriented proof                                                      *)
(******************************************************************************)
val example2TheoremA =
TAC_PROOF(([],
``((M :(commands, 'b, staff, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po)) sat
   Name Alice says (prop go) ==>
  (M,Oi,Os) sat (Name Alice speaks_for Name Bob) ==>
  (M,Oi,Os) sat Name Bob controls (prop go) ==>
  (M,Oi,Os) sat (prop go)``),
PROVE_TAC[Derived_Speaks_For, Controls])

val _ = save_thm("example2TheoremA",example2TheoremA)

(******************************************************************************)
(* A goal-oriented proof using tactics                                        *)
(******************************************************************************)
val example2TheoremB =
TAC_PROOF(([],
``((M :(commands, 'b, staff, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po)) sat
   Name Alice says (prop go) ==>
  (M,Oi,Os) sat (Name Alice speaks_for Name Bob) ==>
  (M,Oi,Os) sat Name Bob controls (prop go) ==>
  (M,Oi,Os) sat (prop go)``),
REPEAT STRIP_TAC THEN
ACL_CONTROLS_TAC ``Name Bob`` THEN
ASM_REWRITE_TAC[] THEN
PAT_ASSUM
``(M,Oi,Os) sat (Name Alice speaks_for Name Bob)``
(fn th1 =>
 (PAT_ASSUM
  ``(M,Oi,Os) sat (Name Alice says (prop go))``
  (fn th2 => ASSUME_TAC(SPEAKS_FOR th1 th2)))) THEN
ASM_REWRITE_TAC[])

val _ = save_thm("example2TheoremB",example2TheoremB)

(* Example 3 *)
(* develop the proof line by line *)
val th1 = ACL_ASSUM``((prop go) impf (prop launch)):(commands,staff,'d,'e)Form``;
val th2 = ACL_ASSUM``(prop go):(commands,staff,'d,'e)Form``;
val th3 = ACL_MP th2 th1;
val th4 = SAYS ``(Name Carol):staff Princ`` th3;
val th5 = DISCH(hd(hyp th2)) th4;
val th6 = DISCH(hd(hyp th1)) th5;

(* Package up the proof into a single function *)
val example3Theorem = 
let
 val th1 = ACL_ASSUM``((prop go) impf (prop launch)):(commands,staff,'d,'e)Form``
 val th2 = ACL_ASSUM``(prop go):(commands,staff,'d,'e)Form``
 val th3 = ACL_MP th2 th1
 val th4 = SAYS ``(Name Carol):staff Princ`` th3
 val th5 = DISCH(hd(hyp th2)) th4
in
 DISCH(hd(hyp th1)) th5
end;

(* We save the theorem by using save_thm *)
val _ = save_thm("example3Theorem",example3Theorem)



(******************************************************************************)
(* A goal-oriented proof                                                      *)
(******************************************************************************)
val example3TheoremA =
TAC_PROOF(([],concl example3Theorem),
PROVE_TAC[Modus_Ponens,Says])

val _ = save_thm("example3TheoremA",example3TheoremA)

(******************************************************************************)
(* Mono_Reps_Theorem                                                          *)
(******************************************************************************)
val Mono_Reps_Theorem =
TAC_PROOF(([],
``(M,Oi,Os) sat ((Q controls f):('a,'c,'d,'e)Form) ==>
  (M,Oi,Os) sat ((reps P Q f):('a,'c,'d,'e)Form) ==>
  (M,Oi,Os) sat ((P' quoting Q' says f):('a,'c,'d,'e)Form) ==>
  (M,Oi,Os) sat ((P' speaks_for P):('a,'c,'d,'e)Form) ==>
  (M,Oi,Os) sat ((Q' speaks_for Q):('a,'c,'d,'e)Form) ==>
  (M,Oi,Os) sat (f:('a,'c,'d,'e)Form)``),
PROVE_TAC[Controls,Reps,Mono_speaks_for,Derived_Speaks_For])

val _ = save_thm("Mono_Reps_Theorem",Mono_Reps_Theorem)

(* ==== start here ====

==== end here ==== *)

(*******************************)
(* Print and export the theory *)
(*******************************)
val _ = print_theory "-";

val _ = export_theory();

end (* structure *)
