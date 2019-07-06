(******************************************************************************)
(* Data structures for various certificate types                              *)
(* (1) root controlsCMD: unsigned P controls (prop (SOME cmd))                *)
(* (2) root reps: unsigned P reps Q on (prop (SOME cmd))                      *)
(* (3) root controlsKey: unsigned CA controls (K speaks_for P)                *)
(* (4) root key certificate: unsigned K speaks_for P                          *)
(* (5) root policy: unsigned p impf q                                         *)
(* (6) signed key certificate: Kca says (K speaks_for P)                      *)
(******************************************************************************)

structure certStructureScript = struct

(* ==== interactive mode ====
app load
 ["TypeBase","cipherTheory","aclfoundationTheory","aclrulesTheory",
  "aclDrulesTheory","acl_infRules","satListTheory","ssm1Theory",
  "certStructureTheory","principalTheory","listTheory","certStructureTheory"];
open TypeBase cipherTheory listTheory;
open aclfoundationTheory aclrulesTheory aclDrulesTheory acl_infRules;
open satListTheory ssm1Theory cipherTheory principalTheory certStructureTheory;
 ==== end interactive mode ====*)
 
open HolKernel Parse boolLib bossLib;
open TypeBase cipherTheory ssm1Theory principalTheory listTheory m0TypesTheory;
(* open aclfoundationTheory aclrulesTheory aclDrulesTheory; *)
(* open acl_infRules satListTheory ssm1Theory principalTheory; *)

val _ = new_theory "certStructure";

val _ =
Datatype
`certificate =
  RCert ((command inst,principal,'d,'e)Form) |
  SCert
   (principal) ((command inst,principal,'d,'e)Form)
   (((command inst, principal, 'd, 'e) Form digest, authority) asymMsg)`
 
(* ==== example certificate expressions ====
``RCert
  (((Name (Authority (ca 0))) controls
  ((Name (KeyS (pubK Bob))) speaks_for (Name (Staff Bob))))
  :(command inst,principal,'d,'e)Form)``

``SCert
  (KeyA (pubK (ca 0)))
  (((Name (Authority (ca 0))) controls
  ((Name (KeyS (pubK Bob))) speaks_for (Name (Staff Bob))))
  :(command inst,principal,'d,'e)Form)
  (sign
   (privK (ca 0))
   (hash (SOME (((Name (KeyS (pubK Bob))) speaks_for (Name (Staff Bob)))
   :(command inst,principal,'d,'e)Form))))``
 ==== end example certificate expressions ==== *)
 
(******************************************************************************)
(* Some of the usual theorems about datatypes                                 *)
(******************************************************************************)
val certificate_one_one = one_one_of``:('d,'e)certificate``
val _ = save_thm("certificate_one_one",certificate_one_one)

val certificate_distinct_thm = distinct_of``:('d,'e)certificate``
val _ = save_thm("certificate_distinct_thm",certificate_distinct_thm)

val checkcert_def =
Define
`(checkcert (RCert (formula:((command inst,principal,'d,'e)Form))) = T) /\
 (checkcert
  (SCert
   (KeyA (pubK (auth:authority)))
   (formula:(command inst,principal,'d,'e)Form)
   (signature:((command inst,principal,'d,'e)Form digest,authority) asymMsg)) =
 (signVerify (pubK auth) signature (SOME formula)))`

(******************************************************************************)
(* Interpretation of root and signed certificates.  Root certificates are     *)
(* accepted at face value.  Signed certificates are their formulas if their   *)
(* signatures check out.                                                      *)
(******************************************************************************)
val certificateInterpret_def =
Define
`(certificateInterpret
  (RCert (formula:(command inst,principal,'d,'e)Form)) =
  if checkcert (RCert formula) then formula else TT) /\
 (certificateInterpret
  (SCert
   (KeyA (pubK (auth:authority)))
   (formula:(command inst,principal,'d,'e)Form)
   (signature:
    ((command inst,principal,'d,'e)Form digest,authority) asymMsg)) =
 if checkcert (SCert (KeyA (pubK (auth:authority))) formula signature)
 then formula else TT)`




