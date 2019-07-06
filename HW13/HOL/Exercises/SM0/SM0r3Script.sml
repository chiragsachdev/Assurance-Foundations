(******************************************************************************)
(* Refinement of SM0r2 to use message and certificate data structures and not *)
(* access-control logic formulas for messages and certs.                      *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 15 April 2017                                                        *)
(******************************************************************************)

structure SM0r3Script = struct

(* ==== interactive mode ====
app load ["principalTheory","m0TypesTheory","ssm1Theory","ssm2Theory","TypeBase",
          "SM0Theory","SM0r1Theory","SM0r2Theory","SM0r3Theory",
	  "aclrulesTheory","aclDrulesTheory","acl_infRules","satListTheory"];
open principalTheory m0TypesTheory ssm1Theory ssm2Theory TypeBase SM0Theory
     SM0r1Theory SM0r2Theory SM0r3Theory certStructureTheory inMsgTheory
     listTheory;
open aclrulesTheory aclDrulesTheory acl_infRules satListTheory;
 ==== end interactive mode ==== *)

open HolKernel Parse boolLib bossLib;
open listTheory TypeBase;
open ssm1Theory ssm2Theory;
open SM0r2Theory SM0r1Theory SM0Theory principalTheory;
open  certStructureTheory inMsgTheory;
open aclrulesTheory aclDrulesTheory acl_infRules satListTheory;

val _ = new_theory "SM0r3";

(******************************************************************************)
(* Create the list of root and signed certificates corresponding to certs,    *)
(* certsr1, and certsr2.                                                      *)
(******************************************************************************)
val certificatesr3_def =
Define
`certificatesr3 (npriv:npriv) (privcmd:privcmd) =
 (MAP mkRCert ((certsr1 npriv privcmd) ++ (certsr2root npriv privcmd))) ++
 (MAP (mkSCert (ca 0))(certsr2signed npriv privcmd))`
 


(******************************************************************************)
(* Prove MAP certificateIntepret applied to (certificatesr3 npriv privcmd)    *)
(* equals (certsr2 npriv privcmd).                                            *)
(******************************************************************************)
val certificatesr3_certsr2_map_thm =
TAC_PROOF(([],
``!npriv privcmd.
  MAP certificateInterpret (certificatesr3 (npriv:npriv)(privcmd:privcmd)) =
  (certsr2 npriv privcmd)``),
REWRITE_TAC[certificatesr3_def,MAP_APPEND] THEN
REWRITE_TAC[MAP_certificateInterpret_mkSCert_thm,
 MAP_certificateInterpret_mkRCert_thm,certsr2_def])

val _ =
save_thm
("certificatesr3_certsr2_map_thm",
  certificatesr3_certsr2_map_thm)

(******************************************************************************)
(* We use inputOKr2 and SM0StateInterp from SM0r2Theory.  We use MsgInterpret *)
(* in inMsgTheory to map input messages to access-control logic formulas. We  *)
(* use certificateInterpret in certStructureTheory to map certificates in     *)
(* our list of certificates providing the security context to a list of       *)
(* access-control logic formulas. We use mkinMsg to create messages. We use   *)
(* mkRcert and mkSCert to create root and signed certificates.                *)
(******************************************************************************)

