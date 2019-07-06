signature SM0r3SolutionsTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val certificatesr3a_def : thm
    val certsr1a_def : thm
    val certsr2a_def : thm

  (*  Theorems  *)
    val SM0r2_Commander_Alice_trap_privcmd_justified_thm : thm
    val SM0r2_Commander_mapSM0r1input_trap_privcmd_justifed_thm : thm
    val SM0r2_mapSM0r1_Alice_Commander_trap_privcmd_lemma : thm
    val SM0r3_Alice_TR2_iff_TR_trap_privcmd : thm
    val SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_thm : thm
    val SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_with_refinements_thm : thm
    val SM0r3_mkinMsg_SM0r2_Alice_Commander_trap_privcmd_lemma : thm
    val certificatesr3a_certsr2a_map_thm : thm

  val SM0r3Solutions_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [SM0r3] Parent theory of "SM0r3Solutions"

   [certificatesr3a_def]  Definition

      |- ∀npriv privcmd cmd.
           certificatesr3a npriv privcmd cmd =
           MAP mkRCert
             (certsr1a npriv privcmd cmd ++ certsr2root npriv privcmd) ++
           MAP (mkSCert (ca 0)) (certsr2signed npriv privcmd)

   [certsr1a_def]  Definition

      |- ∀npriv privcmd cmd.
           certsr1a npriv privcmd cmd =
           certs npriv privcmd ++
           [reps (Name (Staff Alice)) (Name (Role Commander))
              (prop (SOME cmd));
            reps (Name (Staff Bob)) (Name (Role Operator))
              (prop (SOME cmd))]

   [certsr2a_def]  Definition

      |- ∀npriv privcmd cmd.
           certsr2a npriv privcmd cmd =
           certsr1a npriv privcmd cmd ++ certsr2root npriv privcmd ++
           certsr2signed npriv privcmd

   [SM0r2_Commander_Alice_trap_privcmd_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (trap (PR privcmd))
             (CFG inputOKr2 SM0StateInterp
                (certsr2a npriv privcmd (PR privcmd))
                (Name (KeyS (pubK Alice)) quoting
                 Name (Role Commander) says prop (SOME (PR privcmd))::ins)
                s outs)
             (CFG inputOKr2 SM0StateInterp
                (certsr2a npriv privcmd (PR privcmd)) ins
                (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇔
           inputOKr2
             (Name (KeyS (pubK Alice)) quoting Name (Role Commander) says
              prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOKr2 SM0StateInterp
                (certsr2a npriv privcmd (PR privcmd))
                (Name (KeyS (pubK Alice)) quoting
                 Name (Role Commander) says prop (SOME (PR privcmd))::ins)
                s outs) ∧ (M,Oi,Os) sat prop NONE

   [SM0r2_Commander_mapSM0r1input_trap_privcmd_justifed_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (trap (PR privcmd))
             (CFG inputOKr2 SM0StateInterp
                (certsr2a npriv privcmd (PR privcmd))
                (mapSM0r1input
                   (mapSM0inputOperatorBob
                      (Name (Role Commander) says
                       prop (SOME (PR privcmd))))::ins) s outs)
             (CFG inputOKr2 SM0StateInterp
                (certsr2a npriv privcmd (PR privcmd)) ins
                (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇔
           inputOKr2
             (mapSM0r1input
                (mapSM0inputOperatorBob
                   (Name (Role Commander) says
                    prop (SOME (PR privcmd))))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOKr2 SM0StateInterp
                (certsr2a npriv privcmd (PR privcmd))
                (mapSM0r1input
                   (mapSM0inputOperatorBob
                      (Name (Role Commander) says
                       prop (SOME (PR privcmd))))::ins) s outs) ∧
           (M,Oi,Os) sat prop NONE

   [SM0r2_mapSM0r1_Alice_Commander_trap_privcmd_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOKr2 SM0StateInterp
              (certsr2a npriv privcmd (PR privcmd))
              (mapSM0r1input
                 (mapSM0inputOperatorBob
                    (Name (Role Commander) says
                     prop (SOME (PR privcmd))))::ins) s outs) ⇒
         (M,Oi,Os) sat prop NONE

   [SM0r3_Alice_TR2_iff_TR_trap_privcmd]  Theorem

      |- ∀NS Out M Oi Os.
           TR2 (M,Oi,Os) (trap (PR privcmd))
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3a npriv privcmd (PR privcmd)) SM0StateInterp
                (mkinMsg
                   (mapSM0r1input
                      (mapSM0inputOperatorBob
                         (Name (Role Commander) says
                          prop (SOME (PR privcmd)))))::ins2) s outs)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3a npriv privcmd (PR privcmd)) SM0StateInterp
                ins2 (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇔
           TR (M,Oi,Os) (trap (PR privcmd))
             (CFG inputOKr2 SM0StateInterp
                (certsr2a npriv privcmd (PR privcmd))
                (Name (KeyS (pubK Alice)) quoting
                 Name (Role Commander) says prop (SOME (PR privcmd))::ins)
                s outs)
             (CFG inputOKr2 SM0StateInterp
                (certsr2a npriv privcmd (PR privcmd)) ins
                (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs))

   [SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR2 (M,Oi,Os) (trap (PR privcmd))
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3a npriv privcmd (PR privcmd)) SM0StateInterp
                (MSG Alice (Order Commander (PR privcmd))
                   (sign (privK Alice)
                      (hash (SOME (Order Commander (PR privcmd)))))::ins) s
                outs)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3a npriv privcmd (PR privcmd)) SM0StateInterp
                ins (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇔
           inputOKr2
             (MsgInterpret
                (MSG Alice (Order Commander (PR privcmd))
                   (sign (privK Alice)
                      (hash (SOME (Order Commander (PR privcmd))))))) ∧
           CFG2Interpret (M,Oi,Os)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3a npriv privcmd (PR privcmd)) SM0StateInterp
                (MSG Alice (Order Commander (PR privcmd))
                   (sign (privK Alice)
                      (hash (SOME (Order Commander (PR privcmd)))))::ins) s
                outs) ∧ (M,Oi,Os) sat prop NONE

   [SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_with_refinements_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR2 (M,Oi,Os) (trap (PR privcmd))
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3a npriv privcmd (PR privcmd)) SM0StateInterp
                (mkinMsg
                   (mapSM0r1input
                      (mapSM0inputOperatorBob
                         (Name (Role Commander) says
                          prop (SOME (PR privcmd)))))::ins) s outs)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3a npriv privcmd (PR privcmd)) SM0StateInterp
                ins (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇔
           inputOKr2
             (MsgInterpret
                (mkinMsg
                   (mapSM0r1input
                      (mapSM0inputOperatorBob
                         (Name (Role Commander) says
                          prop (SOME (PR privcmd))))))) ∧
           CFG2Interpret (M,Oi,Os)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3a npriv privcmd (PR privcmd)) SM0StateInterp
                (mkinMsg
                   (mapSM0r1input
                      (mapSM0inputOperatorBob
                         (Name (Role Commander) says
                          prop (SOME (PR privcmd)))))::ins) s outs) ∧
           (M,Oi,Os) sat prop NONE

   [SM0r3_mkinMsg_SM0r2_Alice_Commander_trap_privcmd_lemma]  Theorem

      |- CFG2Interpret (M,Oi,Os)
           (CFG2 MsgInterpret certificateInterpret inputOKr2
              (certificatesr3a npriv privcmd (PR privcmd)) SM0StateInterp
              (mkinMsg
                 (mapSM0r1input
                    (mapSM0inputOperatorBob
                       (Name (Role Commander) says
                        prop (SOME (PR privcmd)))))::ins) s outs) ⇒
         (M,Oi,Os) sat prop NONE

   [certificatesr3a_certsr2a_map_thm]  Theorem

      |- ∀npriv privcmd.
           MAP certificateInterpret
             (certificatesr3a npriv privcmd (PR privcmd)) =
           certsr2a npriv privcmd (PR privcmd)


*)
end
