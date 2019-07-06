signature SM0r1Theory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val certsr1_def : thm
    val inputOKr1_primitive_def : thm
    val mapSM0inputOperatorBob_primitive_def : thm

  (*  Theorems  *)
    val Alice_Operator_rejected_lemma : thm
    val Bob_Commander_rejected_lemma : thm
    val Carol_all_roles_rejected_lemma : thm
    val Operator_Bob_exec_privcmd_justified_thm : thm
    val Operator_mapSM0inputOperatorBob_exec_privcmd_justified_thm : thm
    val inputOKr1_TT_reject_lemma : thm
    val inputOKr1_cmd_reject_lemma : thm
    val inputOKr1_def : thm
    val inputOKr1_ind : thm
    val inputOKr1_staff_rejected_lemma : thm
    val mapSM0_Bob_Operator_privcmd_lemma : thm
    val mapSM0inputOperatorBob_def : thm
    val mapSM0inputOperatorBob_ind : thm

  val SM0r1_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [SM0] Parent theory of "SM0r1"

   [certsr1_def]  Definition

      |- ∀npriv privcmd.
           certsr1 npriv privcmd =
           certs npriv privcmd ++
           [reps (Name (Staff Alice)) (Name (Role Commander))
              (prop (SOME (NP npriv)));
            reps (Name (Staff Bob)) (Name (Role Operator))
              (prop (SOME (PR privcmd)));
            reps (Name (Staff Bob)) (Name (Role Operator))
              (prop (SOME (NP npriv)))]

   [inputOKr1_primitive_def]  Definition

      |- inputOKr1 =
         WFREC (@R. WF R)
           (λinputOKr1 a.
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
              | Name v137 says prop v99 => I F
              | v138 meet v139 says prop v99 => I F
              | Name v159 quoting Name (Staff v170) says prop (SOME cmd) =>
                  I F
              | Name v159 quoting Name (Authority v171) says
                prop (SOME cmd) =>
                  I F
              | Name (Staff Alice) quoting Name (Role Commander) says
                prop (SOME cmd) =>
                  I T
              | Name (Staff Bob) quoting Name (Role Commander) says
                prop (SOME cmd) =>
                  I F
              | Name (Staff Carol) quoting Name (Role Commander) says
                prop (SOME cmd) =>
                  I F
              | Name (Staff Alice) quoting Name (Role Operator) says
                prop (SOME cmd) =>
                  I F
              | Name (Staff Bob) quoting Name (Role Operator) says
                prop (SOME cmd) =>
                  I T
              | Name (Staff Carol) quoting Name (Role Operator) says
                prop (SOME cmd) =>
                  I F
              | Name (Authority v183) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I F
              | Name (Role v184) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I F
              | Name (KeyS v185) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I F
              | Name (KeyA v186) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I F
              | Name (Machine v187) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I F
              | Name v159 quoting Name (KeyS v173) says prop (SOME cmd) =>
                  I F
              | Name v159 quoting Name (KeyA v174) says prop (SOME cmd) =>
                  I F
              | Name v159 quoting Name (Machine v175) says
                prop (SOME cmd) =>
                  I F
              | v160 meet v161 quoting Name v149 says prop (SOME cmd) =>
                  I F
              | (v162 quoting v163) quoting Name v149 says
                prop (SOME cmd) =>
                  I F
              | v140 quoting v150 meet v151 says prop (SOME cmd) => I F
              | v140 quoting v152 quoting v153 says prop (SOME cmd) => I F
              | v140 quoting v141 says prop NONE => I F
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

   [mapSM0inputOperatorBob_primitive_def]  Definition

      |- mapSM0inputOperatorBob =
         WFREC (@R. WF R)
           (λmapSM0inputOperatorBob a.
              case a of
                TT => I TT
              | FF => I TT
              | prop v33 => I TT
              | notf v34 => I TT
              | v35 andf v36 => I TT
              | v37 orf v38 => I TT
              | v39 impf v40 => I TT
              | v41 eqf v42 => I TT
              | v43 says TT => I TT
              | v43 says FF => I TT
              | Name (Staff v150) says prop (SOME cmd) => I TT
              | Name (Authority v151) says prop (SOME cmd) => I TT
              | Name (Role Commander) says prop (SOME cmd) =>
                  I
                    (Name (Staff Alice) quoting Name (Role Commander) says
                     prop (SOME cmd))
              | Name (Role Operator) says prop (SOME cmd) =>
                  I
                    (Name (Staff Bob) quoting Name (Role Operator) says
                     prop (SOME cmd))
              | Name (KeyS v153) says prop (SOME cmd) => I TT
              | Name (KeyA v154) says prop (SOME cmd) => I TT
              | Name (Machine v155) says prop (SOME cmd) => I TT
              | Name v137 says prop NONE => I TT
              | v138 meet v139 says prop v99 => I TT
              | v140 quoting v141 says prop v99 => I TT
              | v43 says notf v100 => I TT
              | v43 says (v101 andf v102) => I TT
              | v43 says (v103 orf v104) => I TT
              | v43 says (v105 impf v106) => I TT
              | v43 says (v107 eqf v108) => I TT
              | v43 says v109 says v110 => I TT
              | v43 says v111 speaks_for v112 => I TT
              | v43 says v113 controls v114 => I TT
              | v43 says reps v115 v116 v117 => I TT
              | v43 says v118 domi v119 => I TT
              | v43 says v120 eqi v121 => I TT
              | v43 says v122 doms v123 => I TT
              | v43 says v124 eqs v125 => I TT
              | v43 says v126 eqn v127 => I TT
              | v43 says v128 lte v129 => I TT
              | v43 says v130 lt v131 => I TT
              | v45 speaks_for v46 => I TT
              | v47 controls v48 => I TT
              | reps v49 v50 v51 => I TT
              | v52 domi v53 => I TT
              | v54 eqi v55 => I TT
              | v56 doms v57 => I TT
              | v58 eqs v59 => I TT
              | v60 eqn v61 => I TT
              | v62 lte v63 => I TT
              | v64 lt v65 => I TT)

   [Alice_Operator_rejected_lemma]  Theorem

      |- ¬inputOKr1
            (Name (Staff Alice) quoting Name (Role Operator) says
             prop (SOME cmd))

   [Bob_Commander_rejected_lemma]  Theorem

      |- ¬inputOKr1
            (Name (Staff Bob) quoting Name (Role Commander) says
             prop (SOME cmd))

   [Carol_all_roles_rejected_lemma]  Theorem

      |- ¬inputOKr1
            (Name (Staff Carol) quoting Name (Role role) says
             prop (SOME cmd))

   [Operator_Bob_exec_privcmd_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOKr1 SM0StateInterp (certsr1 npriv privcmd)
                (Name (Staff Bob) quoting Name (Role Operator) says
                 prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOKr1 SM0StateInterp (certsr1 npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇔
           inputOKr1
             (Name (Staff Bob) quoting Name (Role Operator) says
              prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOKr1 SM0StateInterp (certsr1 npriv privcmd)
                (Name (Staff Bob) quoting Name (Role Operator) says
                 prop (SOME (PR privcmd))::ins) s outs) ∧
           (M,Oi,Os) sat prop (SOME (PR privcmd))

   [Operator_mapSM0inputOperatorBob_exec_privcmd_justified_thm]  Theorem

      |- ∀s privcmd outs npriv ins NS Out M Oi Os.
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOKr1 SM0StateInterp (certsr1 npriv privcmd)
                (mapSM0inputOperatorBob
                   (Name (Role Operator) says prop (SOME (PR privcmd)))::
                     ins) s outs)
             (CFG inputOKr1 SM0StateInterp (certsr1 npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇔
           inputOKr1
             (mapSM0inputOperatorBob
                (Name (Role Operator) says prop (SOME (PR privcmd)))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOKr1 SM0StateInterp (certsr1 npriv privcmd)
                (mapSM0inputOperatorBob
                   (Name (Role Operator) says prop (SOME (PR privcmd)))::
                     ins) s outs) ∧ (M,Oi,Os) sat prop (SOME (PR privcmd))

   [inputOKr1_TT_reject_lemma]  Theorem

      |- ¬inputOKr1 TT

   [inputOKr1_cmd_reject_lemma]  Theorem

      |- ∀cmd. ¬inputOKr1 (prop (SOME cmd))

   [inputOKr1_def]  Theorem

      |- (inputOKr1
            (Name (Staff Bob) quoting Name (Role Operator) says
             prop (SOME cmd)) ⇔ T) ∧
         (inputOKr1
            (Name (Staff Alice) quoting Name (Role Commander) says
             prop (SOME cmd)) ⇔ T) ∧ (inputOKr1 TT ⇔ F) ∧
         (inputOKr1 FF ⇔ F) ∧ (inputOKr1 (prop v) ⇔ F) ∧
         (inputOKr1 (notf v1) ⇔ F) ∧ (inputOKr1 (v2 andf v3) ⇔ F) ∧
         (inputOKr1 (v4 orf v5) ⇔ F) ∧ (inputOKr1 (v6 impf v7) ⇔ F) ∧
         (inputOKr1 (v8 eqf v9) ⇔ F) ∧ (inputOKr1 (v10 says TT) ⇔ F) ∧
         (inputOKr1 (v10 says FF) ⇔ F) ∧
         (inputOKr1 (Name v132 says prop v66) ⇔ F) ∧
         (inputOKr1 (v133 meet v134 says prop v66) ⇔ F) ∧
         (inputOKr1
            (Name v154 quoting Name (Staff v164) says prop (SOME v142)) ⇔
          F) ∧
         (inputOKr1
            (Name v154 quoting Name (Authority v165) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name (Staff Bob) quoting Name (Role Commander) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name (Staff Carol) quoting Name (Role Commander) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name (Staff Alice) quoting Name (Role Operator) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name (Staff Carol) quoting Name (Role Operator) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name (Authority v177) quoting Name (Role v166) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name (Role v178) quoting Name (Role v166) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name (KeyS v179) quoting Name (Role v166) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name (KeyA v180) quoting Name (Role v166) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name (Machine v181) quoting Name (Role v166) says
             prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            (Name v154 quoting Name (KeyS v167) says prop (SOME v142)) ⇔
          F) ∧
         (inputOKr1
            (Name v154 quoting Name (KeyA v168) says prop (SOME v142)) ⇔
          F) ∧
         (inputOKr1
            (Name v154 quoting Name (Machine v169) says prop (SOME v142)) ⇔
          F) ∧
         (inputOKr1
            (v155 meet v156 quoting Name v144 says prop (SOME v142)) ⇔ F) ∧
         (inputOKr1
            ((v157 quoting v158) quoting Name v144 says prop (SOME v142)) ⇔
          F) ∧
         (inputOKr1 (v135 quoting v145 meet v146 says prop (SOME v142)) ⇔
          F) ∧
         (inputOKr1
            (v135 quoting v147 quoting v148 says prop (SOME v142)) ⇔ F) ∧
         (inputOKr1 (v135 quoting v136 says prop NONE) ⇔ F) ∧
         (inputOKr1 (v10 says notf v67) ⇔ F) ∧
         (inputOKr1 (v10 says (v68 andf v69)) ⇔ F) ∧
         (inputOKr1 (v10 says (v70 orf v71)) ⇔ F) ∧
         (inputOKr1 (v10 says (v72 impf v73)) ⇔ F) ∧
         (inputOKr1 (v10 says (v74 eqf v75)) ⇔ F) ∧
         (inputOKr1 (v10 says v76 says v77) ⇔ F) ∧
         (inputOKr1 (v10 says v78 speaks_for v79) ⇔ F) ∧
         (inputOKr1 (v10 says v80 controls v81) ⇔ F) ∧
         (inputOKr1 (v10 says reps v82 v83 v84) ⇔ F) ∧
         (inputOKr1 (v10 says v85 domi v86) ⇔ F) ∧
         (inputOKr1 (v10 says v87 eqi v88) ⇔ F) ∧
         (inputOKr1 (v10 says v89 doms v90) ⇔ F) ∧
         (inputOKr1 (v10 says v91 eqs v92) ⇔ F) ∧
         (inputOKr1 (v10 says v93 eqn v94) ⇔ F) ∧
         (inputOKr1 (v10 says v95 lte v96) ⇔ F) ∧
         (inputOKr1 (v10 says v97 lt v98) ⇔ F) ∧
         (inputOKr1 (v12 speaks_for v13) ⇔ F) ∧
         (inputOKr1 (v14 controls v15) ⇔ F) ∧
         (inputOKr1 (reps v16 v17 v18) ⇔ F) ∧
         (inputOKr1 (v19 domi v20) ⇔ F) ∧ (inputOKr1 (v21 eqi v22) ⇔ F) ∧
         (inputOKr1 (v23 doms v24) ⇔ F) ∧ (inputOKr1 (v25 eqs v26) ⇔ F) ∧
         (inputOKr1 (v27 eqn v28) ⇔ F) ∧ (inputOKr1 (v29 lte v30) ⇔ F) ∧
         (inputOKr1 (v31 lt v32) ⇔ F)

   [inputOKr1_ind]  Theorem

      |- ∀P.
           (∀cmd.
              P
                (Name (Staff Bob) quoting Name (Role Operator) says
                 prop (SOME cmd))) ∧
           (∀cmd.
              P
                (Name (Staff Alice) quoting Name (Role Commander) says
                 prop (SOME cmd))) ∧ P TT ∧ P FF ∧ (∀v. P (prop v)) ∧
           (∀v1. P (notf v1)) ∧ (∀v2 v3. P (v2 andf v3)) ∧
           (∀v4 v5. P (v4 orf v5)) ∧ (∀v6 v7. P (v6 impf v7)) ∧
           (∀v8 v9. P (v8 eqf v9)) ∧ (∀v10. P (v10 says TT)) ∧
           (∀v10. P (v10 says FF)) ∧
           (∀v132 v66. P (Name v132 says prop v66)) ∧
           (∀v133 v134 v66. P (v133 meet v134 says prop v66)) ∧
           (∀v154 v164 v142.
              P
                (Name v154 quoting Name (Staff v164) says
                 prop (SOME v142))) ∧
           (∀v154 v165 v142.
              P
                (Name v154 quoting Name (Authority v165) says
                 prop (SOME v142))) ∧
           (∀v142.
              P
                (Name (Staff Bob) quoting Name (Role Commander) says
                 prop (SOME v142))) ∧
           (∀v142.
              P
                (Name (Staff Carol) quoting Name (Role Commander) says
                 prop (SOME v142))) ∧
           (∀v142.
              P
                (Name (Staff Alice) quoting Name (Role Operator) says
                 prop (SOME v142))) ∧
           (∀v142.
              P
                (Name (Staff Carol) quoting Name (Role Operator) says
                 prop (SOME v142))) ∧
           (∀v177 v166 v142.
              P
                (Name (Authority v177) quoting Name (Role v166) says
                 prop (SOME v142))) ∧
           (∀v178 v166 v142.
              P
                (Name (Role v178) quoting Name (Role v166) says
                 prop (SOME v142))) ∧
           (∀v179 v166 v142.
              P
                (Name (KeyS v179) quoting Name (Role v166) says
                 prop (SOME v142))) ∧
           (∀v180 v166 v142.
              P
                (Name (KeyA v180) quoting Name (Role v166) says
                 prop (SOME v142))) ∧
           (∀v181 v166 v142.
              P
                (Name (Machine v181) quoting Name (Role v166) says
                 prop (SOME v142))) ∧
           (∀v154 v167 v142.
              P
                (Name v154 quoting Name (KeyS v167) says
                 prop (SOME v142))) ∧
           (∀v154 v168 v142.
              P
                (Name v154 quoting Name (KeyA v168) says
                 prop (SOME v142))) ∧
           (∀v154 v169 v142.
              P
                (Name v154 quoting Name (Machine v169) says
                 prop (SOME v142))) ∧
           (∀v155 v156 v144 v142.
              P (v155 meet v156 quoting Name v144 says prop (SOME v142))) ∧
           (∀v157 v158 v144 v142.
              P
                ((v157 quoting v158) quoting Name v144 says
                 prop (SOME v142))) ∧
           (∀v135 v145 v146 v142.
              P (v135 quoting v145 meet v146 says prop (SOME v142))) ∧
           (∀v135 v147 v148 v142.
              P (v135 quoting v147 quoting v148 says prop (SOME v142))) ∧
           (∀v135 v136. P (v135 quoting v136 says prop NONE)) ∧
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

   [inputOKr1_staff_rejected_lemma]  Theorem

      |- ∀P cmd. ¬inputOKr1 (Name (Staff P) says prop (SOME cmd))

   [mapSM0_Bob_Operator_privcmd_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOKr1 SM0StateInterp (certsr1 npriv privcmd)
              (mapSM0inputOperatorBob
                 (Name (Role Operator) says prop (SOME (PR privcmd)))::ins)
              s outs) ⇒
         (M,Oi,Os) sat prop (SOME (PR privcmd))

   [mapSM0inputOperatorBob_def]  Theorem

      |- (mapSM0inputOperatorBob
            (Name (Role Operator) says prop (SOME cmd)) =
          Name (Staff Bob) quoting Name (Role Operator) says
          prop (SOME cmd)) ∧
         (mapSM0inputOperatorBob
            (Name (Role Commander) says prop (SOME cmd)) =
          Name (Staff Alice) quoting Name (Role Commander) says
          prop (SOME cmd)) ∧ (mapSM0inputOperatorBob TT = TT) ∧
         (mapSM0inputOperatorBob FF = TT) ∧
         (mapSM0inputOperatorBob (prop v) = TT) ∧
         (mapSM0inputOperatorBob (notf v1) = TT) ∧
         (mapSM0inputOperatorBob (v2 andf v3) = TT) ∧
         (mapSM0inputOperatorBob (v4 orf v5) = TT) ∧
         (mapSM0inputOperatorBob (v6 impf v7) = TT) ∧
         (mapSM0inputOperatorBob (v8 eqf v9) = TT) ∧
         (mapSM0inputOperatorBob (v10 says TT) = TT) ∧
         (mapSM0inputOperatorBob (v10 says FF) = TT) ∧
         (mapSM0inputOperatorBob
            (Name (Staff v144) says prop (SOME v142)) =
          TT) ∧
         (mapSM0inputOperatorBob
            (Name (Authority v145) says prop (SOME v142)) =
          TT) ∧
         (mapSM0inputOperatorBob (Name (KeyS v147) says prop (SOME v142)) =
          TT) ∧
         (mapSM0inputOperatorBob (Name (KeyA v148) says prop (SOME v142)) =
          TT) ∧
         (mapSM0inputOperatorBob
            (Name (Machine v149) says prop (SOME v142)) =
          TT) ∧ (mapSM0inputOperatorBob (Name v132 says prop NONE) = TT) ∧
         (mapSM0inputOperatorBob (v133 meet v134 says prop v66) = TT) ∧
         (mapSM0inputOperatorBob (v135 quoting v136 says prop v66) = TT) ∧
         (mapSM0inputOperatorBob (v10 says notf v67) = TT) ∧
         (mapSM0inputOperatorBob (v10 says (v68 andf v69)) = TT) ∧
         (mapSM0inputOperatorBob (v10 says (v70 orf v71)) = TT) ∧
         (mapSM0inputOperatorBob (v10 says (v72 impf v73)) = TT) ∧
         (mapSM0inputOperatorBob (v10 says (v74 eqf v75)) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v76 says v77) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v78 speaks_for v79) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v80 controls v81) = TT) ∧
         (mapSM0inputOperatorBob (v10 says reps v82 v83 v84) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v85 domi v86) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v87 eqi v88) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v89 doms v90) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v91 eqs v92) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v93 eqn v94) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v95 lte v96) = TT) ∧
         (mapSM0inputOperatorBob (v10 says v97 lt v98) = TT) ∧
         (mapSM0inputOperatorBob (v12 speaks_for v13) = TT) ∧
         (mapSM0inputOperatorBob (v14 controls v15) = TT) ∧
         (mapSM0inputOperatorBob (reps v16 v17 v18) = TT) ∧
         (mapSM0inputOperatorBob (v19 domi v20) = TT) ∧
         (mapSM0inputOperatorBob (v21 eqi v22) = TT) ∧
         (mapSM0inputOperatorBob (v23 doms v24) = TT) ∧
         (mapSM0inputOperatorBob (v25 eqs v26) = TT) ∧
         (mapSM0inputOperatorBob (v27 eqn v28) = TT) ∧
         (mapSM0inputOperatorBob (v29 lte v30) = TT) ∧
         (mapSM0inputOperatorBob (v31 lt v32) = TT)

   [mapSM0inputOperatorBob_ind]  Theorem

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


*)
end
