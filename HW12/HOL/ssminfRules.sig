signature ssminfRules = sig

type tactic = Abbrev.tactic;

type thm_tactic = Abbrev.thm_tactic;

type conv = Abbrev.conv;

type thm = Thm.thm;

type term = Term.term;

type hol_type = Type.hol_type

val flip_imp : term -> term

val flip_TR_rules : thm -> term

val TR_EQ_rules : thm -> thm -> thm

val distinct_clauses : hol_type -> thm

end;