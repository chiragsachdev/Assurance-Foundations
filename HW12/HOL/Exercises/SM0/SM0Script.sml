(******************************************************************************)
(* SM0 - simple two state machine in secure state machine theory using        *)
(* roles as a basis for authorization                                         *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 13 April 2017                                                        *)
(******************************************************************************)

structure SM0Script = struct

(* ==== interactive mode ====
app load ["principalTheory","m0TypesTheory","ssm1Theory","TypeBase",
          "SM0Theory","aclrulesTheory","aclDrulesTheory","acl_infRules",
	  "satListTheory"];
open principalTheory m0TypesTheory ssm1Theory TypeBase SM0Theory;
open aclrulesTheory aclDrulesTheory acl_infRules satListTheory;
 ==== end interactive mode ==== *)

open HolKernel Parse boolLib bossLib;
open principalTheory m0TypesTheory ssm1Theory TypeBase;
open aclrulesTheory aclDrulesTheory acl_infRules satListTheory;

val _ = new_theory "SM0";

(* -------------------------------------------------------------------------- *)
(* Define next-state function for machine M0                                  *)
(* -------------------------------------------------------------------------- *)
val SM0ns_def =
Define
`(SM0ns STBY (exec (PR reset)) = STBY) /\
 (SM0ns STBY (exec (PR launch)) = ACTIVE) /\
 (SM0ns STBY (exec (NP status)) = STBY) /\
 (SM0ns ACTIVE (exec (PR reset)) = STBY) /\
 (SM0ns ACTIVE (exec (PR launch)) = ACTIVE) /\
 (SM0ns ACTIVE (exec (NP status)) = ACTIVE) /\
 (SM0ns STBY (trap (PR reset)) = STBY) /\
 (SM0ns STBY (trap (PR launch)) = STBY) /\
 (SM0ns STBY (trap (NP status)) = STBY) /\
 (SM0ns ACTIVE (trap (PR reset)) = ACTIVE) /\
 (SM0ns ACTIVE (trap (PR launch)) = ACTIVE) /\
 (SM0ns ACTIVE (trap (NP status)) = ACTIVE) /\
 (SM0ns STBY discard = STBY) /\
 (SM0ns ACTIVE discard = ACTIVE)`

(* -------------------------------------------------------------------------- *)
(* Define next-output function for machine M0                                 *)
(* -------------------------------------------------------------------------- *)
val SM0out_def =
Define
`(SM0out STBY (exec (PR reset)) = off) /\
 (SM0out STBY (exec (PR launch)) = on) /\
 (SM0out STBY (exec (NP status)) = off) /\
 (SM0out ACTIVE (exec (PR reset)) = off) /\
 (SM0out ACTIVE (exec (PR launch)) = on) /\
 (SM0out ACTIVE (exec (NP status)) = on) /\
 (SM0out STBY (trap (PR reset)) = off) /\
 (SM0out STBY (trap (PR launch)) = off) /\
 (SM0out STBY (trap (NP status)) = off) /\
 (SM0out ACTIVE (trap (PR reset)) = on) /\
 (SM0out ACTIVE (trap (PR launch)) = on) /\
 (SM0out ACTIVE (trap (NP status)) = on) /\
 (SM0out STBY discard = off) /\
 (SM0out ACTIVE discard = on)`

(******************************************************************************)
(* In this version of SM0, we build authorization around roles. This is the   *)
(* baseline high-level description of the machine.  After that, we add staff  *)
(* acting in roles as delegates.  After that, we add public keys associated   *)
(* with staff, as well as the use of public key certificates and CAs.         *)
(******************************************************************************)


(******************************************************************************)
(* Input Authentication                                                       *)
(******************************************************************************)
val inputOK_def =
Define
`(inputOK
  (((Name (Role Operator)) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) = T) /\
 (inputOK
  (((Name (Role Commander)) says
   (prop (SOME (cmd:command)))):(command inst,principal,'d,'e)Form) = T) /\
 (inputOK _ = F)`

(******************************************************************************)
(* State Interpretation: this is the trivial assumption TT, as the machine    *)
(* state has no influence on access privileges.                               *)
(******************************************************************************)
val SM0StateInterp_def =
Define
`SM0StateInterp (state:state) = (TT:(command inst,principal,'d,'e)Form)`

(******************************************************************************)
(* A theorem showing that all staff alone operating without a role are        *)
(* rejected.                                                                  *)
(******************************************************************************)
val inputOK_staff_rejected_lemma =
TAC_PROOF(([],
``!(P:staff)(cmd:command). ~inputOK
   ((Name (Staff P) says (prop (SOME (cmd:command))))
   :(command inst,principal,'d,'e)Form)``),
PROVE_TAC[inputOK_def])

