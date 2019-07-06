signature SM0Theory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val SM0StateInterp_def : thm
    val certs_def : thm
    val inputOK_primitive_def : thm

  (*  Theorems  *)
    val Operator_exec_privcmd_justified_thm : thm
    val Operator_justified_privcmd_exec_thm : thm
    val Operator_privcmd_lemma : thm
    val Operator_privcmd_verified_thm : thm
    val SM0ns_def : thm
    val SM0ns_ind : thm
    val SM0out_def : thm
    val SM0out_ind : thm
    val inputOK_TT_reject_lemma : thm
    val inputOK_cmd_reject_lemma : thm
    val inputOK_def : thm
    val inputOK_ind : thm
    val inputOK_staff_rejected_lemma : thm

  val SM0_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [m0Types] Parent theory of "SM0"

   [principal] Parent theory of "SM0"

   [ssm1] Parent theory of "SM0"

   [SM0StateInterp_def]  Definition

      |- ∀state. SM0StateInterp state = TT

   [certs_def]  Definition

      |- ∀npriv privcmd.
           certs npriv privcmd =
           [Name (Role Operator) controls prop (SOME (NP npriv));
            Name (Role Operator) controls prop (SOME (PR privcmd));
            Name (Role Commander) controls prop (SOME (NP npriv));
            Name (Role Commander) says prop (SOME (PR privcmd)) impf
            prop NONE]

   [inputOK_primitive_def]  Definition

      |- inputOK =
         WFREC (@R. WF R)
           (λinputOK a.
              case a of
                TT => I F
              | FF => I F
              | prop v33 => I F
              | notf v34 => I F
              | v35 andf v36 => I F
              | v37 orf v38 => I F
              | v39 impf v40 => I F
              | v41 eqf v42 => I F
              | v43 says TT => I F
              | v43 says FF => I F
              | Name (Staff v150) says prop (SOME v143) => I F
              | Name (Authority v151) says prop (SOME v143) => I F
              | Name (Role v152) says prop (SOME v143) => I T
              | Name (KeyS v153) says prop (SOME v143) => I F
              | Name (KeyA v154) says prop (SOME v143) => I F
              | Name (Machine v155) says prop (SOME v143) => I F
              | Name v137 says prop NONE => I F
              | v138 meet v139 says prop v99 => I F
              | v140 quoting v141 says prop v99 => I F
              | v43 says notf v100 => I F
              | v43 says (v101 andf v102) => I F
              | v43 says (v103 orf v104) => I F
              | v43 says (v105 impf v106) => I F
              | v43 says (v107 eqf v108) => I F
              | v43 says v109 says v110 => I F
              | v43 says v111 speaks_for v112 => I F
              | v43 says v113 controls v114 => I F
              | v43 says reps v115 v116 v117 => I F
              | v43 says v118 domi v119 => I F
              | v43 says v120 eqi v121 => I F
              | v43 says v122 doms v123 => I F
              | v43 says v124 eqs v125 => I F
              | v43 says v126 eqn v127 => I F
              | v43 says v128 lte v129 => I F
              | v43 says v130 lt v131 => I F
              | v45 speaks_for v46 => I F
              | v47 controls v48 => I F
              | reps v49 v50 v51 => I F
              | v52 domi v53 => I F
              | v54 eqi v55 => I F
              | v56 doms v57 => I F
              | v58 eqs v59 => I F
              | v60 eqn v61 => I F
              | v62 lte v63 => I F
              | v64 lt v65 => I F)

   [Operator_exec_privcmd_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOK SM0StateInterp (certs npriv privcmd)
                (Name (Role Operator) says prop (SOME (PR privcmd))::ins) s
                outs)
             (CFG inputOK SM0StateInterp (certs npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇔
           inputOK (Name (Role Operator) says prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK SM0StateInterp (certs npriv privcmd)
                (Name (Role Operator) says prop (SOME (PR privcmd))::ins) s
                outs) ∧ (M,Oi,Os) sat prop (SOME (PR privcmd))

   [Operator_justified_privcmd_exec_thm]  Theorem

      |- ∀NS Out M Oi Os cmd npriv privcmd ins s outs.
           inputOK (Name (Role Operator) says prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK SM0StateInterp (certs npriv privcmd)
                (Name (Role Operator) says prop (SOME (PR privcmd))::ins) s
                outs) ⇒
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOK SM0StateInterp (certs npriv privcmd)
                (Name (Role Operator) says prop (SOME (PR privcmd))::ins) s
                outs)
             (CFG inputOK SM0StateInterp (certs npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs))

   [Operator_privcmd_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOK SM0StateInterp (certs npriv privcmd)
              (Name (Role Operator) says prop (SOME (PR privcmd))::ins) s
              outs) ⇒
         (M,Oi,Os) sat prop (SOME (PR privcmd))

   [Operator_privcmd_verified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOK SM0StateInterp (certs npriv privcmd)
                (Name (Role Operator) says prop (SOME (PR privcmd))::ins) s
                outs)
             (CFG inputOK SM0StateInterp (certs npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇒
           (M,Oi,Os) sat prop (SOME (PR privcmd))

   [SM0ns_def]  Theorem

      |- (SM0ns STBY (exec (PR reset)) = STBY) ∧
         (SM0ns STBY (exec (PR launch)) = ACTIVE) ∧
         (SM0ns STBY (exec (NP status)) = STBY) ∧
         (SM0ns ACTIVE (exec (PR reset)) = STBY) ∧
         (SM0ns ACTIVE (exec (PR launch)) = ACTIVE) ∧
         (SM0ns ACTIVE (exec (NP status)) = ACTIVE) ∧
         (SM0ns STBY (trap (PR reset)) = STBY) ∧
         (SM0ns STBY (trap (PR launch)) = STBY) ∧
         (SM0ns STBY (trap (NP status)) = STBY) ∧
         (SM0ns ACTIVE (trap (PR reset)) = ACTIVE) ∧
         (SM0ns ACTIVE (trap (PR launch)) = ACTIVE) ∧
         (SM0ns ACTIVE (trap (NP status)) = ACTIVE) ∧
         (SM0ns STBY discard = STBY) ∧ (SM0ns ACTIVE discard = ACTIVE)

   [SM0ns_ind]  Theorem

      |- ∀P.
           P STBY (exec (PR reset)) ∧ P STBY (exec (PR launch)) ∧
           P STBY (exec (NP status)) ∧ P ACTIVE (exec (PR reset)) ∧
           P ACTIVE (exec (PR launch)) ∧ P ACTIVE (exec (NP status)) ∧
           P STBY (trap (PR reset)) ∧ P STBY (trap (PR launch)) ∧
           P STBY (trap (NP status)) ∧ P ACTIVE (trap (PR reset)) ∧
           P ACTIVE (trap (PR launch)) ∧ P ACTIVE (trap (NP status)) ∧
           P STBY discard ∧ P ACTIVE discard ⇒
           ∀v v1. P v v1

   [SM0out_def]  Theorem

      |- (SM0out STBY (exec (PR reset)) = off) ∧
         (SM0out STBY (exec (PR launch)) = on) ∧
         (SM0out STBY (exec (NP status)) = off) ∧
         (SM0out ACTIVE (exec (PR reset)) = off) ∧
         (SM0out ACTIVE (exec (PR launch)) = on) ∧
         (SM0out ACTIVE (exec (NP status)) = on) ∧
         (SM0out STBY (trap (PR reset)) = off) ∧
         (SM0out STBY (trap (PR launch)) = off) ∧
         (SM0out STBY (trap (NP status)) = off) ∧
         (SM0out ACTIVE (trap (PR reset)) = on) ∧
         (SM0out ACTIVE (trap (PR launch)) = on) ∧
         (SM0out ACTIVE (trap (NP status)) = on) ∧
         (SM0out STBY discard = off) ∧ (SM0out ACTIVE discard = on)

   [SM0out_ind]  Theorem

      |- ∀P.
           P STBY (exec (PR reset)) ∧ P STBY (exec (PR launch)) ∧
           P STBY (exec (NP status)) ∧ P ACTIVE (exec (PR reset)) ∧
           P ACTIVE (exec (PR launch)) ∧ P ACTIVE (exec (NP status)) ∧
           P STBY (trap (PR reset)) ∧ P STBY (trap (PR launch)) ∧
           P STBY (trap (NP status)) ∧ P ACTIVE (trap (PR reset)) ∧
           P ACTIVE (trap (PR launch)) ∧ P ACTIVE (trap (NP status)) ∧
           P STBY discard ∧ P ACTIVE discard ⇒
           ∀v v1. P v v1

   [inputOK_TT_reject_lemma]  Theorem

      |- ¬inputOK TT

   [inputOK_cmd_reject_lemma]  Theorem

      |- ∀cmd. ¬inputOK (prop (SOME cmd))

   [inputOK_def]  Theorem

      |- (inputOK (Name (Role Operator) says prop (SOME cmd)) ⇔ T) ∧
         (inputOK (Name (Role Commander) says prop (SOME cmd)) ⇔ T) ∧
         (inputOK TT ⇔ F) ∧ (inputOK FF ⇔ F) ∧ (inputOK (prop v) ⇔ F) ∧
         (inputOK (notf v1) ⇔ F) ∧ (inputOK (v2 andf v3) ⇔ F) ∧
         (inputOK (v4 orf v5) ⇔ F) ∧ (inputOK (v6 impf v7) ⇔ F) ∧
         (inputOK (v8 eqf v9) ⇔ F) ∧ (inputOK (v10 says TT) ⇔ F) ∧
         (inputOK (v10 says FF) ⇔ F) ∧
         (inputOK (Name (Staff v144) says prop (SOME v142)) ⇔ F) ∧
         (inputOK (Name (Authority v145) says prop (SOME v142)) ⇔ F) ∧
         (inputOK (Name (KeyS v147) says prop (SOME v142)) ⇔ F) ∧
         (inputOK (Name (KeyA v148) says prop (SOME v142)) ⇔ F) ∧
         (inputOK (Name (Machine v149) says prop (SOME v142)) ⇔ F) ∧
         (inputOK (Name v132 says prop NONE) ⇔ F) ∧
         (inputOK (v133 meet v134 says prop v66) ⇔ F) ∧
         (inputOK (v135 quoting v136 says prop v66) ⇔ F) ∧
         (inputOK (v10 says notf v67) ⇔ F) ∧
         (inputOK (v10 says (v68 andf v69)) ⇔ F) ∧
         (inputOK (v10 says (v70 orf v71)) ⇔ F) ∧
         (inputOK (v10 says (v72 impf v73)) ⇔ F) ∧
         (inputOK (v10 says (v74 eqf v75)) ⇔ F) ∧
         (inputOK (v10 says v76 says v77) ⇔ F) ∧
         (inputOK (v10 says v78 speaks_for v79) ⇔ F) ∧
         (inputOK (v10 says v80 controls v81) ⇔ F) ∧
         (inputOK (v10 says reps v82 v83 v84) ⇔ F) ∧
         (inputOK (v10 says v85 domi v86) ⇔ F) ∧
         (inputOK (v10 says v87 eqi v88) ⇔ F) ∧
         (inputOK (v10 says v89 doms v90) ⇔ F) ∧
         (inputOK (v10 says v91 eqs v92) ⇔ F) ∧
         (inputOK (v10 says v93 eqn v94) ⇔ F) ∧
         (inputOK (v10 says v95 lte v96) ⇔ F) ∧
         (inputOK (v10 says v97 lt v98) ⇔ F) ∧
         (inputOK (v12 speaks_for v13) ⇔ F) ∧
         (inputOK (v14 controls v15) ⇔ F) ∧
         (inputOK (reps v16 v17 v18) ⇔ F) ∧ (inputOK (v19 domi v20) ⇔ F) ∧
         (inputOK (v21 eqi v22) ⇔ F) ∧ (inputOK (v23 doms v24) ⇔ F) ∧
         (inputOK (v25 eqs v26) ⇔ F) ∧ (inputOK (v27 eqn v28) ⇔ F) ∧
         (inputOK (v29 lte v30) ⇔ F) ∧ (inputOK (v31 lt v32) ⇔ F)

   [inputOK_ind]  Theorem

      |- ∀P.
           (∀cmd. P (Name (Role Operator) says prop (SOME cmd))) ∧
           (∀cmd. P (Name (Role Commander) says prop (SOME cmd))) ∧ P TT ∧
           P FF ∧ (∀v. P (prop v)) ∧ (∀v1. P (notf v1)) ∧
           (∀v2 v3. P (v2 andf v3)) ∧ (∀v4 v5. P (v4 orf v5)) ∧
           (∀v6 v7. P (v6 impf v7)) ∧ (∀v8 v9. P (v8 eqf v9)) ∧
           (∀v10. P (v10 says TT)) ∧ (∀v10. P (v10 says FF)) ∧
           (∀v144 v142. P (Name (Staff v144) says prop (SOME v142))) ∧
           (∀v145 v142. P (Name (Authority v145) says prop (SOME v142))) ∧
           (∀v147 v142. P (Name (KeyS v147) says prop (SOME v142))) ∧
           (∀v148 v142. P (Name (KeyA v148) says prop (SOME v142))) ∧
           (∀v149 v142. P (Name (Machine v149) says prop (SOME v142))) ∧
           (∀v132. P (Name v132 says prop NONE)) ∧
           (∀v133 v134 v66. P (v133 meet v134 says prop v66)) ∧
           (∀v135 v136 v66. P (v135 quoting v136 says prop v66)) ∧
           (∀v10 v67. P (v10 says notf v67)) ∧
           (∀v10 v68 v69. P (v10 says (v68 andf v69))) ∧
           (∀v10 v70 v71. P (v10 says (v70 orf v71))) ∧
           (∀v10 v72 v73. P (v10 says (v72 impf v73))) ∧
           (∀v10 v74 v75. P (v10 says (v74 eqf v75))) ∧
           (∀v10 v76 v77. P (v10 says v76 says v77)) ∧
           (∀v10 v78 v79. P (v10 says v78 speaks_for v79)) ∧
           (∀v10 v80 v81. P (v10 says v80 controls v81)) ∧
           (∀v10 v82 v83 v84. P (v10 says reps v82 v83 v84)) ∧
           (∀v10 v85 v86. P (v10 says v85 domi v86)) ∧
           (∀v10 v87 v88. P (v10 says v87 eqi v88)) ∧
           (∀v10 v89 v90. P (v10 says v89 doms v90)) ∧
           (∀v10 v91 v92. P (v10 says v91 eqs v92)) ∧
           (∀v10 v93 v94. P (v10 says v93 eqn v94)) ∧
           (∀v10 v95 v96. P (v10 says v95 lte v96)) ∧
           (∀v10 v97 v98. P (v10 says v97 lt v98)) ∧
           (∀v12 v13. P (v12 speaks_for v13)) ∧
           (∀v14 v15. P (v14 controls v15)) ∧
           (∀v16 v17 v18. P (reps v16 v17 v18)) ∧
           (∀v19 v20. P (v19 domi v20)) ∧ (∀v21 v22. P (v21 eqi v22)) ∧
           (∀v23 v24. P (v23 doms v24)) ∧ (∀v25 v26. P (v25 eqs v26)) ∧
           (∀v27 v28. P (v27 eqn v28)) ∧ (∀v29 v30. P (v29 lte v30)) ∧
           (∀v31 v32. P (v31 lt v32)) ⇒
           ∀v. P v

   [inputOK_staff_rejected_lemma]  Theorem

      |- ∀P cmd. ¬inputOK (Name (Staff P) says prop (SOME cmd))


*)
end
