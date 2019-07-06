signature exercise9Theory =
sig
  type thm = Thm.thm

  (*  Theorems  *)
    val absorptionRule : thm
    val absorptionRule2 : thm
    val constructiveDilemmaRule : thm
    val constructiveDilemmaRule2 : thm

  val exercise9_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [indexedLists] Parent theory of "exercise9"

   [patternMatches] Parent theory of "exercise9"

   [absorptionRule]  Theorem

      |- ∀p q. (p ⇒ q) ⇒ p ⇒ p ∧ q

   [absorptionRule2]  Theorem

      |- ∀p q. (p ⇒ q) ⇒ p ⇒ p ∧ q

   [constructiveDilemmaRule]  Theorem

      |- ∀p q r s. (p ⇒ q) ∧ (r ⇒ s) ⇒ p ∨ r ⇒ q ∨ s

   [constructiveDilemmaRule2]  Theorem

      |- ∀p q r s. (p ⇒ q) ∧ (r ⇒ s) ⇒ p ∨ r ⇒ q ∨ s


*)
end