val _ = save_thm("inputOK_staff_rejected_lemma",inputOK_staff_rejected_lemma)

(******************************************************************************)
(* A theorem showing commands without a principal are rejected.               *)
(******************************************************************************)
val inputOK_cmd_reject_lemma =
TAC_PROOF(([],
``!(cmd:command). ~inputOK
   (prop (SOME (cmd:command)):(command inst,principal,'d,'e)Form)``),
PROVE_TAC[inputOK_def])

val _ = save_thm("inputOK_cmd_reject_lemma",inputOK_cmd_reject_lemma)

(******************************************************************************)
(* TT, (the result of a failed signature check), is rejected.                 *)
(******************************************************************************)
val inputOK_TT_reject_lemma =
TAC_PROOF(([],
``~inputOK (TT:(command inst,principal,'d,'e)Form)``),
PROVE_TAC[inputOK_def])

val _ = save_thm("inputOK_TT_reject_lemma",inputOK_TT_reject_lemma)

(* -------------------------------------------------------------------------- *)
(* certs definition: Operators authorized on any command; Commanders are      *)
(* authorized only on non-privileged commands                                 *)
(* -------------------------------------------------------------------------- *)
val certs_def =
Define
`certs (npriv:npriv)(privcmd:privcmd) =
 [(Name (Role Operator) controls ((prop (SOME (NP npriv)))
  :(command inst, principal,'d,'e)Form));
  Name (Role Operator) controls (prop (SOME (PR privcmd)));
  Name (Role Commander) controls prop (SOME (NP npriv));
  ((Name (Role Commander)) says (prop (SOME (PR privcmd)))) impf (prop NONE)]`



(******************************************************************************)
(* We prove theorems about when transitions occur given the authentication    *)
(* and authorization functions and certificates.                              *)
(******************************************************************************)

