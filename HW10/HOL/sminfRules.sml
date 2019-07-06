(***************************************)
(* Inference rules for state machines  *)
(***************************************)
structure sminfRules :> sminfRules = struct

open HolKernel boolLib Parse bossLib
open reduceLib smTheory

fun SPEC_TR (ns:term) (out:term) = ISPECL [ns,out] TR_rules

fun SPEC_Trans (ns:term) = ISPEC ns Trans_rules

fun SPEC_TR_clauses (ns:term) (out:term) =
CONJ
 (CONJUNCT1 TR_clauses)
 (ISPECL[ns,out](CONJUNCT2 TR_clauses))

fun SPEC_Trans_Equiv_TR (ns:term)(out:term) =
ISPECL
[ns,out]
(GENL
 [``NS:'state -> 'input -> 'state``,
  ``Out:'state -> 'input -> 'output``]
 Trans_Equiv_TR)


end; (* structure *)