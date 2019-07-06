signature hw5Theory =
sig
  type thm = Thm.thm

  (*  Theorems  *)
    val conSymThm : thm
    val conSymThmAll : thm
    val problem1Thm : thm

  val hw5_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [indexedLists] Parent theory of "hw5"

   [patternMatches] Parent theory of "hw5"

   [conSymThm]  Theorem

      |- p ∧ q ⇔ q ∧ p

   [conSymThmAll]  Theorem

      |- ∀p q. p ∧ q ⇔ q ∧ p

   [problem1Thm]  Theorem

      [oracles: ] [axioms: ] [p] |- (q ⇒ r) ⇒ (p ⇒ q) ⇒ (q ⇒ r) ⇒ q


*)
end
