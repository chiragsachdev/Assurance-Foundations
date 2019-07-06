signature sminfRules = sig

type tactic = Abbrev.tactic;

type thm_tactic = Abbrev.thm_tactic;

type conv = Abbrev.conv;

type thm = Thm.thm;

type term = Term.term;

type hol_type = Type.hol_type

val SPEC_TR : term -> term -> thm

val SPEC_Trans : term -> thm

val SPEC_TR_clauses : term -> term -> thm

val SPEC_Trans_Equiv_TR : term -> term -> thm

end;