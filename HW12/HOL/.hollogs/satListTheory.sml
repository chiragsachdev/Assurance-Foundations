/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:88: warning: Pattern is not exhaustive.
Found near val [prop_type, name_type, integ_type, ...] = snd f_type_parts
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:125: warning: Pattern is not exhaustive.
Found near val [prop_type, name_type, integ_type, ...] = snd f_type_parts
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:162: warning: Pattern is not exhaustive.
Found near val [prop_type, name_type, integ_type, ...] = snd f_type_parts
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:250: warning: Pattern is not exhaustive.
Found near val [prop_type, name_type, integ_type, ...] = snd f1_type_parts
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1245: warning: Matches are not exhaustive. Found near fn [th1, th2] => ACL_CONJ th1 th2
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1276: warning: Matches are not exhaustive. Found near fn [th] => ACL_DISJ1 disj2 th
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1304: warning: Matches are not exhaustive. Found near fn [th] => ACL_DISJ2 disj1 th
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1336: warning: Pattern is not exhaustive.
Found near val (_, [kripketype, ...]) = dest_type tupleType
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1337: warning: Pattern is not exhaustive.
Found near val (_, [_, ...]) = dest_type kripketype
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1340: warning: Matches are not exhaustive. Found near fn [th] => ACL_MP th2 th
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1374: warning: Matches are not exhaustive. Found near fn [th] => AND_SAYS_RL th
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1408: warning: Matches are not exhaustive. Found near fn [th] => AND_SAYS_LR th
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1440: warning: Matches are not exhaustive. Found near fn [th1, th2] => CONTROLS th1 th2
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1473: warning: Matches are not exhaustive. Found near fn [th1, th2] => DC th1 th2
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1506: warning: Matches are not exhaustive. Found near fn [th1, th2] => DOMI_TRANS th1 th2
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1541: warning: Matches are not exhaustive. Found near fn [th1, th2] => DOMS_TRANS th1 th2
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1575: warning: Matches are not exhaustive. Found near fn [th1, th2] => HS th1 th2
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1601: warning: Pattern is not exhaustive.
Found near val (_, [kripketype, ...]) = dest_type tupleType
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1602: warning: Pattern is not exhaustive.
Found near val (_, [_, ...]) = dest_type kripketype
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1604: warning: Pattern is not exhaustive.
Found near val (_, [proptype, ...]) = dest_type formType
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1643: warning: Matches are not exhaustive.
Found near fn [th1, th2, th3] => IL_DOMI th2 th1 th3
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1679: warning: Matches are not exhaustive.
Found near fn [th1, th2] => MONO_SPEAKS_FOR th1 th2
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1709: warning: Pattern is not exhaustive.
Found near val (_, [kripketype, ...]) = dest_type tupleType
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1710: warning: Pattern is not exhaustive.
Found near val (_, [_, ...]) = dest_type kripketype
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1745: warning: Matches are not exhaustive. Found near fn [th] => QUOTING_LR th
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1776: warning: Matches are not exhaustive. Found near fn [th] => QUOTING_RL th
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1810: warning: Matches are not exhaustive. Found near fn [th1, th2, th3] => REPS th1 th2 th3
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1842: warning: Matches are not exhaustive. Found near fn [th1, th2] => REP_SAYS th1 th2
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1869: warning: Matches are not exhaustive. Found near fn [th] => SAYS princ th
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1901: warning: Matches are not exhaustive. Found near fn [th1, th2] => SPEAKS_FOR th1 th2
/home/csbd/Documents/RESEARCH/HOL/ACL/acl_infRules.sml:1934: warning: Matches are not exhaustive.
Found near fn [th1, th2] => TRANS_SPEAKS_FOR th1 th2
<<HOL message: Created theory "satList">>
Saved definition __ "satList_def"
Saved theorem _____ "satList_nil"
Saved theorem _____ "satList_conj"
Saved theorem _____ "satList_CONS"
Exporting theory "satList" ... done.
Theory "satList" took 0.23457s to build
Theory: satList

Parents:
    aclDrules

Term constants:
    satList   :('prop, 'world, 'pName, 'Int, 'Sec) Kripke #
               'Int po # 'Sec po ->
               ('prop, 'pName, 'Int, 'Sec) Form list -> bool

Definitions:
    satList_def
      |- ∀M Oi Os formList.
           (M,Oi,Os) satList formList ⇔
           FOLDR (λx y. x ∧ y) T (MAP (λf. (M,Oi,Os) sat f) formList)

Theorems:
    satList_CONS
      |- ∀h t M Oi Os.
           (M,Oi,Os) satList (h::t) ⇔
           (M,Oi,Os) sat h ∧ (M,Oi,Os) satList t
    satList_conj
      |- ∀l1 l2 M Oi Os.
           (M,Oi,Os) satList l1 ∧ (M,Oi,Os) satList l2 ⇔
           (M,Oi,Os) satList (l1 ++ l2)
    satList_nil
      |- (M,Oi,Os) satList []
Completed load of satListScript
