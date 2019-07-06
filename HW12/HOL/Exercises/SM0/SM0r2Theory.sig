signature SM0r2Theory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val certsr2_def : thm
    val certsr2root_def : thm
    val certsr2signed_def : thm
    val inputOKr2_primitive_def : thm
    val mapSM0r1input_primitive_def : thm

  (*  Theorems  *)
    val Operator_Bob_exec_privcmd_justified_thm_r2 : thm
    val Operator_mapSM0r1input_exec_privcmd_justifed_thm : thm
    val inputOKr2_def : thm
    val inputOKr2_ind : thm
    val mapSM0r1_Bob_Operator_privcmd_lemma : thm
    val mapSM0r1input_def : thm
    val mapSM0r1input_ind : thm

  val SM0r2_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [SM0r1] Parent theory of "SM0r2"

   [certsr2_def]  Definition

      |- ∀npriv privcmd.
           certsr2 npriv privcmd =
           certsr1 npriv privcmd ++ certsr2root npriv privcmd ++
           certsr2signed npriv privcmd

   [certsr2root_def]  Definition

      |- ∀npriv privcmd.
           certsr2root npriv privcmd =
           [Name (KeyA (pubK (ca 0))) speaks_for Name (Authority (ca 0));
            Name (Authority (ca 0)) controls
            Name (KeyS (pubK Bob)) speaks_for Name (Staff Bob);
            Name (Authority (ca 0)) controls
            Name (KeyS (pubK Alice)) speaks_for Name (Staff Alice)]

   [certsr2signed_def]  Definition

      |- ∀npriv privcmd.
           certsr2signed npriv privcmd =
           [Name (KeyA (pubK (ca 0))) says
            Name (KeyS (pubK Bob)) speaks_for Name (Staff Bob);
            Name (KeyA (pubK (ca 0))) says
            Name (KeyS (pubK Alice)) speaks_for Name (Staff Alice)]

   [inputOKr2_primitive_def]  Definition

      |- inputOKr2 =
         WFREC (@R. WF R)
           (λinputOKr2 a.
              case a of
                TT => I F
              | FF => I F
              | prop v33 => I F
              | notf v34 => I F
              | v35 andf v36 => I F
              | v37 orf v38 => I F
              | v39 impf v40 => I F
              | v41 eqf v42 => I F
              | Name v71 says v44 => I F
              | v72 meet v73 says v44 => I F
              | Name (Staff v92) quoting v75 says v44 => I F
              | Name (Authority v93) quoting v75 says v44 => I F
              | Name (Role v94) quoting v75 says v44 => I F
              | Name (KeyS (pubK v100)) quoting Name (Staff v118) says
                v44 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Authority v119) says
                v44 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says TT =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says FF =>
                  I F
              | Name (KeyS (pubK Alice)) quoting Name (Role Commander) says
                prop (SOME cmd) =>
                  I T
              | Name (KeyS (pubK Bob)) quoting Name (Role Commander) says
                prop (SOME cmd) =>
                  I F
              | Name (KeyS (pubK Carol)) quoting Name (Role Commander) says
                prop (SOME cmd) =>
                  I F
              | Name (KeyS (pubK Alice)) quoting Name (Role Operator) says
                prop (SOME cmd) =>
                  I F
              | Name (KeyS (pubK Bob)) quoting Name (Role Operator) says
                prop (SOME cmd) =>
                  I T
              | Name (KeyS (pubK Carol)) quoting Name (Role Operator) says
                prop (SOME cmd) =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                prop NONE =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                notf v158 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                (v159 andf v160) =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                (v161 orf v162) =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                (v163 impf v164) =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                (v165 eqf v166) =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v167 says v168 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v169 speaks_for v170 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v171 controls v172 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                reps v173 v174 v175 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v176 domi v177 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v178 eqi v179 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v180 doms v181 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v182 eqs v183 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v184 eqn v185 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v186 lte v187 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Role v120) says
                v188 lt v189 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (KeyS v121) says
                v44 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (KeyA v122) says
                v44 =>
                  I F
              | Name (KeyS (pubK v100)) quoting Name (Machine v123) says
                v44 =>
                  I F
              | Name (KeyS (pubK v100)) quoting v108 meet v109 says v44 =>
                  I F
              | Name (KeyS (pubK v100)) quoting v110 quoting v111 says
                v44 =>
                  I F
              | Name (KeyS (privK v101)) quoting v75 says v44 => I F
              | Name (KeyA v96) quoting v75 says v44 => I F
              | Name (Machine v97) quoting v75 says v44 => I F
              | v82 meet v83 quoting v75 says v44 => I F
              | (v84 quoting v85) quoting v75 says v44 => I F
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

   [mapSM0r1input_primitive_def]  Definition

      |- mapSM0r1input =
         WFREC (@R. WF R)
           (λmapSM0r1input a.
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
              | Name v137 says prop v99 => I TT
              | v138 meet v139 says prop v99 => I TT
              | Name v159 quoting Name (Staff v170) says prop (SOME cmd) =>
                  I TT
              | Name v159 quoting Name (Authority v171) says
                prop (SOME cmd) =>
                  I TT
              | Name (Staff Alice) quoting Name (Role Commander) says
                prop (SOME cmd) =>
                  I
                    (Name (KeyS (pubK Alice)) quoting
                     Name (Role Commander) says prop (SOME cmd))
              | Name (Staff Bob) quoting Name (Role Commander) says
                prop (SOME cmd) =>
                  I TT
              | Name (Staff Carol) quoting Name (Role Commander) says
                prop (SOME cmd) =>
                  I TT
              | Name (Staff Alice) quoting Name (Role Operator) says
                prop (SOME cmd) =>
                  I TT
              | Name (Staff Bob) quoting Name (Role Operator) says
                prop (SOME cmd) =>
                  I
                    (Name (KeyS (pubK Bob)) quoting
                     Name (Role Operator) says prop (SOME cmd))
              | Name (Staff Carol) quoting Name (Role Operator) says
                prop (SOME cmd) =>
                  I TT
              | Name (Authority v183) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I TT
              | Name (Role v184) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I TT
              | Name (KeyS v185) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I TT
              | Name (KeyA v186) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I TT
              | Name (Machine v187) quoting Name (Role v172) says
                prop (SOME cmd) =>
                  I TT
              | Name v159 quoting Name (KeyS v173) says prop (SOME cmd) =>
                  I TT
              | Name v159 quoting Name (KeyA v174) says prop (SOME cmd) =>
                  I TT
              | Name v159 quoting Name (Machine v175) says
                prop (SOME cmd) =>
                  I TT
              | v160 meet v161 quoting Name v149 says prop (SOME cmd) =>
                  I TT
              | (v162 quoting v163) quoting Name v149 says
                prop (SOME cmd) =>
                  I TT
              | v140 quoting v150 meet v151 says prop (SOME cmd) => I TT
              | v140 quoting v152 quoting v153 says prop (SOME cmd) => I TT
              | v140 quoting v141 says prop NONE => I TT
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

   [Operator_Bob_exec_privcmd_justified_thm_r2]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd)
                (Name (KeyS (pubK Bob)) quoting Name (Role Operator) says
                 prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇔
           inputOKr2
             (Name (KeyS (pubK Bob)) quoting Name (Role Operator) says
              prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd)
                (Name (KeyS (pubK Bob)) quoting Name (Role Operator) says
                 prop (SOME (PR privcmd))::ins) s outs) ∧
           (M,Oi,Os) sat prop (SOME (PR privcmd))

   [Operator_mapSM0r1input_exec_privcmd_justifed_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd)
                (mapSM0r1input
                   (mapSM0inputOperatorBob
                      (Name (Role Operator) says
                       prop (SOME (PR privcmd))))::ins) s outs)
             (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇔
           inputOKr2
             (mapSM0r1input
                (mapSM0inputOperatorBob
                   (Name (Role Operator) says prop (SOME (PR privcmd))))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd)
                (mapSM0r1input
                   (mapSM0inputOperatorBob
                      (Name (Role Operator) says
                       prop (SOME (PR privcmd))))::ins) s outs) ∧
           (M,Oi,Os) sat prop (SOME (PR privcmd))

   [inputOKr2_def]  Theorem

      |- (inputOKr2
            (Name (KeyS (pubK Bob)) quoting Name (Role Operator) says
             prop (SOME cmd)) ⇔ T) ∧
         (inputOKr2
            (Name (KeyS (pubK Alice)) quoting Name (Role Commander) says
             prop (SOME cmd)) ⇔ T) ∧ (inputOKr2 TT ⇔ F) ∧
         (inputOKr2 FF ⇔ F) ∧ (inputOKr2 (prop v) ⇔ F) ∧
         (inputOKr2 (notf v1) ⇔ F) ∧ (inputOKr2 (v2 andf v3) ⇔ F) ∧
         (inputOKr2 (v4 orf v5) ⇔ F) ∧ (inputOKr2 (v6 impf v7) ⇔ F) ∧
         (inputOKr2 (v8 eqf v9) ⇔ F) ∧
         (inputOKr2 (Name v66 says v11) ⇔ F) ∧
         (inputOKr2 (v67 meet v68 says v11) ⇔ F) ∧
         (inputOKr2 (Name (Staff v86) quoting v70 says v11) ⇔ F) ∧
         (inputOKr2 (Name (Authority v87) quoting v70 says v11) ⇔ F) ∧
         (inputOKr2 (Name (Role v88) quoting v70 says v11) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Staff v112) says v11) ⇔
          F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Authority v113) says
             v11) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says TT) ⇔
          F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says FF) ⇔
          F) ∧
         (inputOKr2
            (Name (KeyS (pubK Bob)) quoting Name (Role Commander) says
             prop (SOME v190)) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK Carol)) quoting Name (Role Commander) says
             prop (SOME v190)) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK Alice)) quoting Name (Role Operator) says
             prop (SOME v190)) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK Carol)) quoting Name (Role Operator) says
             prop (SOME v190)) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says
             prop NONE) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says
             notf v125) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says
             (v126 andf v127)) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says
             (v128 orf v129)) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says
             (v130 impf v131)) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says
             (v132 eqf v133)) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says v134 says
             v135) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says
             v136 speaks_for v137) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says
             v138 controls v139) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says
             reps v140 v141 v142) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says v143 domi
             v144) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says v145 eqi
             v146) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says v147 doms
             v148) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says v149 eqs
             v150) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says v151 eqn
             v152) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says v153 lte
             v154) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Role v114) says v155 lt
             v156) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (KeyS v115) says v11) ⇔
          F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (KeyA v116) says v11) ⇔
          F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting Name (Machine v117) says v11) ⇔
          F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting v103 meet v104 says v11) ⇔ F) ∧
         (inputOKr2
            (Name (KeyS (pubK v98)) quoting v105 quoting v106 says v11) ⇔
          F) ∧
         (inputOKr2 (Name (KeyS (privK v99)) quoting v70 says v11) ⇔ F) ∧
         (inputOKr2 (Name (KeyA v90) quoting v70 says v11) ⇔ F) ∧
         (inputOKr2 (Name (Machine v91) quoting v70 says v11) ⇔ F) ∧
         (inputOKr2 (v77 meet v78 quoting v70 says v11) ⇔ F) ∧
         (inputOKr2 ((v79 quoting v80) quoting v70 says v11) ⇔ F) ∧
         (inputOKr2 (v12 speaks_for v13) ⇔ F) ∧
         (inputOKr2 (v14 controls v15) ⇔ F) ∧
         (inputOKr2 (reps v16 v17 v18) ⇔ F) ∧
         (inputOKr2 (v19 domi v20) ⇔ F) ∧ (inputOKr2 (v21 eqi v22) ⇔ F) ∧
         (inputOKr2 (v23 doms v24) ⇔ F) ∧ (inputOKr2 (v25 eqs v26) ⇔ F) ∧
         (inputOKr2 (v27 eqn v28) ⇔ F) ∧ (inputOKr2 (v29 lte v30) ⇔ F) ∧
         (inputOKr2 (v31 lt v32) ⇔ F)

   [inputOKr2_ind]  Theorem

      |- ∀P.
           (∀cmd.
              P
                (Name (KeyS (pubK Bob)) quoting Name (Role Operator) says
                 prop (SOME cmd))) ∧
           (∀cmd.
              P
                (Name (KeyS (pubK Alice)) quoting
                 Name (Role Commander) says prop (SOME cmd))) ∧ P TT ∧
           P FF ∧ (∀v. P (prop v)) ∧ (∀v1. P (notf v1)) ∧
           (∀v2 v3. P (v2 andf v3)) ∧ (∀v4 v5. P (v4 orf v5)) ∧
           (∀v6 v7. P (v6 impf v7)) ∧ (∀v8 v9. P (v8 eqf v9)) ∧
           (∀v66 v11. P (Name v66 says v11)) ∧
           (∀v67 v68 v11. P (v67 meet v68 says v11)) ∧
           (∀v86 v70 v11. P (Name (Staff v86) quoting v70 says v11)) ∧
           (∀v87 v70 v11. P (Name (Authority v87) quoting v70 says v11)) ∧
           (∀v88 v70 v11. P (Name (Role v88) quoting v70 says v11)) ∧
           (∀v98 v112 v11.
              P
                (Name (KeyS (pubK v98)) quoting Name (Staff v112) says
                 v11)) ∧
           (∀v98 v113 v11.
              P
                (Name (KeyS (pubK v98)) quoting Name (Authority v113) says
                 v11)) ∧
           (∀v98 v114.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 TT)) ∧
           (∀v98 v114.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 FF)) ∧
           (∀v190.
              P
                (Name (KeyS (pubK Bob)) quoting Name (Role Commander) says
                 prop (SOME v190))) ∧
           (∀v190.
              P
                (Name (KeyS (pubK Carol)) quoting
                 Name (Role Commander) says prop (SOME v190))) ∧
           (∀v190.
              P
                (Name (KeyS (pubK Alice)) quoting Name (Role Operator) says
                 prop (SOME v190))) ∧
           (∀v190.
              P
                (Name (KeyS (pubK Carol)) quoting Name (Role Operator) says
                 prop (SOME v190))) ∧
           (∀v98 v114.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 prop NONE)) ∧
           (∀v98 v114 v125.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 notf v125)) ∧
           (∀v98 v114 v126 v127.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 (v126 andf v127))) ∧
           (∀v98 v114 v128 v129.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 (v128 orf v129))) ∧
           (∀v98 v114 v130 v131.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 (v130 impf v131))) ∧
           (∀v98 v114 v132 v133.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 (v132 eqf v133))) ∧
           (∀v98 v114 v134 v135.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v134 says v135)) ∧
           (∀v98 v114 v136 v137.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v136 speaks_for v137)) ∧
           (∀v98 v114 v138 v139.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v138 controls v139)) ∧
           (∀v98 v114 v140 v141 v142.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 reps v140 v141 v142)) ∧
           (∀v98 v114 v143 v144.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v143 domi v144)) ∧
           (∀v98 v114 v145 v146.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v145 eqi v146)) ∧
           (∀v98 v114 v147 v148.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v147 doms v148)) ∧
           (∀v98 v114 v149 v150.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v149 eqs v150)) ∧
           (∀v98 v114 v151 v152.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v151 eqn v152)) ∧
           (∀v98 v114 v153 v154.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v153 lte v154)) ∧
           (∀v98 v114 v155 v156.
              P
                (Name (KeyS (pubK v98)) quoting Name (Role v114) says
                 v155 lt v156)) ∧
           (∀v98 v115 v11.
              P
                (Name (KeyS (pubK v98)) quoting Name (KeyS v115) says
                 v11)) ∧
           (∀v98 v116 v11.
              P
                (Name (KeyS (pubK v98)) quoting Name (KeyA v116) says
                 v11)) ∧
           (∀v98 v117 v11.
              P
                (Name (KeyS (pubK v98)) quoting Name (Machine v117) says
                 v11)) ∧
           (∀v98 v103 v104 v11.
              P (Name (KeyS (pubK v98)) quoting v103 meet v104 says v11)) ∧
           (∀v98 v105 v106 v11.
              P
                (Name (KeyS (pubK v98)) quoting v105 quoting v106 says
                 v11)) ∧
           (∀v99 v70 v11.
              P (Name (KeyS (privK v99)) quoting v70 says v11)) ∧
           (∀v90 v70 v11. P (Name (KeyA v90) quoting v70 says v11)) ∧
           (∀v91 v70 v11. P (Name (Machine v91) quoting v70 says v11)) ∧
           (∀v77 v78 v70 v11. P (v77 meet v78 quoting v70 says v11)) ∧
           (∀v79 v80 v70 v11. P ((v79 quoting v80) quoting v70 says v11)) ∧
           (∀v12 v13. P (v12 speaks_for v13)) ∧
           (∀v14 v15. P (v14 controls v15)) ∧
           (∀v16 v17 v18. P (reps v16 v17 v18)) ∧
           (∀v19 v20. P (v19 domi v20)) ∧ (∀v21 v22. P (v21 eqi v22)) ∧
           (∀v23 v24. P (v23 doms v24)) ∧ (∀v25 v26. P (v25 eqs v26)) ∧
           (∀v27 v28. P (v27 eqn v28)) ∧ (∀v29 v30. P (v29 lte v30)) ∧
           (∀v31 v32. P (v31 lt v32)) ⇒
           ∀v. P v

   [mapSM0r1_Bob_Operator_privcmd_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd)
              (mapSM0r1input
                 (mapSM0inputOperatorBob
                    (Name (Role Operator) says prop (SOME (PR privcmd))))::
                   ins) s outs) ⇒
         (M,Oi,Os) sat prop (SOME (PR privcmd))

   [mapSM0r1input_def]  Theorem

      |- (mapSM0r1input
            (Name (Staff Bob) quoting Name (Role Operator) says
             prop (SOME cmd)) =
          Name (KeyS (pubK Bob)) quoting Name (Role Operator) says
          prop (SOME cmd)) ∧
         (mapSM0r1input
            (Name (Staff Alice) quoting Name (Role Commander) says
             prop (SOME cmd)) =
          Name (KeyS (pubK Alice)) quoting Name (Role Commander) says
          prop (SOME cmd)) ∧ (mapSM0r1input TT = TT) ∧
         (mapSM0r1input FF = TT) ∧ (mapSM0r1input (prop v) = TT) ∧
         (mapSM0r1input (notf v1) = TT) ∧
         (mapSM0r1input (v2 andf v3) = TT) ∧
         (mapSM0r1input (v4 orf v5) = TT) ∧
         (mapSM0r1input (v6 impf v7) = TT) ∧
         (mapSM0r1input (v8 eqf v9) = TT) ∧
         (mapSM0r1input (v10 says TT) = TT) ∧
         (mapSM0r1input (v10 says FF) = TT) ∧
         (mapSM0r1input (Name v132 says prop v66) = TT) ∧
         (mapSM0r1input (v133 meet v134 says prop v66) = TT) ∧
         (mapSM0r1input
            (Name v154 quoting Name (Staff v164) says prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name v154 quoting Name (Authority v165) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name (Staff Bob) quoting Name (Role Commander) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name (Staff Carol) quoting Name (Role Commander) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name (Staff Alice) quoting Name (Role Operator) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name (Staff Carol) quoting Name (Role Operator) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name (Authority v177) quoting Name (Role v166) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name (Role v178) quoting Name (Role v166) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name (KeyS v179) quoting Name (Role v166) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name (KeyA v180) quoting Name (Role v166) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name (Machine v181) quoting Name (Role v166) says
             prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name v154 quoting Name (KeyS v167) says prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name v154 quoting Name (KeyA v168) says prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (Name v154 quoting Name (Machine v169) says prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (v155 meet v156 quoting Name v144 says prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            ((v157 quoting v158) quoting Name v144 says prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (v135 quoting v145 meet v146 says prop (SOME v142)) =
          TT) ∧
         (mapSM0r1input
            (v135 quoting v147 quoting v148 says prop (SOME v142)) =
          TT) ∧ (mapSM0r1input (v135 quoting v136 says prop NONE) = TT) ∧
         (mapSM0r1input (v10 says notf v67) = TT) ∧
         (mapSM0r1input (v10 says (v68 andf v69)) = TT) ∧
         (mapSM0r1input (v10 says (v70 orf v71)) = TT) ∧
         (mapSM0r1input (v10 says (v72 impf v73)) = TT) ∧
         (mapSM0r1input (v10 says (v74 eqf v75)) = TT) ∧
         (mapSM0r1input (v10 says v76 says v77) = TT) ∧
         (mapSM0r1input (v10 says v78 speaks_for v79) = TT) ∧
         (mapSM0r1input (v10 says v80 controls v81) = TT) ∧
         (mapSM0r1input (v10 says reps v82 v83 v84) = TT) ∧
         (mapSM0r1input (v10 says v85 domi v86) = TT) ∧
         (mapSM0r1input (v10 says v87 eqi v88) = TT) ∧
         (mapSM0r1input (v10 says v89 doms v90) = TT) ∧
         (mapSM0r1input (v10 says v91 eqs v92) = TT) ∧
         (mapSM0r1input (v10 says v93 eqn v94) = TT) ∧
         (mapSM0r1input (v10 says v95 lte v96) = TT) ∧
         (mapSM0r1input (v10 says v97 lt v98) = TT) ∧
         (mapSM0r1input (v12 speaks_for v13) = TT) ∧
         (mapSM0r1input (v14 controls v15) = TT) ∧
         (mapSM0r1input (reps v16 v17 v18) = TT) ∧
         (mapSM0r1input (v19 domi v20) = TT) ∧
         (mapSM0r1input (v21 eqi v22) = TT) ∧
         (mapSM0r1input (v23 doms v24) = TT) ∧
         (mapSM0r1input (v25 eqs v26) = TT) ∧
         (mapSM0r1input (v27 eqn v28) = TT) ∧
         (mapSM0r1input (v29 lte v30) = TT) ∧
         (mapSM0r1input (v31 lt v32) = TT)

   [mapSM0r1input_ind]  Theorem

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


*)
end
