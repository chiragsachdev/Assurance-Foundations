(******************************************************************************)
(* Secure State Machine Theory 2: Refined version of ssm1Theory with          *)
(* with datatypes for inputs, key certificates, authorizations, policies      *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 9 April 2017                                                         *)
(******************************************************************************)

structure ssm2Script = struct

(* ==== Interactive mode ====
app load ["TypeBase","ssminfRules","acl_infRules","listTheory",
           "satListTheory","ssm1Theory","ssm2Theory"];
open TypeBase ssminfRules acl_infRules satListTheory listTheory
     ssm1Theory ssm2Theory
 ==== end interactive mode ==== *)

open HolKernel boolLib Parse bossLib
open TypeBase ssminfRules acl_infRules listTheory satListTheory ssm1Theory

(***********************)
(* create a new theory *)
(***********************)
val _ = new_theory "ssm2";



(******************************************************************************)
(* We use the same type of transitions in ssm1: discard, execute, or trap.    *)
(* We use the type definitions in ssm1 for inst and trType. As before, we     *)
(* anticipate that inputs have a meaning P says <command>.                    *)
(******************************************************************************)

(* =====  Previously defined in ssm1 ====

val _ = 
Datatype
`inst = SOME 'command | NONE`
 
val inst_distinct_clauses = distinct_of``:'command inst``
val _ = save_thm("inst_distinct_clauses",inst_distinct_clauses)

val inst_one_one = one_one_of``:'command inst``
val _ = save_thm("inst_one_one",inst_one_one)

val _ =
Datatype 
`trType = 
  discard | trap 'command | exec 'command`

val trType_distinct_clauses = distinct_of``:'command trType``
val _ = save_thm("trType_distinct_clauses",trType_distinct_clauses)

val trType_one_one = one_one_of``:'command trType``
val _ = save_thm("trType_one_one",trType_one_one)

 ==== end previously defined in ssm1 ==== *)


