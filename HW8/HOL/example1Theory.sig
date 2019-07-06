signature example1Theory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val commands_BIJ : thm
    val commands_CASE : thm
    val commands_TY_DEF : thm
    val commands_size_def : thm
    val staff_BIJ : thm
    val staff_CASE : thm
    val staff_TY_DEF : thm
    val staff_size_def : thm

  (*  Theorems  *)
    val Mono_Reps_Theorem : thm
    val commands2num_11 : thm
    val commands2num_ONTO : thm
    val commands2num_num2commands : thm
    val commands2num_thm : thm
    val commands_Axiom : thm
    val commands_EQ_commands : thm
    val commands_case_cong : thm
    val commands_case_def : thm
    val commands_distinct : thm
    val commands_induction : thm
    val commands_nchotomy : thm
    val datatype_commands : thm
    val datatype_staff : thm
    val example1Theorem : thm
    val example1TheoremA : thm
    val example1TheoremB : thm
    val example2Theorem : thm
    val example2TheoremA : thm
    val example2TheoremB : thm
    val example3Theorem : thm
    val example3TheoremA : thm
    val num2commands_11 : thm
    val num2commands_ONTO : thm
    val num2commands_commands2num : thm
    val num2commands_thm : thm
    val num2staff_11 : thm
    val num2staff_ONTO : thm
    val num2staff_staff2num : thm
    val num2staff_thm : thm
    val staff2num_11 : thm
    val staff2num_ONTO : thm
    val staff2num_num2staff : thm
    val staff2num_thm : thm
    val staff_Axiom : thm
    val staff_EQ_staff : thm
    val staff_case_cong : thm
    val staff_case_def : thm
    val staff_distinct : thm
    val staff_induction : thm
    val staff_nchotomy : thm

  val example1_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [aclDrules] Parent theory of "example1"

   [commands_BIJ]  Definition

      |- (∀a. num2commands (commands2num a) = a) ∧
         ∀r. (λn. n < 4) r ⇔ (commands2num (num2commands r) = r)

   [commands_CASE]  Definition

      |- ∀x v0 v1 v2 v3.
           (case x of go => v0 | nogo => v1 | launch => v2 | abort => v3) =
           (λm.
              if m < 1 then v0
              else if m < 2 then v1
              else if m = 2 then v2
              else v3) (commands2num x)

   [commands_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 4) rep

   [commands_size_def]  Definition

      |- ∀x. commands_size x = 0

   [staff_BIJ]  Definition

      |- (∀a. num2staff (staff2num a) = a) ∧
         ∀r. (λn. n < 4) r ⇔ (staff2num (num2staff r) = r)

   [staff_CASE]  Definition

      |- ∀x v0 v1 v2 v3.
           (case x of Alice => v0 | Bob => v1 | Carol => v2 | Dan => v3) =
           (λm.
              if m < 1 then v0
              else if m < 2 then v1
              else if m = 2 then v2
              else v3) (staff2num x)

   [staff_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 4) rep

   [staff_size_def]  Definition

      |- ∀x. staff_size x = 0

   [Mono_Reps_Theorem]  Theorem

      |- (M,Oi,Os) sat Q controls f ⇒
         (M,Oi,Os) sat reps P Q f ⇒
         (M,Oi,Os) sat P' quoting Q' says f ⇒
         (M,Oi,Os) sat P' speaks_for P ⇒
         (M,Oi,Os) sat Q' speaks_for Q ⇒
         (M,Oi,Os) sat f

   [commands2num_11]  Theorem

      |- ∀a a'. (commands2num a = commands2num a') ⇔ (a = a')

   [commands2num_ONTO]  Theorem

      |- ∀r. r < 4 ⇔ ∃a. r = commands2num a

   [commands2num_num2commands]  Theorem

      |- ∀r. r < 4 ⇔ (commands2num (num2commands r) = r)

   [commands2num_thm]  Theorem

      |- (commands2num go = 0) ∧ (commands2num nogo = 1) ∧
         (commands2num launch = 2) ∧ (commands2num abort = 3)

   [commands_Axiom]  Theorem

      |- ∀x0 x1 x2 x3.
           ∃f.
             (f go = x0) ∧ (f nogo = x1) ∧ (f launch = x2) ∧ (f abort = x3)

   [commands_EQ_commands]  Theorem

      |- ∀a a'. (a = a') ⇔ (commands2num a = commands2num a')

   [commands_case_cong]  Theorem

      |- ∀M M' v0 v1 v2 v3.
           (M = M') ∧ ((M' = go) ⇒ (v0 = v0')) ∧
           ((M' = nogo) ⇒ (v1 = v1')) ∧ ((M' = launch) ⇒ (v2 = v2')) ∧
           ((M' = abort) ⇒ (v3 = v3')) ⇒
           ((case M of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3) =
            case M' of
              go => v0'
            | nogo => v1'
            | launch => v2'
            | abort => v3')

   [commands_case_def]  Theorem

      |- (∀v0 v1 v2 v3.
            (case go of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3) =
            v0) ∧
         (∀v0 v1 v2 v3.
            (case nogo of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3) =
            v1) ∧
         (∀v0 v1 v2 v3.
            (case launch of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3) =
            v2) ∧
         ∀v0 v1 v2 v3.
           (case abort of
              go => v0
            | nogo => v1
            | launch => v2
            | abort => v3) =
           v3

   [commands_distinct]  Theorem

      |- go ≠ nogo ∧ go ≠ launch ∧ go ≠ abort ∧ nogo ≠ launch ∧
         nogo ≠ abort ∧ launch ≠ abort

   [commands_induction]  Theorem

      |- ∀P. P abort ∧ P go ∧ P launch ∧ P nogo ⇒ ∀a. P a

   [commands_nchotomy]  Theorem

      |- ∀a. (a = go) ∨ (a = nogo) ∨ (a = launch) ∨ (a = abort)

   [datatype_commands]  Theorem

      |- DATATYPE (commands go nogo launch abort)

   [datatype_staff]  Theorem

      |- DATATYPE (staff Alice Bob Carol Dan)

   [example1Theorem]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Alice controls prop go ⇒
         (M,Oi,Os) sat prop go

   [example1TheoremA]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Alice controls prop go ⇒
         (M,Oi,Os) sat prop go

   [example1TheoremB]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Alice controls prop go ⇒
         (M,Oi,Os) sat prop go

   [example2Theorem]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Alice speaks_for Name Bob ⇒
         (M,Oi,Os) sat Name Bob controls prop go ⇒
         (M,Oi,Os) sat prop go

   [example2TheoremA]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Alice speaks_for Name Bob ⇒
         (M,Oi,Os) sat Name Bob controls prop go ⇒
         (M,Oi,Os) sat prop go

   [example2TheoremB]  Theorem

      |- (M,Oi,Os) sat Name Alice says prop go ⇒
         (M,Oi,Os) sat Name Alice speaks_for Name Bob ⇒
         (M,Oi,Os) sat Name Bob controls prop go ⇒
         (M,Oi,Os) sat prop go

   [example3Theorem]  Theorem

      |- (M,Oi,Os) sat prop go impf prop launch ⇒
         (M,Oi,Os) sat prop go ⇒
         (M,Oi,Os) sat Name Carol says prop launch

   [example3TheoremA]  Theorem

      |- (M,Oi,Os) sat prop go impf prop launch ⇒
         (M,Oi,Os) sat prop go ⇒
         (M,Oi,Os) sat Name Carol says prop launch

   [num2commands_11]  Theorem

      |- ∀r r'.
           r < 4 ⇒ r' < 4 ⇒ ((num2commands r = num2commands r') ⇔ (r = r'))

   [num2commands_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2commands r) ∧ r < 4

   [num2commands_commands2num]  Theorem

      |- ∀a. num2commands (commands2num a) = a

   [num2commands_thm]  Theorem

      |- (num2commands 0 = go) ∧ (num2commands 1 = nogo) ∧
         (num2commands 2 = launch) ∧ (num2commands 3 = abort)

   [num2staff_11]  Theorem

      |- ∀r r'. r < 4 ⇒ r' < 4 ⇒ ((num2staff r = num2staff r') ⇔ (r = r'))

   [num2staff_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2staff r) ∧ r < 4

   [num2staff_staff2num]  Theorem

      |- ∀a. num2staff (staff2num a) = a

   [num2staff_thm]  Theorem

      |- (num2staff 0 = Alice) ∧ (num2staff 1 = Bob) ∧
         (num2staff 2 = Carol) ∧ (num2staff 3 = Dan)

   [staff2num_11]  Theorem

      |- ∀a a'. (staff2num a = staff2num a') ⇔ (a = a')

   [staff2num_ONTO]  Theorem

      |- ∀r. r < 4 ⇔ ∃a. r = staff2num a

   [staff2num_num2staff]  Theorem

      |- ∀r. r < 4 ⇔ (staff2num (num2staff r) = r)

   [staff2num_thm]  Theorem

      |- (staff2num Alice = 0) ∧ (staff2num Bob = 1) ∧
         (staff2num Carol = 2) ∧ (staff2num Dan = 3)

   [staff_Axiom]  Theorem

      |- ∀x0 x1 x2 x3.
           ∃f.
             (f Alice = x0) ∧ (f Bob = x1) ∧ (f Carol = x2) ∧ (f Dan = x3)

   [staff_EQ_staff]  Theorem

      |- ∀a a'. (a = a') ⇔ (staff2num a = staff2num a')

   [staff_case_cong]  Theorem

      |- ∀M M' v0 v1 v2 v3.
           (M = M') ∧ ((M' = Alice) ⇒ (v0 = v0')) ∧
           ((M' = Bob) ⇒ (v1 = v1')) ∧ ((M' = Carol) ⇒ (v2 = v2')) ∧
           ((M' = Dan) ⇒ (v3 = v3')) ⇒
           ((case M of Alice => v0 | Bob => v1 | Carol => v2 | Dan => v3) =
            case M' of
              Alice => v0'
            | Bob => v1'
            | Carol => v2'
            | Dan => v3')

   [staff_case_def]  Theorem

      |- (∀v0 v1 v2 v3.
            (case Alice of
               Alice => v0
             | Bob => v1
             | Carol => v2
             | Dan => v3) =
            v0) ∧
         (∀v0 v1 v2 v3.
            (case Bob of
               Alice => v0
             | Bob => v1
             | Carol => v2
             | Dan => v3) =
            v1) ∧
         (∀v0 v1 v2 v3.
            (case Carol of
               Alice => v0
             | Bob => v1
             | Carol => v2
             | Dan => v3) =
            v2) ∧
         ∀v0 v1 v2 v3.
           (case Dan of
              Alice => v0
            | Bob => v1
            | Carol => v2
            | Dan => v3) =
           v3

   [staff_distinct]  Theorem

      |- Alice ≠ Bob ∧ Alice ≠ Carol ∧ Alice ≠ Dan ∧ Bob ≠ Carol ∧
         Bob ≠ Dan ∧ Carol ≠ Dan

   [staff_induction]  Theorem

      |- ∀P. P Alice ∧ P Bob ∧ P Carol ∧ P Dan ⇒ ∀a. P a

   [staff_nchotomy]  Theorem

      |- ∀a. (a = Alice) ∨ (a = Bob) ∨ (a = Carol) ∨ (a = Dan)


*)
end
