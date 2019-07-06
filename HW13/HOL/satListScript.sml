(* -------------------------------------------------------------------------- *)
(* Definition of satList for conjunctions of ACL formulas                     *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 24 July 2014                                                         *)
(* -------------------------------------------------------------------------- *)
structure satListScript = struct

(*  interactive mode
 app load 
  ["TypeBase","listTheory","acl_infRules"];
*)
open HolKernel boolLib Parse bossLib
open TypeBase acl_infRules listTheory

(***********
* create a new theory
***********)
val _ = new_theory "satList";

(************************************************************)
(* Configurations and policies are represented by lists     *)
(* of formulas in the access-control logic.                 *)
(* Previously, for a formula f in the access-control logic, *)
(* we ultimately interpreted it within the context of a     *)
(* Kripke structure M and partial orders Oi:'Int po and     *)
(* Os:'Sec po. This is represented as (M,Oi,Os) sat f.      *)
(* The natural extension is to interpret a list of formulas *)
(* [f0;..;fn] as a conjunction:                             *)
(* (M,Oi,Os) sat f0 /\ ... /\ (M,Oi,Os) sat fn              *)
(************************************************************)

val _ = set_fixity "satList" (Infixr 540);


val satList_def =
Define
`((M:('prop,'world,'pName,'Int,'Sec)Kripke),(Oi:'Int po),(Os:'Sec po)) 
 satList 
 formList =
 FOLDR 
 (\x y. x /\ y) T 
 (MAP 
  (\ (f:('prop,'pName,'Int,'Sec)Form). 
  ((M:('prop,'world,'pName,'Int,'Sec)Kripke),
    Oi:'Int po,Os:'Sec po) sat f)formList)`;

(*************************)
(* Properties of satList *)
(*************************)
val satList_nil =
TAC_PROOF(
([],
``((M:('prop,'world,'pName,'Int,'Sec)Kripke),(Oi:'Int po),(Os:'Sec po)) satList []``),
REWRITE_TAC[satList_def,FOLDR,MAP])

val _ = save_thm("satList_nil",satList_nil)

val satList_conj =
TAC_PROOF(
([],
``!l1 l2 M Oi Os.(((M:('prop,'world,'pName,'Int,'Sec)Kripke),(Oi:'Int po),(Os:'Sec po)) 
   satList l1) /\ 
  (((M:('prop,'world,'pName,'Int,'Sec)Kripke),(Oi:'Int po),(Os:'Sec po)) 
   satList l2) =
  (((M:('prop,'world,'pName,'Int,'Sec)Kripke),(Oi:'Int po),(Os:'Sec po)) 
   satList (l1 ++ l2))``),
Induct THEN
REWRITE_TAC[APPEND,satList_nil] THEN
REWRITE_TAC[satList_def,MAP] THEN
CONV_TAC(DEPTH_CONV BETA_CONV) THEN
REWRITE_TAC[FOLDR] THEN
CONV_TAC(DEPTH_CONV BETA_CONV) THEN
REWRITE_TAC[GSYM satList_def] THEN
PROVE_TAC[])

val _ = save_thm("satList_conj",satList_conj)

val satList_CONS =
TAC_PROOF(([],
``!h t M Oi Os.(((M:('prop,'world,'pName,'Int,'Sec)Kripke),(Oi:'Int po),(Os:'Sec po)) 
   satList (h::t)) =
  (((M,Oi,Os) sat h) /\
  (((M:('prop,'world,'pName,'Int,'Sec)Kripke),(Oi:'Int po),(Os:'Sec po)) 
   satList t))``),
REPEAT STRIP_TAC THEN
REWRITE_TAC[satList_def,MAP] THEN
CONV_TAC(DEPTH_CONV BETA_CONV) THEN
REWRITE_TAC[FOLDR] THEN
CONV_TAC(DEPTH_CONV BETA_CONV) THEN
REWRITE_TAC[])

val _ = save_thm("satList_CONS",satList_CONS)

val _ = export_theory ();
val _ = print_theory "-";

end (* structure *)