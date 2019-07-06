signature inMsgTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val MsgInterpret_primitive_def : thm
    val checkMsg_def : thm
    val inMsg_TY_DEF : thm
    val inMsg_case_def : thm
    val inMsg_size_def : thm
    val mkinMsg_primitive_def : thm
    val orderInterpret_def : thm
    val order_TY_DEF : thm
    val order_case_def : thm
    val order_size_def : thm

  (*  Theorems  *)
    val MsgInterpretOK : thm
    val MsgInterpret_def : thm
    val MsgInterpret_ind : thm
    val MsgInterpret_inverts_mkinMsg_thm : thm
    val checkMsgOK : thm
    val datatype_inMsg : thm
    val datatype_order : thm
    val inMsg_11 : thm
    val inMsg_Axiom : thm
    val inMsg_case_cong : thm
    val inMsg_induction : thm
    val inMsg_nchotomy : thm
    val inMsg_one_one : thm
    val mkinMsg_def : thm
    val mkinMsg_ind : thm
    val order_11 : thm
    val order_Axiom : thm
    val order_case_cong : thm
    val order_induction : thm
    val order_nchotomy : thm
    val order_one_one : thm

  val inMsg_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [m0Types] Parent theory of "inMsg"

   [principal] Parent theory of "inMsg"

   [ssm2] Parent theory of "inMsg"

   [MsgInterpret_primitive_def]  Definition

      |- MsgInterpret =
         WFREC (@R. WF R)
           (λMsgInterpret a.
              case a of
                MSG staff (Order role command) signature =>
                  I
                    (if
                       checkMsg (MSG staff (Order role command) signature)
                     then
                       Name (KeyS (pubK staff)) quoting
                       Name (Role role) says prop (SOME command)
                     else TT))

   [checkMsg_def]  Definition

      |- ∀staff order signature.
           checkMsg (MSG staff order signature) ⇔
           signVerify (pubK staff) signature (SOME order)

   [inMsg_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0'.
                ∀'inMsg' .
                  (∀a0'.
                     (∃a0 a1 a2.
                        a0' =
                        (λa0 a1 a2.
                           ind_type$CONSTR 0 (a0,a1,a2)
                             (λn. ind_type$BOTTOM)) a0 a1 a2) ⇒
                     'inMsg' a0') ⇒
                  'inMsg' a0') rep

   [inMsg_case_def]  Definition

      |- ∀a0 a1 a2 f. inMsg_CASE (MSG a0 a1 a2) f = f a0 a1 a2

   [inMsg_size_def]  Definition

      |- ∀a0 a1 a2.
           inMsg_size (MSG a0 a1 a2) =
           1 +
           (staff_size a0 +
            (order_size a1 +
             asymMsg_size (digest_size order_size) staff_size a2))

   [mkinMsg_primitive_def]  Definition

      |- mkinMsg =
         WFREC (@R. WF R)
           (λmkinMsg a.
              case a of
                TT => ARB
              | FF => ARB
              | prop v => ARB
              | notf v2 => ARB
              | v4 andf v5 => ARB
              | v8 orf v9 => ARB
              | v12 impf v13 => ARB
              | v16 eqf v17 => ARB
              | v20 says TT => ARB
              | v20 says FF => ARB
              | Name v131 says prop v64 => ARB
              | v133 meet v134 says prop v64 => ARB
              | Name v151 quoting Name (Staff v160) says
                prop (SOME command) =>
                  ARB
              | Name v151 quoting Name (Authority v162) says
                prop (SOME command) =>
                  ARB
              | Name (Staff v173) quoting Name (Role role) says
                prop (SOME command) =>
                  ARB
              | Name (Authority v175) quoting Name (Role role) says
                prop (SOME command) =>
                  ARB
              | Name (Role v177) quoting Name (Role role) says
                prop (SOME command) =>
                  ARB
              | Name (KeyS (pubK staff)) quoting Name (Role role) says
                prop (SOME command) =>
                  I
                    (MSG staff (Order role command)
                       (sign (privK staff)
                          (hash (SOME (Order role command)))))
              | Name (KeyS (privK v188)) quoting Name (Role role) says
                prop (SOME command) =>
                  ARB
              | Name (KeyA v180) quoting Name (Role role) says
                prop (SOME command) =>
                  ARB
              | Name (Machine v182) quoting Name (Role role) says
                prop (SOME command) =>
                  ARB
              | Name v151 quoting Name (KeyS v165) says
                prop (SOME command) =>
                  ARB
              | Name v151 quoting Name (KeyA v167) says
                prop (SOME command) =>
                  ARB
              | Name v151 quoting Name (Machine v169) says
                prop (SOME command) =>
                  ARB
              | v152 meet v153 quoting Name v142 says
                prop (SOME command) =>
                  ARB
              | (v156 quoting v157) quoting Name v142 says
                prop (SOME command) =>
                  ARB
              | v137 quoting v143 meet v144 says prop (SOME command) => ARB
              | v137 quoting v147 quoting v148 says prop (SOME command) =>
                  ARB
              | v137 quoting v138 says prop NONE => ARB
              | v20 says notf v65 => ARB
              | v20 says (v67 andf v68) => ARB
              | v20 says (v71 orf v72) => ARB
              | v20 says (v75 impf v76) => ARB
              | v20 says (v79 eqf v80) => ARB
              | v20 says v83 says v84 => ARB
              | v20 says v87 speaks_for v88 => ARB
              | v20 says v91 controls v92 => ARB
              | v20 says reps v95 v96 v97 => ARB
              | v20 says v101 domi v102 => ARB
              | v20 says v105 eqi v106 => ARB
              | v20 says v109 doms v110 => ARB
              | v20 says v113 eqs v114 => ARB
              | v20 says v117 eqn v118 => ARB
              | v20 says v121 lte v122 => ARB
              | v20 says v125 lt v126 => ARB
              | v22 speaks_for v23 => ARB
              | v26 controls v27 => ARB
              | reps v30 v31 v32 => ARB
              | v36 domi v37 => ARB
              | v40 eqi v41 => ARB
              | v44 doms v45 => ARB
              | v48 eqs v49 => ARB
              | v52 eqn v53 => ARB
              | v56 lte v57 => ARB
              | v60 lt v61 => ARB)

   [orderInterpret_def]  Definition

      |- ∀role command.
           orderInterpret (Order role command) =
           Name (Role role) says prop (SOME command)

   [order_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0'.
                ∀'order' .
                  (∀a0'.
                     (∃a0 a1.
                        a0' =
                        (λa0 a1.
                           ind_type$CONSTR 0 (a0,a1) (λn. ind_type$BOTTOM))
                          a0 a1) ⇒
                     'order' a0') ⇒
                  'order' a0') rep

   [order_case_def]  Definition

      |- ∀a0 a1 f. order_CASE (Order a0 a1) f = f a0 a1

   [order_size_def]  Definition

      |- ∀a0 a1.
           order_size (Order a0 a1) = 1 + (role_size a0 + command_size a1)

   [MsgInterpretOK]  Theorem

      |- ∀staff role command.
           MsgInterpret
             (MSG staff (Order role command)
                (sign (privK staff) (hash (SOME (Order role command))))) =
           Name (KeyS (pubK staff)) quoting Name (Role role) says
           prop (SOME command)

   [MsgInterpret_def]  Theorem

      |- MsgInterpret (MSG staff (Order role command) signature) =
         if checkMsg (MSG staff (Order role command) signature) then
           Name (KeyS (pubK staff)) quoting Name (Role role) says
           prop (SOME command)
         else TT

   [MsgInterpret_ind]  Theorem

      |- ∀P.
           (∀staff role command signature.
              P (MSG staff (Order role command) signature)) ⇒
           ∀v. P v

   [MsgInterpret_inverts_mkinMsg_thm]  Theorem

      |- ∀staff role command.
           MsgInterpret
             (mkinMsg
                (Name (KeyS (pubK staff)) quoting Name (Role role) says
                 prop (SOME command))) =
           Name (KeyS (pubK staff)) quoting Name (Role role) says
           prop (SOME command)

   [checkMsgOK]  Theorem

      |- checkMsg
           (MSG staff order (sign (privK staff) (hash (SOME order))))

   [datatype_inMsg]  Theorem

      |- DATATYPE (inMsg MSG)

   [datatype_order]  Theorem

      |- DATATYPE (order Order)

   [inMsg_11]  Theorem

      |- ∀a0 a1 a2 a0' a1' a2'.
           (MSG a0 a1 a2 = MSG a0' a1' a2') ⇔
           (a0 = a0') ∧ (a1 = a1') ∧ (a2 = a2')

   [inMsg_Axiom]  Theorem

      |- ∀f. ∃fn. ∀a0 a1 a2. fn (MSG a0 a1 a2) = f a0 a1 a2

   [inMsg_case_cong]  Theorem

      |- ∀M M' f.
           (M = M') ∧
           (∀a0 a1 a2. (M' = MSG a0 a1 a2) ⇒ (f a0 a1 a2 = f' a0 a1 a2)) ⇒
           (inMsg_CASE M f = inMsg_CASE M' f')

   [inMsg_induction]  Theorem

      |- ∀P. (∀s $o a. P (MSG s $o a)) ⇒ ∀i. P i

   [inMsg_nchotomy]  Theorem

      |- ∀ii. ∃s $o a. ii = MSG s $o a

   [inMsg_one_one]  Theorem

      |- ∀a0 a1 a2 a0' a1' a2'.
           (MSG a0 a1 a2 = MSG a0' a1' a2') ⇔
           (a0 = a0') ∧ (a1 = a1') ∧ (a2 = a2')

   [mkinMsg_def]  Theorem

      |- mkinMsg
           (Name (KeyS (pubK staff)) quoting Name (Role role) says
            prop (SOME command)) =
         MSG staff (Order role command)
           (sign (privK staff) (hash (SOME (Order role command))))

   [mkinMsg_ind]  Theorem

      |- ∀P.
           (∀staff role command.
              P
                (Name (KeyS (pubK staff)) quoting Name (Role role) says
                 prop (SOME command))) ∧ P TT ∧ P FF ∧ (∀v1. P (prop v1)) ∧
           (∀v3. P (notf v3)) ∧ (∀v6 v7. P (v6 andf v7)) ∧
           (∀v10 v11. P (v10 orf v11)) ∧ (∀v14 v15. P (v14 impf v15)) ∧
           (∀v18 v19. P (v18 eqf v19)) ∧ (∀v129. P (v129 says TT)) ∧
           (∀v130. P (v130 says FF)) ∧
           (∀v132 v139. P (Name v132 says prop v139)) ∧
           (∀v135 v136 v140. P (v135 meet v136 says prop v140)) ∧
           (∀v171 v161 command.
              P
                (Name v171 quoting Name (Staff v161) says
                 prop (SOME command))) ∧
           (∀v172 v163 command.
              P
                (Name v172 quoting Name (Authority v163) says
                 prop (SOME command))) ∧
           (∀v174 v184 command.
              P
                (Name (Staff v174) quoting Name (Role v184) says
                 prop (SOME command))) ∧
           (∀v176 v185 command.
              P
                (Name (Authority v176) quoting Name (Role v185) says
                 prop (SOME command))) ∧
           (∀v178 v186 command.
              P
                (Name (Role v178) quoting Name (Role v186) says
                 prop (SOME command))) ∧
           (∀v189 role command.
              P
                (Name (KeyS (privK v189)) quoting Name (Role role) says
                 prop (SOME command))) ∧
           (∀v181 v190 command.
              P
                (Name (KeyA v181) quoting Name (Role v190) says
                 prop (SOME command))) ∧
           (∀v183 v191 command.
              P
                (Name (Machine v183) quoting Name (Role v191) says
                 prop (SOME command))) ∧
           (∀v192 v166 command.
              P
                (Name v192 quoting Name (KeyS v166) says
                 prop (SOME command))) ∧
           (∀v193 v168 command.
              P
                (Name v193 quoting Name (KeyA v168) says
                 prop (SOME command))) ∧
           (∀v194 v170 command.
              P
                (Name v194 quoting Name (Machine v170) says
                 prop (SOME command))) ∧
           (∀v154 v155 v195 v196.
              P (v154 meet v155 quoting Name v195 says prop (SOME v196))) ∧
           (∀v158 v159 v197 v198.
              P
                ((v158 quoting v159) quoting Name v197 says
                 prop (SOME v198))) ∧
           (∀v200 v145 v146 v199.
              P (v200 quoting v145 meet v146 says prop (SOME v199))) ∧
           (∀v202 v149 v150 v201.
              P (v202 quoting v149 quoting v150 says prop (SOME v201))) ∧
           (∀v203 v204. P (v203 quoting v204 says prop NONE)) ∧
           (∀v205 v66. P (v205 says notf v66)) ∧
           (∀v206 v69 v70. P (v206 says (v69 andf v70))) ∧
           (∀v207 v73 v74. P (v207 says (v73 orf v74))) ∧
           (∀v208 v77 v78. P (v208 says (v77 impf v78))) ∧
           (∀v209 v81 v82. P (v209 says (v81 eqf v82))) ∧
           (∀v210 v85 v86. P (v210 says v85 says v86)) ∧
           (∀v211 v89 v90. P (v211 says v89 speaks_for v90)) ∧
           (∀v212 v93 v94. P (v212 says v93 controls v94)) ∧
           (∀v213 v98 v99 v100. P (v213 says reps v98 v99 v100)) ∧
           (∀v214 v103 v104. P (v214 says v103 domi v104)) ∧
           (∀v215 v107 v108. P (v215 says v107 eqi v108)) ∧
           (∀v216 v111 v112. P (v216 says v111 doms v112)) ∧
           (∀v217 v115 v116. P (v217 says v115 eqs v116)) ∧
           (∀v218 v119 v120. P (v218 says v119 eqn v120)) ∧
           (∀v219 v123 v124. P (v219 says v123 lte v124)) ∧
           (∀v220 v127 v128. P (v220 says v127 lt v128)) ∧
           (∀v24 v25. P (v24 speaks_for v25)) ∧
           (∀v28 v29. P (v28 controls v29)) ∧
           (∀v33 v34 v35. P (reps v33 v34 v35)) ∧
           (∀v38 v39. P (v38 domi v39)) ∧ (∀v42 v43. P (v42 eqi v43)) ∧
           (∀v46 v47. P (v46 doms v47)) ∧ (∀v50 v51. P (v50 eqs v51)) ∧
           (∀v54 v55. P (v54 eqn v55)) ∧ (∀v58 v59. P (v58 lte v59)) ∧
           (∀v62 v63. P (v62 lt v63)) ⇒
           ∀v. P v

   [order_11]  Theorem

      |- ∀a0 a1 a0' a1'.
           (Order a0 a1 = Order a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')

   [order_Axiom]  Theorem

      |- ∀f. ∃fn. ∀a0 a1. fn (Order a0 a1) = f a0 a1

   [order_case_cong]  Theorem

      |- ∀M M' f.
           (M = M') ∧ (∀a0 a1. (M' = Order a0 a1) ⇒ (f a0 a1 = f' a0 a1)) ⇒
           (order_CASE M f = order_CASE M' f')

   [order_induction]  Theorem

      |- ∀P. (∀r c. P (Order r c)) ⇒ ∀ $o. P $o

   [order_nchotomy]  Theorem

      |- ∀oo. ∃r c. oo = Order r c

   [order_one_one]  Theorem

      |- ∀a0 a1 a0' a1'.
           (Order a0 a1 = Order a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')


*)
end
