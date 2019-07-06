signature isainfRules = sig

type tactic = Abbrev.tactic;

type thm_tactic = Abbrev.thm_tactic;

type conv = Abbrev.conv;

type thm = Thm.thm;

type term = Term.term;

type hol_type = Type.hol_type

val flip_imp : term -> term

val flip_TR_rules : thm -> term

val distinct_clauses : hol_type -> thm

val TR_EQ_rules : thm -> thm -> thm

end;