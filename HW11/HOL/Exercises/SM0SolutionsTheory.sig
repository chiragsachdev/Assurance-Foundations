signature SM0SolutionsTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val certs2_def : thm
    val inputOK2_primitive_def : thm

  (*  Theorems  *)
    val Alice_exec_npriv_justified_thm : thm
    val Alice_justified_npriv_exec_thm : thm
    val Alice_npriv_lemma : thm
    val Alice_npriv_verified_thm : thm
    val Carol_exec_npriv_justified_thm : thm
    val Carol_justified_npriv_exec_thm : thm
    val Carol_justified_privcmd_trap_thm : thm
    val Carol_npriv_lemma : thm
    val Carol_npriv_verified_thm : thm
    val Carol_privcmd_trap_lemma : thm
    val Carol_privcmd_trapped_thm : thm
    val Carol_trap_privcmd_justified_thm : thm
    val inputOK2_def : thm
    val inputOK2_ind : thm

  val SM0Solutions_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [SM0] Parent theory of "SM0Solutions"

   [certs2_def]  Definition

      |- ∀cmd npriv privcmd.
           certs2 cmd npriv privcmd =
           [Name Carol controls prop (SOME (NP npriv));
            Name Carol says prop (SOME (PR privcmd)) impf prop NONE]

   [inputOK2_primitive_def]  Definition

      |- inputOK2 =
         WFREC (@R. WF R)
           (λinputOK2 a.
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
              | Name Alice says prop (SOME cmd) => I F
              | Name Bob says prop (SOME cmd) => I F
              | Name Carol says prop (SOME cmd) => I T
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

   [Alice_exec_npriv_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (NP npriv))
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (NP npriv))::ins) s outs)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd) ins
                (NS s (exec (NP npriv))) (Out s (exec (NP npriv))::outs)) ⇔
           inputOK (Name Alice says prop (SOME (NP npriv))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (NP npriv))::ins) s outs) ∧
           (M,Oi,Os) sat prop (SOME (NP npriv))

   [Alice_justified_npriv_exec_thm]  Theorem

      |- ∀NS Out M Oi Os cmd npriv privcmd ins s outs.
           inputOK (Name Alice says prop (SOME (NP npriv))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (NP npriv))::ins) s outs) ⇒
           TR (M,Oi,Os) (exec (NP npriv))
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (NP npriv))::ins) s outs)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd) ins
                (NS s (exec (NP npriv))) (Out s (exec (NP npriv))::outs))

   [Alice_npriv_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
              (Name Alice says prop (SOME (NP npriv))::ins) s outs) ⇒
         (M,Oi,Os) sat prop (SOME (NP npriv))

   [Alice_npriv_verified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (NP npriv))
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (NP npriv))::ins) s outs)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd) ins
                (NS s (exec (NP npriv))) (Out s (exec (NP npriv))::outs)) ⇒
           (M,Oi,Os) sat prop (SOME (NP npriv))

   [Carol_exec_npriv_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (NP npriv))
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (NP npriv))::ins) s outs)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd) ins
                (NS s (exec (NP npriv))) (Out s (exec (NP npriv))::outs)) ⇔
           inputOK2 (Name Carol says prop (SOME (NP npriv))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (NP npriv))::ins) s outs) ∧
           (M,Oi,Os) sat prop (SOME (NP npriv))

   [Carol_justified_npriv_exec_thm]  Theorem

      |- ∀NS Out M Oi Os cmd npriv privcmd ins s outs.
           inputOK2 (Name Carol says prop (SOME (NP npriv))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (NP npriv))::ins) s outs) ⇒
           TR (M,Oi,Os) (exec (NP npriv))
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (NP npriv))::ins) s outs)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd) ins
                (NS s (exec (NP npriv))) (Out s (exec (NP npriv))::outs))

   [Carol_justified_privcmd_trap_thm]  Theorem

      |- ∀NS Out M Oi Os cmd npriv privcmd ins s outs.
           inputOK2 (Name Carol says prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (PR privcmd))::ins) s outs) ⇒
           TR (M,Oi,Os) (trap (PR privcmd))
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd) ins
                (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs))

   [Carol_npriv_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
              (Name Carol says prop (SOME (NP npriv))::ins) s outs) ⇒
         (M,Oi,Os) sat prop (SOME (NP npriv))

   [Carol_npriv_verified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (NP npriv))
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (NP npriv))::ins) s outs)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd) ins
                (NS s (exec (NP npriv))) (Out s (exec (NP npriv))::outs)) ⇒
           (M,Oi,Os) sat prop (SOME (NP npriv))

   [Carol_privcmd_trap_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
              (Name Carol says prop (SOME (PR privcmd))::ins) s outs) ⇒
         (M,Oi,Os) sat prop NONE

   [Carol_privcmd_trapped_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (trap (PR privcmd))
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd) ins
                (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇒
           (M,Oi,Os) sat prop NONE

   [Carol_trap_privcmd_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (trap (PR privcmd))
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd) ins
                (NS s (trap (PR privcmd)))
                (Out s (trap (PR privcmd))::outs)) ⇔
           inputOK2 (Name Carol says prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK2 SM0StateInterp (certs2 cmd npriv privcmd)
                (Name Carol says prop (SOME (PR privcmd))::ins) s outs) ∧
           (M,Oi,Os) sat prop NONE

   [inputOK2_def]  Theorem

      |- (inputOK2 (Name Carol says prop (SOME cmd)) ⇔ T) ∧
         (inputOK2 TT ⇔ F) ∧ (inputOK2 FF ⇔ F) ∧ (inputOK2 (prop v) ⇔ F) ∧
         (inputOK2 (notf v1) ⇔ F) ∧ (inputOK2 (v2 andf v3) ⇔ F) ∧
         (inputOK2 (v4 orf v5) ⇔ F) ∧ (inputOK2 (v6 impf v7) ⇔ F) ∧
         (inputOK2 (v8 eqf v9) ⇔ F) ∧ (inputOK2 (v10 says TT) ⇔ F) ∧
         (inputOK2 (v10 says FF) ⇔ F) ∧
         (inputOK2 (Name Alice says prop (SOME v142)) ⇔ F) ∧
         (inputOK2 (Name Bob says prop (SOME v142)) ⇔ F) ∧
         (inputOK2 (Name v132 says prop NONE) ⇔ F) ∧
         (inputOK2 (v133 meet v134 says prop v66) ⇔ F) ∧
         (inputOK2 (v135 quoting v136 says prop v66) ⇔ F) ∧
         (inputOK2 (v10 says notf v67) ⇔ F) ∧
         (inputOK2 (v10 says (v68 andf v69)) ⇔ F) ∧
         (inputOK2 (v10 says (v70 orf v71)) ⇔ F) ∧
         (inputOK2 (v10 says (v72 impf v73)) ⇔ F) ∧
         (inputOK2 (v10 says (v74 eqf v75)) ⇔ F) ∧
         (inputOK2 (v10 says v76 says v77) ⇔ F) ∧
         (inputOK2 (v10 says v78 speaks_for v79) ⇔ F) ∧
         (inputOK2 (v10 says v80 controls v81) ⇔ F) ∧
         (inputOK2 (v10 says reps v82 v83 v84) ⇔ F) ∧
         (inputOK2 (v10 says v85 domi v86) ⇔ F) ∧
         (inputOK2 (v10 says v87 eqi v88) ⇔ F) ∧
         (inputOK2 (v10 says v89 doms v90) ⇔ F) ∧
         (inputOK2 (v10 says v91 eqs v92) ⇔ F) ∧
         (inputOK2 (v10 says v93 eqn v94) ⇔ F) ∧
         (inputOK2 (v10 says v95 lte v96) ⇔ F) ∧
         (inputOK2 (v10 says v97 lt v98) ⇔ F) ∧
         (inputOK2 (v12 speaks_for v13) ⇔ F) ∧
         (inputOK2 (v14 controls v15) ⇔ F) ∧
         (inputOK2 (reps v16 v17 v18) ⇔ F) ∧
         (inputOK2 (v19 domi v20) ⇔ F) ∧ (inputOK2 (v21 eqi v22) ⇔ F) ∧
         (inputOK2 (v23 doms v24) ⇔ F) ∧ (inputOK2 (v25 eqs v26) ⇔ F) ∧
         (inputOK2 (v27 eqn v28) ⇔ F) ∧ (inputOK2 (v29 lte v30) ⇔ F) ∧
         (inputOK2 (v31 lt v32) ⇔ F)

   [inputOK2_ind]  Theorem

      |- ∀P.
           (∀cmd. P (Name Carol says prop (SOME cmd))) ∧ P TT ∧ P FF ∧
           (∀v. P (prop v)) ∧ (∀v1. P (notf v1)) ∧
           (∀v2 v3. P (v2 andf v3)) ∧ (∀v4 v5. P (v4 orf v5)) ∧
           (∀v6 v7. P (v6 impf v7)) ∧ (∀v8 v9. P (v8 eqf v9)) ∧
           (∀v10. P (v10 says TT)) ∧ (∀v10. P (v10 says FF)) ∧
           (∀v142. P (Name Alice says prop (SOME v142))) ∧
           (∀v142. P (Name Bob says prop (SOME v142))) ∧
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


*)
end