(******************************************************************************)
(* Our first task is to prove that CFG2Interpret applied to Bob as Operator   *)
(* justifies executing his privileged commands. This is the TR2 version of    *)
(* mapSM0r1_Bob_Operator_privcmd_lemma vertically refined to use input data   *)
(* structures and certificate data structures.                                *)
(******************************************************************************)

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
val mkinMsg_SM0r2_Bob_Operator_privcmd_lemma =
TAC_PROOF(([],
``CFG2Interpret ((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
  (CFG2 MsgInterpret certificateInterpret inputOKr2
   (certificatesr3 npriv privcmd)
   SM0StateInterp
   (mkinMsg(mapSM0r1input
    (mapSM0inputOperatorBob
     ((Name (Role Operator)) says
      (prop (SOME (PR (privcmd:privcmd)))):(command inst,principal,'d,'e)Form)))::ins)
   s (outs:output list)) ==>
  ((M,Oi,Os) sat (prop (SOME(PR privcmd))))``),
REWRITE_TAC
 [CFG2Interpret_def,mapSM0inputOperatorBob_def,mapSM0r1input_def,
  MsgInterpret_inverts_mkinMsg_thm,
  certificatesr3_certsr2_map_thm] THEN
PROVE_TAC[th6])

val _ =
save_thm(
"mkinMsg_SM0r2_Bob_Operator_privcmd_lemma",
 mkinMsg_SM0r2_Bob_Operator_privcmd_lemma)


(******************************************************************************)
(* Notice that to get :'d and :'e as type variables for integrity and privacy *)
(* label types, we need to provide the exact type signature for the           *)
(* arguments in ISPECL. Otherwise, rewriting TR2_exec_cmd_rule won't work.    *)
(******************************************************************************)
val th1 =
ISPECL
[``MsgInterpret:inMsg -> (command inst, principal, 'd,'e)Form``,
 ``certificateInterpret
   :('d,'e) certificate -> (command inst,principal,'d,'e)Form``,
 ``inputOKr2:(command inst,principal,'d,'e)Form -> bool``,
 ``(certificatesr3 npriv privcmd):('d,'e)certificate list``,
 ``SM0StateInterp:state -> (command inst,principal,'d,'e)Form``,
 ``mkinMsg(mapSM0r1input
    (mapSM0inputOperatorBob
     ((Name (Role Operator)) says
      (prop (SOME (PR (privcmd:privcmd)))
      :(command inst,principal,'d,'e)Form))))``,
  ``PR privcmd``,``ins:inMsg list``,``s:state``,``outs:output list``]
TR2_exec_cmd_rule

val Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm =
REWRITE_RULE
[mkinMsg_SM0r2_Bob_Operator_privcmd_lemma]th1

val _ =
save_thm(
"Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm",
Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm)

val Operator_Bob_privcmd_exec_privcmd_justified_thm =
REWRITE_RULE
[mkinMsg_SM0r2_Bob_Operator_privcmd_lemma,
 mapSM0r1input_def,mapSM0inputOperatorBob_def,
 mkinMsg_def]
 Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm

val _ =
save_thm(
"Operator_Bob_privcmd_exec_privcmd_justified_thm",
Operator_Bob_privcmd_exec_privcmd_justified_thm)


(******************************************************************************)
(* Specialize TR2_iff_TR_exec_thm to the specific message and certificate     *)
(* data structures for authorizing Bob as Operator to execute privileged      *)
(* commands.                                                                  *)
(******************************************************************************)
val th1 =
ISPECL
[``MsgInterpret:inMsg -> (command inst, principal, 'd,'e)Form``,
 ``certificateInterpret
   :('d,'e) certificate -> (command inst,principal,'d,'e)Form``,
 ``inputOKr2:(command inst,principal,'d,'e)Form -> bool``,
 ``(certsr2 npriv privcmd):(command inst,principal,'d,'e)Form list``,
 ``(certificatesr3 npriv privcmd):('d,'e)certificate list``,
 ``SM0StateInterp:state -> (command inst,principal,'d,'e)Form``,
 ``mkinMsg(mapSM0r1input
    (mapSM0inputOperatorBob
     ((Name (Role Operator)) says
      (prop (SOME (PR (privcmd:privcmd)))
      :(command inst,principal,'d,'e)Form))))``,
  ``(Name (KeyS (pubK Bob))) quoting (Name (Role Operator))``,
  ``PR privcmd``,``ins:(command inst, principal,'d,'e)Form list``,
  ``ins2:inMsg list``,``s:state``,``outs:output list``]
TR2_iff_TR_exec_thm


(******************************************************************************)
(* Notice that mkinMsg_SM0r2_Bob_Operator_privcmd_lemma is one of the         *)
(* conditions.  We simplify th1 by rewriting with                             *)
(* mkinMsg_SM0r2_Bob_Operator_privcmd_lemma                                   *)
(******************************************************************************)
val th2 = REWRITE_RULE[mkinMsg_SM0r2_Bob_Operator_privcmd_lemma] th1


(******************************************************************************)
(* mapSM0r1_Bob_Operator_privcmd_lemma is close to the condition we need      *)
(* in th2 above.  We need to add MsgInterpret(mkinMsg( ... ) to               *)
(* mapSM0r1_Bob_Operator_privcmd_lemma                                        *)
(******************************************************************************)
val th3 =
TAC_PROOF(([],
``(((mapSM0r1input
    (mapSM0inputOperatorBob
     (Name (Role Operator) says prop (SOME (PR privcmd)))))
   :(command inst,principal,'d,'e)Form)::ins) =   
 ((MsgInterpret
  (mkinMsg
   ((mapSM0r1input
    (mapSM0inputOperatorBob
     ((Name (Role Operator) says ((prop (SOME (PR privcmd))):(command inst,principal,'d,'e)Form))))))))::(ins:(command inst,principal,'d,'e)Form list))``),
REWRITE_TAC[mapSM0inputOperatorBob_def,mapSM0r1input_def,
	    MsgInterpret_inverts_mkinMsg_thm])

(******************************************************************************)
(* Rewrite mapSM0r1_Bob_Operator_privcmd_lemma using th3 to include           *)
(* MsgInterpret(mkinMsg ( ....) to match the condition in th2.                *)
(******************************************************************************)
val th4 =
REWRITE_RULE[th3]mapSM0r1_Bob_Operator_privcmd_lemma

(******************************************************************************)
(* Simplify th2 using th4, which corresponds to CFGInterpret ... ==> (M,Oi,Os *)
(******************************************************************************)
val th5 =
REWRITE_RULE[th4]th2

(******************************************************************************)
(* Show that                                                                  *)
(*   MsgInterpret(mkinMsg(mapSM0r1input(mapSM0inputOperatorBob(Name (Role ... *)
(* equals (Name(KeyS (pubK Bob)) ...                                          *)
(******************************************************************************)
val th6 =
TAC_PROOF(([],
``((MsgInterpret:inMsg -> (command inst,principal,'d,'e)Form)
    (mkinMsg
      (mapSM0r1input
        (mapSM0inputOperatorBob
	  (Name (Role Operator) says
	   (prop (SOME (PR privcmd))):(command inst,principal,'d,'e)Form))))) =
   ((Name (KeyS (pubK Bob)) quoting Name (Role Operator) says
    prop (SOME (PR privcmd))):(command inst,principal,'d,'e)Form)``),
REWRITE_TAC[mapSM0inputOperatorBob_def,mapSM0r1input_def,
	    MsgInterpret_inverts_mkinMsg_thm])

(******************************************************************************)
(* Use th6 to rewrite th5 to eliminate the MsgInterpret = ((Name (KeyS ...    *)
(* condition.                                                                 *)
(******************************************************************************)
val th7 =
REWRITE_RULE[th6]th5


(******************************************************************************)
(* Finally, eliminate the MAP certificateInterpret .... condition by          *)
(* rewriting with certificatesr3_certsr2_map_thm                              *)
(******************************************************************************)
val Bob_TR2_iff_TR_privcmd =
REWRITE_RULE[certificatesr3_certsr2_map_thm]th7

val _ = save_thm("Bob_TR2_iff_TR_privcmd",Bob_TR2_iff_TR_privcmd)
(* ==== start here ====

 === end here ==== *)

val _ = export_theory();



end (* structure *)