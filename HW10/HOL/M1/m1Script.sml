(******************************************************************************)
(* Chirag Sachdev                                                             *)
(* Ex. 16.3.1                                                                 *)
(******************************************************************************)

structure m1Script = struct

open HolKernel Parse boolLib bossLib;
open TypeBase smTheory sminfRules

val _ = new_theory "m1";

val _ = Datatype`command = i0 | i1`
val command_distinct_clauses = distinct_of``:command``
val _ = save_thm("command_distinct_clauses",command_distinct_clauses)

val _ = Datatype`state = S0 | S1 | S2`
val state_distinct_clauses = distinct_of``:state``
val _ = save_thm("state_distinct_clauses",state_distinct_clauses)

val _ = Datatype`output = o0 | o1`
val output_distinct_clauses = distinct_of``:output``
val _ = save_thm("output_distinct_clauses",output_distinct_clauses)

val M1ns_def =
    Define`(M1ns S0 i0 = S1) /\ (M1ns S0 i1 = S2) /\
       (M1ns S1 i0 = S0) /\ (M1ns S1 i1 = S0) /\
       (M1ns S2 i0 = S2) /\ (M1ns S2 i1 = S2)`;


val M1out_def =
    Define`(M1out S0 i0 = o0) /\ (M1out S0 i1 = o1) /\
       (M1out S1 i0 = o0) /\ (M1out S1 i1 = o0) /\
       (M1out S2 i0 = o1) /\ (M1out S2 i1 = o1)`;
       
val m1TR_rules = SPEC_TR ``M1ns`` ``M1out``
val _ = save_thm("m1TR_rules",m1TR_rules)

val m1TR_clauses = SPEC_TR_clauses ``M1ns`` ``M1out``
val _ = save_thm("m1TR_clauses",m1TR_clauses)

val m1Trans_Equiv_TR = SPEC_Trans_Equiv_TR ``M1ns`` ``M1out``
val _ = save_thm("m1Trans_Equiv_TR",m1Trans_Equiv_TR)

val th1 = REWRITE_RULE[M1ns_def,M1out_def](SPECL[``S0``,``i0``] m1TR_rules)
val th2 = REWRITE_RULE[M1ns_def,M1out_def](SPECL[``S0``,``i1``] m1TR_rules)
val th3 = REWRITE_RULE[M1ns_def,M1out_def](SPECL[``S1``,``i0``] m1TR_rules)
val th4 = REWRITE_RULE[M1ns_def,M1out_def](SPECL[``S1``,``i1``] m1TR_rules)
val th5 = REWRITE_RULE[M1ns_def,M1out_def](SPECL[``S2``,``i0``] m1TR_rules)
val th6 = REWRITE_RULE[M1ns_def,M1out_def](SPECL[``S2``,``i1``] m1TR_rules)

val m1_rules = LIST_CONJ [th1,th2,th3,th4,th5,th6]
val _ = save_thm("m1_rules",m1_rules)

val _ = export_theory();
val _ = print_theory "-";
end (* structure *)