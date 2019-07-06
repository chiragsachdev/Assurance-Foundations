(******************************************************************************)
(* Definition of datatypes for SM0 commands and their properties              *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 13 April 2017                                                        *)
(******************************************************************************)

structure m0TypesScript = struct

(* ===== Interactive Mode ====
app load ["TypeBase", "commandTheory"]
open TypeBase commandTheory
 ==== end Interactive Mode ==== *)

open HolKernel Parse boolLib bossLib;
open TypeBase;

val _ = new_theory "m0Types";

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

val _ = export_theory();


end (* structure *)