(******************************************************************************)
(* Define principal datatype for refined machines to include staff, keys,     *)
(* authorities, and machines.                                                 *)
(******************************************************************************)

structure principalScript = struct

open HolKernel Parse boolLib bossLib;
open TypeBase cipherTheory 


val _ = new_theory "principal";

(******************************************************************************)
(* Introduce certificate authorities                                          *)
(******************************************************************************)
val _ = Datatype `authority = ca num`
val authority_one_one = one_one_of``:authority``
val _ = save_thm("authority_one_one",authority_one_one)

(******************************************************************************)
(* Introduce roles                                                            *)
(******************************************************************************)
val _ = Datatype `role = Commander | Operator`
val role_distinct_clauses = distinct_of ``:role``
val _ = save_thm("role_distinct_clauses",role_distinct_clauses)

(* -------------------------------------------------------------------------- *)
(* Define datatypes for principles and their properties                       *)
(* -------------------------------------------------------------------------- *)
val _ =
Datatype `staff = Alice | Bob | Carol`

val staff_distinct_clauses = distinct_of``:staff``
val _ = save_thm("staff_distinct_clauses",staff_distinct_clauses)

(******************************************************************************)
(* Define principal datatype. Principals are roles, staff, authorities,       *)
(* public/private keys of staff, and public/private keys of authorities.      *)
(******************************************************************************)
val _ =
 Datatype
  `principal =
    Staff staff | Authority authority | Role role |
    KeyS (staff pKey) | KeyA (authority pKey) | Machine num`

val principal_distinct_clauses = distinct_of ``:principal``
val _ = save_thm("principal_distinct_clauses",principal_distinct_clauses)
val principal_one_one = one_one_of ``:principal``
val _ = save_thm("principal_one_one",principal_one_one)

val _ = export_theory();


end (* structure *)