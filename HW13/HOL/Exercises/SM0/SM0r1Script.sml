(******************************************************************************)
(* Refinement of SM0 to include staff acting in roles                         *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 14 April 2017                                                        *)
(******************************************************************************)

structure SM0r1Script = struct

(* ==== interactive mode ====
app load ["principalTheory","m0TypesTheory","ssm1Theory","TypeBase",
          "SM0Theory","SM0r1Theory","aclrulesTheory","aclDrulesTheory",
	  "acl_infRules","satListTheory"];
open principalTheory m0TypesTheory ssm1Theory TypeBase SM0Theory
     SM0r1Theory;
open aclrulesTheory aclDrulesTheory acl_infRules satListTheory;
 ==== end interactive mode ==== *)


open HolKernel Parse boolLib bossLib;
open principalTheory m0TypesTheory ssm1Theory TypeBase SM0Theory;
open aclrulesTheory aclDrulesTheory acl_infRules satListTheory;

val _ = new_theory "SM0r1";

(******************************************************************************)
(* In this refined version of SM0, namely SM0r1, we add the logic to have     *)
(* staff in roles.  This requires defining inputOKr1 and extending certs      *)
(* to include delegation.                                                     *)
(******************************************************************************)

(******************************************************************************)
(* Input Authentication                                                       *)
(******************************************************************************)
val inputOKr1_def =
Define
`(inputOKr1
  ((((Name (Staff Bob)) quoting (Name (Role Operator))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) = T) /\
 (inputOKr1
  ((((Name (Staff Alice)) quoting (Name (Role Commander))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) = T) /\
 (inputOKr1 _ = F)`

(******************************************************************************)
(* A theorem showing that all staff alone operating without a role are        *)
(* rejected.                                                                  *)
(******************************************************************************)
val inputOKr1_staff_rejected_lemma =
TAC_PROOF(([],
``!(P:staff)(cmd:command). ~inputOKr1
   ((Name (Staff P) says (prop (SOME (cmd:command))))
   :(command inst,principal,'d,'e)Form)``),
PROVE_TAC[inputOKr1_def])

val _ =
save_thm("inputOKr1_staff_rejected_lemma",inputOKr1_staff_rejected_lemma)

(******************************************************************************)
(* A theorem showing commands without a principal are rejected.               *)
(******************************************************************************)
val inputOKr1_cmd_reject_lemma =
TAC_PROOF(([],
``!(cmd:command). ~inputOKr1
   (prop (SOME (cmd:command)):(command inst,principal,'d,'e)Form)``),
PROVE_TAC[inputOKr1_def])

val _ = save_thm("inputOKr1_cmd_reject_lemma",inputOKr1_cmd_reject_lemma)

(******************************************************************************)
(* TT, (the result of a failed signature check), is rejected.                 *)
(******************************************************************************)
val inputOKr1_TT_reject_lemma =
TAC_PROOF(([],
``~inputOKr1 (TT:(command inst,principal,'d,'e)Form)``),
PROVE_TAC[inputOKr1_def])

val _ = save_thm("inputOKr1_TT_reject_lemma",inputOKr1_TT_reject_lemma)


