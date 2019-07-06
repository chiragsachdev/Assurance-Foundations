(******************************************************************************)
(* Machine SM0 example                                                        *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 30 November 2015                                                     *)
(******************************************************************************)

structure SM0Script = struct


(* interactive mode
app load ["TypeBase","ssm1Theory","SM0Theory","acl_infRules","aclrulesTheory",
      	  "aclDrulesTheory","SM0Theory"];
open TypeBase ssm1Theory acl_infRules aclrulesTheory
     aclDrulesTheory satListTheory SM0Theory
*)

open HolKernel boolLib Parse bossLib
open TypeBase ssm1Theory acl_infRules aclrulesTheory aclDrulesTheory
     satListTheory

(***********
* create a new theory
***********)

val _ = new_theory "SM0"



(* -------------------------------------------------------------------------- *)
(* Define datatypes for commands and their properties                         *)
(* -------------------------------------------------------------------------- *)
val _ =
Datatype `privcmd = launch | reset`

val privcmd_distinct_clauses = distinct_of``:privcmd``
val _ = save_thm("privcmd_distinct_clauses",privcmd_distinct_clauses)

val _ =
Datatype `npriv = status`

val _ =
Datatype `command = NP npriv | PR privcmd`

val command_distinct_clauses = distinct_of``:command``
val _ = save_thm("command_distinct_clauses",command_distinct_clauses)

val command_one_one = one_one_of``:command``
val _ = save_thm("command_one_one",command_one_one)

(* -------------------------------------------------------------------------- *)
(* Define the states                                                          *)
(* -------------------------------------------------------------------------- *)
val _ =
Datatype`state = STBY | ACTIVE`

val state_distinct_clauses = distinct_of``:state``
val _ = save_thm("state_distinct_clauses",state_distinct_clauses)


(* -------------------------------------------------------------------------- *)
(* Define the outputs                                                         *)
(* -------------------------------------------------------------------------- *)
val _ =
Datatype`output = on | off`

val output_distinct_clauses = distinct_of``:output``
val _ = save_thm("output_distinct_clauses",output_distinct_clauses)

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
(* -------------------------------------------------------------------------- *)
(* Define datatypes for principles and their properties                       *)
(* -------------------------------------------------------------------------- *)
val _ =
Datatype `staff = Alice | Bob | Carol`

val staff_distinct_clauses = distinct_of``:staff``
val _ = save_thm("staff_distinct_clauses",staff_distinct_clauses)

(* -------------------------------------------------------------------------- *)
(* Input Authentication                                                       *)
(* -------------------------------------------------------------------------- *)
val inputOK_def =
Define
`(inputOK
  (((Name Alice) says
   (prop (SOME (cmd:command)))):(command inst,staff,'d,'e)Form) = T) /\
 (inputOK
  (((Name Bob) says
   (prop (SOME (cmd:command)))):(command inst,staff,'d,'e)Form) = T) /\
 (inputOK _ = F)`
 

(* -------------------------------------------------------------------------- *)
(* SM0StateInterp                                                             *)
(* -------------------------------------------------------------------------- *)
val SM0StateInterp_def =
Define
`SM0StateInterp (state:state) = (TT:(command inst,staff,'d,'e)Form)`

(* -------------------------------------------------------------------------- *)
(* certs definition                                                           *)
(* -------------------------------------------------------------------------- *)
val certs_def =
Define
`certs (cmd:command)(npriv:npriv)(privcmd:privcmd) =
 [(Name Alice controls ((prop (SOME (NP npriv))):(command inst, staff,'d,'e)Form));
  Name Alice controls (prop (SOME (PR privcmd)));
  Name Bob controls prop (SOME (NP npriv));
  ((Name Bob) says (prop (SOME (PR privcmd)))) impf (prop NONE)]`

(* -------------------------------------------------------------------------- *)
(* Some theorems showing any message from Carol is rejected                   *)
(* -------------------------------------------------------------------------- *)
val Carol_rejected_lemma =
TAC_PROOF(([],
``~inputOK
   (((Name Carol) says (prop (SOME (cmd:command)))):(command inst,staff,'d,'e)Form)``),
PROVE_TAC[inputOK_def])

