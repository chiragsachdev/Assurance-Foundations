<<HOL message: Created theory "cipher">>
Saved theorem _____ "datatype_symKey"
Saved theorem _____ "symKey_11"
Saved theorem _____ "symKey_case_cong"
Saved theorem _____ "symKey_nchotomy"
Saved theorem _____ "symKey_Axiom"
Saved theorem _____ "symKey_induction"
<<HOL message: Defined type: "symKey">>
Saved theorem _____ "datatype_symMsg"
Saved theorem _____ "symMsg_11"
Saved theorem _____ "symMsg_case_cong"
Saved theorem _____ "symMsg_nchotomy"
Saved theorem _____ "symMsg_Axiom"
Saved theorem _____ "symMsg_induction"
<<HOL message: Defined type: "symMsg">>
Saved theorem _____ "symKey_one_one"
Saved theorem _____ "symMsg_one_one"
<<HOL warning: GrammarDeltas.revise_data: 
  Grammar-deltas:
    overload_on("deciphS_tupled")
  invalidated by DelConstant(cipher$deciphS_tupled)>>
Saved definition __ "deciphS_def"
Saved induction ___ "deciphS_ind"
Saved theorem _____ "datatype_pKey"
Saved theorem _____ "pKey_11"
Saved theorem _____ "pKey_distinct"
Saved theorem _____ "pKey_case_cong"
Saved theorem _____ "pKey_nchotomy"
Saved theorem _____ "pKey_Axiom"
Saved theorem _____ "pKey_induction"
<<HOL message: Defined type: "pKey">>
Saved theorem _____ "datatype_asymMsg"
Saved theorem _____ "asymMsg_11"
Saved theorem _____ "asymMsg_case_cong"
Saved theorem _____ "asymMsg_nchotomy"
Saved theorem _____ "asymMsg_Axiom"
Saved theorem _____ "asymMsg_induction"
<<HOL message: Defined type: "asymMsg">>
Saved theorem _____ "pKey_one_one"
Saved theorem _____ "pKey_distinct_clauses"
Saved theorem _____ "asymMsg_one_one"
<<HOL warning: GrammarDeltas.revise_data: 
  Grammar-deltas:
    overload_on("deciphP_tupled")
  invalidated by DelConstant(cipher$deciphP_tupled)>>
Saved definition __ "deciphP_def"
Saved induction ___ "deciphP_ind"
Saved theorem _____ "datatype_digest"
Saved theorem _____ "digest_11"
Saved theorem _____ "digest_case_cong"
Saved theorem _____ "digest_nchotomy"
Saved theorem _____ "digest_Axiom"
Saved theorem _____ "digest_induction"
<<HOL message: Defined type: "digest">>
Saved theorem _____ "digest_one_one"
Saved definition __ "sign_def"
Saved definition __ "signVerify_def"
Saved theorem _____ "signVerifyOK"
Saved theorem _____ "option_distinct"
Saved theorem _____ "deciphP_clauses"
Saved theorem _____ "deciphS_clauses"
Saved theorem _____ "option_one_one"
Saved theorem _____ "sign_one_one"
Saved theorem _____ "deciphS_one_one"
Saved theorem _____ "deciphP_one_one"
Saved theorem _____ "signVerify_one_one"
Theory: cipher

Parents:
    indexedLists
    patternMatches

Type constants:
    asymMsg 2
    digest 1
    pKey 1
    symKey 0
    symMsg 1

