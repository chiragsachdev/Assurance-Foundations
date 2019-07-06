(******************************************************************************)
(* Refinement of SM0r1 to include cryptographic keys, public-key certificates,*)
(* and certificate authorities.                                               *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 14 April 2017                                                        *)
(******************************************************************************)

structure SM0r2Script = struct

(* ==== interactive mode ====
app load ["principalTheory","m0TypesTheory","ssm1Theory","TypeBase",
          "SM0Theory","SM0r1Theory","SM0r2Theory", "aclrulesTheory",
	  "aclDrulesTheory","acl_infRules","satListTheory"];
open principalTheory m0TypesTheory ssm1Theory TypeBase SM0Theory
     SM0r1Theory SM0r2Theory;
open aclrulesTheory aclDrulesTheory acl_infRules satListTheory;
 ==== end interactive mode ==== *)

open HolKernel Parse boolLib bossLib;
open principalTheory m0TypesTheory ssm1Theory TypeBase SM0Theory;
open SM0r1Theory;
open aclrulesTheory aclDrulesTheory acl_infRules satListTheory;

val _ = new_theory "SM0r2";

(******************************************************************************)
(* In this refined version of SM0r1, namely SM0r2, we add the logic to have   *)
(* cryptographic keys speaking for staff. We define inputOKr2 and extend      *)
(* certsr1 to include cryptographic keys, public-key certificates and         *)
(* certificate authorities.                                                   *)
(******************************************************************************)

(******************************************************************************)
(* Input Authentication                                                       *)
(******************************************************************************)
val inputOKr2def =
Define
`(inputOKr2
  ((((Name (KeyS (pubK Bob))) quoting (Name (Role Operator))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) = T) /\
 (inputOKr2
  ((((Name (KeyS (pubK Alice))) quoting (Name (Role Commander))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) = T) /\
 (inputOKr2 _ = F)`

(* -------------------------------------------------------------------------- *)
(* certsr2 definition                                                         *)
(* -------------------------------------------------------------------------- *)
val certsr2root_def =
Define
`certsr2root (npriv:npriv)(privcmd:privcmd) =
  [((Name (KeyA (pubK (ca 0)))) speaks_for (Name (Authority (ca 0)))):
    (command inst,principal,'d,'e)Form;
   ((Name (Authority (ca 0))) controls
    ((Name (KeyS (pubK Bob))) speaks_for (Name (Staff Bob)))):
    (command inst,principal,'d,'e)Form;
   ((Name (Authority (ca 0))) controls
    ((Name (KeyS (pubK Alice))) speaks_for (Name (Staff Alice)))):
    (command inst,principal,'d,'e)Form]`

val certsr2signed_def =
Define
`certsr2signed (npriv:npriv)(privcmd:privcmd) =
   [((Name (KeyA (pubK (ca 0)))) says
     ((Name (KeyS (pubK Bob))) speaks_for (Name (Staff Bob)))):
    (command inst,principal,'d,'e)Form;
   ((Name (KeyA (pubK (ca 0)))) says
     ((Name (KeyS (pubK Alice))) speaks_for (Name (Staff Alice)))):
     (command inst,principal,'d,'e)Form]`

val certsr2_def =
Define
`certsr2 (npriv:npriv)(privcmd:privcmd) =
 (certsr1 (npriv:npriv)(privcmd:privcmd) ++ (certsr2root npriv privcmd))
 ++ (certsr2signed npriv privcmd)`

(* -------------------------------------------------------------------------- *)
(* Define mapping from SM0 inputs with just roles to adding Alice as          *)
(* Commander and Bob as Operator.                                             *)
(* -------------------------------------------------------------------------- *)
val mapSM0r1input_def =
Define
`(mapSM0r1input
  ((((Name (Staff Bob)) quoting (Name (Role Operator))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) =
  ((((Name (KeyS (pubK Bob))) quoting (Name (Role Operator))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form)) /\
 (mapSM0r1input
  ((((Name (Staff Alice)) quoting (Name (Role Commander))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) =
   ((((Name (KeyS (pubK Alice))) quoting (Name (Role Commander))) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form)) /\
 (mapSM0r1input _ = TT)`

