signature principalTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val authority_TY_DEF : thm
    val authority_case_def : thm
    val authority_size_def : thm
    val principal_TY_DEF : thm
    val principal_case_def : thm
    val principal_size_def : thm
    val role_BIJ : thm
    val role_CASE : thm
    val role_TY_DEF : thm
    val role_size_def : thm
    val staff_BIJ : thm
    val staff_CASE : thm
    val staff_TY_DEF : thm
    val staff_size_def : thm

  (*  Theorems  *)
    val authority_11 : thm
    val authority_Axiom : thm
    val authority_case_cong : thm
    val authority_induction : thm
    val authority_nchotomy : thm
    val authority_one_one : thm
    val datatype_authority : thm
    val datatype_principal : thm
    val datatype_role : thm
    val datatype_staff : thm
    val num2role_11 : thm
    val num2role_ONTO : thm
    val num2role_role2num : thm
    val num2role_thm : thm
    val num2staff_11 : thm
    val num2staff_ONTO : thm
    val num2staff_staff2num : thm
    val num2staff_thm : thm
    val principal_11 : thm
    val principal_Axiom : thm
    val principal_case_cong : thm
    val principal_distinct : thm
    val principal_distinct_clauses : thm
    val principal_induction : thm
    val principal_nchotomy : thm
    val principal_one_one : thm
    val role2num_11 : thm
    val role2num_ONTO : thm
    val role2num_num2role : thm
    val role2num_thm : thm
    val role_Axiom : thm
    val role_EQ_role : thm
    val role_case_cong : thm
    val role_case_def : thm
    val role_distinct : thm
    val role_distinct_clauses : thm
    val role_induction : thm
    val role_nchotomy : thm
    val staff2num_11 : thm
    val staff2num_ONTO : thm
    val staff2num_num2staff : thm
    val staff2num_thm : thm
    val staff_Axiom : thm
    val staff_EQ_staff : thm
    val staff_case_cong : thm
    val staff_case_def : thm
    val staff_distinct : thm
    val staff_distinct_clauses : thm
    val staff_induction : thm
    val staff_nchotomy : thm

  val principal_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [cipher] Parent theory of "principal"

   [authority_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'authority' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa. ind_type$CONSTR 0 a (λn. ind_type$BOTTOM))
                          a) ⇒
                     'authority' a0) ⇒
                  'authority' a0) rep

   [authority_case_def]  Definition

      |- ∀a f. authority_CASE (ca a) f = f a

   [authority_size_def]  Definition

      |- ∀a. authority_size (ca a) = 1 + a

   [principal_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'principal' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR 0 (a,ARB,ARB,ARB,ARB,ARB)
                             (λn. ind_type$BOTTOM)) a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC 0) (ARB,a,ARB,ARB,ARB,ARB)
                             (λn. ind_type$BOTTOM)) a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC (SUC 0))
                             (ARB,ARB,a,ARB,ARB,ARB) (λn. ind_type$BOTTOM))
                          a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC (SUC (SUC 0)))
                             (ARB,ARB,ARB,a,ARB,ARB) (λn. ind_type$BOTTOM))
                          a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC (SUC (SUC (SUC 0))))
                             (ARB,ARB,ARB,ARB,a,ARB) (λn. ind_type$BOTTOM))
                          a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC (SUC (SUC (SUC (SUC 0)))))
                             (ARB,ARB,ARB,ARB,ARB,a) (λn. ind_type$BOTTOM))
                          a) ⇒
                     'principal' a0) ⇒
                  'principal' a0) rep

   [principal_case_def]  Definition

      |- (∀a f f1 f2 f3 f4 f5.
            principal_CASE (Staff a) f f1 f2 f3 f4 f5 = f a) ∧
         (∀a f f1 f2 f3 f4 f5.
            principal_CASE (Authority a) f f1 f2 f3 f4 f5 = f1 a) ∧
         (∀a f f1 f2 f3 f4 f5.
            principal_CASE (Role a) f f1 f2 f3 f4 f5 = f2 a) ∧
         (∀a f f1 f2 f3 f4 f5.
            principal_CASE (KeyS a) f f1 f2 f3 f4 f5 = f3 a) ∧
         (∀a f f1 f2 f3 f4 f5.
            principal_CASE (KeyA a) f f1 f2 f3 f4 f5 = f4 a) ∧
         ∀a f f1 f2 f3 f4 f5.
           principal_CASE (Machine a) f f1 f2 f3 f4 f5 = f5 a

   [principal_size_def]  Definition

      |- (∀a. principal_size (Staff a) = 1 + staff_size a) ∧
         (∀a. principal_size (Authority a) = 1 + authority_size a) ∧
         (∀a. principal_size (Role a) = 1 + role_size a) ∧
         (∀a. principal_size (KeyS a) = 1 + pKey_size staff_size a) ∧
         (∀a. principal_size (KeyA a) = 1 + pKey_size authority_size a) ∧
         ∀a. principal_size (Machine a) = 1 + a

   [role_BIJ]  Definition

      |- (∀a. num2role (role2num a) = a) ∧
         ∀r. (λn. n < 2) r ⇔ (role2num (num2role r) = r)

   [role_CASE]  Definition

      |- ∀x v0 v1.
           (case x of Commander => v0 | Operator => v1) =
           (λm. if m = 0 then v0 else v1) (role2num x)

   [role_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 2) rep

   [role_size_def]  Definition

      |- ∀x. role_size x = 0

   [staff_BIJ]  Definition

      |- (∀a. num2staff (staff2num a) = a) ∧
         ∀r. (λn. n < 3) r ⇔ (staff2num (num2staff r) = r)

   [staff_CASE]  Definition

      |- ∀x v0 v1 v2.
           (case x of Alice => v0 | Bob => v1 | Carol => v2) =
           (λm. if m < 1 then v0 else if m = 1 then v1 else v2)
             (staff2num x)

   [staff_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 3) rep

   [staff_size_def]  Definition

      |- ∀x. staff_size x = 0

   [authority_11]  Theorem

      |- ∀a a'. (ca a = ca a') ⇔ (a = a')

   [authority_Axiom]  Theorem

      |- ∀f. ∃fn. ∀a. fn (ca a) = f a

   [authority_case_cong]  Theorem

      |- ∀M M' f.
           (M = M') ∧ (∀a. (M' = ca a) ⇒ (f a = f' a)) ⇒
           (authority_CASE M f = authority_CASE M' f')

   [authority_induction]  Theorem

      |- ∀P. (∀n. P (ca n)) ⇒ ∀a. P a

   [authority_nchotomy]  Theorem

      |- ∀aa. ∃n. aa = ca n

   [authority_one_one]  Theorem

      |- ∀a a'. (ca a = ca a') ⇔ (a = a')

   [datatype_authority]  Theorem

      |- DATATYPE (authority ca)

   [datatype_principal]  Theorem

      |- DATATYPE (principal Staff Authority Role KeyS KeyA Machine)

   [datatype_role]  Theorem

      |- DATATYPE (role Commander Operator)

   [datatype_staff]  Theorem

      |- DATATYPE (staff Alice Bob Carol)

   [num2role_11]  Theorem

      |- ∀r r'. r < 2 ⇒ r' < 2 ⇒ ((num2role r = num2role r') ⇔ (r = r'))

   [num2role_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2role r) ∧ r < 2

   [num2role_role2num]  Theorem

      |- ∀a. num2role (role2num a) = a

   [num2role_thm]  Theorem

      |- (num2role 0 = Commander) ∧ (num2role 1 = Operator)

   [num2staff_11]  Theorem

      |- ∀r r'. r < 3 ⇒ r' < 3 ⇒ ((num2staff r = num2staff r') ⇔ (r = r'))

   [num2staff_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2staff r) ∧ r < 3

   [num2staff_staff2num]  Theorem

      |- ∀a. num2staff (staff2num a) = a

   [num2staff_thm]  Theorem

      |- (num2staff 0 = Alice) ∧ (num2staff 1 = Bob) ∧
         (num2staff 2 = Carol)

   [principal_11]  Theorem

      |- (∀a a'. (Staff a = Staff a') ⇔ (a = a')) ∧
         (∀a a'. (Authority a = Authority a') ⇔ (a = a')) ∧
         (∀a a'. (Role a = Role a') ⇔ (a = a')) ∧
         (∀a a'. (KeyS a = KeyS a') ⇔ (a = a')) ∧
         (∀a a'. (KeyA a = KeyA a') ⇔ (a = a')) ∧
         ∀a a'. (Machine a = Machine a') ⇔ (a = a')

   [principal_Axiom]  Theorem

      |- ∀f0 f1 f2 f3 f4 f5.
           ∃fn.
             (∀a. fn (Staff a) = f0 a) ∧ (∀a. fn (Authority a) = f1 a) ∧
             (∀a. fn (Role a) = f2 a) ∧ (∀a. fn (KeyS a) = f3 a) ∧
             (∀a. fn (KeyA a) = f4 a) ∧ ∀a. fn (Machine a) = f5 a

   [principal_case_cong]  Theorem

      |- ∀M M' f f1 f2 f3 f4 f5.
           (M = M') ∧ (∀a. (M' = Staff a) ⇒ (f a = f' a)) ∧
           (∀a. (M' = Authority a) ⇒ (f1 a = f1' a)) ∧
           (∀a. (M' = Role a) ⇒ (f2 a = f2' a)) ∧
           (∀a. (M' = KeyS a) ⇒ (f3 a = f3' a)) ∧
           (∀a. (M' = KeyA a) ⇒ (f4 a = f4' a)) ∧
           (∀a. (M' = Machine a) ⇒ (f5 a = f5' a)) ⇒
           (principal_CASE M f f1 f2 f3 f4 f5 =
            principal_CASE M' f' f1' f2' f3' f4' f5')

   [principal_distinct]  Theorem

      |- (∀a' a. Staff a ≠ Authority a') ∧ (∀a' a. Staff a ≠ Role a') ∧
         (∀a' a. Staff a ≠ KeyS a') ∧ (∀a' a. Staff a ≠ KeyA a') ∧
         (∀a' a. Staff a ≠ Machine a') ∧ (∀a' a. Authority a ≠ Role a') ∧
         (∀a' a. Authority a ≠ KeyS a') ∧ (∀a' a. Authority a ≠ KeyA a') ∧
         (∀a' a. Authority a ≠ Machine a') ∧ (∀a' a. Role a ≠ KeyS a') ∧
         (∀a' a. Role a ≠ KeyA a') ∧ (∀a' a. Role a ≠ Machine a') ∧
         (∀a' a. KeyS a ≠ KeyA a') ∧ (∀a' a. KeyS a ≠ Machine a') ∧
         ∀a' a. KeyA a ≠ Machine a'

   [principal_distinct_clauses]  Theorem

      |- (∀a' a. Staff a ≠ Authority a') ∧ (∀a' a. Staff a ≠ Role a') ∧
         (∀a' a. Staff a ≠ KeyS a') ∧ (∀a' a. Staff a ≠ KeyA a') ∧
         (∀a' a. Staff a ≠ Machine a') ∧ (∀a' a. Authority a ≠ Role a') ∧
         (∀a' a. Authority a ≠ KeyS a') ∧ (∀a' a. Authority a ≠ KeyA a') ∧
         (∀a' a. Authority a ≠ Machine a') ∧ (∀a' a. Role a ≠ KeyS a') ∧
         (∀a' a. Role a ≠ KeyA a') ∧ (∀a' a. Role a ≠ Machine a') ∧
         (∀a' a. KeyS a ≠ KeyA a') ∧ (∀a' a. KeyS a ≠ Machine a') ∧
         ∀a' a. KeyA a ≠ Machine a'

   [principal_induction]  Theorem

      |- ∀P.
           (∀s. P (Staff s)) ∧ (∀a. P (Authority a)) ∧ (∀r. P (Role r)) ∧
           (∀p. P (KeyS p)) ∧ (∀p. P (KeyA p)) ∧ (∀n. P (Machine n)) ⇒
           ∀p. P p

   [principal_nchotomy]  Theorem

      |- ∀pp.
           (∃s. pp = Staff s) ∨ (∃a. pp = Authority a) ∨
           (∃r. pp = Role r) ∨ (∃p. pp = KeyS p) ∨ (∃p. pp = KeyA p) ∨
           ∃n. pp = Machine n

   [principal_one_one]  Theorem

      |- (∀a a'. (Staff a = Staff a') ⇔ (a = a')) ∧
         (∀a a'. (Authority a = Authority a') ⇔ (a = a')) ∧
         (∀a a'. (Role a = Role a') ⇔ (a = a')) ∧
         (∀a a'. (KeyS a = KeyS a') ⇔ (a = a')) ∧
         (∀a a'. (KeyA a = KeyA a') ⇔ (a = a')) ∧
         ∀a a'. (Machine a = Machine a') ⇔ (a = a')

   [role2num_11]  Theorem

      |- ∀a a'. (role2num a = role2num a') ⇔ (a = a')

   [role2num_ONTO]  Theorem

      |- ∀r. r < 2 ⇔ ∃a. r = role2num a

   [role2num_num2role]  Theorem

      |- ∀r. r < 2 ⇔ (role2num (num2role r) = r)

   [role2num_thm]  Theorem

      |- (role2num Commander = 0) ∧ (role2num Operator = 1)

   [role_Axiom]  Theorem

      |- ∀x0 x1. ∃f. (f Commander = x0) ∧ (f Operator = x1)

   [role_EQ_role]  Theorem

      |- ∀a a'. (a = a') ⇔ (role2num a = role2num a')

   [role_case_cong]  Theorem

      |- ∀M M' v0 v1.
           (M = M') ∧ ((M' = Commander) ⇒ (v0 = v0')) ∧
           ((M' = Operator) ⇒ (v1 = v1')) ⇒
           ((case M of Commander => v0 | Operator => v1) =
            case M' of Commander => v0' | Operator => v1')

   [role_case_def]  Theorem

      |- (∀v0 v1.
            (case Commander of Commander => v0 | Operator => v1) = v0) ∧
         ∀v0 v1. (case Operator of Commander => v0 | Operator => v1) = v1

   [role_distinct]  Theorem

      |- Commander ≠ Operator

   [role_distinct_clauses]  Theorem

      |- Commander ≠ Operator

   [role_induction]  Theorem

      |- ∀P. P Commander ∧ P Operator ⇒ ∀a. P a

   [role_nchotomy]  Theorem

      |- ∀a. (a = Commander) ∨ (a = Operator)

   [staff2num_11]  Theorem

      |- ∀a a'. (staff2num a = staff2num a') ⇔ (a = a')

   [staff2num_ONTO]  Theorem

      |- ∀r. r < 3 ⇔ ∃a. r = staff2num a

   [staff2num_num2staff]  Theorem

      |- ∀r. r < 3 ⇔ (staff2num (num2staff r) = r)

   [staff2num_thm]  Theorem

      |- (staff2num Alice = 0) ∧ (staff2num Bob = 1) ∧
         (staff2num Carol = 2)

   [staff_Axiom]  Theorem

      |- ∀x0 x1 x2. ∃f. (f Alice = x0) ∧ (f Bob = x1) ∧ (f Carol = x2)

   [staff_EQ_staff]  Theorem

      |- ∀a a'. (a = a') ⇔ (staff2num a = staff2num a')

   [staff_case_cong]  Theorem

      |- ∀M M' v0 v1 v2.
           (M = M') ∧ ((M' = Alice) ⇒ (v0 = v0')) ∧
           ((M' = Bob) ⇒ (v1 = v1')) ∧ ((M' = Carol) ⇒ (v2 = v2')) ⇒
           ((case M of Alice => v0 | Bob => v1 | Carol => v2) =
            case M' of Alice => v0' | Bob => v1' | Carol => v2')

   [staff_case_def]  Theorem

      |- (∀v0 v1 v2.
            (case Alice of Alice => v0 | Bob => v1 | Carol => v2) = v0) ∧
         (∀v0 v1 v2.
            (case Bob of Alice => v0 | Bob => v1 | Carol => v2) = v1) ∧
         ∀v0 v1 v2.
           (case Carol of Alice => v0 | Bob => v1 | Carol => v2) = v2

   [staff_distinct]  Theorem

      |- Alice ≠ Bob ∧ Alice ≠ Carol ∧ Bob ≠ Carol

   [staff_distinct_clauses]  Theorem

      |- Alice ≠ Bob ∧ Alice ≠ Carol ∧ Bob ≠ Carol

   [staff_induction]  Theorem

      |- ∀P. P Alice ∧ P Bob ∧ P Carol ⇒ ∀a. P a

   [staff_nchotomy]  Theorem

      |- ∀a. (a = Alice) ∨ (a = Bob) ∨ (a = Carol)


*)
end
