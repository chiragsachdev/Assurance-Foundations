signature SM0r3SolutionsTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val certificatesr3a_def : thm
    val certsr1a_def : thm
    val certsr2a_def : thm

  (*  Theorems  *)
    val SM0_Commander_privcmd_trapped_lemma : thm
    val SM0_Commander_trap_privcmd_justified_thm : thm
    val SM0r1_Commander_Alice_trap_privcmd_justified_thm : thm
    val SM0r1_Commander_mapSM0inputOperatorBob_trap_privcmd_justified_thm : thm
    val SM0r1_mapSM0_Alice_Commander_trap_privcmd_lemma : thm

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

   [SM0_Commander_privcmd_trapped_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOK SM0StateInterp (certs npriv privcmd)
              (Name (Role Commander) says prop (SOME (PR privcmd))::ins) s
              outs) ⇒
         (M,Oi,Os) sat prop NONE

   [SM0_Commander_trap_privcmd_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (trap (PR privcmd))
             (CFG inputOK SM0StateInterp (certs npriv privcmd)
                (Name (Role Commander) says prop (SOME (PR privcmd))::ins)
                s outs)
             (CFG inputOK SM0StateInterp (certs npriv privcmd) ins
                (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇔
           inputOK (Name (Role Commander) says prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK SM0StateInterp (certs npriv privcmd)
                (Name (Role Commander) says prop (SOME (PR privcmd))::ins)
                s outs) ∧ (M,Oi,Os) sat prop NONE

   [SM0r1_Commander_Alice_trap_privcmd_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (trap (PR privcmd))
             (CFG inputOKr1 SM0StateInterp
                (certsr1a npriv privcmd (PR privcmd))
                (Name (Staff Alice) quoting Name (Role Commander) says
                 prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOKr1 SM0StateInterp
                (certsr1a npriv privcmd (PR privcmd)) ins
                (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇔
           inputOKr1
             (Name (Staff Alice) quoting Name (Role Commander) says
              prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOKr1 SM0StateInterp
                (certsr1a npriv privcmd (PR privcmd))
                (Name (Staff Alice) quoting Name (Role Commander) says
                 prop (SOME (PR privcmd))::ins) s outs) ∧
           (M,Oi,Os) sat prop NONE

   [SM0r1_Commander_mapSM0inputOperatorBob_trap_privcmd_justified_thm]  Theorem

      |- ∀s privcmd outs npriv ins NS Out M Oi Os.
           TR (M,Oi,Os) (trap (PR privcmd))
             (CFG inputOKr1 SM0StateInterp
                (certsr1a npriv privcmd (PR privcmd))
                (mapSM0inputOperatorBob
                   (Name (Role Commander) says prop (SOME (PR privcmd)))::
                     ins) s outs)
             (CFG inputOKr1 SM0StateInterp
                (certsr1a npriv privcmd (PR privcmd)) ins
                (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇔
           inputOKr1
             (mapSM0inputOperatorBob
                (Name (Role Commander) says prop (SOME (PR privcmd)))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOKr1 SM0StateInterp
                (certsr1a npriv privcmd (PR privcmd))
                (mapSM0inputOperatorBob
                   (Name (Role Commander) says prop (SOME (PR privcmd)))::
                     ins) s outs) ∧ (M,Oi,Os) sat prop NONE

   [SM0r1_mapSM0_Alice_Commander_trap_privcmd_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOKr1 SM0StateInterp
              (certsr1a npriv privcmd (PR privcmd))
              (mapSM0inputOperatorBob
                 (Name (Role Commander) says prop (SOME (PR privcmd)))::
                   ins) s outs) ⇒
         (M,Oi,Os) sat prop NONE


*)
end
