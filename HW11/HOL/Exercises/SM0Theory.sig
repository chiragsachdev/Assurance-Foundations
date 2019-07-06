signature SM0Theory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val SM0StateInterp_def : thm
    val certs_def : thm
    val command_TY_DEF : thm
    val command_case_def : thm
    val command_size_def : thm
    val inputOK_primitive_def : thm
    val npriv_BIJ : thm
    val npriv_CASE : thm
    val npriv_TY_DEF : thm
    val npriv_size_def : thm
    val output_BIJ : thm
    val output_CASE : thm
    val output_TY_DEF : thm
    val output_size_def : thm
    val privcmd_BIJ : thm
    val privcmd_CASE : thm
    val privcmd_TY_DEF : thm
    val privcmd_size_def : thm
    val staff_BIJ : thm
    val staff_CASE : thm
    val staff_TY_DEF : thm
    val staff_size_def : thm
    val state_BIJ : thm
    val state_CASE : thm
    val state_TY_DEF : thm
    val state_size_def : thm

  (*  Theorems  *)
    val Alice_exec_privcmd_justified_thm : thm
    val Alice_justified_privcmd_exec_thm : thm
    val Alice_privcmd_lemma : thm
    val Alice_privcmd_verified_thm : thm
    val Carol_discard_lemma : thm
    val Carol_rejected_lemma : thm
    val SM0ns_def : thm
    val SM0ns_ind : thm
    val SM0out_def : thm
    val SM0out_ind : thm
    val command_11 : thm
    val command_Axiom : thm
    val command_case_cong : thm
    val command_distinct : thm
    val command_distinct_clauses : thm
    val command_induction : thm
    val command_nchotomy : thm
    val command_one_one : thm
    val datatype_command : thm
    val datatype_npriv : thm
    val datatype_output : thm
    val datatype_privcmd : thm
    val datatype_staff : thm
    val datatype_state : thm
    val inputOK_def : thm
    val inputOK_ind : thm
    val npriv2num_11 : thm
    val npriv2num_ONTO : thm
    val npriv2num_num2npriv : thm
    val npriv2num_thm : thm
    val npriv_Axiom : thm
    val npriv_EQ_npriv : thm
    val npriv_case_cong : thm
    val npriv_case_def : thm
    val npriv_induction : thm
    val npriv_nchotomy : thm
    val num2npriv_11 : thm
    val num2npriv_ONTO : thm
    val num2npriv_npriv2num : thm
    val num2npriv_thm : thm
    val num2output_11 : thm
    val num2output_ONTO : thm
    val num2output_output2num : thm
    val num2output_thm : thm
    val num2privcmd_11 : thm
    val num2privcmd_ONTO : thm
    val num2privcmd_privcmd2num : thm
    val num2privcmd_thm : thm
    val num2staff_11 : thm
    val num2staff_ONTO : thm
    val num2staff_staff2num : thm
    val num2staff_thm : thm
    val num2state_11 : thm
    val num2state_ONTO : thm
    val num2state_state2num : thm
    val num2state_thm : thm
    val output2num_11 : thm
    val output2num_ONTO : thm
    val output2num_num2output : thm
    val output2num_thm : thm
    val output_Axiom : thm
    val output_EQ_output : thm
    val output_case_cong : thm
    val output_case_def : thm
    val output_distinct : thm
    val output_distinct_clauses : thm
    val output_induction : thm
    val output_nchotomy : thm
    val privcmd2num_11 : thm
    val privcmd2num_ONTO : thm
    val privcmd2num_num2privcmd : thm
    val privcmd2num_thm : thm
    val privcmd_Axiom : thm
    val privcmd_EQ_privcmd : thm
    val privcmd_case_cong : thm
    val privcmd_case_def : thm
    val privcmd_distinct : thm
    val privcmd_distinct_clauses : thm
    val privcmd_induction : thm
    val privcmd_nchotomy : thm
    val staff2num_11 : thm
    val staff2num_ONTO : thm
    val staff2num_num2staff : thm
    val staff2num_thm : thm
    val staff_Axiom : thm
    val staff_EQ_staff : thm
    val staff_case_cong : thm
    val staff_case_def : thm
    val staff_distinct : thm
    val staff_distinct_clauses : thm
    val staff_induction : thm
    val staff_nchotomy : thm
    val state2num_11 : thm
    val state2num_ONTO : thm
    val state2num_num2state : thm
    val state2num_thm : thm
    val state_Axiom : thm
    val state_EQ_state : thm
    val state_case_cong : thm
    val state_case_def : thm
    val state_distinct : thm
    val state_distinct_clauses : thm
    val state_induction : thm
    val state_nchotomy : thm

  val SM0_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [ssm1] Parent theory of "SM0"

   [SM0StateInterp_def]  Definition

      |- ∀state. SM0StateInterp state = TT

   [certs_def]  Definition

      |- ∀cmd npriv privcmd.
           certs cmd npriv privcmd =
           [Name Alice controls prop (SOME (NP npriv));
            Name Alice controls prop (SOME (PR privcmd));
            Name Bob controls prop (SOME (NP npriv));
            Name Bob says prop (SOME (PR privcmd)) impf prop NONE]

   [command_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'command' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR 0 (a,ARB) (λn. ind_type$BOTTOM))
                          a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC 0) (ARB,a)
                             (λn. ind_type$BOTTOM)) a) ⇒
                     'command' a0) ⇒
                  'command' a0) rep

   [command_case_def]  Definition

      |- (∀a f f1. command_CASE (NP a) f f1 = f a) ∧
         ∀a f f1. command_CASE (PR a) f f1 = f1 a

   [command_size_def]  Definition

      |- (∀a. command_size (NP a) = 1 + npriv_size a) ∧
         ∀a. command_size (PR a) = 1 + privcmd_size a

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
              | Name Alice says prop (SOME cmd) => I T
              | Name Bob says prop (SOME cmd) => I T
              | Name Carol says prop (SOME cmd) => I F
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

   [npriv_BIJ]  Definition

      |- (∀a. num2npriv (npriv2num a) = a) ∧
         ∀r. (λn. n < 1) r ⇔ (npriv2num (num2npriv r) = r)

   [npriv_CASE]  Definition

      |- ∀x v0. (case x of status => v0) = (λm. v0) (npriv2num x)

   [npriv_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 1) rep

   [npriv_size_def]  Definition

      |- ∀x. npriv_size x = 0

   [output_BIJ]  Definition

      |- (∀a. num2output (output2num a) = a) ∧
         ∀r. (λn. n < 2) r ⇔ (output2num (num2output r) = r)

   [output_CASE]  Definition

      |- ∀x v0 v1.
           (case x of on => v0 | off => v1) =
           (λm. if m = 0 then v0 else v1) (output2num x)

   [output_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 2) rep

   [output_size_def]  Definition

      |- ∀x. output_size x = 0

   [privcmd_BIJ]  Definition

      |- (∀a. num2privcmd (privcmd2num a) = a) ∧
         ∀r. (λn. n < 2) r ⇔ (privcmd2num (num2privcmd r) = r)

   [privcmd_CASE]  Definition

      |- ∀x v0 v1.
           (case x of launch => v0 | reset => v1) =
           (λm. if m = 0 then v0 else v1) (privcmd2num x)

   [privcmd_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 2) rep

   [privcmd_size_def]  Definition

      |- ∀x. privcmd_size x = 0

   [staff_BIJ]  Definition

      |- (∀a. num2staff (staff2num a) = a) ∧
         ∀r. (λn. n < 3) r ⇔ (staff2num (num2staff r) = r)

   [staff_CASE]  Definition

      |- ∀x v0 v1 v2.
           (case x of Alice => v0 | Bob => v1 | Carol => v2) =
           (λm. if m < 1 then v0 else if m = 1 then v1 else v2)
             (staff2num x)

   [staff_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 3) rep

   [staff_size_def]  Definition

      |- ∀x. staff_size x = 0

   [state_BIJ]  Definition

      |- (∀a. num2state (state2num a) = a) ∧
         ∀r. (λn. n < 2) r ⇔ (state2num (num2state r) = r)

   [state_CASE]  Definition

      |- ∀x v0 v1.
           (case x of STBY => v0 | ACTIVE => v1) =
           (λm. if m = 0 then v0 else v1) (state2num x)

   [state_TY_DEF]  Definition

      |- ∃rep. TYPE_DEFINITION (λn. n < 2) rep

   [state_size_def]  Definition

      |- ∀x. state_size x = 0

   [Alice_exec_privcmd_justified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇔
           inputOK (Name Alice says prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (PR privcmd))::ins) s outs) ∧
           (M,Oi,Os) sat prop (SOME (PR privcmd))

   [Alice_justified_privcmd_exec_thm]  Theorem

      |- ∀NS Out M Oi Os cmd npriv privcmd ins s outs.
           inputOK (Name Alice says prop (SOME (PR privcmd))) ∧
           CFGInterpret (M,Oi,Os)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (PR privcmd))::ins) s outs) ⇒
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs))

   [Alice_privcmd_lemma]  Theorem

      |- CFGInterpret (M,Oi,Os)
           (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
              (Name Alice says prop (SOME (PR privcmd))::ins) s outs) ⇒
         (M,Oi,Os) sat prop (SOME (PR privcmd))

   [Alice_privcmd_verified_thm]  Theorem

      |- ∀NS Out M Oi Os.
           TR (M,Oi,Os) (exec (PR privcmd))
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
                (Name Alice says prop (SOME (PR privcmd))::ins) s outs)
             (CFG inputOK SM0StateInterp (certs cmd npriv privcmd) ins
                (NS s (exec (PR privcmd)))
                (Out s (exec (PR privcmd))::outs)) ⇒
           (M,Oi,Os) sat prop (SOME (PR privcmd))

   [Carol_discard_lemma]  Theorem

      |- TR (M,Oi,Os) discard
           (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
              (Name Carol says prop (SOME cmd)::ins) s outs)
           (CFG inputOK SM0StateInterp (certs cmd npriv privcmd) ins
              (SM0ns s discard) (SM0out s discard::outs))

   [Carol_rejected_lemma]  Theorem

      |- ¬inputOK (Name Carol says prop (SOME cmd))

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

   [command_11]  Theorem

      |- (∀a a'. (NP a = NP a') ⇔ (a = a')) ∧
         ∀a a'. (PR a = PR a') ⇔ (a = a')

   [command_Axiom]  Theorem

      |- ∀f0 f1. ∃fn. (∀a. fn (NP a) = f0 a) ∧ ∀a. fn (PR a) = f1 a

   [command_case_cong]  Theorem

      |- ∀M M' f f1.
           (M = M') ∧ (∀a. (M' = NP a) ⇒ (f a = f' a)) ∧
           (∀a. (M' = PR a) ⇒ (f1 a = f1' a)) ⇒
           (command_CASE M f f1 = command_CASE M' f' f1')

   [command_distinct]  Theorem

      |- ∀a' a. NP a ≠ PR a'

   [command_distinct_clauses]  Theorem

      |- ∀a' a. NP a ≠ PR a'

   [command_induction]  Theorem

      |- ∀P. (∀n. P (NP n)) ∧ (∀p. P (PR p)) ⇒ ∀c. P c

   [command_nchotomy]  Theorem

      |- ∀cc. (∃n. cc = NP n) ∨ ∃p. cc = PR p

   [command_one_one]  Theorem

      |- (∀a a'. (NP a = NP a') ⇔ (a = a')) ∧
         ∀a a'. (PR a = PR a') ⇔ (a = a')

   [datatype_command]  Theorem

      |- DATATYPE (command NP PR)

   [datatype_npriv]  Theorem

      |- DATATYPE (npriv status)

   [datatype_output]  Theorem

      |- DATATYPE (output on off)

   [datatype_privcmd]  Theorem

      |- DATATYPE (privcmd launch reset)

   [datatype_staff]  Theorem

      |- DATATYPE (staff Alice Bob Carol)

   [datatype_state]  Theorem

      |- DATATYPE (state STBY ACTIVE)

   [inputOK_def]  Theorem

      |- (inputOK (Name Alice says prop (SOME cmd)) ⇔ T) ∧
         (inputOK (Name Bob says prop (SOME cmd)) ⇔ T) ∧ (inputOK TT ⇔ F) ∧
         (inputOK FF ⇔ F) ∧ (inputOK (prop v) ⇔ F) ∧
         (inputOK (notf v1) ⇔ F) ∧ (inputOK (v2 andf v3) ⇔ F) ∧
         (inputOK (v4 orf v5) ⇔ F) ∧ (inputOK (v6 impf v7) ⇔ F) ∧
         (inputOK (v8 eqf v9) ⇔ F) ∧ (inputOK (v10 says TT) ⇔ F) ∧
         (inputOK (v10 says FF) ⇔ F) ∧
         (inputOK (Name Carol says prop (SOME v142)) ⇔ F) ∧
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
           (∀cmd. P (Name Alice says prop (SOME cmd))) ∧
           (∀cmd. P (Name Bob says prop (SOME cmd))) ∧ P TT ∧ P FF ∧
           (∀v. P (prop v)) ∧ (∀v1. P (notf v1)) ∧
           (∀v2 v3. P (v2 andf v3)) ∧ (∀v4 v5. P (v4 orf v5)) ∧
           (∀v6 v7. P (v6 impf v7)) ∧ (∀v8 v9. P (v8 eqf v9)) ∧
           (∀v10. P (v10 says TT)) ∧ (∀v10. P (v10 says FF)) ∧
           (∀v142. P (Name Carol says prop (SOME v142))) ∧
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

   [npriv2num_11]  Theorem

      |- ∀a a'. (npriv2num a = npriv2num a') ⇔ (a = a')

   [npriv2num_ONTO]  Theorem

      |- ∀r. r < 1 ⇔ ∃a. r = npriv2num a

   [npriv2num_num2npriv]  Theorem

      |- ∀r. r < 1 ⇔ (npriv2num (num2npriv r) = r)

   [npriv2num_thm]  Theorem

      |- npriv2num status = 0

   [npriv_Axiom]  Theorem

      |- ∀x0. ∃f. f status = x0

   [npriv_EQ_npriv]  Theorem

      |- ∀a a'. (a = a') ⇔ (npriv2num a = npriv2num a')

   [npriv_case_cong]  Theorem

      |- ∀M M' v0.
           (M = M') ∧ ((M' = status) ⇒ (v0 = v0')) ⇒
           ((case M of status => v0) = case M' of status => v0')

   [npriv_case_def]  Theorem

      |- ∀v0. (case status of status => v0) = v0

   [npriv_induction]  Theorem

      |- ∀P. P status ⇒ ∀a. P a

   [npriv_nchotomy]  Theorem

      |- ∀a. a = status

   [num2npriv_11]  Theorem

      |- ∀r r'. r < 1 ⇒ r' < 1 ⇒ ((num2npriv r = num2npriv r') ⇔ (r = r'))

   [num2npriv_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2npriv r) ∧ r < 1

   [num2npriv_npriv2num]  Theorem

      |- ∀a. num2npriv (npriv2num a) = a

   [num2npriv_thm]  Theorem

      |- num2npriv 0 = status

   [num2output_11]  Theorem

      |- ∀r r'.
           r < 2 ⇒ r' < 2 ⇒ ((num2output r = num2output r') ⇔ (r = r'))

   [num2output_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2output r) ∧ r < 2

   [num2output_output2num]  Theorem

      |- ∀a. num2output (output2num a) = a

   [num2output_thm]  Theorem

      |- (num2output 0 = on) ∧ (num2output 1 = off)

   [num2privcmd_11]  Theorem

      |- ∀r r'.
           r < 2 ⇒ r' < 2 ⇒ ((num2privcmd r = num2privcmd r') ⇔ (r = r'))

   [num2privcmd_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2privcmd r) ∧ r < 2

   [num2privcmd_privcmd2num]  Theorem

      |- ∀a. num2privcmd (privcmd2num a) = a

   [num2privcmd_thm]  Theorem

      |- (num2privcmd 0 = launch) ∧ (num2privcmd 1 = reset)

   [num2staff_11]  Theorem

      |- ∀r r'. r < 3 ⇒ r' < 3 ⇒ ((num2staff r = num2staff r') ⇔ (r = r'))

   [num2staff_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2staff r) ∧ r < 3

   [num2staff_staff2num]  Theorem

      |- ∀a. num2staff (staff2num a) = a

   [num2staff_thm]  Theorem

      |- (num2staff 0 = Alice) ∧ (num2staff 1 = Bob) ∧
         (num2staff 2 = Carol)

   [num2state_11]  Theorem

      |- ∀r r'. r < 2 ⇒ r' < 2 ⇒ ((num2state r = num2state r') ⇔ (r = r'))

   [num2state_ONTO]  Theorem

      |- ∀a. ∃r. (a = num2state r) ∧ r < 2

   [num2state_state2num]  Theorem

      |- ∀a. num2state (state2num a) = a

   [num2state_thm]  Theorem

      |- (num2state 0 = STBY) ∧ (num2state 1 = ACTIVE)

   [output2num_11]  Theorem

      |- ∀a a'. (output2num a = output2num a') ⇔ (a = a')

   [output2num_ONTO]  Theorem

      |- ∀r. r < 2 ⇔ ∃a. r = output2num a

   [output2num_num2output]  Theorem

      |- ∀r. r < 2 ⇔ (output2num (num2output r) = r)

   [output2num_thm]  Theorem

      |- (output2num on = 0) ∧ (output2num off = 1)

   [output_Axiom]  Theorem

      |- ∀x0 x1. ∃f. (f on = x0) ∧ (f off = x1)

   [output_EQ_output]  Theorem

      |- ∀a a'. (a = a') ⇔ (output2num a = output2num a')

   [output_case_cong]  Theorem

      |- ∀M M' v0 v1.
           (M = M') ∧ ((M' = on) ⇒ (v0 = v0')) ∧
           ((M' = off) ⇒ (v1 = v1')) ⇒
           ((case M of on => v0 | off => v1) =
            case M' of on => v0' | off => v1')

   [output_case_def]  Theorem

      |- (∀v0 v1. (case on of on => v0 | off => v1) = v0) ∧
         ∀v0 v1. (case off of on => v0 | off => v1) = v1

   [output_distinct]  Theorem

      |- on ≠ off

   [output_distinct_clauses]  Theorem

      |- on ≠ off

   [output_induction]  Theorem

      |- ∀P. P off ∧ P on ⇒ ∀a. P a

   [output_nchotomy]  Theorem

      |- ∀a. (a = on) ∨ (a = off)

   [privcmd2num_11]  Theorem

      |- ∀a a'. (privcmd2num a = privcmd2num a') ⇔ (a = a')

   [privcmd2num_ONTO]  Theorem

      |- ∀r. r < 2 ⇔ ∃a. r = privcmd2num a

   [privcmd2num_num2privcmd]  Theorem

      |- ∀r. r < 2 ⇔ (privcmd2num (num2privcmd r) = r)

   [privcmd2num_thm]  Theorem

      |- (privcmd2num launch = 0) ∧ (privcmd2num reset = 1)

   [privcmd_Axiom]  Theorem

      |- ∀x0 x1. ∃f. (f launch = x0) ∧ (f reset = x1)

   [privcmd_EQ_privcmd]  Theorem

      |- ∀a a'. (a = a') ⇔ (privcmd2num a = privcmd2num a')

   [privcmd_case_cong]  Theorem

      |- ∀M M' v0 v1.
           (M = M') ∧ ((M' = launch) ⇒ (v0 = v0')) ∧
           ((M' = reset) ⇒ (v1 = v1')) ⇒
           ((case M of launch => v0 | reset => v1) =
            case M' of launch => v0' | reset => v1')

   [privcmd_case_def]  Theorem

      |- (∀v0 v1. (case launch of launch => v0 | reset => v1) = v0) ∧
         ∀v0 v1. (case reset of launch => v0 | reset => v1) = v1

   [privcmd_distinct]  Theorem

      |- launch ≠ reset

   [privcmd_distinct_clauses]  Theorem

      |- launch ≠ reset

   [privcmd_induction]  Theorem

      |- ∀P. P launch ∧ P reset ⇒ ∀a. P a

   [privcmd_nchotomy]  Theorem

      |- ∀a. (a = launch) ∨ (a = reset)

   [staff2num_11]  Theorem

      |- ∀a a'. (staff2num a = staff2num a') ⇔ (a = a')

   [staff2num_ONTO]  Theorem

      |- ∀r. r < 3 ⇔ ∃a. r = staff2num a

   [staff2num_num2staff]  Theorem

      |- ∀r. r < 3 ⇔ (staff2num (num2staff r) = r)

   [staff2num_thm]  Theorem

      |- (staff2num Alice = 0) ∧ (staff2num Bob = 1) ∧
         (staff2num Carol = 2)

   [staff_Axiom]  Theorem

      |- ∀x0 x1 x2. ∃f. (f Alice = x0) ∧ (f Bob = x1) ∧ (f Carol = x2)

   [staff_EQ_staff]  Theorem

      |- ∀a a'. (a = a') ⇔ (staff2num a = staff2num a')

   [staff_case_cong]  Theorem

      |- ∀M M' v0 v1 v2.
           (M = M') ∧ ((M' = Alice) ⇒ (v0 = v0')) ∧
           ((M' = Bob) ⇒ (v1 = v1')) ∧ ((M' = Carol) ⇒ (v2 = v2')) ⇒
           ((case M of Alice => v0 | Bob => v1 | Carol => v2) =
            case M' of Alice => v0' | Bob => v1' | Carol => v2')

   [staff_case_def]  Theorem

      |- (∀v0 v1 v2.
            (case Alice of Alice => v0 | Bob => v1 | Carol => v2) = v0) ∧
         (∀v0 v1 v2.
            (case Bob of Alice => v0 | Bob => v1 | Carol => v2) = v1) ∧
         ∀v0 v1 v2.
           (case Carol of Alice => v0 | Bob => v1 | Carol => v2) = v2

   [staff_distinct]  Theorem

      |- Alice ≠ Bob ∧ Alice ≠ Carol ∧ Bob ≠ Carol

   [staff_distinct_clauses]  Theorem

      |- Alice ≠ Bob ∧ Alice ≠ Carol ∧ Bob ≠ Carol

   [staff_induction]  Theorem

      |- ∀P. P Alice ∧ P Bob ∧ P Carol ⇒ ∀a. P a

   [staff_nchotomy]  Theorem

      |- ∀a. (a = Alice) ∨ (a = Bob) ∨ (a = Carol)

   [state2num_11]  Theorem

      |- ∀a a'. (state2num a = state2num a') ⇔ (a = a')

   [state2num_ONTO]  Theorem

      |- ∀r. r < 2 ⇔ ∃a. r = state2num a

   [state2num_num2state]  Theorem

      |- ∀r. r < 2 ⇔ (state2num (num2state r) = r)

   [state2num_thm]  Theorem

      |- (state2num STBY = 0) ∧ (state2num ACTIVE = 1)

   [state_Axiom]  Theorem

      |- ∀x0 x1. ∃f. (f STBY = x0) ∧ (f ACTIVE = x1)

   [state_EQ_state]  Theorem

      |- ∀a a'. (a = a') ⇔ (state2num a = state2num a')

   [state_case_cong]  Theorem

      |- ∀M M' v0 v1.
           (M = M') ∧ ((M' = STBY) ⇒ (v0 = v0')) ∧
           ((M' = ACTIVE) ⇒ (v1 = v1')) ⇒
           ((case M of STBY => v0 | ACTIVE => v1) =
            case M' of STBY => v0' | ACTIVE => v1')

   [state_case_def]  Theorem

      |- (∀v0 v1. (case STBY of STBY => v0 | ACTIVE => v1) = v0) ∧
         ∀v0 v1. (case ACTIVE of STBY => v0 | ACTIVE => v1) = v1

   [state_distinct]  Theorem

      |- STBY ≠ ACTIVE

   [state_distinct_clauses]  Theorem

      |- STBY ≠ ACTIVE

   [state_induction]  Theorem

      |- ∀P. P ACTIVE ∧ P STBY ⇒ ∀a. P a

   [state_nchotomy]  Theorem

      |- ∀a. (a = STBY) ∨ (a = ACTIVE)


*)
end