(******************************************************************************)
(* Operator is authorized on any privileged command                           *)
(******************************************************************************)
val Operator_privcmd_lemma =
TAC_PROOF(([],
``CFGInterpret ((M:(command inst,'b,principal,'d,'e)Kripke),Oi,Os)
  (CFG inputOK SM0StateInterp (certs npriv privcmd)
   (((Name (Role Operator)) says (prop (SOME (PR (privcmd:privcmd)))))::ins)
   s (outs:output list)) ==>
  ((M,Oi,Os) sat (prop (SOME(PR privcmd))))``),
REWRITE_TAC[CFGInterpret_def,certs_def,SM0StateInterp_def,satList_CONS,
	    satList_nil,sat_TT] THEN
PROVE_TAC[Controls])

val _ = save_thm("Operator_privcmd_lemma",Operator_privcmd_lemma)

(* -------------------------------------------------------------------------- *)
(* exec privcmd occurs if and only if Operator's command is authenticated and *)
(* authorized                                                                 *)
(* -------------------------------------------------------------------------- *)
val Operator_exec_privcmd_justified_thm =
let
 val th1 =
 ISPECL
 [``inputOK:(command inst, principal,'d,'e)Form -> bool``,
  ``(certs npriv privcmd):(command inst, principal,'d,'e)Form list``,
  ``SM0StateInterp:state->(command inst, principal,'d,'e)Form``,
  ``Name (Role Operator)``,``PR privcmd``,
  ``ins:(command inst,principal,'d,'e)Form list``,
  ``s:state``,``outs:output list``]
 TR_exec_cmd_rule
in 
 TAC_PROOF(([],
    ``!(NS :state -> command trType -> state)
         (Out :state -> command trType -> output)
         (M :(command inst, 'b, principal, 'd, 'e) Kripke) (Oi :'d po)
         (Os :'e po).
        TR (M,Oi,Os) (exec (PR (privcmd :privcmd)))
          (CFG (inputOK :(command inst, principal, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, principal, 'd, 'e) Form)
             (certs (npriv :npriv) privcmd :
                (command inst, principal, 'd, 'e) Form list)
             (Name (Role Operator) says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, principal, 'd, 'e) Form)::
                  (ins :(command inst, principal, 'd, 'e) Form list)) (s :state)
             (outs :output list))
          (CFG (inputOK :(command inst, principal, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, principal, 'd, 'e) Form)
             (certs npriv privcmd :
                (command inst, principal, 'd, 'e) Form list) ins
             (NS s (exec (PR privcmd)))
             (Out s (exec (PR privcmd))::outs)) <=>
        inputOK
          (Name (Role Operator) says
           (prop (SOME (PR privcmd) :command inst) :
              (command inst, principal, 'd, 'e) Form)) /\
        CFGInterpret (M,Oi,Os)
          (CFG (inputOK :(command inst, principal, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, principal, 'd, 'e) Form)
             (certs npriv privcmd :
                (command inst, principal, 'd, 'e) Form list)
             (Name (Role Operator) says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, principal, 'd, 'e) Form)::ins) s outs) /\
        (M,Oi,Os) sat
        (prop (SOME (PR privcmd) :command inst) :
           (command inst, principal, 'd, 'e) Form)``),
 PROVE_TAC[th1,Operator_privcmd_lemma])
end

val _ =
 save_thm
 ("Operator_exec_privcmd_justified_thm",Operator_exec_privcmd_justified_thm)

(* -------------------------------------------------------------------------- *)
(* If Operator's privileged command was executed, then the request was        *)
(* verified.                                                                  *)
(* -------------------------------------------------------------------------- *)
val Operator_privcmd_verified_thm =
TAC_PROOF(([],``!(NS :state -> command trType -> state)
         (Out :state -> command trType -> output)
         (M :(command inst, 'b, principal, 'd, 'e) Kripke) (Oi :'d po)
         (Os :'e po).
        TR (M,Oi,Os) (exec (PR (privcmd :privcmd)))
          (CFG (inputOK :(command inst, principal, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, principal, 'd, 'e) Form)
             (certs (npriv :npriv) privcmd :
                (command inst, principal, 'd, 'e) Form list)
             (Name (Role Operator) says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, principal, 'd, 'e) Form)::
                  (ins :(command inst, principal, 'd, 'e) Form list)) (s :state)
             (outs :output list))
          (CFG (inputOK :(command inst, principal, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, principal, 'd, 'e) Form)
             (certs npriv privcmd :
                (command inst, principal, 'd, 'e) Form list) ins
             (NS s (exec (PR privcmd)))
             (Out s (exec (PR privcmd))::outs)) ==>
        (M,Oi,Os) sat
        (prop (SOME (PR privcmd) :command inst) :
           (command inst, principal, 'd, 'e) Form)``),
PROVE_TAC[Operator_exec_privcmd_justified_thm])

val _ = save_thm("Operator_privcmd_verified_thm",Operator_privcmd_verified_thm)

(* -------------------------------------------------------------------------- *)
(* If Operator's privileged command was authorized, then the command is       *)
(* executed                                                                   *)
(* -------------------------------------------------------------------------- *)
val Operator_justified_privcmd_exec_thm =
TAC_PROOF(([],``!(NS :state -> command trType -> state)
         (Out :state -> command trType -> output)
         (M :(command inst, 'b, principal, 'd, 'e) Kripke) (Oi :'d po)
         (Os :'e po) cmd npriv privcmd ins s outs.
	 inputOK
          (Name (Role Operator) says
           (prop (SOME (PR privcmd) :command inst) :
              (command inst, principal, 'd, 'e) Form)) /\
	  CFGInterpret (M,Oi,Os)
          (CFG (inputOK :(command inst, principal, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, principal, 'd, 'e) Form)
             (certs npriv privcmd :
                (command inst, principal, 'd, 'e) Form list)
             (Name (Role Operator) says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, principal, 'd, 'e) Form)::ins) s outs) ==>
        TR (M,Oi,Os) (exec (PR (privcmd :privcmd)))
          (CFG (inputOK :(command inst, principal, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, principal, 'd, 'e) Form)
             (certs (npriv :npriv) privcmd :
                (command inst, principal, 'd, 'e) Form list)
             (Name (Role Operator) says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, principal, 'd, 'e) Form)::
                  (ins :(command inst, principal, 'd, 'e) Form list)) (s :state)
             (outs :output list))
          (CFG (inputOK :(command inst, principal, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, principal, 'd, 'e) Form)
             (certs npriv privcmd :
                (command inst, principal, 'd, 'e) Form list) ins
             (NS s (exec (PR privcmd)))
             (Out s (exec (PR privcmd))::outs))``),
PROVE_TAC[Operator_exec_privcmd_justified_thm,inputOK_def,Operator_privcmd_lemma])

val _ =
save_thm("Operator_justified_privcmd_exec_thm",
         Operator_justified_privcmd_exec_thm)

 (* ==== start here ====

==== end here ==== *)
val _ = export_theory();


end (* structure *)