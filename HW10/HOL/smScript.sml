(*******************************)
(* State machine theory        *)
(* Author: Shiu-Kai Chin       *)
(* Date: 01 January 2014,      *)
(* Modified 06 August 2015     *)
(*******************************)

structure smScript = struct

(* ==== Interactive mode ====
app load ["TypeBase","listTheory","smTheory"];
open TypeBase listTheory smTheory
 ==== end interactive mode ==== *)

open HolKernel boolLib Parse bossLib
open TypeBase listTheory
(***********************)
(* create a new theory *)
(***********************)
val _ = new_theory "sm";

(******************************************************************************)
(* State-based transition relation                                            *)
(*                                                                            *)
(*                                                                            *)
(******************************************************************************)
val (Trans_rules, Trans_ind, Trans_cases) =
Hol_reln
`!NS (s:'state) (x:'input).
  Trans x s ((NS:'state -> 'input -> 'state) s x)`

(*************************)
(* Define configurations *)
(*************************)
val _ =
Datatype
`configuration = CFG ('input list) 'state ('output list)`

(*******************************************************************************)
(* Note: configuration_11, configuration_induction, and configuration_nchotomy *)
(* are proved and available when fsmTheory is loaded and opened                *)
(*******************************************************************************)
val configuration_11 = one_one_of``:('input,'state,'output)configuration``
val configuration_one_one = one_one_of``:('input,'state,'output)configuration``

val _ = save_thm("configuration_11",configuration_11)
val _ = save_thm("configuration_one_one",configuration_one_one)

(***************************************************)
(* Define transition relation among configurations *)
(* This definition is parameterized in terms of    *)
(* next state transition and output relations      *)
(***************************************************)
val (TR_rules, TR_ind, TR_cases) =
Hol_reln
`!NS Out (s:'state) (x:'input) (ins:'input list) (outs:'output list).
  TR x (CFG (x::ins) s outs)(CFG ins (NS s x) ((Out s x)::outs))`

val lemma1 = 
ISPECL [``x:'input``,``CFG (x1s:'input list) (s1:'state) (out1s:'output list)``,
        ``CFG (x2s:'input list) (s2:'state) (out2s:'output list)``] TR_cases

val lemma2 =
TAC_PROOF(
([],
``!x x1s s1 out1s x2s out2s s2.
  TR (x:'input) (CFG (x1s:'input list) (s1:'state) (out1s:'output list)) (CFG (x2s:'input list) (s2:'state) (out2s:'output list)) <=>
  ?NS Out ins.(x1s = x::ins) /\ (x2s = ins) /\ (s2 = NS s1 x) /\ (out2s = (Out s1 x)::out1s)``),
REWRITE_TAC[lemma1,configuration_11,list_11] THEN
REPEAT GEN_TAC THEN
EQ_TAC THEN
REPEAT STRIP_TAC THEN
EXISTS_TAC ``NS:'state -> 'input -> 'state`` THEN
EXISTS_TAC ``Out:'state -> 'input -> 'output`` THEN
ASM_REWRITE_TAC[] THENL
[(EXISTS_TAC``ins:'input list`` THEN PROVE_TAC []), 
 ALL_TAC] THEN
EXISTS_TAC``s1:'state`` THEN
EXISTS_TAC``ins:'input list`` THEN
EXISTS_TAC``out1s:'output list`` THEN
REWRITE_TAC[])

val lemma3 = 
ISPECL [``x:'input``,``CFG (x1s:'input list) (s1:'state) (out1s:'output list)``,
        ``CFG 
          (x2s:'input list) 
          ((NS:'state -> 'input -> 'state) s1 x) 
          ((Out:'state -> 'input -> 'output) s1 x::out2s)``] TR_cases

val lemma4 =
TAC_PROOF(([],
``!(NS:'state -> 'input -> 'state)(Out:'state -> 'input -> 'output)(x:'input)(x1s:'input list)(s1:'state)out1s x2s out2s.
  TR (x:'input) (CFG (x1s:'input list) (s1:'state) (out1s:'output list)) (CFG (x2s:'input list) (NS s1 x) (Out s1 x::out2s)) <=>
  ?ins.(x1s = x::ins) /\ (x2s = ins) /\ (out2s = out1s)``),
REWRITE_TAC[lemma3,configuration_11,list_11] THEN
REPEAT GEN_TAC THEN
EQ_TAC THEN
REPEAT STRIP_TAC THENL
[(EXISTS_TAC``ins:'input list`` THEN
  ASM_REWRITE_TAC[]),
 (EXISTS_TAC ``NS:'state -> 'input -> 'state`` THEN
  EXISTS_TAC ``Out:'state -> 'input -> 'output`` THEN
  EXISTS_TAC ``s1:'state`` THEN
  EXISTS_TAC ``ins:'input list`` THEN
  EXISTS_TAC ``out1s:'output list`` THEN
  ASM_REWRITE_TAC[])])

val TR_clauses = CONJ lemma2 lemma4
val _ = save_thm("TR_clauses",TR_clauses)


(**********************************)
(* Proof that TR is deterministic *)
(**********************************)

val lemma1 = 
TAC_PROOF(([],
``!(NS:'state -> 'input -> 'state)(Out:'state -> 'input -> 'output).
   (TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2 (NS s1 x1) ((Out s1 x1)::outs2))) ==> 
   (TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2'(NS s1 x1) ((Out s1 x1)::outs2'))) ==>
   (ins2 = ins2') /\ (outs2 = outs2')``),
REWRITE_TAC[TR_clauses] THEN
REPEAT STRIP_TAC THEN
ASM_REWRITE_TAC [] THEN
IMP_RES_TAC list_11 THEN
PROVE_TAC[])

val lemma2 = 
TAC_PROOF(([],
``!(NS:'state -> 'input -> 'state)(Out:'state -> 'input -> 'output).
   (TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2 (NS s1 x1) ((Out s1 x1)::outs2))) ==> 
   (TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2'(NS s1 x1) ((Out s1 x1)::outs2'))) ==>
   ((CFG ins2 (NS s1 x1) ((Out s1 x1)::outs2)) = (CFG ins2'(NS s1 x1) ((Out s1 x1)::outs2')))``),
REWRITE_TAC[configuration_11,list_11] THEN
REPEAT STRIP_TAC THEN
IMP_RES_TAC lemma1)

val lemma3 =
TAC_PROOF(([],
``!(NS:'state -> 'input -> 'state)(Out:'state -> 'input -> 'output).
   ((CFG ins2 (NS s1 x1) ((Out s1 x1)::outs2)) = (CFG ins2'(NS s1 x1) ((Out s1 x1)::outs2'))) /\ 
   (TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2 (NS s1 x1) ((Out s1 x1)::outs2))) ==>
   ((TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2 (NS s1 x1) ((Out s1 x1)::outs2))) /\
    (TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2'(NS s1 x1) ((Out s1 x1)::outs2'))))``),
PROVE_TAC[])

