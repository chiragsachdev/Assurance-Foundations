
(******************************************************************************)
(*       Chirag Sachdev                                                       *)
(*           10.4.1, 10.4.2, 10.4.3                                           *)
(******************************************************************************)

structure exercise10Script = struct

open HolKernel Parse boolLib bossLib;

val _ = new_theory "exercise10";


val problem1_thm =
TAC_PROOF(
([``!x:'a.P(x) ==> M(x)``,``(P:'a->bool)(s:'a)``],``(M:'a->bool)(s:'a)``),
(PAT_ASSUM ``!x.t`` (fn th => (ASSUME_TAC (SPEC ``s`` th))) THEN
RES_TAC)
);

val _ = save_thm("problem1_thm",problem1_thm);

val problem2_thm =
TAC_PROOF(
([``p /\ q ==> r``, ``r ==> s``, ``~s``],``p ==> ~q``),
(REPEAT STRIP_TAC THEN
REPEAT RES_TAC)
);

val _ = save_thm("problem2_thm",problem2_thm);

val problem3_thm =
TAC_PROOF(
([``~(p /\ q)``, ``~p ==> r``, ``~q ==> s``],``r \/ s``),
(PAT_ASSUM ``A ==> B`` (fn th => ASSUME_TAC(REWRITE_RULE[]
(DISJ_IMP(ONCE_REWRITE_RULE [DISJ_SYM](IMP_ELIM th))))) THEN
PAT_ASSUM ``~(A /\ B)`` (fn th => (ASSUME_TAC(REWRITE_RULE[]
(DISJ_IMP(REWRITE_RULE [DE_MORGAN_THM] th))))) THEN
ASSUME_TAC(IMP_TRANS (ASSUME ``p ==> ~q``) (ASSUME ``~q ==> s``)) THEN
ASSUME_TAC(IMP_TRANS (ASSUME ``~r ==> p``) (ASSUME ``p ==> s``)) THEN
PAT_ASSUM ``A ==> B`` (fn th=> (ASSUME_TAC (REWRITE_RULE[] (IMP_ELIM th))))
THEN ASM_REWRITE_TAC[])
);

val _ = save_thm("problem3_thm",problem3_thm);

val _ = export_theory();

end (* structure *)