Term constants:
    Ea             :'princ pKey ->
                    'message option -> ('message, 'princ) asymMsg
    Es             :symKey -> 'message option -> 'message symMsg
    asymMsg_CASE   :('message, 'princ) asymMsg ->
                    ('princ pKey -> 'message option -> α) -> α
    asymMsg_size   :('message -> num) ->
                    ('princ -> num) -> ('message, 'princ) asymMsg -> num
    deciphP        :'princ pKey ->
                    ('message, 'princ) asymMsg -> 'message option
    deciphS        :symKey -> 'message symMsg -> 'message option
    digest_CASE    :'message digest -> ('message option -> α) -> α
    digest_size    :('message -> num) -> 'message digest -> num
    hash           :'message option -> 'message digest
    pKey_CASE      :'princ pKey -> ('princ -> α) -> ('princ -> α) -> α
    pKey_size      :('princ -> num) -> 'princ pKey -> num
    privK          :'princ -> 'princ pKey
    pubK           :'princ -> 'princ pKey
    sign           :'princ pKey ->
                    'message digest -> ('message digest, 'princ) asymMsg
    signVerify     :'princ pKey ->
                    ('message digest, 'princ) asymMsg ->
                    'message option -> bool
    sym            :num -> symKey
    symKey_CASE    :symKey -> (num -> α) -> α
    symKey_size    :symKey -> num
    symMsg_CASE    :'message symMsg ->
                    (symKey -> 'message option -> α) -> α
    symMsg_size    :('message -> num) -> 'message symMsg -> num

Definitions:
    asymMsg_TY_DEF
      |- ∃rep.
           TYPE_DEFINITION
             (λa0'.
                ∀'asymMsg' .
                  (∀a0'.
                     (∃a0 a1.
                        a0' =
                        (λa0 a1.
                           ind_type$CONSTR 0 (a0,a1)
                             (λn. ind_type$BOTTOM)) a0 a1) ⇒
                     'asymMsg' a0') ⇒
                  'asymMsg' a0') rep
    asymMsg_case_def
      |- ∀a0 a1 f. asymMsg_CASE (Ea a0 a1) f = f a0 a1
    asymMsg_size_def
      |- ∀f f1 a0 a1.
           asymMsg_size f f1 (Ea a0 a1) =
           1 + (pKey_size f1 a0 + option_size f a1)
    digest_TY_DEF
      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'digest' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa. ind_type$CONSTR 0 a (λn. ind_type$BOTTOM))
                          a) ⇒
                     'digest' a0) ⇒
                  'digest' a0) rep
    digest_case_def
      |- ∀a f. digest_CASE (hash a) f = f a
    digest_size_def
      |- ∀f a. digest_size f (hash a) = 1 + option_size f a
    pKey_TY_DEF
      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'pKey' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa. ind_type$CONSTR 0 a (λn. ind_type$BOTTOM))
                          a) ∨
                     (∃a.
                        a0 =
                        (λa.
                           ind_type$CONSTR (SUC 0) a
                             (λn. ind_type$BOTTOM)) a) ⇒
                     'pKey' a0) ⇒
                  'pKey' a0) rep
    pKey_case_def
      |- (∀a f f1. pKey_CASE (pubK a) f f1 = f a) ∧
         ∀a f f1. pKey_CASE (privK a) f f1 = f1 a
    pKey_size_def
      |- (∀f a. pKey_size f (pubK a) = 1 + f a) ∧
         ∀f a. pKey_size f (privK a) = 1 + f a
    signVerify_def
      |- ∀pubKey signature msgContents.
           signVerify pubKey signature msgContents ⇔
           (SOME (hash msgContents) = deciphP pubKey signature)
    sign_def
      |- ∀pubKey dgst. sign pubKey dgst = Ea pubKey (SOME dgst)
    symKey_TY_DEF
      |- ∃rep.
           TYPE_DEFINITION
             (λa0.
                ∀'symKey' .
                  (∀a0.
                     (∃a.
                        a0 =
                        (λa. ind_type$CONSTR 0 a (λn. ind_type$BOTTOM))
                          a) ⇒
                     'symKey' a0) ⇒
                  'symKey' a0) rep
    symKey_case_def
      |- ∀a f. symKey_CASE (sym a) f = f a
    symKey_size_def
      |- ∀a. symKey_size (sym a) = 1 + a
    symMsg_TY_DEF
      |- ∃rep.
           TYPE_DEFINITION
             (λa0'.
                ∀'symMsg' .
                  (∀a0'.
                     (∃a0 a1.
                        a0' =
                        (λa0 a1.
                           ind_type$CONSTR 0 (a0,a1)
                             (λn. ind_type$BOTTOM)) a0 a1) ⇒
                     'symMsg' a0') ⇒
                  'symMsg' a0') rep
    symMsg_case_def
      |- ∀a0 a1 f. symMsg_CASE (Es a0 a1) f = f a0 a1
    symMsg_size_def
      |- ∀f a0 a1.
           symMsg_size f (Es a0 a1) =
           1 + (symKey_size a0 + option_size f a1)

Theorems:
    asymMsg_11
      |- ∀a0 a1 a0' a1'.
           (Ea a0 a1 = Ea a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')
    asymMsg_Axiom
      |- ∀f. ∃fn. ∀a0 a1. fn (Ea a0 a1) = f a0 a1
    asymMsg_case_cong
      |- ∀M M' f.
           (M = M') ∧ (∀a0 a1. (M' = Ea a0 a1) ⇒ (f a0 a1 = f' a0 a1)) ⇒
           (asymMsg_CASE M f = asymMsg_CASE M' f')
    asymMsg_induction
      |- ∀P. (∀p $o. P (Ea p $o)) ⇒ ∀a. P a
    asymMsg_nchotomy
      |- ∀aa. ∃p $o. aa = Ea p $o
    asymMsg_one_one
      |- ∀a0 a1 a0' a1'.
           (Ea a0 a1 = Ea a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')
    datatype_asymMsg
      |- DATATYPE (asymMsg Ea)
    datatype_digest
      |- DATATYPE (digest hash)
    datatype_pKey
      |- DATATYPE (pKey pubK privK)
    datatype_symKey
      |- DATATYPE (symKey sym)
    datatype_symMsg
      |- DATATYPE (symMsg Es)
    deciphP_clauses
      |- (∀P text.
            (deciphP (pubK P) (Ea (privK P) (SOME text)) = SOME text) ∧
            (deciphP (privK P) (Ea (pubK P) (SOME text)) = SOME text)) ∧
         (∀k P text.
            (deciphP k (Ea (privK P) (SOME text)) = SOME text) ⇔
            (k = pubK P)) ∧
         (∀k P text.
            (deciphP k (Ea (pubK P) (SOME text)) = SOME text) ⇔
            (k = privK P)) ∧
         (∀x k2 k1 P2 P1.
            (deciphP (pubK P1) (Ea (pubK P2) (SOME x)) = NONE) ∧
            (deciphP k1 (Ea k2 NONE) = NONE)) ∧
         ∀x P2 P1. deciphP (privK P1) (Ea (privK P2) (SOME x)) = NONE
    deciphP_def
      |- (deciphP key (Ea (privK P) (SOME x)) =
          if key = pubK P then SOME x else NONE) ∧
         (deciphP key (Ea (pubK P) (SOME x)) =
          if key = privK P then SOME x else NONE) ∧
         (deciphP k1 (Ea k2 NONE) = NONE)
    deciphP_ind
      |- ∀P'.
           (∀key P x. P' key (Ea (privK P) (SOME x))) ∧
           (∀key P x. P' key (Ea (pubK P) (SOME x))) ∧
           (∀k1 k2. P' k1 (Ea k2 NONE)) ⇒
           ∀v v1. P' v v1
    deciphP_one_one
      |- (∀P1 P2 text1 text2.
            (deciphP (pubK P1) (Ea (privK P2) (SOME text2)) =
             SOME text1) ⇔ (P1 = P2) ∧ (text1 = text2)) ∧
         (∀P1 P2 text1 text2.
            (deciphP (privK P1) (Ea (pubK P2) (SOME text2)) =
             SOME text1) ⇔ (P1 = P2) ∧ (text1 = text2)) ∧
         (∀p c P msg.
            (deciphP (pubK P) (Ea p c) = SOME msg) ⇔
            (p = privK P) ∧ (c = SOME msg)) ∧
         (∀enMsg P msg.
            (deciphP (pubK P) enMsg = SOME msg) ⇔
            (enMsg = Ea (privK P) (SOME msg))) ∧
         (∀p c P msg.
            (deciphP (privK P) (Ea p c) = SOME msg) ⇔
            (p = pubK P) ∧ (c = SOME msg)) ∧
         ∀enMsg P msg.
           (deciphP (privK P) enMsg = SOME msg) ⇔
           (enMsg = Ea (pubK P) (SOME msg))
    deciphS_clauses
      |- (∀k text. deciphS k (Es k (SOME text)) = SOME text) ∧
         (∀k1 k2 text.
            (deciphS k1 (Es k2 (SOME text)) = SOME text) ⇔ (k1 = k2)) ∧
         (∀k1 k2 text.
            (deciphS k1 (Es k2 (SOME text)) = NONE) ⇔ k1 ≠ k2) ∧
         ∀k1 k2. deciphS k1 (Es k2 NONE) = NONE
    deciphS_def
      |- (deciphS k1 (Es k2 (SOME x)) =
          if k1 = k2 then SOME x else NONE) ∧
         (deciphS k1 (Es k2 NONE) = NONE)
    deciphS_ind
      |- ∀P.
           (∀k1 k2 x. P k1 (Es k2 (SOME x))) ∧
           (∀k1 k2. P k1 (Es k2 NONE)) ⇒
           ∀v v1. P v v1
    deciphS_one_one
      |- (∀k1 k2 text1 text2.
            (deciphS k1 (Es k2 (SOME text2)) = SOME text1) ⇔
            (k1 = k2) ∧ (text1 = text2)) ∧
         ∀enMsg text key.
           (deciphS key enMsg = SOME text) ⇔
           (enMsg = Es key (SOME text))
    digest_11
      |- ∀a a'. (hash a = hash a') ⇔ (a = a')
    digest_Axiom
      |- ∀f. ∃fn. ∀a. fn (hash a) = f a
    digest_case_cong
      |- ∀M M' f.
           (M = M') ∧ (∀a. (M' = hash a) ⇒ (f a = f' a)) ⇒
           (digest_CASE M f = digest_CASE M' f')
    digest_induction
      |- ∀P. (∀ $o. P (hash $o)) ⇒ ∀d. P d
    digest_nchotomy
      |- ∀dd. ∃ $o. dd = hash $o
    digest_one_one
      |- ∀a a'. (hash a = hash a') ⇔ (a = a')
    option_distinct
      |- ∀x. NONE ≠ SOME x
    option_one_one
      |- ∀x y. (SOME x = SOME y) ⇔ (x = y)
    pKey_11
      |- (∀a a'. (pubK a = pubK a') ⇔ (a = a')) ∧
         ∀a a'. (privK a = privK a') ⇔ (a = a')
    pKey_Axiom
      |- ∀f0 f1. ∃fn. (∀a. fn (pubK a) = f0 a) ∧ ∀a. fn (privK a) = f1 a
    pKey_case_cong
      |- ∀M M' f f1.
           (M = M') ∧ (∀a. (M' = pubK a) ⇒ (f a = f' a)) ∧
           (∀a. (M' = privK a) ⇒ (f1 a = f1' a)) ⇒
           (pKey_CASE M f f1 = pKey_CASE M' f' f1')
    pKey_distinct
      |- ∀a' a. pubK a ≠ privK a'
    pKey_distinct_clauses
      |- (∀a' a. pubK a ≠ privK a') ∧ ∀a' a. privK a' ≠ pubK a
    pKey_induction
      |- ∀P. (∀p. P (pubK p)) ∧ (∀p. P (privK p)) ⇒ ∀p. P p
    pKey_nchotomy
      |- ∀pp. (∃p. pp = pubK p) ∨ ∃p. pp = privK p
    pKey_one_one
      |- (∀a a'. (pubK a = pubK a') ⇔ (a = a')) ∧
         ∀a a'. (privK a = privK a') ⇔ (a = a')
    signVerifyOK
      |- ∀P msg.
           signVerify (pubK P) (sign (privK P) (hash (SOME msg)))
             (SOME msg)
    signVerify_one_one
      |- (∀P m1 m2.
            signVerify (pubK P) (Ea (privK P) (SOME (hash (SOME m1))))
              (SOME m2) ⇔ (m1 = m2)) ∧
         (∀signature P text.
            signVerify (pubK P) signature (SOME text) ⇔
            (signature = sign (privK P) (hash (SOME text)))) ∧
         ∀text2 text1 P2 P1.
           signVerify (pubK P1) (sign (privK P2) (hash (SOME text2)))
             (SOME text1) ⇔ (P1 = P2) ∧ (text1 = text2)
    sign_one_one
      |- ∀pubKey1 pubKey2 m1 m2.
           (sign pubKey1 (hash m1) = sign pubKey2 (hash m2)) ⇔
           (pubKey1 = pubKey2) ∧ (m1 = m2)
    symKey_11
      |- ∀a a'. (sym a = sym a') ⇔ (a = a')
    symKey_Axiom
      |- ∀f. ∃fn. ∀a. fn (sym a) = f a
    symKey_case_cong
      |- ∀M M' f.
           (M = M') ∧ (∀a. (M' = sym a) ⇒ (f a = f' a)) ⇒
           (symKey_CASE M f = symKey_CASE M' f')
    symKey_induction
      |- ∀P. (∀n. P (sym n)) ⇒ ∀s. P s
    symKey_nchotomy
      |- ∀ss. ∃n. ss = sym n
    symKey_one_one
      |- ∀a a'. (sym a = sym a') ⇔ (a = a')
    symMsg_11
      |- ∀a0 a1 a0' a1'.
           (Es a0 a1 = Es a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')
    symMsg_Axiom
      |- ∀f. ∃fn. ∀a0 a1. fn (Es a0 a1) = f a0 a1
    symMsg_case_cong
      |- ∀M M' f.
           (M = M') ∧ (∀a0 a1. (M' = Es a0 a1) ⇒ (f a0 a1 = f' a0 a1)) ⇒
           (symMsg_CASE M f = symMsg_CASE M' f')
    symMsg_induction
      |- ∀P. (∀s $o. P (Es s $o)) ⇒ ∀s. P s
    symMsg_nchotomy
      |- ∀ss. ∃s $o. ss = Es s $o
    symMsg_one_one
      |- ∀a0 a1 a0' a1'.
           (Es a0 a1 = Es a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')
Exporting theory "cipher" ... done.
Theory "cipher" took 2.6s to build
Completed load of cipherScript