val _ = save_thm("Carol_rejected_lemma",Carol_rejected_lemma)

val Carol_discard_lemma =
TAC_PROOF(([],
``TR ((M:(command inst,'b,staff,'d,'e)Kripke),Oi,Os) discard
  (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
   (((Name Carol) says (prop (SOME (cmd:command))))::ins)
   s (outs:output list))
  (CFG inputOK SM0StateInterp (certs cmd npriv privcmd) ins
  (SM0ns s discard) ((SM0out s discard)::outs))``),
PROVE_TAC[Carol_rejected_lemma,TR_discard_cmd_rule])

val _ = save_thm("Carol_discard_lemma",Carol_discard_lemma)


(* -------------------------------------------------------------------------- *)
(* Alice authorized on any privileged command                                 *)
(* -------------------------------------------------------------------------- *)
val Alice_privcmd_lemma =
TAC_PROOF(([],
``CFGInterpret ((M:(command inst,'b,staff,'d,'e)Kripke),Oi,Os)
  (CFG inputOK SM0StateInterp (certs cmd npriv privcmd)
   (((Name Alice) says (prop (SOME (PR (privcmd:privcmd)))))::ins)
   s (outs:output list)) ==>
  ((M,Oi,Os) sat (prop (SOME(PR privcmd))))``),
REWRITE_TAC[CFGInterpret_def,certs_def,SM0StateInterp_def,satList_CONS,
	    satList_nil,sat_TT] THEN
PROVE_TAC[Controls])

val _ = save_thm("Alice_privcmd_lemma",Alice_privcmd_lemma)

(* -------------------------------------------------------------------------- *)
(* exec privcmd occurs if and only if Alice's command is authenticated and    *)
(* authorized                                                                 *)
(* -------------------------------------------------------------------------- *)
val Alice_exec_privcmd_justified_thm =
let
 val th1 =
 ISPECL
 [``inputOK:(command inst, staff,'d,'e)Form -> bool``,
  ``(certs cmd npriv privcmd):(command inst, staff,'d,'e)Form list``,
  ``SM0StateInterp:state->(command inst, staff,'d,'e)Form``,
  ``Name Alice``,``PR privcmd``,``ins:(command inst,staff,'d,'e)Form list``,
  ``s:state``,``outs:output list``]
 TR_exec_cmd_rule
in 
 TAC_PROOF(([],
    ``!(NS :state -> command trType -> state)
         (Out :state -> command trType -> output)
         (M :(command inst, 'b, staff, 'd, 'e) Kripke) (Oi :'d po)
         (Os :'e po).
        TR (M,Oi,Os) (exec (PR (privcmd :privcmd)))
          (CFG (inputOK :(command inst, staff, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, staff, 'd, 'e) Form)
             (certs (cmd :command) (npriv :npriv) privcmd :
                (command inst, staff, 'd, 'e) Form list)
             (Name Alice says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, staff, 'd, 'e) Form)::
                  (ins :(command inst, staff, 'd, 'e) Form list)) (s :state)
             (outs :output list))
          (CFG (inputOK :(command inst, staff, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, staff, 'd, 'e) Form)
             (certs cmd npriv privcmd :
                (command inst, staff, 'd, 'e) Form list) ins
             (NS s (exec (PR privcmd)))
             (Out s (exec (PR privcmd))::outs)) <=>
        inputOK
          (Name Alice says
           (prop (SOME (PR privcmd) :command inst) :
              (command inst, staff, 'd, 'e) Form)) /\
        CFGInterpret (M,Oi,Os)
          (CFG (inputOK :(command inst, staff, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, staff, 'd, 'e) Form)
             (certs cmd npriv privcmd :
                (command inst, staff, 'd, 'e) Form list)
             (Name Alice says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, staff, 'd, 'e) Form)::ins) s outs) /\
        (M,Oi,Os) sat
        (prop (SOME (PR privcmd) :command inst) :
           (command inst, staff, 'd, 'e) Form)``),
 PROVE_TAC[th1,Alice_privcmd_lemma])
end

val _ = save_thm("Alice_exec_privcmd_justified_thm",Alice_exec_privcmd_justified_thm)


(* -------------------------------------------------------------------------- *)
(* If Alice's privileged command was executed, then the request was verified. *)
(* -------------------------------------------------------------------------- *)
val Alice_privcmd_verified_thm =
TAC_PROOF(([],``!(NS :state -> command trType -> state)
         (Out :state -> command trType -> output)
         (M :(command inst, 'b, staff, 'd, 'e) Kripke) (Oi :'d po)
         (Os :'e po).
        TR (M,Oi,Os) (exec (PR (privcmd :privcmd)))
          (CFG (inputOK :(command inst, staff, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, staff, 'd, 'e) Form)
             (certs (cmd :command) (npriv :npriv) privcmd :
                (command inst, staff, 'd, 'e) Form list)
             (Name Alice says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, staff, 'd, 'e) Form)::
                  (ins :(command inst, staff, 'd, 'e) Form list)) (s :state)
             (outs :output list))
          (CFG (inputOK :(command inst, staff, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, staff, 'd, 'e) Form)
             (certs cmd npriv privcmd :
                (command inst, staff, 'd, 'e) Form list) ins
             (NS s (exec (PR privcmd)))
             (Out s (exec (PR privcmd))::outs)) ==>
        (M,Oi,Os) sat
        (prop (SOME (PR privcmd) :command inst) :
           (command inst, staff, 'd, 'e) Form)``),
PROVE_TAC[Alice_exec_privcmd_justified_thm])

val _ = save_thm("Alice_privcmd_verified_thm",Alice_privcmd_verified_thm)

(* -------------------------------------------------------------------------- *)
(* If Alice's privileged command was authorized, then the command is executed *)
(* -------------------------------------------------------------------------- *)
val Alice_justified_privcmd_exec_thm =
TAC_PROOF(([],``!(NS :state -> command trType -> state)
         (Out :state -> command trType -> output)
         (M :(command inst, 'b, staff, 'd, 'e) Kripke) (Oi :'d po)
         (Os :'e po) cmd npriv privcmd ins s outs.
	 inputOK
          (Name Alice says
           (prop (SOME (PR privcmd) :command inst) :
              (command inst, staff, 'd, 'e) Form)) /\
	  CFGInterpret (M,Oi,Os)
          (CFG (inputOK :(command inst, staff, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, staff, 'd, 'e) Form)
             (certs cmd npriv privcmd :
                (command inst, staff, 'd, 'e) Form list)
             (Name Alice says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, staff, 'd, 'e) Form)::ins) s outs) ==>
        TR (M,Oi,Os) (exec (PR (privcmd :privcmd)))
          (CFG (inputOK :(command inst, staff, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, staff, 'd, 'e) Form)
             (certs (cmd :command) (npriv :npriv) privcmd :
                (command inst, staff, 'd, 'e) Form list)
             (Name Alice says
              (prop (SOME (PR privcmd) :command inst) :
                 (command inst, staff, 'd, 'e) Form)::
                  (ins :(command inst, staff, 'd, 'e) Form list)) (s :state)
             (outs :output list))
          (CFG (inputOK :(command inst, staff, 'd, 'e) Form -> bool)
             (SM0StateInterp :state -> (command inst, staff, 'd, 'e) Form)
             (certs cmd npriv privcmd :
                (command inst, staff, 'd, 'e) Form list) ins
             (NS s (exec (PR privcmd)))
             (Out s (exec (PR privcmd))::outs))``),
PROVE_TAC[Alice_exec_privcmd_justified_thm,inputOK_def,Alice_privcmd_lemma])

val _ = save_thm("Alice_justified_privcmd_exec_thm",Alice_justified_privcmd_exec_thm)


val _ = export_theory ()
val _ = print_theory "-"

end (* structure *)