(******************************************************************************)
(* Define the configuration CFG2 to be a refinement of ssm1. We mean it has   *)
(* both the same and additional components as CFG. The components are as      *)
(* follows: (1) the intepretation of inputs to access-control logic formulas, *)
(* (2) the interpretation of certificates used in the security context,       *)
(* (3) the authentication function, same as used in CFG in the access-control *)
(* logic, (4) the security context: 'cert list, (5) the interpretation of the *)
(* state, same as used in CFG, (6) the input stream :'input list, (7) the     *)
(* state :'state, and (8) the output stream :'output list                     *)
(******************************************************************************)
val _ =
Hol_datatype
`configuration2 =
CFG2 of
('input -> ('command inst,'principal,'d,'e)Form) =>
('cert -> ('command inst,'principal,'d,'e)Form) =>
(('command inst,'principal,'d,'e)Form -> bool) =>
'cert list =>
('state -> ('command inst,'principal,'d,'e)Form) =>
'input list =>
'state =>
'output list`

(* -------------------------------------------------------------------------- *)
(* Prove one-to-one properties of configuration                               *)
(* -------------------------------------------------------------------------- *)
val configuration2_one_one = 
    one_one_of``:('cert,'command inst,'d,'e,'input,'output,'principal,'state)configuration2``

val _ = save_thm("configuration2_one_one",configuration2_one_one)

(******************************************************************************)
(* The interpretation of configuration2 is the conjunction of the             *)
(* interpretations of the input, the certificates in the security context,    *)
(* and the state.                                                             *)
(******************************************************************************)
val CFG2Interpret_def =
Define
`CFG2Interpret
 ((M:('command inst,'b,'principal,'d,'e)Kripke),Oi:'d po,Os:'e po)
 (CFG2
  (inputInterpret: 'input -> ('command inst,'principal,'d,'e)Form)
  (certInterpret: 'cert -> ('command inst,'principal,'d,'e)Form)
  (inputTest:('command inst,'principal,'d,'e)Form -> bool)
  (certs:'cert list)
  (stateInterpret:'state -> ('command inst,'principal,'d,'e)Form)
  ((x::ins):'input list)
  (state:'state)
  (outStream:'output list))
 =
 (((M,Oi,Os) satList (MAP certInterpret certs)) /\
  ((M,Oi,Os) sat (inputInterpret x)) /\
  ((M,Oi,Os) sat (stateInterpret state)))`

(******************************************************************************)
(* Define the transition rule TR2 among configurations CFG2.                  *)
(*                                                                            *)
(*                                                                            *)
(******************************************************************************)
val (TR2_rules, TR2_ind, TR2_cases) =
Hol_reln
`(!(inputInterpret: 'input -> ('command inst,'principal,'d,'e)Form)
 (certInterpret: 'cert -> ('command inst,'principal,'d,'e)Form)
 (inputTest:('command inst,'principal,'d,'e)Form -> bool)
 (x:'input)
 (NS: 'state -> 'command trType -> 'state)
 (M:('command inst,'b,'principal,'d,'e)Kripke)
 (Oi:'d po)
 (Os:'e po)
 (Out: 'state -> 'command trType -> 'output)
 (state:'state)
 (certs:'cert list)
 (stateInterpret:'state -> ('command inst,'principal,'d,'e)Form)
 (cmd:'command)
 (ins:'input list)
 (outStream:'output list).
(inputTest(inputInterpret (x:'input))) /\
(CFG2Interpret
 (M,Oi,Os)
 (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
       (x::ins) state outStream)) ==>
(TR2 (M,Oi,Os) (exec cmd)
 (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
       (x::ins) state outStream)
 (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
       ins (NS state (exec cmd)) ((Out state (exec cmd))::outStream))))
 /\
 (!(inputInterpret: 'input -> ('command inst,'principal,'d,'e)Form)
 (certInterpret: 'cert -> ('command inst,'principal,'d,'e)Form)
 (inputTest:('command inst,'principal,'d,'e)Form -> bool)
 (x:'input)
 (NS: 'state -> 'command trType -> 'state)
 (M:('command inst,'b,'principal,'d,'e)Kripke)
 (Oi:'d po)
 (Os:'e po)
 (Out: 'state -> 'command trType -> 'output)
 (state:'state)
 (certs:'cert list)
 (stateInterpret:'state -> ('command inst,'principal,'d,'e)Form)
 (cmd:'command)
 (ins:'input list)
 (outStream:'output list).
(inputTest(inputInterpret (x:'input))) /\
(CFG2Interpret
 (M,Oi,Os)
 (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
       (x::ins) state outStream)) ==>
(TR2 (M,Oi,Os) (trap cmd)
 (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
       (x::ins) state outStream)
 (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
       ins (NS state (trap cmd)) ((Out state (trap cmd))::outStream))))
/\
(!(inputInterpret: 'input -> ('command inst,'principal,'d,'e)Form)
 (certInterpret: 'cert -> ('command inst,'principal,'d,'e)Form)
 (inputTest:('command inst,'principal,'d,'e)Form -> bool)
 (x:'input)
 (NS: 'state -> 'command trType -> 'state)
 (M:('command inst,'b,'principal,'d,'e)Kripke)
 (Oi:'d po)
 (Os:'e po)
 (Out: 'state -> 'command trType -> 'output)
 (state:'state)
 (certs:'cert list)
 (stateInterpret:'state -> ('command inst,'principal,'d,'e)Form)
 (cmd:'command)
 (ins:'input list)
 (outStream:'output list).
~(inputTest(inputInterpret (x:'input))) ==>
(TR2 (M,Oi,Os) discard
 (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
       (x::ins) state outStream)
 (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
       ins (NS state discard) ((Out state discard)::outStream))))`



(* -------------------------------------------------------------------------- *)
(* Split up TR2_rules into individual clauses                                 *)
(* -------------------------------------------------------------------------- *)
val [rule0,rule1,rule2] = CONJUNCTS TR2_rules

(******************************************************************************)
(* Prove the converse of rule0, rule1, and rule2                              *)
(******************************************************************************)

val TR2_lemma0 =
TAC_PROOF(([],flip_TR_rules rule0),
DISCH_TAC THEN
IMP_RES_TAC TR2_cases THEN
PAT_ASSUM
 ``exec cmd = y``
 (fn th => ASSUME_TAC(REWRITE_RULE[trType_one_one,trType_distinct_clauses]th))
THEN
PROVE_TAC[configuration2_one_one,list_11,trType_distinct_clauses])

val TR2_lemma1 =
TAC_PROOF(([],flip_TR_rules rule1),
DISCH_TAC THEN
IMP_RES_TAC TR2_cases THEN
PAT_ASSUM
 ``trap cmd = y``
 (fn th => ASSUME_TAC(REWRITE_RULE[trType_one_one,trType_distinct_clauses]th)) THEN
PROVE_TAC[configuration2_one_one,list_11,trType_distinct_clauses])

val TR2_lemma2 =
TAC_PROOF(([],flip_TR_rules rule2),
DISCH_TAC THEN
IMP_RES_TAC TR2_cases THEN
PAT_ASSUM
 ``discard = y``
 (fn th => ASSUME_TAC(REWRITE_RULE[trType_one_one,trType_distinct_clauses]th)) THEN
PROVE_TAC[configuration2_one_one,list_11,trType_distinct_clauses])


(******************************************************************************)
(* Combine the three converse theorems by conjunction                         *)
(******************************************************************************)
val TR2_rules_converse =
TAC_PROOF(([],flip_TR_rules TR2_rules),
REWRITE_TAC[TR2_lemma0, TR2_lemma1, TR2_lemma2])


(******************************************************************************)
(* Prove the if and only if versions of TR2_rules                             *)
(******************************************************************************)
val TR2_EQ_rules_thm = TR_EQ_rules TR2_rules TR2_rules_converse

val _ = save_thm("TR2_EQ_rules_thm",TR2_EQ_rules_thm)



(******************************************************************************)
(* Split up the TR2_EQ_rules into three individual rules: (1) exec, (2) trap, *)
(* and (3) discard                                                            *)
(******************************************************************************)
val [TR2rule0,TR2rule1,TR2_discard_cmd_rule] = CONJUNCTS TR2_EQ_rules_thm

val _ = save_thm("TR2rule0",TR2rule0)
val _ = save_thm("TR2rule1",TR2rule1)
val _ = save_thm("TR2_discard_cmd_rule",TR2_discard_cmd_rule)


(******************************************************************************)
(* CFG2Interpret implies (M,Oi,Os) sat (prop(CMD cmd)), then we have an       *)
(* exec(CMD cmd) transition if and only if inputTest, CFG2Interpret, and      *)
(* (M,Oi,Os) sat (prop(CMD cmd)) are all true                                 *)
(******************************************************************************)
val TR2_exec_cmd_rule =
TAC_PROOF(([],
``!inputInterpret certInterpret inputTest certs stateInterpret x cmd
   ins state outStream.
  (!M Oi Os.
   (CFG2Interpret
    ((M:('command inst,'b,'principal,'d,'e)Kripke),Oi:'d po,Os:'e po)
  (CFG2
  (inputInterpret: 'input -> ('command inst,'principal,'d,'e)Form)
  (certInterpret: 'cert -> ('command inst,'principal,'d,'e)Form)
  (inputTest:('command inst,'principal,'d,'e)Form -> bool)
  (certs:'cert list)
  (stateInterpret:'state -> ('command inst,'principal,'d,'e)Form)
  ((x::ins):'input list)
  (state:'state)
  (outStream:'output list)) ==> (M,Oi,Os) sat (prop(SOME cmd))))
  ==>
  (!NS Out (M:('command inst,'b,'principal,'d,'e)Kripke) Oi Os.
   TR2 (M,Oi,Os) (exec (cmd:'command))
     (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
        (x::ins) state outStream)
     (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
        ins (NS state (exec cmd))
        (Out state (exec cmd)::outStream)) <=>
   inputTest (inputInterpret x) /\
   (CFG2Interpret (M,Oi,Os)
      (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
         (x::ins) state outStream)) /\
   (M,Oi,Os) sat (prop(SOME cmd)))``),
REWRITE_TAC[TR2rule0] THEN
REPEAT STRIP_TAC THEN
EQ_TAC THEN
REPEAT STRIP_TAC THEN
PROVE_TAC[])

val _ = save_thm("TR2_exec_cmd_rule",TR2_exec_cmd_rule)


(******************************************************************************)
(* CFG2Interpret implies (M,Oi,Os) sat (prop(CMD cmd)), then we have an       *)
(* exec(CMD cmd) transition if and only if inputTest, CFG2Interpret, and      *)
(* (M,Oi,Os) sat (prop(CMD cmd)) are all true                                 *)
(******************************************************************************)
val TR2_trap_cmd_rule =
TAC_PROOF(([],
``!inputInterpret certInterpret inputTest certs stateInterpret x cmd
   ins state outStream.
  (!M Oi Os.
   (CFG2Interpret
    ((M:('command inst,'b,'principal,'d,'e)Kripke),Oi:'d po,Os:'e po)
  (CFG2
  (inputInterpret: 'input -> ('command inst,'principal,'d,'e)Form)
  (certInterpret: 'cert -> ('command inst,'principal,'d,'e)Form)
  (inputTest:('command inst,'principal,'d,'e)Form -> bool)
  (certs:'cert list)
  (stateInterpret:'state -> ('command inst,'principal,'d,'e)Form)
  ((x::ins):'input list)
  (state:'state)
  (outStream:'output list)) ==> (M,Oi,Os) sat (prop NONE)))
  ==>
  (!NS Out (M:('command inst,'b,'principal,'d,'e)Kripke) Oi Os.
   TR2 (M,Oi,Os) (trap (cmd:'command))
     (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
        (x::ins) state outStream)
     (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
        ins (NS state (trap cmd))
        (Out state (trap cmd)::outStream)) <=>
   inputTest (inputInterpret x) /\
   (CFG2Interpret (M,Oi,Os)
      (CFG2 inputInterpret certInterpret inputTest certs stateInterpret
         (x::ins) state outStream)) /\
   (M,Oi,Os) sat (prop NONE))``),
REWRITE_TAC[TR2rule1] THEN
REPEAT STRIP_TAC THEN
EQ_TAC THEN
REPEAT STRIP_TAC THEN
PROVE_TAC[])

val _ = save_thm("TR2_trap_cmd_rule",TR2_trap_cmd_rule)


(******************************************************************************)
(* TR2 discards if and only if TR discards                                    *)
(******************************************************************************)
val TR2_iff_TR_discard_thm =
TAC_PROOF(([],
``!NS Out outStream state certs certs2 x ins ins2 stateInterpret
   inputInterpret certInterpret inputTest.
  TR2
    ((M :('command inst, 'b, 'principal, 'd, 'e) Kripke),(Oi :'d po),
     (Os :'e po)) (discard :'command trType)
    (CFG2
       (inputInterpret :
         'input -> ('command inst, 'principal, 'd, 'e) Form)
       (certInterpret :
         'cert -> ('command inst, 'principal, 'd, 'e) Form)
       (inputTest :('command inst, 'principal, 'd, 'e) Form -> bool)
       (certs2 :'cert list)
       (stateInterpret :
         'state -> ('command inst, 'principal, 'd, 'e) Form)
       ((x :'input)::(ins2 :'input list)) (state :'state)
       (outStream :'output list))
    (CFG2 inputInterpret certInterpret inputTest certs2 stateInterpret
       ins2
       ((NS :'state -> 'command trType -> 'state) state
          (discard :'command trType))
       ((Out :'state -> 'command trType -> 'output) state
          (discard :'command trType)::outStream))
 <=>
  TR
    ((M :('command inst, 'b, 'principal, 'd, 'e) Kripke),(Oi :'d po),
     (Os :'e po)) (discard :'command trType)
    (CFG (inputTest :('command inst, 'principal, 'd, 'e) Form -> bool)
       (stateInterpret :
         'state -> ('command inst, 'principal, 'd, 'e) Form)
       (certs :('command inst, 'principal, 'd, 'e) Form list)
       (((inputInterpret x) :('command inst, 'principal, 'd, 'e) Form)::
            (ins :('command inst, 'principal, 'd, 'e) Form list))
       (state :'state) (outStream :'output list))
    (CFG inputTest stateInterpret certs ins
       ((NS :'state -> 'command trType -> 'state) state
          (discard :'command trType))
       ((Out :'state -> 'command trType -> 'output) state
               (discard :'command trType)::outStream))``),
REWRITE_TAC[TR_discard_cmd_rule,TR2_discard_cmd_rule])

val _ = save_thm("TR2_iff_TR_discard_thm",TR2_iff_TR_discard_thm)

val TR2_iff_TR_exec_thm =
TAC_PROOF(([],
``!inputInterpret certInterpret inputTest certs certs2 stateInterpret x P cmd
   ins ins2 state outStream.
   (inputInterpret x = (P says prop (SOME cmd))) ==>
   (MAP certInterpret certs2 = certs) ==>
   (!M Oi Os. 
   (CFGInterpret
   ((M :('command inst, 'b, 'principal, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po))
   (CFG (inputTest :('command inst, 'principal, 'd, 'e) Form -> bool)
       (stateInterpret :
         'state -> ('command inst, 'principal, 'd, 'e) Form)
       (certs :('command inst, 'principal, 'd, 'e) Form list)
       (((inputInterpret x) :('command inst, 'principal, 'd, 'e) Form)::
            (ins :('command inst, 'principal, 'd, 'e) Form list))
       (state :'state) (outStream :'output list)) ==>
  (M,Oi,Os) sat (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form)))
  ==>
  (!M Oi Os.
   (CFG2Interpret
    ((M:('command inst,'b,'principal,'d,'e)Kripke),Oi:'d po,Os:'e po)
  (CFG2
  (inputInterpret: 'input -> ('command inst,'principal,'d,'e)Form)
  (certInterpret: 'cert -> ('command inst,'principal,'d,'e)Form)
  (inputTest:('command inst,'principal,'d,'e)Form -> bool)
  (certs2:'cert list)
  (stateInterpret:'state -> ('command inst,'principal,'d,'e)Form)
  ((x::ins2):'input list)
  (state:'state)
  (outStream:'output list)) ==> (M,Oi,Os) sat (prop(SOME cmd))))
  ==>
  ((!NS Out (M:('command inst,'b,'principal,'d,'e)Kripke) Oi Os.
   TR2 (M,Oi,Os) (exec (cmd:'command))
     (CFG2 inputInterpret certInterpret inputTest (certs2:'cert list) stateInterpret
        ((x:'input)::ins2) state outStream)
     (CFG2 inputInterpret certInterpret inputTest certs2 stateInterpret
        ins2 (NS state (exec cmd))
        (Out state (exec cmd)::outStream)) <=>
   TR (M,Oi,Os) (exec cmd)
    (CFG (inputTest :('command inst, 'principal, 'd, 'e) Form -> bool)
       (stateInterpret :
         'state -> ('command inst, 'principal, 'd, 'e) Form)
       (certs :('command inst, 'principal, 'd, 'e) Form list)
       (((inputInterpret x) :('command inst, 'principal, 'd, 'e) Form)::
            (ins :('command inst, 'principal, 'd, 'e) Form list))
       (state :'state) (outStream :'output list))
    (CFG inputTest stateInterpret certs ins
       ((NS :'state -> 'command trType -> 'state) state
          ((exec cmd) :'command trType))
       ((Out :'state -> 'command trType -> 'output) state
               ((exec cmd) :'command trType)::outStream))))``),
REPEAT GEN_TAC THEN
DISCH_TAC THEN
DISCH_TAC THEN
ASM_REWRITE_TAC[] THEN
REPEAT STRIP_TAC THEN
IMP_RES_TAC TR_exec_cmd_rule THEN
IMP_RES_TAC TR2_exec_cmd_rule THEN
ASM_REWRITE_TAC[CFGInterpret_def,CFG2Interpret_def])

val _ = save_thm("TR2_iff_TR_exec_thm",TR2_iff_TR_exec_thm)

val TR2_iff_TR_trap_thm =
TAC_PROOF(([],
``!inputInterpret certInterpret inputTest certs certs2 stateInterpret x P cmd
   ins ins2 state outStream.
   (inputInterpret x = (P says prop (SOME cmd))) ==>
   (MAP certInterpret certs2 = certs) ==>
   (!M Oi Os. 
   (CFGInterpret
   ((M :('command inst, 'b, 'principal, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po))
   (CFG (inputTest :('command inst, 'principal, 'd, 'e) Form -> bool)
       (stateInterpret :
         'state -> ('command inst, 'principal, 'd, 'e) Form)
       (certs :('command inst, 'principal, 'd, 'e) Form list)
       (((inputInterpret x) :('command inst, 'principal, 'd, 'e) Form)::
            (ins :('command inst, 'principal, 'd, 'e) Form list))
       (state :'state) (outStream :'output list)) ==>
  (M,Oi,Os) sat (prop (NONE) :('command inst, 'principal, 'd, 'e) Form)))
  ==>
  (!M Oi Os.
   (CFG2Interpret
    ((M:('command inst,'b,'principal,'d,'e)Kripke),Oi:'d po,Os:'e po)
  (CFG2
  (inputInterpret: 'input -> ('command inst,'principal,'d,'e)Form)
  (certInterpret: 'cert -> ('command inst,'principal,'d,'e)Form)
  (inputTest:('command inst,'principal,'d,'e)Form -> bool)
  (certs2:'cert list)
  (stateInterpret:'state -> ('command inst,'principal,'d,'e)Form)
  ((x::ins2):'input list)
  (state:'state)
  (outStream:'output list)) ==> (M,Oi,Os) sat (prop NONE)))
  ==>
  ((!NS Out (M:('command inst,'b,'principal,'d,'e)Kripke) Oi Os.
   TR2 (M,Oi,Os) (trap (cmd:'command))
     (CFG2 inputInterpret certInterpret inputTest (certs2:'cert list) stateInterpret
        ((x:'input)::ins2) state outStream)
     (CFG2 inputInterpret certInterpret inputTest certs2 stateInterpret
        ins2 (NS state (trap cmd))
        (Out state (trap cmd)::outStream)) <=>
   TR (M,Oi,Os) (trap cmd)
    (CFG (inputTest :('command inst, 'principal, 'd, 'e) Form -> bool)
       (stateInterpret :
         'state -> ('command inst, 'principal, 'd, 'e) Form)
       (certs :('command inst, 'principal, 'd, 'e) Form list)
       (((inputInterpret x) :('command inst, 'principal, 'd, 'e) Form)::
            (ins :('command inst, 'principal, 'd, 'e) Form list))
       (state :'state) (outStream :'output list))
    (CFG inputTest stateInterpret certs ins
       ((NS :'state -> 'command trType -> 'state) state
          ((trap cmd) :'command trType))
       ((Out :'state -> 'command trType -> 'output) state
               ((trap cmd) :'command trType)::outStream))))``),
REPEAT GEN_TAC THEN
DISCH_TAC THEN
DISCH_TAC THEN
ASM_REWRITE_TAC[] THEN
REPEAT STRIP_TAC THEN
IMP_RES_TAC TR_trap_cmd_rule THEN
IMP_RES_TAC TR2_trap_cmd_rule THEN
ASM_REWRITE_TAC[CFGInterpret_def,CFG2Interpret_def])

val _ = save_thm("TR2_iff_TR_trap_thm",TR2_iff_TR_trap_thm)

(* ==== start here ====

==== end here ==== *)


val _ = export_theory ();
val _ = print_theory "-";

end (* structure *)