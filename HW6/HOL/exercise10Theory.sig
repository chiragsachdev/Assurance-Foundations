signature exercise10Theory =
sig
  type thm = Thm.thm

  (*  Theorems  *)
    val problem1_thm : thm
    val problem2_thm : thm
    val problem3_thm : thm

  val exercise10_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [indexedLists] Parent theory of "exercise10"

   [patternMatches] Parent theory of "exercise10"

   [problem1_thm]  Theorem

      [oracles: ] [axioms: ] [P s, ∀x. P x ⇒ M x] |- M s

   [problem2_thm]  Theorem

      [oracles: DISK_THM] [axioms: ] [¬s, r ⇒ s, p ∧ q ⇒ r] |- p ⇒ ¬q

   [problem3_thm]  Theorem

      [oracles: DISK_THM] [axioms: ] [¬(p ∧ q), ¬p ⇒ r, ¬q ⇒ s] |- r ∨ s


*)
end
