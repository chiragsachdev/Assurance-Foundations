(******************************************************************************)
(* Chirag Sachdev                                                             *)
(* Ex. 15.6.1, 15.6.2, 15.6.3                                                 *)
(******************************************************************************)

structure cryptoExercisesScript = struct
open HolKernel Parse boolLib bossLib ;
open TypeBase isainfRules optionTheory cipherTheory stringTheory
val _ = new_theory "cryptoExercises";

(* 15.6.1a *)

val exercise15_6_1a_thm = 
TAC_PROOF(([],``!key enMsg message.(deciphS key enMsg = SOME message) <=>
(enMsg = Es key (SOME message))``),
PROVE_TAC[deciphS_one_one]
);
val _ = save_thm("exercise15_6_1a_thm", exercise15_6_1a_thm);

(* 15.6.1b *)

val exercise15_6_1b_thm =
TAC_PROOF(([],``!keyAlice k text.(deciphS keyAlice (Es k (SOME text)) = SOME "This is from Alice")<=> ((k = keyAlice) /\ (text = "This is from Alice"))``),
PROVE_TAC[deciphS_one_one]
);
val _ = save_thm("exercise15_6_1b_thm", exercise15_6_1b_thm);

(* 15.6.2a *)

val exercise15_6_2a_thm =
TAC_PROOF(([],``!P message.(deciphP (pubK P) enMsg = SOME message) <=>
(enMsg = Ea (privK P) (SOME message))``),
PROVE_TAC[deciphP_one_one]
);
val _ = save_thm("exercise15_6_2a_thm", exercise15_6_2a_thm);

(* 15.6.2b *)

val exercise15_6_2b_thm =
TAC_PROOF(([],``!key text.(deciphP (pubK Alice) (Ea key (SOME text)) = SOME "This is from Alice")<=> (key = privK Alice) /\ (text = "This is from Alice")``),
PROVE_TAC[deciphP_one_one]
);
val _ = save_thm("exercise15_6_2b_thm", exercise15_6_2b_thm);

(* 15.6.3 *)

val exercise15_6_3_thm =
TAC_PROOF(([],``!signature.signVerify (pubK Alice) signature (SOME "This is from Alice")<=> (signature = sign (privK Alice) (hash (SOME "This is from Alice")))``),
PROVE_TAC[signVerify_one_one]
);
val _ = save_thm("exercise15_6_3_thm", exercise15_6_3_thm);

val _ = export_theory();
val _ = print_theory "-";
end (* structure *)