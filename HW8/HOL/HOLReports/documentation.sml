(******************************************************************************)
(* documentation.sml: 13 February 2017                                        *)
(* Author: Shiu-Kai Chin                                                      *)
(* File used to generate documentation for reports in LaTeX                   *)
(******************************************************************************)

(******************************************************************************)
(* We apply (using the ml function app) the load function to the HOL theories *)
(* and libraries we need.  In this case "example1Theory" and "EmitTeX".       *)
(* EmitTeX contains the functions for pretty-printing HOL theories.           *)
(******************************************************************************)
app 
 load 
 ["example1Theory","solutions1Theory","conops0SolutionTheory","EmitTeX"];


(******************************************************************************)
(* We need to open EmitTeX to bring its functions into the HOL interpreter.   *)
(******************************************************************************)
open EmitTeX;

(******************************************************************************)
(* We call on one of the EmitTeX functions, print_theories_as_tex_doc, to     *)
(* produce the pretty-printed theory file for example1Theory.                 *)
(******************************************************************************)
print_theories_as_tex_doc
["example1","solutions1","conops0Solution"] "HW8";
