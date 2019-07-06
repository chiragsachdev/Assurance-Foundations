signature m0TypesTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val command_TY_DEF : thm
    val command_case_def : thm
    val command_size_def : thm
    val npriv_BIJ : thm
    val npriv_CASE : thm
    val npriv_TY_DEF : thm
    val npriv_size_def : thm
    val output_BIJ : thm
    val output_CASE : thm
    val output_TY_DEF : thm
    val output_size_def : thm
    val privcmd_BIJ : thm
    val privcmd_CASE : thm
    val privcmd_TY_DEF : thm
    val privcmd_size_def : thm
    val state_BIJ : thm
    val state_CASE : thm
    val state_TY_DEF : thm
    val state_size_def : thm

  (*  Theorems  *)
    val command_11 : thm
    val command_Axiom : thm
    val command_case_cong : thm
    val command_distinct : thm
    val command_distinct_clauses : thm
    val command_induction : thm
    val command_nchotomy : thm
    val command_one_one : thm
    val datatype_command : thm
    val datatype_npriv : thm
    val datatype_output : thm
    val datatype_privcmd : thm
    val datatype_state : thm
    val npriv2num_11 : thm
    val npriv2num_ONTO : thm
    val npriv2num_num2npriv : thm
    val npriv2num_thm : thm
    val npriv_Axiom : thm
    val npriv_EQ_npriv : thm
    val npriv_case_cong : thm
    val npriv_case_def : thm
    val npriv_induction : thm
    val npriv_nchotomy : thm
    val num2npriv_11 : thm
    val num2npriv_ONTO : thm
    val num2npriv_npriv2num : thm
    val num2npriv_thm : thm
    val num2output_11 : thm
    val num2output_ONTO : thm
    val num2output_output2num : thm
    val num2output_thm : thm
    val num2privcmd_11 : thm
    val num2privcmd_ONTO : thm
    val num2privcmd_privcmd2num : thm
    val num2privcmd_thm : thm
    val num2state_11 : thm
    val num2state_ONTO : thm
    val num2state_state2num : thm
    val num2state_thm : thm
    val output2num_11 : thm
    val output2num_ONTO : thm
    val output2num_num2output : thm
    val output2num_thm : thm
    val output_Axiom : thm
    val output_EQ_output : thm
    val output_case_cong : thm
    val output_case_def : thm
    val output_distinct : thm
    val output_distinct_clauses : thm
    val output_induction : thm
    val output_nchotomy : thm
    val privcmd2num_11 : thm
    val privcmd2num_ONTO : thm
    val privcmd2num_num2privcmd : thm
    val privcmd2num_thm : thm
    val privcmd_Axiom : thm
    val privcmd_EQ_privcmd : thm
    val privcmd_case_cong : thm
    val privcmd_case_def : thm
    val privcmd_distinct : thm
    val privcmd_distinct_clauses : thm
    val privcmd_induction : thm
    val privcmd_nchotomy : thm
    val state2num_11 : thm
    val state2num_ONTO : thm
    val state2num_num2state : thm
    val state2num_thm : thm
    val state_Axiom : thm
    val state_EQ_state : thm
    val state_case_cong : thm
    val state_case_def : thm
    val state_distinct : thm
    val state_distinct_clauses : thm
    val state_induction : thm
    val state_nchotomy : thm

  val m0Types_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [indexedLists] Parent theory of "m0Types"

   [patternMatches] Parent theory of "m0Types"

   [command_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'command' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR 0 (a,ARB) (λn. ind_type$BOTTOM))
                          a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC 0) (ARB,a)
                             (λn. ind_type$BOTTOM)) a) ⇒
                     'command' a0) ⇒
                  'command' a0) rep

   [command_case_def]  Definition

      |- (∀a f f1. command_CASE (NP a) f f1 = f a) ∧
         ∀a f f1. command_CASE (PR a) f f1 = f1 a

   [command_size_def]  Definition

      |- (∀a. command_size (NP a) = 1 + npriv_size a) ∧
         ∀a. command_size (PR a) = 1 + privcmd_size a

   [npriv_BIJ]  Definition

      |- (∀a. num2npriv (npriv2num a) = a) ∧
         ∀r. (λn. n < 1) r ⇔ (npriv2num (num2npriv r) = r)

   [npriv_CASE]  Definition

      |- ∀x v0. (case x of status => v0) = (λm. v0) (npriv2num x)

   [npriv_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 1) rep

   [npriv_size_def]  Definition

      |- ∀x. npriv_size x = 0

   [output_BIJ]  Definition

      |- (∀a. num2output (output2num a) = a) ∧
         ∀r. (λn. n < 2) r ⇔ (output2num (num2output r) = r)

   [output_CASE]  Definition

      |- ∀x v0 v1.
           (case x of on => v0 | off => v1) =
           (λm. if m = 0 then v0 else v1) (output2num x)

   [output_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 2) rep

   [output_size_def]  Definition

      |- ∀x. output_size x = 0

   [privcmd_BIJ]  Definition

      |- (∀a. num2privcmd (privcmd2num a) = a) ∧
         ∀r. (λn. n < 2) r ⇔ (privcmd2num (num2privcmd r) = r)

   [privcmd_CASE]  Definition

      |- ∀x v0 v1.
           (case x of launch => v0 | reset => v1) =
           (λm. if m = 0 then v0 else v1) (privcmd2num x)

   [privcmd_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 2) rep

   [privcmd_size_def]  Definition

      |- ∀x. privcmd_size x = 0

   [state_BIJ]  Definition

      |- (∀a. num2state (state2num a) = a) ∧
         ∀r. (λn. n < 2) r ⇔ (state2num (num2state r) = r)

   [state_CASE]  Definition

      |- ∀x v0 v1.
           (case x of STBY => v0 | ACTIVE => v1) =
           (λm. if m = 0 then v0 else v1) (state2num x)

   [state_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 2) rep

   [state_size_def]  Definition

      |- ∀x. state_size x = 0

   [command_11]  Theorem

      |- (∀a a'. (NP a = NP a') ⇔ (a = a')) ∧
         ∀a a'. (PR a = PR a') ⇔ (a = a')

   [command_Axiom]  Theorem

      |- ∀f0 f1. ∃fn. (∀a. fn (NP a) = f0 a) ∧ ∀a. fn (PR a) = f1 a

   [command_case_cong]  Theorem

      |- ∀M M' f f1.
           (M = M') ∧ (∀a. (M' = NP a) ⇒ (f a = f' a)) ∧
           (∀a. (M' = PR a) ⇒ (f1 a = f1' a)) ⇒
           (command_CASE M f f1 = command_CASE M' f' f1')

   [command_distinct]  Theorem

      |- ∀a' a. NP a ≠ PR a'

   [command_distinct_clauses]  Theorem

      |- ∀a' a. NP a ≠ PR a'

   [command_induction]  Theorem

      |- ∀P. (∀n. P (NP n)) ∧ (∀p. P (PR p)) ⇒ ∀c. P c

   [command_nchotomy]  Theorem

      |- ∀cc. (∃n. cc = NP n) ∨ ∃p. cc = PR p

   [command_one_one]  Theorem

      |- (∀a a'. (NP a = NP a') ⇔ (a = a')) ∧
         ∀a a'. (PR a = PR a') ⇔ (a = a')

   [datatype_command]  Theorem

      |- DATATYPE (command NP PR)

   [datatype_npriv]  Theorem

      |- DATATYPE (npriv status)

   [datatype_output]  Theorem

      |- DATATYPE (output on off)

   [datatype_privcmd]  Theorem

      |- DATATYPE (privcmd launch reset)

   [datatype_state]  Theorem

      |- DATATYPE (state STBY ACTIVE)

   [npriv2num_11]  Theorem

      |- ∀a a'. (npriv2num a = npriv2num a') ⇔ (a = a')

   [npriv2num_ONTO]  Theorem

      |- ∀r. r < 1 ⇔ ∃a. r = npriv2num a

   [npriv2num_num2npriv]  Theorem

      |- ∀r. r < 1 ⇔ (npriv2num (num2npriv r) = r)

   [npriv2num_thm]  Theorem

      |- npriv2num status = 0

   [npriv_Axiom]  Theorem

      |- ∀x0. ∃f. f status = x0

   [npriv_EQ_npriv]  Theorem

      |- ∀a a'. (a = a') ⇔ (npriv2num a = npriv2num a')

   [npriv_case_cong]  Theorem

      |- ∀M M' v0.
           (M = M') ∧ ((M' = status) ⇒ (v0 = v0')) ⇒
           ((case M of status => v0) = case M' of status => v0')

   [npriv_case_def]  Theorem

      |- ∀v0. (case status of status => v0) = v0

   [npriv_induction]  Theorem

      |- ∀P. P status ⇒ ∀a. P a

   [npriv_nchotomy]  Theorem

      |- ∀a. a = status

   [num2npriv_11]  Theorem

      |- ∀r r'. r < 1 ⇒ r' < 1 ⇒ ((num2npriv r = num2npriv r') ⇔ (r = r'))

   [num2npriv_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2npriv r) ∧ r < 1

   [num2npriv_npriv2num]  Theorem

      |- ∀a. num2npriv (npriv2num a) = a

   [num2npriv_thm]  Theorem

      |- num2npriv 0 = status

   [num2output_11]  Theorem

      |- ∀r r'.
           r < 2 ⇒ r' < 2 ⇒ ((num2output r = num2output r') ⇔ (r = r'))

   [num2output_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2output r) ∧ r < 2

   [num2output_output2num]  Theorem

      |- ∀a. num2output (output2num a) = a

   [num2output_thm]  Theorem

      |- (num2output 0 = on) ∧ (num2output 1 = off)

   [num2privcmd_11]  Theorem

      |- ∀r r'.
           r < 2 ⇒ r' < 2 ⇒ ((num2privcmd r = num2privcmd r') ⇔ (r = r'))

   [num2privcmd_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2privcmd r) ∧ r < 2

   [num2privcmd_privcmd2num]  Theorem

      |- ∀a. num2privcmd (privcmd2num a) = a

   [num2privcmd_thm]  Theorem

      |- (num2privcmd 0 = launch) ∧ (num2privcmd 1 = reset)

   [num2state_11]  Theorem

      |- ∀r r'. r < 2 ⇒ r' < 2 ⇒ ((num2state r = num2state r') ⇔ (r = r'))

   [num2state_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2state r) ∧ r < 2

   [num2state_state2num]  Theorem

      |- ∀a. num2state (state2num a) = a

   [num2state_thm]  Theorem

      |- (num2state 0 = STBY) ∧ (num2state 1 = ACTIVE)

   [output2num_11]  Theorem

      |- ∀a a'. (output2num a = output2num a') ⇔ (a = a')

   [output2num_ONTO]  Theorem

      |- ∀r. r < 2 ⇔ ∃a. r = output2num a

   [output2num_num2output]  Theorem

      |- ∀r. r < 2 ⇔ (output2num (num2output r) = r)

   [output2num_thm]  Theorem

      |- (output2num on = 0) ∧ (output2num off = 1)

   [output_Axiom]  Theorem

      |- ∀x0 x1. ∃f. (f on = x0) ∧ (f off = x1)

   [output_EQ_output]  Theorem

      |- ∀a a'. (a = a') ⇔ (output2num a = output2num a')

   [output_case_cong]  Theorem

      |- ∀M M' v0 v1.
           (M = M') ∧ ((M' = on) ⇒ (v0 = v0')) ∧
           ((M' = off) ⇒ (v1 = v1')) ⇒
           ((case M of on => v0 | off => v1) =
            case M' of on => v0' | off => v1')

   [output_case_def]  Theorem

      |- (∀v0 v1. (case on of on => v0 | off => v1) = v0) ∧
         ∀v0 v1. (case off of on => v0 | off => v1) = v1

   [output_distinct]  Theorem

      |- on ≠ off

   [output_distinct_clauses]  Theorem

      |- on ≠ off

   [output_induction]  Theorem

      |- ∀P. P off ∧ P on ⇒ ∀a. P a

   [output_nchotomy]  Theorem

      |- ∀a. (a = on) ∨ (a = off)

   [privcmd2num_11]  Theorem

      |- ∀a a'. (privcmd2num a = privcmd2num a') ⇔ (a = a')

   [privcmd2num_ONTO]  Theorem

      |- ∀r. r < 2 ⇔ ∃a. r = privcmd2num a

   [privcmd2num_num2privcmd]  Theorem

      |- ∀r. r < 2 ⇔ (privcmd2num (num2privcmd r) = r)

   [privcmd2num_thm]  Theorem

      |- (privcmd2num launch = 0) ∧ (privcmd2num reset = 1)

   [privcmd_Axiom]  Theorem

      |- ∀x0 x1. ∃f. (f launch = x0) ∧ (f reset = x1)

   [privcmd_EQ_privcmd]  Theorem

      |- ∀a a'. (a = a') ⇔ (privcmd2num a = privcmd2num a')

   [privcmd_case_cong]  Theorem

      |- ∀M M' v0 v1.
           (M = M') ∧ ((M' = launch) ⇒ (v0 = v0')) ∧
           ((M' = reset) ⇒ (v1 = v1')) ⇒
           ((case M of launch => v0 | reset => v1) =
            case M' of launch => v0' | reset => v1')

   [privcmd_case_def]  Theorem

      |- (∀v0 v1. (case launch of launch => v0 | reset => v1) = v0) ∧
         ∀v0 v1. (case reset of launch => v0 | reset => v1) = v1

   [privcmd_distinct]  Theorem

      |- launch ≠ reset

   [privcmd_distinct_clauses]  Theorem

      |- launch ≠ reset

   [privcmd_induction]  Theorem

      |- ∀P. P launch ∧ P reset ⇒ ∀a. P a

   [privcmd_nchotomy]  Theorem

      |- ∀a. (a = launch) ∨ (a = reset)

   [state2num_11]  Theorem

      |- ∀a a'. (state2num a = state2num a') ⇔ (a = a')

   [state2num_ONTO]  Theorem

      |- ∀r. r < 2 ⇔ ∃a. r = state2num a

   [state2num_num2state]  Theorem

      |- ∀r. r < 2 ⇔ (state2num (num2state r) = r)

   [state2num_thm]  Theorem

      |- (state2num STBY = 0) ∧ (state2num ACTIVE = 1)

   [state_Axiom]  Theorem

      |- ∀x0 x1. ∃f. (f STBY = x0) ∧ (f ACTIVE = x1)

   [state_EQ_state]  Theorem

      |- ∀a a'. (a = a') ⇔ (state2num a = state2num a')

   [state_case_cong]  Theorem

      |- ∀M M' v0 v1.
           (M = M') ∧ ((M' = STBY) ⇒ (v0 = v0')) ∧
           ((M' = ACTIVE) ⇒ (v1 = v1')) ⇒
           ((case M of STBY => v0 | ACTIVE => v1) =
            case M' of STBY => v0' | ACTIVE => v1')

   [state_case_def]  Theorem

      |- (∀v0 v1. (case STBY of STBY => v0 | ACTIVE => v1) = v0) ∧
         ∀v0 v1. (case ACTIVE of STBY => v0 | ACTIVE => v1) = v1

   [state_distinct]  Theorem

      |- STBY ≠ ACTIVE

   [state_distinct_clauses]  Theorem

      |- STBY ≠ ACTIVE

   [state_induction]  Theorem

      |- ∀P. P ACTIVE ∧ P STBY ⇒ ∀a. P a

   [state_nchotomy]  Theorem

      |- ∀a. (a = STBY) ∨ (a = ACTIVE)


*)
end
