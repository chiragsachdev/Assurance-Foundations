(******************************************************************************)
(* Secure State Machine Theory: authentication, authorization, and state      *)
(* interpretation.                                                            *)
(* Author: Shiu-Kai Chin                                                      *)
(* Date: 27 November 2015                                                     *)
(******************************************************************************)


structure ssm1Script = struct

(* ==== Interactive mode ====
app load ["TypeBase", "ssminfRules","listTheory","optionTheory","acl_infRules",
    	  "satListTheory","ssm1Theory"];
open TypeBase listTheory ssminfRules optionTheory acl_infRules satListTheory
     ssm1Theory
 ==== end interactive mode ==== *)

open HolKernel boolLib Parse bossLib
open TypeBase listTheory optionTheory ssminfRules acl_infRules satListTheory
(***********************)
(* create a new theory *)
(***********************)
val _ = new_theory "ssm1";

(* -------------------------------------------------------------------------- *)
(* Define the type of transition: discard, execute, or trap. We discard from  *)
(* the input stream those inputs that are not of the form P says command. We  *)
(* execute commands that users and supervisors are authorized for. We trap    *)
(* commands that users are not authorized to execute.                         *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(* In keeping with virtual machine design principles as described by Popek    *)
(* and Goldberg, we add a TRAP instruction to the commands by users.          *)
(* In effect, we are LIFTING the commands available to users to include the   *)
(* TRAP instruction used by the state machine to handle authorization errors. *)
(* -------------------------------------------------------------------------- *)

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

(* -------------------------------------------------------------------------- *)
(* Define configuration to include the security context within which the      *)
(* inputs are evaluated. The components are as follows: (1) the authentication*)
(* function, (2) the intepretation of the state, (3) the security context,    *)
(* (4) the input stream, (5) the state, and (6) the output stream.            *)
(* -------------------------------------------------------------------------- *)
val _ =
Datatype 
`configuration = 
 CFG
  (('command inst,'principal,'d,'e)Form -> bool)
  (('state -> ('command inst,'principal,'d,'e)Form))
  (('command inst,'principal,'d,'e)Form list)
  (('command inst,'principal,'d,'e)Form list)
  ('state)
  ('output list)`



(* -------------------------------------------------------------------------- *)
(* Prove one-to-one properties of configuration                               *)
(* -------------------------------------------------------------------------- *)
val configuration_one_one = 
    one_one_of``:('command inst,'d,'e,'output,'principal,'state)configuration``

val _ = save_thm("configuration_one_one",configuration_one_one)

(* -------------------------------------------------------------------------- *)
(* The interpretation of configuration is the conjunction of the formulas in  *)
(* the context and the first element of a non-empty input stream.             *)
(* -------------------------------------------------------------------------- *)
val CFGInterpret_def =
Define
`CFGInterpret
 ((M:('command inst,'b,'principal,'d,'e)Kripke),Oi:'d po,Os:'e po)
 (CFG 
  (inputTest:('command inst,'principal,'d,'e)Form -> bool)
  (stateInterp:'state -> ('command inst,'principal,'d,'e)Form)
  (context:('command inst,'principal,'d,'e)Form list)
  ((x:('command inst,'principal,'d,'e)Form)::ins)
  (state:'state)
  (outStream:'output list))
 =
  ((M,Oi,Os) satList context) /\
  ((M,Oi,Os) sat x) /\
  ((M,Oi,Os) sat (stateInterp state))`

(* -------------------------------------------------------------------------- *)
(* Define transition relation among configurations. This definition is        *)
(* parameterized in terms of next-state transition function and output        *)
(* function.                                                                  *)
(* The first rule is set up with the expectation it is some principal P       *)
(* ordering a command cmd be executed.                                        *)
(* -------------------------------------------------------------------------- *)
val (TR_rules, TR_ind, TR_cases) =
Hol_reln
`(!(inputTest:('command inst,'principal,'d,'e)Form -> bool) (P:'principal Princ)
    (NS: 'state -> 'command trType -> 'state) M Oi Os Out (s:'state)
    (certList:('command inst,'principal,'d,'e)Form list)
    (stateInterp:'state -> ('command inst,'principal,'d,'e)Form)
    (cmd:'command)(ins:('command inst,'principal,'d,'e)Form list) 
    (outs:'output list).
 (inputTest ((P says (prop (SOME cmd))):('command inst,'principal,'d,'e)Form) /\
 (CFGInterpret (M,Oi,Os)
  (CFG inputTest stateInterp certList
       (((P says (prop (SOME cmd))):('command inst,'principal,'d,'e)Form)::ins)
       s outs))) ==>
 (TR 
  ((M:('command inst,'b,'principal,'d,'e)Kripke),Oi:'d po,Os:'e po) (exec cmd)
  (CFG inputTest stateInterp certList
       (((P says (prop (SOME cmd))):('command inst,'principal,'d,'e)Form)::ins)
      s outs)
  (CFG inputTest stateInterp certList ins (NS s (exec cmd))
       ((Out s (exec cmd))::outs)))) /\
 (!(inputTest:('command inst,'principal,'d,'e)Form -> bool) (P:'principal Princ)
   (NS:'state -> 'command trType -> 'state) M Oi Os Out (s:'state)
   (certList:('command inst,'principal,'d,'e)Form list)
   (stateInterp:'state -> ('command inst,'principal,'d,'e)Form)
   (cmd:'command)(ins:('command inst,'principal,'d,'e)Form list) 
   (outs:'output list).
 (inputTest ((P says (prop (SOME cmd))):('command inst,'principal,'d,'e)Form) /\
 (CFGInterpret (M,Oi,Os)
  (CFG inputTest stateInterp certList
       (((P says (prop (SOME cmd))):('command inst,'principal,'d,'e)Form)::ins)
       s outs))) ==>
 (TR 
  ((M:('command inst,'b,'principal,'d,'e)Kripke),Oi:'d po,Os:'e po) (trap cmd)
 (CFG inputTest stateInterp certList
      (((P says (prop (SOME cmd))):('command inst,'principal,'d,'e)Form)::ins)
      s outs)
 (CFG inputTest stateInterp certList ins (NS s (trap cmd))
      ((Out s (trap cmd))::outs)))) /\
 (!(inputTest:('command inst,'principal,'d,'e)Form -> bool)
   (NS:'state -> 'command trType -> 'state)
   M Oi Os (Out: 'state -> 'command trType -> 'output) (s:'state)
   (certList:('command inst,'principal,'d,'e)Form list)
   (stateInterp:'state -> ('command inst,'principal,'d,'e)Form)
   (cmd:'command)(x:('command inst,'principal,'d,'e)Form)
   (ins:('command inst,'principal,'d,'e)Form list) 
   (outs:'output list).
 ~inputTest x ==>
 (TR 
  ((M:('command inst,'b,'principal,'d,'e)Kripke),Oi:'d po,Os:'e po)
  (discard:'command trType)
 (CFG inputTest stateInterp certList
      ((x:('command inst,'principal,'d,'e)Form)::ins) s outs)
 (CFG inputTest stateInterp certList ins (NS s discard)
      ((Out s discard)::outs))))`



(* -------------------------------------------------------------------------- *)
(* Split up TR_rules into individual clauses                                  *)
(* -------------------------------------------------------------------------- *)
val [rule0,rule1,rule2] = CONJUNCTS TR_rules

(******************************************************************************)
(* Prove the converse of rule0, rule1, and rule2                              *)
(******************************************************************************)
val TR_lemma0 =
TAC_PROOF(([],flip_TR_rules rule0),
DISCH_TAC THEN
IMP_RES_TAC TR_cases THEN
PAT_ASSUM
 ``exec cmd = y``
 (fn th => ASSUME_TAC(REWRITE_RULE[trType_one_one,trType_distinct_clauses]th)) THEN
PROVE_TAC[configuration_one_one,list_11,trType_distinct_clauses])

val TR_lemma1 =
TAC_PROOF(([],flip_TR_rules rule1),
DISCH_TAC THEN
IMP_RES_TAC TR_cases THEN
PAT_ASSUM
 ``trap cmd = y``
 (fn th => ASSUME_TAC(REWRITE_RULE[trType_one_one,trType_distinct_clauses]th)) THEN
 PROVE_TAC[configuration_one_one,list_11,trType_distinct_clauses])

val TR_lemma2 =
TAC_PROOF(([],flip_TR_rules rule2),
DISCH_TAC THEN
IMP_RES_TAC TR_cases THEN
PAT_ASSUM
 ``discard = y``
 (fn th => ASSUME_TAC(REWRITE_RULE[trType_one_one,trType_distinct_clauses]th)) THEN
PROVE_TAC[configuration_one_one,list_11,trType_distinct_clauses])

val TR_rules_converse =
TAC_PROOF(([],flip_TR_rules TR_rules),
REWRITE_TAC[TR_lemma0, TR_lemma1, TR_lemma2])

val TR_EQ_rules_thm = TR_EQ_rules TR_rules TR_rules_converse 

val _ = save_thm("TR_EQ_rules_thm",TR_EQ_rules_thm)

val [TRrule0,TRrule1,TR_discard_cmd_rule] = CONJUNCTS TR_EQ_rules_thm

val _ = save_thm("TRrule0",TRrule0)
val _ = save_thm("TRrule1",TRrule1)
val _ = save_thm("TR_discard_cmd_rule",TR_discard_cmd_rule)


(* -------------------------------------------------------------------------- *)
(* If (CFGInterpret                                                           *)
(*     (M,Oi,Os)                                                              *)
(*     (CFG inputTest stateInterpret certList                                    *)
(*          ((P says (prop (CMD cmd)))::ins) s outs) ==>                      *)
(*    ((M,Oi,Os) sat (prop (CMD cmd))))                                       *)
(* is a valid inference rule, then executing cmd the exec(CMD cmd) transition *)
(* occurs if and only if prop (CMD cmd), inputTest, and                       *)
(* CFGInterpret (M,Oi,Os)                                                     *)
(*  (CFG inputTest stateInterpret certList (P says prop (CMD cmd)::ins) s outs)  *)
(* are true.                                                                  *)
(* -------------------------------------------------------------------------- *)
val TR_exec_cmd_rule =
TAC_PROOF(([],
``!inputTest certList stateInterp P cmd ins s outs.
 (!M Oi Os. 
 (CFGInterpret
  ((M :('command inst, 'b, 'principal, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po))
  (CFG inputTest
       (stateInterp:'state -> ('command inst,'principal,'d,'e)Form) certList
       (P says (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form)::ins)
       (s:'state) (outs:'output list)) ==>
  (M,Oi,Os) sat (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form))) ==>
(!NS Out M Oi Os. 
 TR
  ((M :('command inst, 'b, 'principal, 'd, 'e) Kripke),(Oi :'d po),
   (Os :'e po)) (exec (cmd :'command))
  (CFG (inputTest :('command inst, 'principal, 'd, 'e) Form -> bool)
	   (stateInterp:'state -> ('command inst,'principal,'d,'e)Form)
           (certList :('command inst, 'principal, 'd, 'e) Form list)
           ((P :'principal Princ) says
            (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form)::
                (ins :('command inst, 'principal, 'd, 'e) Form list))
           (s :'state) (outs :'output list))
   (CFG inputTest stateInterp certList ins
           ((NS :'state -> 'command trType -> 'state) s (exec cmd))
           ((Out :'state -> 'command trType -> 'output) s (exec cmd)::
                outs)) <=>
   inputTest
    (P says (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form)) /\
   (CFGInterpret (M,Oi,Os)
    (CFG
      inputTest stateInterp certList
      (P says (prop (SOME cmd):('command inst, 'principal, 'd, 'e) Form)::ins)
      s outs)) /\
   (M,Oi,Os) sat (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form))``),
REWRITE_TAC[TRrule0] THEN
REPEAT STRIP_TAC THEN
EQ_TAC THEN
REPEAT STRIP_TAC THEN
PROVE_TAC[])

val _ = save_thm("TR_exec_cmd_rule",TR_exec_cmd_rule)

(* -------------------------------------------------------------------------- *)
(* If (CFGInterpret                                                           *)
(*     (M,Oi,Os)                                                              *)
(*     (CFG inputTest stateInterpret certList                                    *)
(*          ((P says (prop (CMD cmd)))::ins) s outs) ==>                      *)
(*    ((M,Oi,Os) sat (prop TRAP)))                                            *)
(* is a valid inference rule, then executing cmd the exec(CMD cmd) transition *)
(* occurs if and only if prop TRAP, inputTest, and                            *)
(* CFGInterpret (M,Oi,Os)                                                     *)
(*  (CFG inputTest stateInterpret certList (P says prop (CMD cmd)::ins)          *)
(*       s outs) are true.                                                    *)
(* -------------------------------------------------------------------------- *)
val TR_trap_cmd_rule =
TAC_PROOF(
([],
``!inputTest (stateInterp:'state -> ('command inst,'principal,'d,'e)Form) certList
   P cmd ins (s:'state) (outs:'output list).
  (!M Oi Os.
  CFGInterpret
   ((M :('command inst, 'b, 'principal, 'd, 'e) Kripke),(Oi :'d po), (Os :'e po))
   (CFG inputTest stateInterp certList
        (P says (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form)::ins)
           s outs) ==>
  (M,Oi,Os) sat (prop NONE :('command inst, 'principal, 'd, 'e) Form)) ==>
(!NS Out M Oi Os.
TR
  ((M :('command inst, 'b, 'principal, 'd, 'e) Kripke),(Oi :'d po),
   (Os :'e po)) (trap (cmd :'command))
  (CFG (inputTest :('command inst, 'principal, 'd, 'e) Form -> bool)
     (stateInterp:'state -> ('command inst,'principal,'d,'e)Form)
     (certList :('command inst, 'principal, 'd, 'e) Form list)
     ((P :'principal Princ) says
      (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form)::
          (ins :('command inst, 'principal, 'd, 'e) Form list))
     (s :'state) outs)
  (CFG inputTest (stateInterp:'state -> ('command inst,'principal,'d,'e)Form) certList ins
     ((NS :'state -> 'command trType -> 'state) s (trap cmd))
     ((Out :'state -> 'command trType -> 'output) s
        (trap cmd)::outs)) <=>
inputTest
  (P says
   (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form)) /\
CFGInterpret (M,Oi,Os)
  (CFG inputTest (stateInterp:'state -> ('command inst,'principal,'d,'e)Form) certList
     (P says
      (prop (SOME cmd) :('command inst, 'principal, 'd, 'e) Form)::ins)
     s outs) /\
(M,Oi,Os) sat (prop NONE))``),
REWRITE_TAC[TRrule1] THEN
REPEAT STRIP_TAC THEN
EQ_TAC THEN
REPEAT STRIP_TAC THEN
PROVE_TAC[])

val _ = save_thm("TR_trap_cmd_rule",TR_trap_cmd_rule)
(* ==== start here ====

 ==== end here ==== *)

val _ = export_theory ();
val _ = print_theory "-";

end (* structure *)