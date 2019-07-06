signature SM0r3Theory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val certificatesr3_def : thm

  (*  Theorems  *)
    val Bob_TR2_iff_TR_privcmd : thm
    val Operator_Bob_privcmd_exec_privcmd_justified_thm : thm
    val Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm : thm
    val certificatesr3_certsr2_map_thm : thm
    val mkinMsg_SM0r2_Bob_Operator_privcmd_lemma : thm

  val SM0r3_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [SM0r2] Parent theory of "SM0r3"

   [certStructure] Parent theory of "SM0r3"

   [inMsg] Parent theory of "SM0r3"

   [certificatesr3_def]  Definition

      |- ∀npriv privcmd.
           certificatesr3 npriv privcmd =
           MAP mkRCert
             (certsr1 npriv privcmd ++ certsr2root npriv privcmd) ++
           MAP (mkSCert (ca 0)) (certsr2signed npriv privcmd)

   [Bob_TR2_iff_TR_privcmd]  Theorem

      |- ∀NS Out M Oi Os.
           TR2 (M,Oi,Os) (exec (PR privcmd))
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3 npriv privcmd) SM0StateInterp
                (mkinMsg
                   (mapSM0r1input
                      (mapSM0inputOperatorBob
                         (Name (Role Operator) says
                          prop (SOME (PR privcmd)))))::ins2) s outs)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3 npriv privcmd) SM0StateInterp ins2
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇔
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd)
                (Name (KeyS (pubK Bob)) quoting Name (Role Operator) says
                 prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs))

   [Operator_Bob_privcmd_exec_privcmd_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR2 (M,Oi,Os) (exec (PR privcmd))
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3 npriv privcmd) SM0StateInterp
                (MSG Bob (Order Operator (PR privcmd))
                   (sign (privK Bob)
                      (hash (SOME (Order Operator (PR privcmd)))))::ins) s
                outs)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3 npriv privcmd) SM0StateInterp ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇔
           inputOKr2
             (MsgInterpret
                (MSG Bob (Order Operator (PR privcmd))
                   (sign (privK Bob)
                      (hash (SOME (Order Operator (PR privcmd))))))) ∧
           CFG2Interpret (M,Oi,Os)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3 npriv privcmd) SM0StateInterp
                (MSG Bob (Order Operator (PR privcmd))
                   (sign (privK Bob)
                      (hash (SOME (Order Operator (PR privcmd)))))::ins) s
                outs) ∧ (M,Oi,Os) sat prop (SOME (PR privcmd))

   [Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR2 (M,Oi,Os) (exec (PR privcmd))
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3 npriv privcmd) SM0StateInterp
                (mkinMsg
                   (mapSM0r1input
                      (mapSM0inputOperatorBob
                         (Name (Role Operator) says
                          prop (SOME (PR privcmd)))))::ins) s outs)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3 npriv privcmd) SM0StateInterp ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇔
           inputOKr2
             (MsgInterpret
                (mkinMsg
                   (mapSM0r1input
                      (mapSM0inputOperatorBob
                         (Name (Role Operator) says
                          prop (SOME (PR privcmd))))))) ∧
           CFG2Interpret (M,Oi,Os)
             (CFG2 MsgInterpret certificateInterpret inputOKr2
                (certificatesr3 npriv privcmd) SM0StateInterp
                (mkinMsg
                   (mapSM0r1input
                      (mapSM0inputOperatorBob
                         (Name (Role Operator) says
                          prop (SOME (PR privcmd)))))::ins) s outs) ∧
           (M,Oi,Os) sat prop (SOME (PR privcmd))

   [certificatesr3_certsr2_map_thm]  Theorem

      |- ∀npriv privcmd.
           MAP certificateInterpret (certificatesr3 npriv privcmd) =
           certsr2 npriv privcmd

   [mkinMsg_SM0r2_Bob_Operator_privcmd_lemma]  Theorem

      |- CFG2Interpret (M,Oi,Os)
           (CFG2 MsgInterpret certificateInterpret inputOKr2
              (certificatesr3 npriv privcmd) SM0StateInterp
              (mkinMsg
                 (mapSM0r1input
                    (mapSM0inputOperatorBob
                       (Name (Role Operator) says
                        prop (SOME (PR privcmd)))))::ins) s outs) ⇒
         (M,Oi,Os) sat prop (SOME (PR privcmd))


*)
end
