signature ssm2Theory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val TR2_def : thm
    val configuration2_TY_DEF : thm
    val configuration2_case_def : thm
    val configuration2_size_def : thm

  (*  Theorems  *)
    val CFG2Interpret_def : thm
    val CFG2Interpret_ind : thm
    val TR2_EQ_rules_thm : thm
    val TR2_cases : thm
    val TR2_discard_cmd_rule : thm
    val TR2_exec_cmd_rule : thm
    val TR2_iff_TR_discard_thm : thm
    val TR2_iff_TR_exec_thm : thm
    val TR2_iff_TR_trap_thm : thm
    val TR2_ind : thm
    val TR2_rules : thm
    val TR2_strongind : thm
    val TR2_trap_cmd_rule : thm
    val TR2rule0 : thm
    val TR2rule1 : thm
    val configuration2_11 : thm
    val configuration2_Axiom : thm
    val configuration2_case_cong : thm
    val configuration2_induction : thm
    val configuration2_nchotomy : thm
    val configuration2_one_one : thm
    val datatype_configuration2 : thm

  val ssm2_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [ssm1] Parent theory of "ssm2"

   [TR2_def]  Definition

      |- TR2 =
         (λa0 a1 a2 a3.
            ∀TR2'.
              (∀a0 a1 a2 a3.
                 (∃inputInterpret certInterpret inputTest x NS M Oi Os Out
                     state certs stateInterpret cmd ins outStream.
                    (a0 = (M,Oi,Os)) ∧ (a1 = exec cmd) ∧
                    (a2 =
                     CFG2 inputInterpret certInterpret inputTest certs
                       stateInterpret (x::ins) state outStream) ∧
                    (a3 =
                     CFG2 inputInterpret certInterpret inputTest certs
                       stateInterpret ins (NS state (exec cmd))
                       (Out state (exec cmd)::outStream)) ∧
                    inputTest (inputInterpret x) ∧
                    CFG2Interpret (M,Oi,Os)
                      (CFG2 inputInterpret certInterpret inputTest certs
                         stateInterpret (x::ins) state outStream)) ∨
                 (∃inputInterpret certInterpret inputTest x NS M Oi Os Out
                     state certs stateInterpret cmd ins outStream.
                    (a0 = (M,Oi,Os)) ∧ (a1 = trap cmd) ∧
                    (a2 =
                     CFG2 inputInterpret certInterpret inputTest certs
                       stateInterpret (x::ins) state outStream) ∧
                    (a3 =
                     CFG2 inputInterpret certInterpret inputTest certs
                       stateInterpret ins (NS state (trap cmd))
                       (Out state (trap cmd)::outStream)) ∧
                    inputTest (inputInterpret x) ∧
                    CFG2Interpret (M,Oi,Os)
                      (CFG2 inputInterpret certInterpret inputTest certs
                         stateInterpret (x::ins) state outStream)) ∨
                 (∃inputInterpret certInterpret inputTest x NS M Oi Os Out
                     state certs stateInterpret cmd ins outStream.
                    (a0 = (M,Oi,Os)) ∧ (a1 = discard) ∧
                    (a2 =
                     CFG2 inputInterpret certInterpret inputTest certs
                       stateInterpret (x::ins) state outStream) ∧
                    (a3 =
                     CFG2 inputInterpret certInterpret inputTest certs
                       stateInterpret ins (NS state discard)
                       (Out state discard::outStream)) ∧
                    ¬inputTest (inputInterpret x)) ⇒
                 TR2' a0 a1 a2 a3) ⇒
              TR2' a0 a1 a2 a3)

   [configuration2_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0'.
                ∀'configuration2' .
                  (∀a0'.
                     (∃a0 a1 a2 a3 a4 a5 a6 a7.
                        a0' =
                        (λa0 a1 a2 a3 a4 a5 a6 a7.
                           ind_type$CONSTR 0 (a0,a1,a2,a3,a4,a5,a6,a7)
                             (λn. ind_type$BOTTOM)) a0 a1 a2 a3 a4 a5 a6
                          a7) ⇒
                     'configuration2' a0') ⇒
                  'configuration2' a0') rep

   [configuration2_case_def]  Definition

      |- ∀a0 a1 a2 a3 a4 a5 a6 a7 f.
           configuration2_CASE (CFG2 a0 a1 a2 a3 a4 a5 a6 a7) f =
           f a0 a1 a2 a3 a4 a5 a6 a7

   [configuration2_size_def]  Definition

      |- ∀f f1 f2 f3 f4 f5 f6 f7 a0 a1 a2 a3 a4 a5 a6 a7.
           configuration2_size f f1 f2 f3 f4 f5 f6 f7
             (CFG2 a0 a1 a2 a3 a4 a5 a6 a7) =
           1 +
           (list_size f a3 + (list_size f4 a5 + (f7 a6 + list_size f5 a7)))

   [CFG2Interpret_def]  Theorem

      |- CFG2Interpret (M,Oi,Os)
           (CFG2 inputInterpret certInterpret inputTest certs
              stateInterpret (x::ins) state outStream) ⇔
         (M,Oi,Os) satList MAP certInterpret certs ∧
         (M,Oi,Os) sat inputInterpret x ∧
         (M,Oi,Os) sat stateInterpret state

   [CFG2Interpret_ind]  Theorem

      |- ∀P.
           (∀M Oi Os inputInterpret certInterpret inputTest certs
               stateInterpret x ins state outStream.
              P (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream)) ∧
           (∀v19 v12 v13 v14 v15 v16 v17 v18.
              P v19 (CFG2 v12 v13 v14 v15 v16 [] v17 v18)) ⇒
           ∀v v1 v2 v3. P (v,v1,v2) v3

   [TR2_EQ_rules_thm]  Theorem

      |- (TR2 (M,Oi,Os) (exec cmd)
            (CFG2 inputInterpret certInterpret inputTest certs
               stateInterpret (x::ins) state outStream)
            (CFG2 inputInterpret certInterpret inputTest certs
               stateInterpret ins (NS state (exec cmd))
               (Out state (exec cmd)::outStream)) ⇔
          inputTest (inputInterpret x) ∧
          CFG2Interpret (M,Oi,Os)
            (CFG2 inputInterpret certInterpret inputTest certs
               stateInterpret (x::ins) state outStream)) ∧
         (TR2 (M,Oi,Os) (trap cmd)
            (CFG2 inputInterpret certInterpret inputTest certs
               stateInterpret (x::ins) state outStream)
            (CFG2 inputInterpret certInterpret inputTest certs
               stateInterpret ins (NS state (trap cmd))
               (Out state (trap cmd)::outStream)) ⇔
          inputTest (inputInterpret x) ∧
          CFG2Interpret (M,Oi,Os)
            (CFG2 inputInterpret certInterpret inputTest certs
               stateInterpret (x::ins) state outStream)) ∧
         (TR2 (M,Oi,Os) discard
            (CFG2 inputInterpret certInterpret inputTest certs
               stateInterpret (x::ins) state outStream)
            (CFG2 inputInterpret certInterpret inputTest certs
               stateInterpret ins (NS state discard)
               (Out state discard::outStream)) ⇔
          ¬inputTest (inputInterpret x))

   [TR2_cases]  Theorem

      |- ∀a0 a1 a2 a3.
           TR2 a0 a1 a2 a3 ⇔
           (∃inputInterpret certInterpret inputTest x NS M Oi Os Out state
               certs stateInterpret cmd ins outStream.
              (a0 = (M,Oi,Os)) ∧ (a1 = exec cmd) ∧
              (a2 =
               CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret (x::ins) state outStream) ∧
              (a3 =
               CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret ins (NS state (exec cmd))
                 (Out state (exec cmd)::outStream)) ∧
              inputTest (inputInterpret x) ∧
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream)) ∨
           (∃inputInterpret certInterpret inputTest x NS M Oi Os Out state
               certs stateInterpret cmd ins outStream.
              (a0 = (M,Oi,Os)) ∧ (a1 = trap cmd) ∧
              (a2 =
               CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret (x::ins) state outStream) ∧
              (a3 =
               CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret ins (NS state (trap cmd))
                 (Out state (trap cmd)::outStream)) ∧
              inputTest (inputInterpret x) ∧
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream)) ∨
           ∃inputInterpret certInterpret inputTest x NS M Oi Os Out state
              certs stateInterpret cmd ins outStream.
             (a0 = (M,Oi,Os)) ∧ (a1 = discard) ∧
             (a2 =
              CFG2 inputInterpret certInterpret inputTest certs
                stateInterpret (x::ins) state outStream) ∧
             (a3 =
              CFG2 inputInterpret certInterpret inputTest certs
                stateInterpret ins (NS state discard)
                (Out state discard::outStream)) ∧
             ¬inputTest (inputInterpret x)

   [TR2_discard_cmd_rule]  Theorem

      |- TR2 (M,Oi,Os) discard
           (CFG2 inputInterpret certInterpret inputTest certs
              stateInterpret (x::ins) state outStream)
           (CFG2 inputInterpret certInterpret inputTest certs
              stateInterpret ins (NS state discard)
              (Out state discard::outStream)) ⇔
         ¬inputTest (inputInterpret x)

   [TR2_exec_cmd_rule]  Theorem

      |- ∀inputInterpret certInterpret inputTest certs stateInterpret x cmd
            ins state outStream.
           (∀M Oi Os.
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream) ⇒
              (M,Oi,Os) sat prop (SOME cmd)) ⇒
           ∀NS Out M Oi Os.
             TR2 (M,Oi,Os) (exec cmd)
               (CFG2 inputInterpret certInterpret inputTest certs
                  stateInterpret (x::ins) state outStream)
               (CFG2 inputInterpret certInterpret inputTest certs
                  stateInterpret ins (NS state (exec cmd))
                  (Out state (exec cmd)::outStream)) ⇔
             inputTest (inputInterpret x) ∧
             CFG2Interpret (M,Oi,Os)
               (CFG2 inputInterpret certInterpret inputTest certs
                  stateInterpret (x::ins) state outStream) ∧
             (M,Oi,Os) sat prop (SOME cmd)

   [TR2_iff_TR_discard_thm]  Theorem

      |- ∀NS Out outStream state certs certs2 x ins ins2 stateInterpret
            inputInterpret certInterpret inputTest.
           TR2 (M,Oi,Os) discard
             (CFG2 inputInterpret certInterpret inputTest certs2
                stateInterpret (x::ins2) state outStream)
             (CFG2 inputInterpret certInterpret inputTest certs2
                stateInterpret ins2 (NS state discard)
                (Out state discard::outStream)) ⇔
           TR (M,Oi,Os) discard
             (CFG inputTest stateInterpret certs (inputInterpret x::ins)
                state outStream)
             (CFG inputTest stateInterpret certs ins (NS state discard)
                (Out state discard::outStream))

   [TR2_iff_TR_exec_thm]  Theorem

      |- ∀inputInterpret certInterpret inputTest certs certs2
            stateInterpret x P cmd ins ins2 state outStream.
           (inputInterpret x = P says prop (SOME cmd)) ⇒
           (MAP certInterpret certs2 = certs) ⇒
           (∀M Oi Os.
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterpret certs (inputInterpret x::ins)
                   state outStream) ⇒
              (M,Oi,Os) sat prop (SOME cmd)) ⇒
           (∀M Oi Os.
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs2
                   stateInterpret (x::ins2) state outStream) ⇒
              (M,Oi,Os) sat prop (SOME cmd)) ⇒
           ∀NS Out M Oi Os.
             TR2 (M,Oi,Os) (exec cmd)
               (CFG2 inputInterpret certInterpret inputTest certs2
                  stateInterpret (x::ins2) state outStream)
               (CFG2 inputInterpret certInterpret inputTest certs2
                  stateInterpret ins2 (NS state (exec cmd))
                  (Out state (exec cmd)::outStream)) ⇔
             TR (M,Oi,Os) (exec cmd)
               (CFG inputTest stateInterpret certs (inputInterpret x::ins)
                  state outStream)
               (CFG inputTest stateInterpret certs ins
                  (NS state (exec cmd)) (Out state (exec cmd)::outStream))

   [TR2_iff_TR_trap_thm]  Theorem

      |- ∀inputInterpret certInterpret inputTest certs certs2
            stateInterpret x P cmd ins ins2 state outStream.
           (inputInterpret x = P says prop (SOME cmd)) ⇒
           (MAP certInterpret certs2 = certs) ⇒
           (∀M Oi Os.
              CFGInterpret (M,Oi,Os)
                (CFG inputTest stateInterpret certs (inputInterpret x::ins)
                   state outStream) ⇒
              (M,Oi,Os) sat prop NONE) ⇒
           (∀M Oi Os.
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs2
                   stateInterpret (x::ins2) state outStream) ⇒
              (M,Oi,Os) sat prop NONE) ⇒
           ∀NS Out M Oi Os.
             TR2 (M,Oi,Os) (trap cmd)
               (CFG2 inputInterpret certInterpret inputTest certs2
                  stateInterpret (x::ins2) state outStream)
               (CFG2 inputInterpret certInterpret inputTest certs2
                  stateInterpret ins2 (NS state (trap cmd))
                  (Out state (trap cmd)::outStream)) ⇔
             TR (M,Oi,Os) (trap cmd)
               (CFG inputTest stateInterpret certs (inputInterpret x::ins)
                  state outStream)
               (CFG inputTest stateInterpret certs ins
                  (NS state (trap cmd)) (Out state (trap cmd)::outStream))

   [TR2_ind]  Theorem

      |- ∀TR2'.
           (∀inputInterpret certInterpret inputTest x NS M Oi Os Out state
               certs stateInterpret cmd ins outStream.
              inputTest (inputInterpret x) ∧
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream) ⇒
              TR2' (M,Oi,Os) (exec cmd)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret ins (NS state (exec cmd))
                   (Out state (exec cmd)::outStream))) ∧
           (∀inputInterpret certInterpret inputTest x NS M Oi Os Out state
               certs stateInterpret cmd ins outStream.
              inputTest (inputInterpret x) ∧
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream) ⇒
              TR2' (M,Oi,Os) (trap cmd)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret ins (NS state (trap cmd))
                   (Out state (trap cmd)::outStream))) ∧
           (∀inputInterpret certInterpret inputTest x NS M Oi Os Out state
               certs stateInterpret cmd ins outStream.
              ¬inputTest (inputInterpret x) ⇒
              TR2' (M,Oi,Os) discard
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret ins (NS state discard)
                   (Out state discard::outStream))) ⇒
           ∀a0 a1 a2 a3. TR2 a0 a1 a2 a3 ⇒ TR2' a0 a1 a2 a3

   [TR2_rules]  Theorem

      |- (∀inputInterpret certInterpret inputTest x NS M Oi Os Out state
             certs stateInterpret cmd ins outStream.
            inputTest (inputInterpret x) ∧
            CFG2Interpret (M,Oi,Os)
              (CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret (x::ins) state outStream) ⇒
            TR2 (M,Oi,Os) (exec cmd)
              (CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret (x::ins) state outStream)
              (CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret ins (NS state (exec cmd))
                 (Out state (exec cmd)::outStream))) ∧
         (∀inputInterpret certInterpret inputTest x NS M Oi Os Out state
             certs stateInterpret cmd ins outStream.
            inputTest (inputInterpret x) ∧
            CFG2Interpret (M,Oi,Os)
              (CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret (x::ins) state outStream) ⇒
            TR2 (M,Oi,Os) (trap cmd)
              (CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret (x::ins) state outStream)
              (CFG2 inputInterpret certInterpret inputTest certs
                 stateInterpret ins (NS state (trap cmd))
                 (Out state (trap cmd)::outStream))) ∧
         ∀inputInterpret certInterpret inputTest x NS M Oi Os Out state
            certs stateInterpret cmd ins outStream.
           ¬inputTest (inputInterpret x) ⇒
           TR2 (M,Oi,Os) discard
             (CFG2 inputInterpret certInterpret inputTest certs
                stateInterpret (x::ins) state outStream)
             (CFG2 inputInterpret certInterpret inputTest certs
                stateInterpret ins (NS state discard)
                (Out state discard::outStream))

   [TR2_strongind]  Theorem

      |- ∀TR2'.
           (∀inputInterpret certInterpret inputTest x NS M Oi Os Out state
               certs stateInterpret cmd ins outStream.
              inputTest (inputInterpret x) ∧
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream) ⇒
              TR2' (M,Oi,Os) (exec cmd)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret ins (NS state (exec cmd))
                   (Out state (exec cmd)::outStream))) ∧
           (∀inputInterpret certInterpret inputTest x NS M Oi Os Out state
               certs stateInterpret cmd ins outStream.
              inputTest (inputInterpret x) ∧
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream) ⇒
              TR2' (M,Oi,Os) (trap cmd)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret ins (NS state (trap cmd))
                   (Out state (trap cmd)::outStream))) ∧
           (∀inputInterpret certInterpret inputTest x NS M Oi Os Out state
               certs stateInterpret ins outStream.
              ¬inputTest (inputInterpret x) ⇒
              TR2' (M,Oi,Os) discard
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret ins (NS state discard)
                   (Out state discard::outStream))) ⇒
           ∀a0 a1 a2 a3. TR2 a0 a1 a2 a3 ⇒ TR2' a0 a1 a2 a3

   [TR2_trap_cmd_rule]  Theorem

      |- ∀inputInterpret certInterpret inputTest certs stateInterpret x cmd
            ins state outStream.
           (∀M Oi Os.
              CFG2Interpret (M,Oi,Os)
                (CFG2 inputInterpret certInterpret inputTest certs
                   stateInterpret (x::ins) state outStream) ⇒
              (M,Oi,Os) sat prop NONE) ⇒
           ∀NS Out M Oi Os.
             TR2 (M,Oi,Os) (trap cmd)
               (CFG2 inputInterpret certInterpret inputTest certs
                  stateInterpret (x::ins) state outStream)
               (CFG2 inputInterpret certInterpret inputTest certs
                  stateInterpret ins (NS state (trap cmd))
                  (Out state (trap cmd)::outStream)) ⇔
             inputTest (inputInterpret x) ∧
             CFG2Interpret (M,Oi,Os)
               (CFG2 inputInterpret certInterpret inputTest certs
                  stateInterpret (x::ins) state outStream) ∧
             (M,Oi,Os) sat prop NONE

   [TR2rule0]  Theorem

      |- TR2 (M,Oi,Os) (exec cmd)
           (CFG2 inputInterpret certInterpret inputTest certs
              stateInterpret (x::ins) state outStream)
           (CFG2 inputInterpret certInterpret inputTest certs
              stateInterpret ins (NS state (exec cmd))
              (Out state (exec cmd)::outStream)) ⇔
         inputTest (inputInterpret x) ∧
         CFG2Interpret (M,Oi,Os)
           (CFG2 inputInterpret certInterpret inputTest certs
              stateInterpret (x::ins) state outStream)

   [TR2rule1]  Theorem

      |- TR2 (M,Oi,Os) (trap cmd)
           (CFG2 inputInterpret certInterpret inputTest certs
              stateInterpret (x::ins) state outStream)
           (CFG2 inputInterpret certInterpret inputTest certs
              stateInterpret ins (NS state (trap cmd))
              (Out state (trap cmd)::outStream)) ⇔
         inputTest (inputInterpret x) ∧
         CFG2Interpret (M,Oi,Os)
           (CFG2 inputInterpret certInterpret inputTest certs
              stateInterpret (x::ins) state outStream)

   [configuration2_11]  Theorem

      |- ∀a0 a1 a2 a3 a4 a5 a6 a7 a0' a1' a2' a3' a4' a5' a6' a7'.
           (CFG2 a0 a1 a2 a3 a4 a5 a6 a7 =
            CFG2 a0' a1' a2' a3' a4' a5' a6' a7') ⇔
           (a0 = a0') ∧ (a1 = a1') ∧ (a2 = a2') ∧ (a3 = a3') ∧ (a4 = a4') ∧
           (a5 = a5') ∧ (a6 = a6') ∧ (a7 = a7')

   [configuration2_Axiom]  Theorem

      |- ∀f.
           ∃fn.
             ∀a0 a1 a2 a3 a4 a5 a6 a7.
               fn (CFG2 a0 a1 a2 a3 a4 a5 a6 a7) =
               f a0 a1 a2 a3 a4 a5 a6 a7

   [configuration2_case_cong]  Theorem

      |- ∀M M' f.
           (M = M') ∧
           (∀a0 a1 a2 a3 a4 a5 a6 a7.
              (M' = CFG2 a0 a1 a2 a3 a4 a5 a6 a7) ⇒
              (f a0 a1 a2 a3 a4 a5 a6 a7 = f' a0 a1 a2 a3 a4 a5 a6 a7)) ⇒
           (configuration2_CASE M f = configuration2_CASE M' f')

   [configuration2_induction]  Theorem

      |- ∀P.
           (∀f f0 f1 l f2 l0 s l1. P (CFG2 f f0 f1 l f2 l0 s l1)) ⇒ ∀c. P c

   [configuration2_nchotomy]  Theorem

      |- ∀cc. ∃f f0 f1 l f2 l0 s l1. cc = CFG2 f f0 f1 l f2 l0 s l1

   [configuration2_one_one]  Theorem

      |- ∀a0 a1 a2 a3 a4 a5 a6 a7 a0' a1' a2' a3' a4' a5' a6' a7'.
           (CFG2 a0 a1 a2 a3 a4 a5 a6 a7 =
            CFG2 a0' a1' a2' a3' a4' a5' a6' a7') ⇔
           (a0 = a0') ∧ (a1 = a1') ∧ (a2 = a2') ∧ (a3 = a3') ∧ (a4 = a4') ∧
           (a5 = a5') ∧ (a6 = a6') ∧ (a7 = a7')

   [datatype_configuration2]  Theorem

      |- DATATYPE (configuration2 CFG2)


*)
end
