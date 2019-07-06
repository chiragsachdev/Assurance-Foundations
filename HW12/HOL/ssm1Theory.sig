signature ssm1Theory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val TR_def : thm
    val configuration_TY_DEF : thm
    val configuration_case_def : thm
    val configuration_size_def : thm
    val inst_TY_DEF : thm
    val inst_case_def : thm
    val inst_size_def : thm
    val trType_TY_DEF : thm
    val trType_case_def : thm
    val trType_size_def : thm

  (*  Theorems  *)
    val CFGInterpret_def : thm
    val CFGInterpret_ind : thm
    val TR_EQ_rules_thm : thm
    val TR_cases : thm
    val TR_discard_cmd_rule : thm
    val TR_exec_cmd_rule : thm
    val TR_ind : thm
    val TR_rules : thm
    val TR_strongind : thm
    val TR_trap_cmd_rule : thm
    val TRrule0 : thm
    val TRrule1 : thm
    val configuration_11 : thm
    val configuration_Axiom : thm
    val configuration_case_cong : thm
    val configuration_induction : thm
    val configuration_nchotomy : thm
    val configuration_one_one : thm
    val datatype_configuration : thm
    val datatype_inst : thm
    val datatype_trType : thm
    val inst_11 : thm
    val inst_Axiom : thm
    val inst_case_cong : thm
    val inst_distinct : thm
    val inst_distinct_clauses : thm
    val inst_induction : thm
    val inst_nchotomy : thm
    val inst_one_one : thm
    val trType_11 : thm
    val trType_Axiom : thm
    val trType_case_cong : thm
    val trType_distinct : thm
    val trType_distinct_clauses : thm
    val trType_induction : thm
    val trType_nchotomy : thm
    val trType_one_one : thm

  val ssm1_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [satList] Parent theory of "ssm1"

   [TR_def]  Definition

      |- TR =
         (λa0 a1 a2 a3.
            ∀TR'.
              (∀a0 a1 a2 a3.
                 (∃inputTest P NS M Oi Os Out s certList stateInterp cmd
                     ins outs.
                    (a0 = (M,Oi,Os)) ∧ (a1 = exec cmd) ∧
                    (a2 =
                     CFG inputTest stateInterp certList
                       (P says prop (SOME cmd)::ins) s outs) ∧
                    (a3 =
                     CFG inputTest stateInterp certList ins
                       (NS s (exec cmd)) (Out s (exec cmd)::outs)) ∧
                    inputTest (P says prop (SOME cmd)) ∧
                    CFGInterpret (M,Oi,Os)
                      (CFG inputTest stateInterp certList
                         (P says prop (SOME cmd)::ins) s outs)) ∨
                 (∃inputTest P NS M Oi Os Out s certList stateInterp cmd
                     ins outs.
                    (a0 = (M,Oi,Os)) ∧ (a1 = trap cmd) ∧
                    (a2 =
                     CFG inputTest stateInterp certList
                       (P says prop (SOME cmd)::ins) s outs) ∧
                    (a3 =
                     CFG inputTest stateInterp certList ins
                       (NS s (trap cmd)) (Out s (trap cmd)::outs)) ∧
                    inputTest (P says prop (SOME cmd)) ∧
                    CFGInterpret (M,Oi,Os)
                      (CFG inputTest stateInterp certList
                         (P says prop (SOME cmd)::ins) s outs)) ∨
                 (∃inputTest NS M Oi Os Out s certList stateInterp cmd x
                     ins outs.
                    (a0 = (M,Oi,Os)) ∧ (a1 = discard) ∧
                    (a2 =
                     CFG inputTest stateInterp certList (x::ins) s outs) ∧
                    (a3 =
                     CFG inputTest stateInterp certList ins (NS s discard)
                       (Out s discard::outs)) ∧ ¬inputTest x) ⇒
                 TR' a0 a1 a2 a3) ⇒
              TR' a0 a1 a2 a3)

   [configuration_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0'.
                ∀'configuration' .
                  (∀a0'.
                     (∃a0 a1 a2 a3 a4 a5.
                        a0' =
                        (λa0 a1 a2 a3 a4 a5.
                           ind_type$CONSTR 0 (a0,a1,a2,a3,a4,a5)
                             (λn. ind_type$BOTTOM)) a0 a1 a2 a3 a4 a5) ⇒
                     'configuration' a0') ⇒
                  'configuration' a0') rep

   [configuration_case_def]  Definition

      |- ∀a0 a1 a2 a3 a4 a5 f.
           configuration_CASE (CFG a0 a1 a2 a3 a4 a5) f =
           f a0 a1 a2 a3 a4 a5

   [configuration_size_def]  Definition

      |- ∀f f1 f2 f3 f4 f5 a0 a1 a2 a3 a4 a5.
           configuration_size f f1 f2 f3 f4 f5 (CFG a0 a1 a2 a3 a4 a5) =
           1 +
           (list_size (Form_size (inst_size f) f4 f1 f2) a2 +
            (list_size (Form_size (inst_size f) f4 f1 f2) a3 +
             (f5 a4 + list_size f3 a5)))

   [inst_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'inst' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa. ind_type$CONSTR 0 a (λn. ind_type$BOTTOM))
                          a) ∨
                     (a0 =
                      ind_type$CONSTR (SUC 0) ARB (λn. ind_type$BOTTOM)) ⇒
                     'inst' a0) ⇒
                  'inst' a0) rep

   [inst_case_def]  Definition

      |- (∀a f v. inst_CASE (SOME a) f v = f a) ∧
         ∀f v. inst_CASE NONE f v = v

   [inst_size_def]  Definition

      |- (∀f a. inst_size f (SOME a) = 1 + f a) ∧ ∀f. inst_size f NONE = 0

   [trType_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'trType' .
                  (∀a0.
                     (a0 = ind_type$CONSTR 0 ARB (λn. ind_type$BOTTOM)) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC 0) a (λn. ind_type$BOTTOM))
                          a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC (SUC 0)) a
                             (λn. ind_type$BOTTOM)) a) ⇒
                     'trType' a0) ⇒
                  'trType' a0) rep

   [trType_case_def]  Definition

      |- (∀v f f1. trType_CASE discard v f f1 = v) ∧
         (∀a v f f1. trType_CASE (trap a) v f f1 = f a) ∧
         ∀a v f f1. trType_CASE (exec a) v f f1 = f1 a

   [trType_size_def]  Definition

      |- (∀f. trType_size f discard = 0) ∧
         (∀f a. trType_size f (trap a) = 1 + f a) ∧
         ∀f a. trType_size f (exec a) = 1 + f a

   [CFGInterpret_def]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputTest stateInterp context (x::ins) state outStream) ⇔
         (M,Oi,Os) satList context ∧ (M,Oi,Os) sat x ∧
         (M,Oi,Os) sat stateInterp state

   [CFGInterpret_ind]  Theorem

      |- ∀P.
           (∀M Oi Os inputTest stateInterp context x ins state outStream.
              P (M,Oi,Os)
                (CFG inputTest stateInterp context (x::ins) state
                   outStream)) ∧
           (∀v15 v10 v11 v12 v13 v14. P v15 (CFG v10 v11 v12 [] v13 v14)) ⇒
           ∀v v1 v2 v3. P (v,v1,v2) v3

   [TR_EQ_rules_thm]  Theorem

      |- (TR (M,Oi,Os) (exec cmd)
            (CFG inputTest stateInterp certList
               (P says prop (SOME cmd)::ins) s outs)
            (CFG inputTest stateInterp certList ins (NS s (exec cmd))
               (Out s (exec cmd)::outs)) ⇔
          inputTest (P says prop (SOME cmd)) ∧
          CFGInterpret (M,Oi,Os)
            (CFG inputTest stateInterp certList
               (P says prop (SOME cmd)::ins) s outs)) ∧
         (TR (M,Oi,Os) (trap cmd)
            (CFG inputTest stateInterp certList
               (P says prop (SOME cmd)::ins) s outs)
            (CFG inputTest stateInterp certList ins (NS s (trap cmd))
               (Out s (trap cmd)::outs)) ⇔
          inputTest (P says prop (SOME cmd)) ∧
          CFGInterpret (M,Oi,Os)
            (CFG inputTest stateInterp certList
               (P says prop (SOME cmd)::ins) s outs)) ∧
         (TR (M,Oi,Os) discard
            (CFG inputTest stateInterp certList (x::ins) s outs)
            (CFG inputTest stateInterp certList ins (NS s discard)
               (Out s discard::outs)) ⇔ ¬inputTest x)

   [TR_cases]  Theorem

      |- ∀a0 a1 a2 a3.
           TR a0 a1 a2 a3 ⇔
           (∃inputTest P NS M Oi Os Out s certList stateInterp cmd ins
               outs.
              (a0 = (M,Oi,Os)) ∧ (a1 = exec cmd) ∧
              (a2 =
               CFG inputTest stateInterp certList
                 (P says prop (SOME cmd)::ins) s outs) ∧
              (a3 =
               CFG inputTest stateInterp certList ins (NS s (exec cmd))
                 (Out s (exec cmd)::outs)) ∧
              inputTest (P says prop (SOME cmd)) ∧
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs)) ∨
           (∃inputTest P NS M Oi Os Out s certList stateInterp cmd ins
               outs.
              (a0 = (M,Oi,Os)) ∧ (a1 = trap cmd) ∧
              (a2 =
               CFG inputTest stateInterp certList
                 (P says prop (SOME cmd)::ins) s outs) ∧
              (a3 =
               CFG inputTest stateInterp certList ins (NS s (trap cmd))
                 (Out s (trap cmd)::outs)) ∧
              inputTest (P says prop (SOME cmd)) ∧
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs)) ∨
           ∃inputTest NS M Oi Os Out s certList stateInterp cmd x ins outs.
             (a0 = (M,Oi,Os)) ∧ (a1 = discard) ∧
             (a2 = CFG inputTest stateInterp certList (x::ins) s outs) ∧
             (a3 =
              CFG inputTest stateInterp certList ins (NS s discard)
                (Out s discard::outs)) ∧ ¬inputTest x

   [TR_discard_cmd_rule]  Theorem

      |- TR (M,Oi,Os) discard
           (CFG inputTest stateInterp certList (x::ins) s outs)
           (CFG inputTest stateInterp certList ins (NS s discard)
              (Out s discard::outs)) ⇔ ¬inputTest x

   [TR_exec_cmd_rule]  Theorem

      |- ∀inputTest certList stateInterp P cmd ins s outs.
           (∀M Oi Os.
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs) ⇒
              (M,Oi,Os) sat prop (SOME cmd)) ⇒
           ∀NS Out M Oi Os.
             TR (M,Oi,Os) (exec cmd)
               (CFG inputTest stateInterp certList
                  (P says prop (SOME cmd)::ins) s outs)
               (CFG inputTest stateInterp certList ins (NS s (exec cmd))
                  (Out s (exec cmd)::outs)) ⇔
             inputTest (P says prop (SOME cmd)) ∧
             CFGInterpret (M,Oi,Os)
               (CFG inputTest stateInterp certList
                  (P says prop (SOME cmd)::ins) s outs) ∧
             (M,Oi,Os) sat prop (SOME cmd)

   [TR_ind]  Theorem

      |- ∀TR'.
           (∀inputTest P NS M Oi Os Out s certList stateInterp cmd ins
               outs.
              inputTest (P says prop (SOME cmd)) ∧
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs) ⇒
              TR' (M,Oi,Os) (exec cmd)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs)
                (CFG inputTest stateInterp certList ins (NS s (exec cmd))
                   (Out s (exec cmd)::outs))) ∧
           (∀inputTest P NS M Oi Os Out s certList stateInterp cmd ins
               outs.
              inputTest (P says prop (SOME cmd)) ∧
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs) ⇒
              TR' (M,Oi,Os) (trap cmd)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs)
                (CFG inputTest stateInterp certList ins (NS s (trap cmd))
                   (Out s (trap cmd)::outs))) ∧
           (∀inputTest NS M Oi Os Out s certList stateInterp cmd x ins
               outs.
              ¬inputTest x ⇒
              TR' (M,Oi,Os) discard
                (CFG inputTest stateInterp certList (x::ins) s outs)
                (CFG inputTest stateInterp certList ins (NS s discard)
                   (Out s discard::outs))) ⇒
           ∀a0 a1 a2 a3. TR a0 a1 a2 a3 ⇒ TR' a0 a1 a2 a3

   [TR_rules]  Theorem

      |- (∀inputTest P NS M Oi Os Out s certList stateInterp cmd ins outs.
            inputTest (P says prop (SOME cmd)) ∧
            CFGInterpret (M,Oi,Os)
              (CFG inputTest stateInterp certList
                 (P says prop (SOME cmd)::ins) s outs) ⇒
            TR (M,Oi,Os) (exec cmd)
              (CFG inputTest stateInterp certList
                 (P says prop (SOME cmd)::ins) s outs)
              (CFG inputTest stateInterp certList ins (NS s (exec cmd))
                 (Out s (exec cmd)::outs))) ∧
         (∀inputTest P NS M Oi Os Out s certList stateInterp cmd ins outs.
            inputTest (P says prop (SOME cmd)) ∧
            CFGInterpret (M,Oi,Os)
              (CFG inputTest stateInterp certList
                 (P says prop (SOME cmd)::ins) s outs) ⇒
            TR (M,Oi,Os) (trap cmd)
              (CFG inputTest stateInterp certList
                 (P says prop (SOME cmd)::ins) s outs)
              (CFG inputTest stateInterp certList ins (NS s (trap cmd))
                 (Out s (trap cmd)::outs))) ∧
         ∀inputTest NS M Oi Os Out s certList stateInterp cmd x ins outs.
           ¬inputTest x ⇒
           TR (M,Oi,Os) discard
             (CFG inputTest stateInterp certList (x::ins) s outs)
             (CFG inputTest stateInterp certList ins (NS s discard)
                (Out s discard::outs))

   [TR_strongind]  Theorem

      |- ∀TR'.
           (∀inputTest P NS M Oi Os Out s certList stateInterp cmd ins
               outs.
              inputTest (P says prop (SOME cmd)) ∧
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs) ⇒
              TR' (M,Oi,Os) (exec cmd)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs)
                (CFG inputTest stateInterp certList ins (NS s (exec cmd))
                   (Out s (exec cmd)::outs))) ∧
           (∀inputTest P NS M Oi Os Out s certList stateInterp cmd ins
               outs.
              inputTest (P says prop (SOME cmd)) ∧
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs) ⇒
              TR' (M,Oi,Os) (trap cmd)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs)
                (CFG inputTest stateInterp certList ins (NS s (trap cmd))
                   (Out s (trap cmd)::outs))) ∧
           (∀inputTest NS M Oi Os Out s certList stateInterp x ins outs.
              ¬inputTest x ⇒
              TR' (M,Oi,Os) discard
                (CFG inputTest stateInterp certList (x::ins) s outs)
                (CFG inputTest stateInterp certList ins (NS s discard)
                   (Out s discard::outs))) ⇒
           ∀a0 a1 a2 a3. TR a0 a1 a2 a3 ⇒ TR' a0 a1 a2 a3

   [TR_trap_cmd_rule]  Theorem

      |- ∀inputTest stateInterp certList P cmd ins s outs.
           (∀M Oi Os.
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterp certList
                   (P says prop (SOME cmd)::ins) s outs) ⇒
              (M,Oi,Os) sat prop NONE) ⇒
           ∀NS Out M Oi Os.
             TR (M,Oi,Os) (trap cmd)
               (CFG inputTest stateInterp certList
                  (P says prop (SOME cmd)::ins) s outs)
               (CFG inputTest stateInterp certList ins (NS s (trap cmd))
                  (Out s (trap cmd)::outs)) ⇔
             inputTest (P says prop (SOME cmd)) ∧
             CFGInterpret (M,Oi,Os)
               (CFG inputTest stateInterp certList
                  (P says prop (SOME cmd)::ins) s outs) ∧
             (M,Oi,Os) sat prop NONE

   [TRrule0]  Theorem

      |- TR (M,Oi,Os) (exec cmd)
           (CFG inputTest stateInterp certList
              (P says prop (SOME cmd)::ins) s outs)
           (CFG inputTest stateInterp certList ins (NS s (exec cmd))
              (Out s (exec cmd)::outs)) ⇔
         inputTest (P says prop (SOME cmd)) ∧
         CFGInterpret (M,Oi,Os)
           (CFG inputTest stateInterp certList
              (P says prop (SOME cmd)::ins) s outs)

   [TRrule1]  Theorem

      |- TR (M,Oi,Os) (trap cmd)
           (CFG inputTest stateInterp certList
              (P says prop (SOME cmd)::ins) s outs)
           (CFG inputTest stateInterp certList ins (NS s (trap cmd))
              (Out s (trap cmd)::outs)) ⇔
         inputTest (P says prop (SOME cmd)) ∧
         CFGInterpret (M,Oi,Os)
           (CFG inputTest stateInterp certList
              (P says prop (SOME cmd)::ins) s outs)

   [configuration_11]  Theorem

      |- ∀a0 a1 a2 a3 a4 a5 a0' a1' a2' a3' a4' a5'.
           (CFG a0 a1 a2 a3 a4 a5 = CFG a0' a1' a2' a3' a4' a5') ⇔
           (a0 = a0') ∧ (a1 = a1') ∧ (a2 = a2') ∧ (a3 = a3') ∧ (a4 = a4') ∧
           (a5 = a5')

   [configuration_Axiom]  Theorem

      |- ∀f.
           ∃fn.
             ∀a0 a1 a2 a3 a4 a5.
               fn (CFG a0 a1 a2 a3 a4 a5) = f a0 a1 a2 a3 a4 a5

   [configuration_case_cong]  Theorem

      |- ∀M M' f.
           (M = M') ∧
           (∀a0 a1 a2 a3 a4 a5.
              (M' = CFG a0 a1 a2 a3 a4 a5) ⇒
              (f a0 a1 a2 a3 a4 a5 = f' a0 a1 a2 a3 a4 a5)) ⇒
           (configuration_CASE M f = configuration_CASE M' f')

   [configuration_induction]  Theorem

      |- ∀P. (∀f f0 l l0 s l1. P (CFG f f0 l l0 s l1)) ⇒ ∀c. P c

   [configuration_nchotomy]  Theorem

      |- ∀cc. ∃f f0 l l0 s l1. cc = CFG f f0 l l0 s l1

   [configuration_one_one]  Theorem

      |- ∀a0 a1 a2 a3 a4 a5 a0' a1' a2' a3' a4' a5'.
           (CFG a0 a1 a2 a3 a4 a5 = CFG a0' a1' a2' a3' a4' a5') ⇔
           (a0 = a0') ∧ (a1 = a1') ∧ (a2 = a2') ∧ (a3 = a3') ∧ (a4 = a4') ∧
           (a5 = a5')

   [datatype_configuration]  Theorem

      |- DATATYPE (configuration CFG)

   [datatype_inst]  Theorem

      |- DATATYPE (inst SOME NONE)

   [datatype_trType]  Theorem

      |- DATATYPE (trType discard trap exec)

   [inst_11]  Theorem

      |- ∀a a'. (SOME a = SOME a') ⇔ (a = a')

   [inst_Axiom]  Theorem

      |- ∀f0 f1. ∃fn. (∀a. fn (SOME a) = f0 a) ∧ (fn NONE = f1)

   [inst_case_cong]  Theorem

      |- ∀M M' f v.
           (M = M') ∧ (∀a. (M' = SOME a) ⇒ (f a = f' a)) ∧
           ((M' = NONE) ⇒ (v = v')) ⇒
           (inst_CASE M f v = inst_CASE M' f' v')

   [inst_distinct]  Theorem

      |- ∀a. SOME a ≠ NONE

   [inst_distinct_clauses]  Theorem

      |- ∀a. SOME a ≠ NONE

   [inst_induction]  Theorem

      |- ∀P. (∀c. P (SOME c)) ∧ P NONE ⇒ ∀i. P i

   [inst_nchotomy]  Theorem

      |- ∀ii. (∃c. ii = SOME c) ∨ (ii = NONE)

   [inst_one_one]  Theorem

      |- ∀a a'. (SOME a = SOME a') ⇔ (a = a')

   [trType_11]  Theorem

      |- (∀a a'. (trap a = trap a') ⇔ (a = a')) ∧
         ∀a a'. (exec a = exec a') ⇔ (a = a')

   [trType_Axiom]  Theorem

      |- ∀f0 f1 f2.
           ∃fn.
             (fn discard = f0) ∧ (∀a. fn (trap a) = f1 a) ∧
             ∀a. fn (exec a) = f2 a

   [trType_case_cong]  Theorem

      |- ∀M M' v f f1.
           (M = M') ∧ ((M' = discard) ⇒ (v = v')) ∧
           (∀a. (M' = trap a) ⇒ (f a = f' a)) ∧
           (∀a. (M' = exec a) ⇒ (f1 a = f1' a)) ⇒
           (trType_CASE M v f f1 = trType_CASE M' v' f' f1')

   [trType_distinct]  Theorem

      |- (∀a. discard ≠ trap a) ∧ (∀a. discard ≠ exec a) ∧
         ∀a' a. trap a ≠ exec a'

   [trType_distinct_clauses]  Theorem

      |- (∀a. discard ≠ trap a) ∧ (∀a. discard ≠ exec a) ∧
         ∀a' a. trap a ≠ exec a'

   [trType_induction]  Theorem

      |- ∀P. P discard ∧ (∀c. P (trap c)) ∧ (∀c. P (exec c)) ⇒ ∀t. P t

   [trType_nchotomy]  Theorem

      |- ∀tt. (tt = discard) ∨ (∃c. tt = trap c) ∨ ∃c. tt = exec c

   [trType_one_one]  Theorem

      |- (∀a a'. (trap a = trap a') ⇔ (a = a')) ∧
         ∀a a'. (exec a = exec a') ⇔ (a = a')


*)
end
