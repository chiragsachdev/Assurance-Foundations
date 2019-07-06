signature conops0SolutionTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val commands_BIJ : thm
    val commands_CASE : thm
    val commands_TY_DEF : thm
    val commands_size_def : thm
    val keyPrinc_TY_DEF : thm
    val keyPrinc_case_def : thm
    val keyPrinc_size_def : thm
    val people_BIJ : thm
    val people_CASE : thm
    val people_TY_DEF : thm
    val people_size_def : thm
    val principals_TY_DEF : thm
    val principals_case_def : thm
    val principals_size_def : thm
    val roles_BIJ : thm
    val roles_CASE : thm
    val roles_TY_DEF : thm
    val roles_size_def : thm

  (*  Theorems  *)
    val ApRuleActivate_thm : thm
    val ApRuleStandDown_thm : thm
    val OpRuleAbort_thm : thm
    val OpRuleLaunch_thm : thm
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
    val datatype_keyPrinc : thm
    val datatype_people : thm
    val datatype_principals : thm
    val datatype_roles : thm
    val keyPrinc_11 : thm
    val keyPrinc_Axiom : thm
    val keyPrinc_case_cong : thm
    val keyPrinc_distinct : thm
    val keyPrinc_induction : thm
    val keyPrinc_nchotomy : thm
    val num2commands_11 : thm
    val num2commands_ONTO : thm
    val num2commands_commands2num : thm
    val num2commands_thm : thm
    val num2people_11 : thm
    val num2people_ONTO : thm
    val num2people_people2num : thm
    val num2people_thm : thm
    val num2roles_11 : thm
    val num2roles_ONTO : thm
    val num2roles_roles2num : thm
    val num2roles_thm : thm
    val people2num_11 : thm
    val people2num_ONTO : thm
    val people2num_num2people : thm
    val people2num_thm : thm
    val people_Axiom : thm
    val people_EQ_people : thm
    val people_case_cong : thm
    val people_case_def : thm
    val people_distinct : thm
    val people_induction : thm
    val people_nchotomy : thm
    val principals_11 : thm
    val principals_Axiom : thm
    val principals_case_cong : thm
    val principals_distinct : thm
    val principals_induction : thm
    val principals_nchotomy : thm
    val roles2num_11 : thm
    val roles2num_ONTO : thm
    val roles2num_num2roles : thm
    val roles2num_thm : thm
    val roles_Axiom : thm
    val roles_EQ_roles : thm
    val roles_case_cong : thm
    val roles_case_def : thm
    val roles_distinct : thm
    val roles_induction : thm
    val roles_nchotomy : thm

  val conops0Solution_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [aclDrules] Parent theory of "conops0Solution"

   [commands_BIJ]  Definition

      |- (∀a. num2commands (commands2num a) = a) ∧
         ∀r. (λn. n < 6) r ⇔ (commands2num (num2commands r) = r)

   [commands_CASE]  Definition

      |- ∀x v0 v1 v2 v3 v4 v5.
           (case x of
              go => v0
            | nogo => v1
            | launch => v2
            | abort => v3
            | activate => v4
            | stand_down => v5) =
           (λm.
              if m < 2 then if m = 0 then v0 else v1
              else if m < 3 then v2
              else if m < 4 then v3
              else if m = 4 then v4
              else v5) (commands2num x)

   [commands_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 6) rep

   [commands_size_def]  Definition

      |- ∀x. commands_size x = 0

   [keyPrinc_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'keyPrinc' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR 0 (a,ARB,ARB)
                             (λn. ind_type$BOTTOM)) a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC 0) (ARB,a,ARB)
                             (λn. ind_type$BOTTOM)) a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC (SUC 0)) (ARB,ARB,a)
                             (λn. ind_type$BOTTOM)) a) ⇒
                     'keyPrinc' a0) ⇒
                  'keyPrinc' a0) rep

   [keyPrinc_case_def]  Definition

      |- (∀a f f1 f2. keyPrinc_CASE (Staff a) f f1 f2 = f a) ∧
         (∀a f f1 f2. keyPrinc_CASE (Role a) f f1 f2 = f1 a) ∧
         ∀a f f1 f2. keyPrinc_CASE (Ap a) f f1 f2 = f2 a

   [keyPrinc_size_def]  Definition

      |- (∀a. keyPrinc_size (Staff a) = 1 + people_size a) ∧
         (∀a. keyPrinc_size (Role a) = 1 + roles_size a) ∧
         ∀a. keyPrinc_size (Ap a) = 1 + a

   [people_BIJ]  Definition

      |- (∀a. num2people (people2num a) = a) ∧
         ∀r. (λn. n < 2) r ⇔ (people2num (num2people r) = r)

   [people_CASE]  Definition

      |- ∀x v0 v1.
           (case x of Alice => v0 | Bob => v1) =
           (λm. if m = 0 then v0 else v1) (people2num x)

   [people_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 2) rep

   [people_size_def]  Definition

      |- ∀x. people_size x = 0

   [principals_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'principals' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa. ind_type$CONSTR 0 a (λn. ind_type$BOTTOM))
                          a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC 0) a (λn. ind_type$BOTTOM))
                          a) ⇒
                     'principals' a0) ⇒
                  'principals' a0) rep

   [principals_case_def]  Definition

      |- (∀a f f1. principals_CASE (PR a) f f1 = f a) ∧
         ∀a f f1. principals_CASE (Key a) f f1 = f1 a

   [principals_size_def]  Definition

      |- (∀a. principals_size (PR a) = 1 + keyPrinc_size a) ∧
         ∀a. principals_size (Key a) = 1 + keyPrinc_size a

   [roles_BIJ]  Definition

      |- (∀a. num2roles (roles2num a) = a) ∧
         ∀r. (λn. n < 3) r ⇔ (roles2num (num2roles r) = r)

   [roles_CASE]  Definition

      |- ∀x v0 v1 v2.
           (case x of Commander => v0 | Operator => v1 | CA => v2) =
           (λm. if m < 1 then v0 else if m = 1 then v1 else v2)
             (roles2num x)

   [roles_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 3) rep

   [roles_size_def]  Definition

      |- ∀x. roles_size x = 0

   [ApRuleActivate_thm]  Theorem

      |- (M,Oi,Os) sat Name (PR (Role Operator)) controls prop launch ⇒
         (M,Oi,Os) sat
         reps (Name (PR (Staff Bob))) (Name (PR (Role Operator)))
           (prop launch) ⇒
         (M,Oi,Os) sat
         Name (Key (Staff Bob)) quoting Name (PR (Role Operator)) says
         prop launch ⇒
         (M,Oi,Os) sat prop launch impf prop activate ⇒
         (M,Oi,Os) sat
         Name (Key (Role CA)) speaks_for Name (PR (Role CA)) ⇒
         (M,Oi,Os) sat
         Name (Key (Role CA)) says
         Name (Key (Staff Bob)) speaks_for Name (PR (Staff Bob)) ⇒
         (M,Oi,Os) sat
         Name (PR (Role CA)) controls
         Name (Key (Staff Bob)) speaks_for Name (PR (Staff Bob)) ⇒
         (M,Oi,Os) sat prop activate

   [ApRuleStandDown_thm]  Theorem

      |- (M,Oi,Os) sat Name (PR (Role Operator)) controls prop abort ⇒
         (M,Oi,Os) sat
         reps (Name (PR (Staff Bob))) (Name (PR (Role Operator)))
           (prop abort) ⇒
         (M,Oi,Os) sat
         Name (Key (Staff Bob)) quoting Name (PR (Role Operator)) says
         prop abort ⇒
         (M,Oi,Os) sat prop abort impf prop stand_down ⇒
         (M,Oi,Os) sat
         Name (Key (Role CA)) speaks_for Name (PR (Role CA)) ⇒
         (M,Oi,Os) sat
         Name (Key (Role CA)) says
         Name (Key (Staff Bob)) speaks_for Name (PR (Staff Bob)) ⇒
         (M,Oi,Os) sat
         Name (PR (Role CA)) controls
         Name (Key (Staff Bob)) speaks_for Name (PR (Staff Bob)) ⇒
         (M,Oi,Os) sat prop stand_down

   [OpRuleAbort_thm]  Theorem

      |- (M,Oi,Os) sat Name (PR (Role Commander)) controls prop nogo ⇒
         (M,Oi,Os) sat
         reps (Name (PR (Staff Alice))) (Name (PR (Role Commander)))
           (prop nogo) ⇒
         (M,Oi,Os) sat
         Name (Key (Staff Alice)) quoting Name (PR (Role Commander)) says
         prop nogo ⇒
         (M,Oi,Os) sat prop nogo impf prop abort ⇒
         (M,Oi,Os) sat
         Name (Key (Role CA)) speaks_for Name (PR (Role CA)) ⇒
         (M,Oi,Os) sat
         Name (Key (Role CA)) says
         Name (Key (Staff Alice)) speaks_for Name (PR (Staff Alice)) ⇒
         (M,Oi,Os) sat
         Name (PR (Role CA)) controls
         Name (Key (Staff Alice)) speaks_for Name (PR (Staff Alice)) ⇒
         (M,Oi,Os) sat
         Name (Key (Staff Bob)) quoting Name (PR (Role Operator)) says
         prop abort

   [OpRuleLaunch_thm]  Theorem

      |- (M,Oi,Os) sat Name (PR (Role Commander)) controls prop go ⇒
         (M,Oi,Os) sat
         reps (Name (PR (Staff Alice))) (Name (PR (Role Commander)))
           (prop go) ⇒
         (M,Oi,Os) sat
         Name (Key (Staff Alice)) quoting Name (PR (Role Commander)) says
         prop go ⇒
         (M,Oi,Os) sat prop go impf prop launch ⇒
         (M,Oi,Os) sat
         Name (Key (Role CA)) speaks_for Name (PR (Role CA)) ⇒
         (M,Oi,Os) sat
         Name (Key (Role CA)) says
         Name (Key (Staff Alice)) speaks_for Name (PR (Staff Alice)) ⇒
         (M,Oi,Os) sat
         Name (PR (Role CA)) controls
         Name (Key (Staff Alice)) speaks_for Name (PR (Staff Alice)) ⇒
         (M,Oi,Os) sat
         Name (Key (Staff Bob)) quoting Name (PR (Role Operator)) says
         prop launch

   [commands2num_11]  Theorem

      |- ∀a a'. (commands2num a = commands2num a') ⇔ (a = a')

   [commands2num_ONTO]  Theorem

      |- ∀r. r < 6 ⇔ ∃a. r = commands2num a

   [commands2num_num2commands]  Theorem

      |- ∀r. r < 6 ⇔ (commands2num (num2commands r) = r)

   [commands2num_thm]  Theorem

      |- (commands2num go = 0) ∧ (commands2num nogo = 1) ∧
         (commands2num launch = 2) ∧ (commands2num abort = 3) ∧
         (commands2num activate = 4) ∧ (commands2num stand_down = 5)

   [commands_Axiom]  Theorem

      |- ∀x0 x1 x2 x3 x4 x5.
           ∃f.
             (f go = x0) ∧ (f nogo = x1) ∧ (f launch = x2) ∧
             (f abort = x3) ∧ (f activate = x4) ∧ (f stand_down = x5)

   [commands_EQ_commands]  Theorem

      |- ∀a a'. (a = a') ⇔ (commands2num a = commands2num a')

   [commands_case_cong]  Theorem

      |- ∀M M' v0 v1 v2 v3 v4 v5.
           (M = M') ∧ ((M' = go) ⇒ (v0 = v0')) ∧
           ((M' = nogo) ⇒ (v1 = v1')) ∧ ((M' = launch) ⇒ (v2 = v2')) ∧
           ((M' = abort) ⇒ (v3 = v3')) ∧ ((M' = activate) ⇒ (v4 = v4')) ∧
           ((M' = stand_down) ⇒ (v5 = v5')) ⇒
           ((case M of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3
             | activate => v4
             | stand_down => v5) =
            case M' of
              go => v0'
            | nogo => v1'
            | launch => v2'
            | abort => v3'
            | activate => v4'
            | stand_down => v5')

   [commands_case_def]  Theorem

      |- (∀v0 v1 v2 v3 v4 v5.
            (case go of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3
             | activate => v4
             | stand_down => v5) =
            v0) ∧
         (∀v0 v1 v2 v3 v4 v5.
            (case nogo of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3
             | activate => v4
             | stand_down => v5) =
            v1) ∧
         (∀v0 v1 v2 v3 v4 v5.
            (case launch of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3
             | activate => v4
             | stand_down => v5) =
            v2) ∧
         (∀v0 v1 v2 v3 v4 v5.
            (case abort of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3
             | activate => v4
             | stand_down => v5) =
            v3) ∧
         (∀v0 v1 v2 v3 v4 v5.
            (case activate of
               go => v0
             | nogo => v1
             | launch => v2
             | abort => v3
             | activate => v4
             | stand_down => v5) =
            v4) ∧
         ∀v0 v1 v2 v3 v4 v5.
           (case stand_down of
              go => v0
            | nogo => v1
            | launch => v2
            | abort => v3
            | activate => v4
            | stand_down => v5) =
           v5

   [commands_distinct]  Theorem

      |- go ≠ nogo ∧ go ≠ launch ∧ go ≠ abort ∧ go ≠ activate ∧
         go ≠ stand_down ∧ nogo ≠ launch ∧ nogo ≠ abort ∧ nogo ≠ activate ∧
         nogo ≠ stand_down ∧ launch ≠ abort ∧ launch ≠ activate ∧
         launch ≠ stand_down ∧ abort ≠ activate ∧ abort ≠ stand_down ∧
         activate ≠ stand_down

   [commands_induction]  Theorem

      |- ∀P.
           P abort ∧ P activate ∧ P go ∧ P launch ∧ P nogo ∧ P stand_down ⇒
           ∀a. P a

   [commands_nchotomy]  Theorem

      |- ∀a.
           (a = go) ∨ (a = nogo) ∨ (a = launch) ∨ (a = abort) ∨
           (a = activate) ∨ (a = stand_down)

   [datatype_commands]  Theorem

      |- DATATYPE (commands go nogo launch abort activate stand_down)

   [datatype_keyPrinc]  Theorem

      |- DATATYPE (keyPrinc Staff Role Ap)

   [datatype_people]  Theorem

      |- DATATYPE (people Alice Bob)

   [datatype_principals]  Theorem

      |- DATATYPE (principals PR Key)

   [datatype_roles]  Theorem

      |- DATATYPE (roles Commander Operator CA)

   [keyPrinc_11]  Theorem

      |- (∀a a'. (Staff a = Staff a') ⇔ (a = a')) ∧
         (∀a a'. (Role a = Role a') ⇔ (a = a')) ∧
         ∀a a'. (Ap a = Ap a') ⇔ (a = a')

   [keyPrinc_Axiom]  Theorem

      |- ∀f0 f1 f2.
           ∃fn.
             (∀a. fn (Staff a) = f0 a) ∧ (∀a. fn (Role a) = f1 a) ∧
             ∀a. fn (Ap a) = f2 a

   [keyPrinc_case_cong]  Theorem

      |- ∀M M' f f1 f2.
           (M = M') ∧ (∀a. (M' = Staff a) ⇒ (f a = f' a)) ∧
           (∀a. (M' = Role a) ⇒ (f1 a = f1' a)) ∧
           (∀a. (M' = Ap a) ⇒ (f2 a = f2' a)) ⇒
           (keyPrinc_CASE M f f1 f2 = keyPrinc_CASE M' f' f1' f2')

   [keyPrinc_distinct]  Theorem

      |- (∀a' a. Staff a ≠ Role a') ∧ (∀a' a. Staff a ≠ Ap a') ∧
         ∀a' a. Role a ≠ Ap a'

   [keyPrinc_induction]  Theorem

      |- ∀P.
           (∀p. P (Staff p)) ∧ (∀r. P (Role r)) ∧ (∀n. P (Ap n)) ⇒ ∀k. P k

   [keyPrinc_nchotomy]  Theorem

      |- ∀kk. (∃p. kk = Staff p) ∨ (∃r. kk = Role r) ∨ ∃n. kk = Ap n

   [num2commands_11]  Theorem

      |- ∀r r'.
           r < 6 ⇒ r' < 6 ⇒ ((num2commands r = num2commands r') ⇔ (r = r'))

   [num2commands_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2commands r) ∧ r < 6

   [num2commands_commands2num]  Theorem

      |- ∀a. num2commands (commands2num a) = a

   [num2commands_thm]  Theorem

      |- (num2commands 0 = go) ∧ (num2commands 1 = nogo) ∧
         (num2commands 2 = launch) ∧ (num2commands 3 = abort) ∧
         (num2commands 4 = activate) ∧ (num2commands 5 = stand_down)

   [num2people_11]  Theorem

      |- ∀r r'.
           r < 2 ⇒ r' < 2 ⇒ ((num2people r = num2people r') ⇔ (r = r'))

   [num2people_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2people r) ∧ r < 2

   [num2people_people2num]  Theorem

      |- ∀a. num2people (people2num a) = a

   [num2people_thm]  Theorem

      |- (num2people 0 = Alice) ∧ (num2people 1 = Bob)

   [num2roles_11]  Theorem

      |- ∀r r'. r < 3 ⇒ r' < 3 ⇒ ((num2roles r = num2roles r') ⇔ (r = r'))

   [num2roles_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2roles r) ∧ r < 3

   [num2roles_roles2num]  Theorem

      |- ∀a. num2roles (roles2num a) = a

   [num2roles_thm]  Theorem

      |- (num2roles 0 = Commander) ∧ (num2roles 1 = Operator) ∧
         (num2roles 2 = CA)

   [people2num_11]  Theorem

      |- ∀a a'. (people2num a = people2num a') ⇔ (a = a')

   [people2num_ONTO]  Theorem

      |- ∀r. r < 2 ⇔ ∃a. r = people2num a

   [people2num_num2people]  Theorem

      |- ∀r. r < 2 ⇔ (people2num (num2people r) = r)

   [people2num_thm]  Theorem

      |- (people2num Alice = 0) ∧ (people2num Bob = 1)

   [people_Axiom]  Theorem

      |- ∀x0 x1. ∃f. (f Alice = x0) ∧ (f Bob = x1)

   [people_EQ_people]  Theorem

      |- ∀a a'. (a = a') ⇔ (people2num a = people2num a')

   [people_case_cong]  Theorem

      |- ∀M M' v0 v1.
           (M = M') ∧ ((M' = Alice) ⇒ (v0 = v0')) ∧
           ((M' = Bob) ⇒ (v1 = v1')) ⇒
           ((case M of Alice => v0 | Bob => v1) =
            case M' of Alice => v0' | Bob => v1')

   [people_case_def]  Theorem

      |- (∀v0 v1. (case Alice of Alice => v0 | Bob => v1) = v0) ∧
         ∀v0 v1. (case Bob of Alice => v0 | Bob => v1) = v1

   [people_distinct]  Theorem

      |- Alice ≠ Bob

   [people_induction]  Theorem

      |- ∀P. P Alice ∧ P Bob ⇒ ∀a. P a

   [people_nchotomy]  Theorem

      |- ∀a. (a = Alice) ∨ (a = Bob)

   [principals_11]  Theorem

      |- (∀a a'. (PR a = PR a') ⇔ (a = a')) ∧
         ∀a a'. (Key a = Key a') ⇔ (a = a')

   [principals_Axiom]  Theorem

      |- ∀f0 f1. ∃fn. (∀a. fn (PR a) = f0 a) ∧ ∀a. fn (Key a) = f1 a

   [principals_case_cong]  Theorem

      |- ∀M M' f f1.
           (M = M') ∧ (∀a. (M' = PR a) ⇒ (f a = f' a)) ∧
           (∀a. (M' = Key a) ⇒ (f1 a = f1' a)) ⇒
           (principals_CASE M f f1 = principals_CASE M' f' f1')

   [principals_distinct]  Theorem

      |- ∀a' a. PR a ≠ Key a'

   [principals_induction]  Theorem

      |- ∀P. (∀k. P (PR k)) ∧ (∀k. P (Key k)) ⇒ ∀p. P p

   [principals_nchotomy]  Theorem

      |- ∀pp. (∃k. pp = PR k) ∨ ∃k. pp = Key k

   [roles2num_11]  Theorem

      |- ∀a a'. (roles2num a = roles2num a') ⇔ (a = a')

   [roles2num_ONTO]  Theorem

      |- ∀r. r < 3 ⇔ ∃a. r = roles2num a

   [roles2num_num2roles]  Theorem

      |- ∀r. r < 3 ⇔ (roles2num (num2roles r) = r)

   [roles2num_thm]  Theorem

      |- (roles2num Commander = 0) ∧ (roles2num Operator = 1) ∧
         (roles2num CA = 2)

   [roles_Axiom]  Theorem

      |- ∀x0 x1 x2.
           ∃f. (f Commander = x0) ∧ (f Operator = x1) ∧ (f CA = x2)

   [roles_EQ_roles]  Theorem

      |- ∀a a'. (a = a') ⇔ (roles2num a = roles2num a')

   [roles_case_cong]  Theorem

      |- ∀M M' v0 v1 v2.
           (M = M') ∧ ((M' = Commander) ⇒ (v0 = v0')) ∧
           ((M' = Operator) ⇒ (v1 = v1')) ∧ ((M' = CA) ⇒ (v2 = v2')) ⇒
           ((case M of Commander => v0 | Operator => v1 | CA => v2) =
            case M' of Commander => v0' | Operator => v1' | CA => v2')

   [roles_case_def]  Theorem

      |- (∀v0 v1 v2.
            (case Commander of
               Commander => v0
             | Operator => v1
             | CA => v2) =
            v0) ∧
         (∀v0 v1 v2.
            (case Operator of
               Commander => v0
             | Operator => v1
             | CA => v2) =
            v1) ∧
         ∀v0 v1 v2.
           (case CA of Commander => v0 | Operator => v1 | CA => v2) = v2

   [roles_distinct]  Theorem

      |- Commander ≠ Operator ∧ Commander ≠ CA ∧ Operator ≠ CA

   [roles_induction]  Theorem

      |- ∀P. P CA ∧ P Commander ∧ P Operator ⇒ ∀a. P a

   [roles_nchotomy]  Theorem

      |- ∀a. (a = Commander) ∨ (a = Operator) ∨ (a = CA)


*)
end
