signature solutions1Theory =
sig
  type thm = Thm.thm

  (*  Theorems  *)
    val aclExercise1 : thm
    val aclExercise1A : thm
    val aclExercise1B : thm
    val aclExercise2 : thm
    val aclExercise2A : thm
    val aclExercise2B : thm

  val solutions1_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [example1] Parent theory of "solutions1"

   [aclExercise1]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Bob says prop go ⇒
         (M,Oi,Os) sat Name Alice meet Name Bob says prop go

   [aclExercise1A]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Bob says prop go ⇒
         (M,Oi,Os) sat Name Alice meet Name Bob says prop go

   [aclExercise1B]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Bob says prop go ⇒
         (M,Oi,Os) sat Name Alice meet Name Bob says prop go

   [aclExercise2]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Alice controls prop go ⇒
         (M,Oi,Os) sat prop go impf prop launch ⇒
         (M,Oi,Os) sat Name Bob says prop launch

   [aclExercise2A]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Alice controls prop go ⇒
         (M,Oi,Os) sat prop go impf prop launch ⇒
         (M,Oi,Os) sat Name Bob says prop launch

   [aclExercise2B]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Alice controls prop go ⇒
         (M,Oi,Os) sat prop go impf prop launch ⇒
         (M,Oi,Os) sat Name Bob says prop launch


*)
end