(******************************************************************************)
(* Alice acting in the wrong role is rejected.                                *)
(******************************************************************************)
val Alice_Operator_rejected_lemma =
TAC_PROOF(([],
``~(inputOKr1
  ((((Name (Staff Alice)) quoting (Name (Role Operator))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form))``),
REWRITE_TAC[inputOKr1_def])

val _ = save_thm("Alice_Operator_rejected_lemma",Alice_Operator_rejected_lemma)

(******************************************************************************)
(* Bob acting in the wrong role is rejected.                                  *)
(******************************************************************************)
val Bob_Commander_rejected_lemma =
TAC_PROOF(([],
``~(inputOKr1
  ((((Name (Staff Bob)) quoting (Name (Role Commander))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form))``),
REWRITE_TAC[inputOKr1_def])

val _ = save_thm("Bob_Commander_rejected_lemma",Bob_Commander_rejected_lemma)

(******************************************************************************)
(* Carol acting in any role is rejected.                                      *)
(******************************************************************************)
val Carol_all_roles_rejected_lemma =
TAC_PROOF(([],
``~(inputOKr1
  ((((Name (Staff Carol)) quoting (Name (Role role))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form))``),
Cases_on`role` THEN
REWRITE_TAC[inputOKr1_def])

val _ = save_thm("Carol_all_roles_rejected_lemma",Carol_all_roles_rejected_lemma)

(* -------------------------------------------------------------------------- *)
(* certsr1 definition                                                         *)
(* -------------------------------------------------------------------------- *)
val certsr1_def =
Define
`certsr1 (npriv:npriv)(privcmd:privcmd) =
 (certs (npriv:npriv)(privcmd:privcmd)) ++
 [(reps (Name (Staff Alice))(Name (Role Commander))
        ((prop (SOME (NP npriv))):(command inst, principal,'d,'e)Form));
  (reps (Name (Staff Bob))(Name (Role Operator))
        ((prop (SOME (PR privcmd))):(command inst, principal,'d,'e)Form));
  (reps (Name (Staff Bob))(Name (Role Operator))
        ((prop (SOME (NP npriv))):(command inst, principal,'d,'e)Form))]`

(* -------------------------------------------------------------------------- *)
(* Define mapping from SM0 inputs with just roles to adding Alice as          *)
(* Commander and Bob as Operator.                                             *)
(* -------------------------------------------------------------------------- *)
val mapSM0inputOperatorBob_def =
Define
`(mapSM0inputOperatorBob
  (((Name (Role Operator)) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) =
   ((((Name (Staff Bob)) quoting (Name (Role Operator))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form)) /\
 (mapSM0inputOperatorBob
  (((Name (Role Commander)) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) =
   ((((Name (Staff Alice)) quoting (Name (Role Commander))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form)) /\
 (mapSM0inputOperatorBob _ = TT)`
 
(******************************************************************************)
(* Bob as Operator is authorized on any privileged command                    *)
(******************************************************************************)
val th1 =
TAC_PROOF(([],
``(((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os) satList
   (certsr1 npriv privcmd)) ==>
  ((M,Oi,Os) sat
   (reps (Name (Staff Bob))(Name (Role Operator))
     (prop (SOME (PR privcmd))))) /\
  ((M,Oi,Os) sat (Name (Role Operator)) controls (prop (SOME (PR privcmd))))``),
REWRITE_TAC
 [certsr1_def,certs_def,satList_CONS,satList_nil,(GSYM satList_conj)] THEN
PROVE_TAC[])

val th2 =
TAC_PROOF(([],
``(((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os) satList
   (certsr1 npriv privcmd)) ==>
  ((M,Oi,Os) sat
  ((Name (Staff Bob)) quoting (Name (Role Operator)) says
  (prop (SOME (PR (privcmd:privcmd)))))) ==>
  ((M,Oi,Os) sat (prop (SOME (PR (privcmd:privcmd)))))``),
PROVE_TAC[th1,Reps])

val mapSM0_Bob_Operator_privcmd_lemma =
TAC_PROOF(([],
``CFGInterpret ((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
  (CFG inputOKr1 SM0StateInterp (certsr1 npriv privcmd)
   (mapSM0inputOperatorBob((Name (Role Operator)) says (prop (SOME (PR (privcmd:privcmd)))))::ins)
   s (outs:output list)) ==>
  ((M,Oi,Os) sat (prop (SOME(PR privcmd))))``),
REWRITE_TAC[CFGInterpret_def,mapSM0inputOperatorBob_def] THEN
PROVE_TAC[th2])

val _ = save_thm("mapSM0_Bob_Operator_privcmd_lemma",mapSM0_Bob_Operator_privcmd_lemma)

(* ==== omit ====
val Bob_Operator_privcmd_lemma =
TAC_PROOF(([],
``CFGInterpret ((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
  (CFG inputOKr1 SM0StateInterp (certsr1 npriv privcmd)
   (((Name (Staff Bob)) quoting (Name (Role Operator)) says (prop (SOME (PR (privcmd:privcmd)))))::ins)
   s (outs:output list)) ==>
  ((M,Oi,Os) sat (prop (SOME(PR privcmd))))``),
REWRITE_TAC[CFGInterpret_def,certsr1_def,certs_def,SM0StateInterp_def,satList_CONS,
	    satList_nil,(GSYM satList_conj),sat_TT] THEN
PROVE_TAC[Controls,Reps])
 ==== end omit ==== *)


(* -------------------------------------------------------------------------- *)
(* exec privcmd occurs if and only if Bob as Operator's command is            *)
(* authenticated and authorized                                               *)
(* -------------------------------------------------------------------------- *)
val Operator_Bob_exec_privcmd_justified_thm =
let
 val th1 =
 ISPECL
 [``inputOKr1:(command inst, principal,'d,'e)Form -> bool``,
  ``(certsr1 npriv privcmd):(command inst, principal,'d,'e)Form list``,
  ``SM0StateInterp:state->(command inst, principal,'d,'e)Form``,
  ``(Name (Staff Bob)) quoting (Name (Role Operator))``,``PR privcmd``,
  ``ins:(command inst,principal,'d,'e)Form list``,
  ``s:state``,``outs:output list``]
 TR_exec_cmd_rule
 val th2 =
 REWRITE_RULE[mapSM0inputOperatorBob_def]mapSM0_Bob_Operator_privcmd_lemma
in 
 REWRITE_RULE[th2]th1
end

val _ =
 save_thm
 ("Operator_Bob_exec_privcmd_justified_thm",
   Operator_Bob_exec_privcmd_justified_thm)

val Operator_mapSM0inputOperatorBob_exec_privcmd_justified_thm =
let
 val th1 =
  TAC_PROOF(([],
  ``(((Name (Staff Bob) quoting (Name (Role Operator)) says
    (prop (SOME (PR (privcmd:privcmd))))):(command inst, principal,'d,'e)Form)) =
    mapSM0inputOperatorBob
    (((Name (Role Operator)) says (prop (SOME (PR (privcmd:privcmd))))):
    (command inst, principal,'d,'e)Form)``),
   REWRITE_TAC[mapSM0inputOperatorBob_def])
in
 GEN_ALL(REWRITE_RULE[th1]Operator_Bob_exec_privcmd_justified_thm)
end

val _ =
save_thm
 ("Operator_mapSM0inputOperatorBob_exec_privcmd_justified_thm",
   Operator_mapSM0inputOperatorBob_exec_privcmd_justified_thm)


(* ==== start here ====

==== end here ==== *)

val _ = export_theory();



end (* structure *)