(******************************************************************************)
(* Properties of certificateInterpret with checkcert for RCert and SCert.     *)
(******************************************************************************)
val certificateInterpretRCert_thm =
TAC_PROOF(([],
``!(formula:(command inst,principal,'d,'e)Form).
   certificateInterpret (RCert formula) = formula``),
REWRITE_TAC[checkcert_def,certificateInterpret_def])

val _ =
save_thm
("certificateInterpretRCert_thm",certificateInterpretRCert_thm)

val certificateInterpretSCert_thm =
TAC_PROOF(([],
``!(formula:(command inst,principal,'d,'e)Form)(auth:authority).
certificateInterpret
(SCert
  (KeyA (pubK (auth:authority)))
  (formula:(command inst,principal,'d,'e)Form)
  (sign
   (privK (auth:authority))
   (hash (SOME formula)))) = formula``),
REWRITE_TAC[checkcert_def,certificateInterpret_def,signVerifyOK])

val _ =
save_thm
("certificateInterpretSCert_thm",certificateInterpretSCert_thm)



(******************************************************************************)
(* Define functions to make certificates from formulas                        *)
(******************************************************************************)
val mkRCert_def =
Define
`mkRCert (formula:(command inst,principal,'d,'e)Form) =
 (RCert formula)`

val mkSCert_def =
Define
`mkSCert
 (auth:authority)
 (formula:(command inst,principal,'d,'e)Form) =
(SCert
 (KeyA (pubK (auth:authority)))
 (formula:(command inst,principal,'d,'e)Form)
 (sign
   (privK (auth:authority))
   (hash (SOME formula))))`


(******************************************************************************)
(* certificateInterpret is the inverse of mkRCert and mkSCert                 *)
(******************************************************************************)
val certificateInterpret_mkRCert_thm =
TAC_PROOF(([],
``! formula.
  certificateInterpret
  (mkRCert (formula:(command inst,principal,'d,'e)Form)) =
  formula``),
REWRITE_TAC[mkRCert_def,certificateInterpretRCert_thm])

val _ =
save_thm
("certificateInterpret_mkRCert_thm",certificateInterpret_mkRCert_thm)

val certificateInterpret_mkSCert_thm =
TAC_PROOF(([],
``!formula auth.
  certificateInterpret
  (mkSCert (auth:authority)(formula:(command inst,principal,'d,'e)Form)) =
  formula``),
REWRITE_TAC[mkSCert_def,certificateInterpretSCert_thm])

val _ =
save_thm
("certificateInterpret_mkSCert_thm",certificateInterpret_mkSCert_thm)


val MAP_certificateInterpret_mkRCert_thm =
TAC_PROOF(([],
``!(formList:(command inst,principal,'d,'e)Form list).
  MAP certificateInterpret (MAP mkRCert formList) = formList``),
Induct_on`formList` THEN
PROVE_TAC[MAP,certificateInterpret_mkRCert_thm])

val _ =
save_thm
("MAP_certificateInterpret_mkRCert_thm",MAP_certificateInterpret_mkRCert_thm)

val MAP_certificateInterpret_mkSCert_thm =
TAC_PROOF(([],
``!(formList:(command inst,principal,'d,'e)Form list)(auth:authority).
  MAP certificateInterpret (MAP (mkSCert auth) formList) = formList``),
Induct_on`formList` THEN
PROVE_TAC[MAP,certificateInterpret_mkSCert_thm])

val _ =
save_thm
("MAP_certificateInterpret_mkSCert_thm",MAP_certificateInterpret_mkSCert_thm)

(* ==== start here ====


==== end here ==== *)

val _ = export_theory();


end (* structure *)