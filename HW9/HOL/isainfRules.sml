(*************************************)
(* Functions for building proofs     *)
(*************************************)
structure isainfRules :> isainfRules = struct

open HolKernel boolLib Parse bossLib
open reduceLib TypeBase

fun flip_imp term = 
let
 val (a,c) = dest_imp term
in
 mk_imp(c,a)
end

fun flip_TR_rules TR_rules =
let
 val thmlist = map SPEC_ALL (CONJUNCTS TR_rules)
 val conclist = map concl thmlist
 val implist = map flip_imp conclist
in
 list_mk_conj implist
end

fun distinct_clauses hol_type =
let
 val th1list = CONJUNCTS(distinct_of hol_type)
 val th2list = append th1list (map GSYM th1list)
in
 LIST_CONJ th2list
end 

fun TR_EQ_rules TR_rules TR_rules_converse =
let
 val th1list = (map SPEC_ALL (CONJUNCTS TR_rules))
 val th2list = CONJUNCTS TR_rules_converse
 val th3list = map2 IMP_ANTISYM_RULE th2list th1list
in
 LIST_CONJ th3list
end

end; (* structure *)