val TR_deterministic =
TAC_PROOF(([],
``!(NS:'state -> 'input -> 'state)(Out:'state -> 'input -> 'output) x1 ins1 s1 outs1 ins2 ins2' outs2 outs2'.
   ((TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2 (NS s1 x1) ((Out s1 x1)::outs2))) /\
    (TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2'(NS s1 x1) ((Out s1 x1)::outs2')))) =
   (((CFG ins2 (NS s1 x1) ((Out s1 x1)::outs2)) = (CFG ins2'(NS s1 x1) ((Out s1 x1)::outs2'))) /\ 
    (TR x1 (CFG (x1::ins1) s1 outs1)(CFG ins2 (NS s1 x1) ((Out s1 x1)::outs2))))``),
PROVE_TAC[lemma2, lemma3])

val _ = save_thm("TR_deterministic",TR_deterministic)

(*****************************************)
(* Proof that TR is completely specified *)
(* if NS and Out are total functions.    *)
(*****************************************)
val TR_complete = 
TAC_PROOF(([],
``!(s:'state)(x:'input)(ins:'input list)(outs:'output list).?(s':'state)(out:'output).
     (TR (x:'input) (CFG (x::ins) (s:'state) (outs:'output list))(CFG ins (s':'state) (out::outs)))``),
REPEAT STRIP_TAC THEN
REWRITE_TAC[TR_cases] THEN
EXISTS_TAC``(NS:'state -> 'input -> 'state) s x`` THEN
EXISTS_TAC``(Out:'state -> 'input -> 'output) s x`` THEN
EXISTS_TAC``(NS:'state -> 'input -> 'state)`` THEN
EXISTS_TAC``(Out:'state -> 'input -> 'output)`` THEN
EXISTS_TAC``s:'state`` THEN
EXISTS_TAC``ins:'input list`` THEN
EXISTS_TAC``outs:'output list`` THEN
REWRITE_TAC[])

val _ = save_thm("TR_complete",TR_complete)

(******************************************************************************)
(* Show trans and TR are equivalent                                           *)
(*                                                                            *)
(*                                                                            *)
(******************************************************************************)
val Trans_TR_lemma =
TAC_PROOF(([],``(Trans (x:'input) (s:'state) (NS s x)) ==>
(TR x (CFG (x::ins) s (outs:'output list))(CFG ins (NS s x) ((Out s x)::outs)))``),
STRIP_TAC THEN
PROVE_TAC[TR_rules])

val _ = save_thm("Trans_TR_lemma",Trans_TR_lemma)

val TR_Trans_lemma =
TAC_PROOF(([],``(TR (x:'input) (CFG (x::ins) (s:'state)(outs:'output list))(CFG ins (NS s x)((Out s x)::outs))) ==>
      (Trans (x:'input) (s:'state) (NS s x))``),
STRIP_TAC THEN
IMP_RES_TAC TR_cases THEN
PAT_ASSUM
``CFG (x::ins) s outs = CFG (x::ins') s' outs'``
(fn th => ASSUME_TAC(REWRITE_RULE[configuration_11,list_11]th)) THEN
PROVE_TAC[Trans_rules])

val _ = save_thm("TR_Trans_lemma",TR_Trans_lemma)

val Trans_Equiv_TR =
TAC_PROOF(([],``(TR (x:'input) (CFG (x::ins) (s:'state)(outs:'output list))(CFG ins (NS s x)((Out s x)::outs))) =
      (Trans (x:'input) (s:'state) (NS s x))``),
PROVE_TAC[TR_Trans_lemma,Trans_TR_lemma])

val _ = save_thm("Trans_Equiv_TR",Trans_Equiv_TR)

(* ==== start here ====
 ==== end here ==== *)

val _ = export_theory ();
val _ = print_theory "-";

end (* structure *)