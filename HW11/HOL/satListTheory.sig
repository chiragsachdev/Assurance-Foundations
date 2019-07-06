signature satListTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val satList_def : thm

  (*  Theorems  *)
    val satList_CONS : thm
    val satList_conj : thm
    val satList_nil : thm

  val satList_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [aclDrules] Parent theory of "satList"

   [satList_def]  Definition

      |- ∀M Oi Os formList.
           (M,Oi,Os) satList formList ⇔
           FOLDR (λx y. x ∧ y) T (MAP (λf. (M,Oi,Os) sat f) formList)

   [satList_CONS]  Theorem

      |- ∀h t M Oi Os.
           (M,Oi,Os) satList (h::t) ⇔ (M,Oi,Os) sat h ∧ (M,Oi,Os) satList t

   [satList_conj]  Theorem

      |- ∀l1 l2 M Oi Os.
           (M,Oi,Os) satList l1 ∧ (M,Oi,Os) satList l2 ⇔
           (M,Oi,Os) satList (l1 ++ l2)

   [satList_nil]  Theorem

      |- (M,Oi,Os) satList []


*)
end
