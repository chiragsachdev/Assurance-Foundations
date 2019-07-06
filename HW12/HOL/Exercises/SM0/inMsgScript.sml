(******************************************************************************)
(* Data structure and functions for input messages signed by staff keys       *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 17 April 2017                                                        *)
(******************************************************************************)

structure inMsgScript = struct

(* ==== interactive mode ====
app load ["TypeBase","cipherTheory","principalTheory","ssm2Theory","inMsgTheory"];
open TypeBase cipherTheory principalTheory ssm2Theory inMsgTheory;
 ==== end interactive mode ==== *)

open HolKernel Parse boolLib bossLib;
open cipherTheory TypeBase principalTheory ssm2Theory m0TypesTheory;

val _ = new_theory "inMsg";



(******************************************************************************)
(* Define the datatype order. Orders are commands issued within the context   *)
(* of a role.                                                                 *)
(******************************************************************************)
val _ =
Datatype
`order = Order role command`

val order_one_one = one_one_of ``:order``
val _ = save_thm("order_one_one",order_one_one)

(******************************************************************************)
(* Orders are interpreted as role says <command>                              *)
(******************************************************************************)
val orderInterpret_def =
Define
`orderInterpret (Order role command) =
 ((Name (Role role) says (prop (SOME command)))
 :(command inst,principal,'d,'e)Form)`
 
(******************************************************************************)
(* Input messages inMsg are digitally signed orders.                          *)
(******************************************************************************)
val _ =
Datatype
`inMsg =
  MSG staff order ((order digest,staff) asymMsg)`

val inMsg_one_one = one_one_of``:inMsg``
val _ = save_thm("inMsg_one_one",inMsg_one_one)


(******************************************************************************)
(* Message checking is verifying the signature over an order using the public *)
(* key of the staff member sending the message.                               *)
(******************************************************************************)
val checkMsg_def =
Define
`(checkMsg
  (MSG (staff:staff) (order:order) (signature:(order digest,staff)asymMsg))) =
 (signVerify (pubK staff) signature (SOME order))`

val checkMsgOK =
TAC_PROOF(([],
``checkMsg
  (MSG
   (staff:staff)
    (order:order)
     (sign (privK staff)(hash (SOME order))))``),
PROVE_TAC[checkMsg_def,signVerifyOK])

val _ = save_thm("checkMsgOK",checkMsgOK)

(******************************************************************************)
(* Message interpret function: if integrity checking passes then it's         *)
(* staff | role says <cmd>.  If not, then TT.                                 *)
(******************************************************************************)
val MsgInterpret_def =
Define
`(MsgInterpret
 (MSG
  (staff:staff)
   (Order (role:role)(command:command))
   (signature:(order digest,staff)asymMsg)) =
(if (checkMsg
    (MSG
     (staff:staff)
      (Order (role:role)(command:command))
       signature)) then
  (((((Name (KeyS (pubK staff))) quoting (Name (Role role))) says (prop (SOME command))))
  :(command inst,principal,'d,'e)Form) else (TT:(command inst, principal,'d,'e)Form)))`

(******************************************************************************)
(* Prove that MsgInterpret works as expected.                                 *)
(******************************************************************************)
val MsgInterpretOK =
TAC_PROOF(([],
``!staff role command.
  MsgInterpret
  (MSG
   (staff:staff)
   (Order (role:role)(command:command))
   (sign (privK staff)(hash (SOME (Order role command))))) =
  ((((Name (KeyS (pubK staff))) quoting (Name (Role role))) says (prop (SOME command)))
  :(command inst,principal,'d,'e)Form)``),
REWRITE_TAC[MsgInterpret_def,checkMsg_def,signVerifyOK])

val _ = save_thm("MsgInterpretOK",MsgInterpretOK)

(******************************************************************************)
(* Define input message creation function from anticipated input formula.     *)
(******************************************************************************)
val mkinMsg_def =
Define
`mkinMsg
 ((((Name (KeyS (pubK staff))) quoting (Name (Role role))) says (prop (SOME command)))
  :(command inst,principal,'d,'e)Form) =
 (MSG
   (staff:staff)
   (Order (role:role)(command:command))
   (sign (privK staff)(hash (SOME (Order role command)))))`

(******************************************************************************)
(* Prove MsgInterpret inverts mkinMsg.                                        *)
(******************************************************************************)
val MsgInterpret_inverts_mkinMsg_thm =
TAC_PROOF(([],
``!staff role command.
  MsgInterpret
  (mkinMsg
   ((((Name (KeyS (pubK staff))) quoting (Name (Role role))) says (prop (SOME command)))
    :(command inst,principal,'d,'e)Form)) =
   ((((Name (KeyS (pubK staff))) quoting (Name (Role role))) says (prop (SOME command)))
    :(command inst,principal,'d,'e)Form)``),
REWRITE_TAC[mkinMsg_def,MsgInterpretOK])

val _ =
save_thm
("MsgInterpret_inverts_mkinMsg_thm",MsgInterpret_inverts_mkinMsg_thm)

(* ==== start here ====

==== end here ==== *)

val _ = export_theory();



end (* structure *)