val th1 =
TAC_PROOF(([],
``((M,Oi,Os) satList (certsr2 npriv privcmd)) ==>
  (((M:(command inst,'b, principal,'d,'e)Kripke),Oi,Os)
  sat Name (KeyS (pubK Bob)) speaks_for Name (Staff Bob))``),
REWRITE_TAC[certsr2_def,certsr2root_def,certsr2signed_def,
	    certsr1_def,certs_def,satList_CONS,
            (GSYM satList_conj),satList_nil] THEN
PROVE_TAC[Derived_Speaks_For,Controls])

val th2 =
TAC_PROOF(
([],``(((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
	sat (Name (Role Operator)) speaks_for (Name (Role Operator)))``),
PROVE_TAC[Idemp_Speaks_For])		

val th3 =
TAC_PROOF(
([],``(((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
       satList (certsr2 npriv privcmd)) ==>
      ((M,Oi,Os) sat (((Name (KeyS (pubK Bob))) quoting
                       (Name (Role Operator)))
                      speaks_for
		     ((Name (Staff Bob)) quoting (Name (Role Operator)))))``),
PROVE_TAC[Mono_speaks_for,th1,Derived_Speaks_For,th2])

val th4 =
TAC_PROOF(
([],``(((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
       satList (certsr2 npriv privcmd)) ==>
      ((M,Oi,Os) sat ((((Name (KeyS (pubK Bob))) quoting (Name (Role Operator))) says
       (prop (SOME (PR privcmd)))):(command inst,principal,'d,'e)Form)) ==>
      ((M,Oi,Os) sat ((((Name (Staff Bob)) quoting (Name (Role Operator))) says
       (prop (SOME (PR privcmd)))):(command inst,principal,'d,'e)Form))``),
PROVE_TAC[th3,Derived_Speaks_For])

val th5 =
TAC_PROOF(
([],``(((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
       satList (certsr2 npriv privcmd)) ==>
      ((M,Oi,Os) sat (Name (Role Operator) controls prop (SOME (PR privcmd)))) /\
      ((M,Oi,Os) sat (reps (Name (Staff Bob)) (Name (Role Operator))
       (prop (SOME (PR privcmd)))))``),
REWRITE_TAC[certsr2_def,certsr2root_def,certsr2signed_def,certsr1_def,
            certs_def,satList_CONS,satList_nil,(GSYM satList_conj)] THEN
PROVE_TAC[])

val th6 =
TAC_PROOF(([],
``(((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
       satList (certsr2 npriv privcmd)) ==>
      ((M,Oi,Os) sat ((((Name (KeyS (pubK Bob))) quoting (Name (Role Operator))) says
       (prop (SOME (PR privcmd)))):(command inst,principal,'d,'e)Form)) ==>
   ((M,Oi,Os) sat (prop (SOME (PR privcmd))))``),
PROVE_TAC[Reps,th4,th5])

(******************************************************************************)
(* Bob as Operator is authorized on any privileged command                    *)
(******************************************************************************)
val mapSM0r1_Bob_Operator_privcmd_lemma =
TAC_PROOF(([],
``CFGInterpret ((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
  (CFG inputOKr2 SM0StateInterp (certsr2 npriv privcmd)
   (mapSM0r1input
    (mapSM0inputOperatorBob
     ((Name (Role Operator)) says (prop (SOME (PR (privcmd:privcmd))))))::ins)
   s (outs:output list)) ==>
  ((M,Oi,Os) sat (prop (SOME(PR privcmd))))``),
REWRITE_TAC[CFGInterpret_def,mapSM0inputOperatorBob_def,mapSM0r1input_def] THEN
PROVE_TAC[th6])

val _ = save_thm("mapSM0r1_Bob_Operator_privcmd_lemma",mapSM0r1_Bob_Operator_privcmd_lemma)

val Operator_Bob_exec_privcmd_justified_thm_r2 =
let
 val th1 =
  ISPECL
   [``inputOKr2:(command inst, principal,'d,'e)Form -> bool``,
     ``(certsr2 npriv privcmd):(command inst, principal,'d,'e)Form list``,
       ``SM0StateInterp:state->(command inst, principal,'d,'e)Form``,
         ``(Name (KeyS (pubK Bob))) quoting (Name (Role Operator))``,``PR privcmd``,
	   ``ins:(command inst,principal,'d,'e)Form list``,
	     ``s:state``,``outs:output list``]
	      TR_exec_cmd_rule
 val th2 =
 REWRITE_RULE[mapSM0inputOperatorBob_def,mapSM0r1input_def]mapSM0r1_Bob_Operator_privcmd_lemma
in 
   REWRITE_RULE[th2]th1
end

val _ =
save_thm("Operator_Bob_exec_privcmd_justified_thm_r2",
	  Operator_Bob_exec_privcmd_justified_thm_r2)

val Operator_mapSM0r1input_exec_privcmd_justifed_thm =
let
 val th1 =
  TAC_PROOF(([],
   ``((Name (KeyS (pubK Bob))) quoting (Name (Role Operator))
      says (prop (SOME (PR (privcmd:privcmd))))
           :(command inst, principal,'d,'e)Form)
      =
      mapSM0r1input
         (mapSM0inputOperatorBob
	      ((Name (Role Operator)) says (prop (SOME (PR (privcmd:privcmd)))))
	           :(command inst, principal,'d,'e)Form)``),
  PROVE_TAC[mapSM0r1input_def,mapSM0inputOperatorBob_def])
in
 REWRITE_RULE[th1]Operator_Bob_exec_privcmd_justified_thm_r2
end 

val _ =
save_thm
("Operator_mapSM0r1input_exec_privcmd_justifed_thm",
Operator_mapSM0r1input_exec_privcmd_justifed_thm)
(* ==== start here ====
==== end here ==== *)


val _ = export_theory();



end (* structure *)