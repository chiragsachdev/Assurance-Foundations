signature cipherTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val asymMsg_TY_DEF : thm
    val asymMsg_case_def : thm
    val asymMsg_size_def : thm
    val digest_TY_DEF : thm
    val digest_case_def : thm
    val digest_size_def : thm
    val pKey_TY_DEF : thm
    val pKey_case_def : thm
    val pKey_size_def : thm
    val signVerify_def : thm
    val sign_def : thm
    val symKey_TY_DEF : thm
    val symKey_case_def : thm
    val symKey_size_def : thm
    val symMsg_TY_DEF : thm
    val symMsg_case_def : thm
    val symMsg_size_def : thm

  (*  Theorems  *)
    val asymMsg_11 : thm
    val asymMsg_Axiom : thm
    val asymMsg_case_cong : thm
    val asymMsg_induction : thm
    val asymMsg_nchotomy : thm
    val asymMsg_one_one : thm
    val datatype_asymMsg : thm
    val datatype_digest : thm
    val datatype_pKey : thm
    val datatype_symKey : thm
    val datatype_symMsg : thm
    val deciphP_clauses : thm
    val deciphP_def : thm
    val deciphP_ind : thm
    val deciphP_one_one : thm
    val deciphS_clauses : thm
    val deciphS_def : thm
    val deciphS_ind : thm
    val deciphS_one_one : thm
    val digest_11 : thm
    val digest_Axiom : thm
    val digest_case_cong : thm
    val digest_induction : thm
    val digest_nchotomy : thm
    val digest_one_one : thm
    val option_distinct : thm
    val option_one_one : thm
    val pKey_11 : thm
    val pKey_Axiom : thm
    val pKey_case_cong : thm
    val pKey_distinct : thm
    val pKey_distinct_clauses : thm
    val pKey_induction : thm
    val pKey_nchotomy : thm
    val pKey_one_one : thm
    val signVerifyOK : thm
    val signVerify_one_one : thm
    val sign_one_one : thm
    val symKey_11 : thm
    val symKey_Axiom : thm
    val symKey_case_cong : thm
    val symKey_induction : thm
    val symKey_nchotomy : thm
    val symKey_one_one : thm
    val symMsg_11 : thm
    val symMsg_Axiom : thm
    val symMsg_case_cong : thm
    val symMsg_induction : thm
    val symMsg_nchotomy : thm
    val symMsg_one_one : thm

  val cipher_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [indexedLists] Parent theory of "cipher"

   [patternMatches] Parent theory of "cipher"

   [asymMsg_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0'.
                ∀'asymMsg' .
                  (∀a0'.
                     (∃a0 a1.
                        a0' =
                        (λa0 a1.
                           ind_type$CONSTR 0 (a0,a1) (λn. ind_type$BOTTOM))
                          a0 a1) ⇒
                     'asymMsg' a0') ⇒
                  'asymMsg' a0') rep

   [asymMsg_case_def]  Definition

      |- ∀a0 a1 f. asymMsg_CASE (Ea a0 a1) f = f a0 a1

   [asymMsg_size_def]  Definition

      |- ∀f f1 a0 a1.
           asymMsg_size f f1 (Ea a0 a1) =
           1 + (pKey_size f1 a0 + option_size f a1)

   [digest_TY_DEF]  Definition

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

   [digest_case_def]  Definition

      |- ∀a f. digest_CASE (hash a) f = f a

   [digest_size_def]  Definition

      |- ∀f a. digest_size f (hash a) = 1 + option_size f a

   [pKey_TY_DEF]  Definition

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
                           ind_type$CONSTR (SUC 0) a (λn. ind_type$BOTTOM))
                          a) ⇒
                     'pKey' a0) ⇒
                  'pKey' a0) rep

   [pKey_case_def]  Definition

      |- (∀a f f1. pKey_CASE (pubK a) f f1 = f a) ∧
         ∀a f f1. pKey_CASE (privK a) f f1 = f1 a

   [pKey_size_def]  Definition

      |- (∀f a. pKey_size f (pubK a) = 1 + f a) ∧
         ∀f a. pKey_size f (privK a) = 1 + f a

   [signVerify_def]  Definition

      |- ∀pubKey signature msgContents.
           signVerify pubKey signature msgContents ⇔
           (SOME (hash msgContents) = deciphP pubKey signature)

   [sign_def]  Definition

      |- ∀pubKey dgst. sign pubKey dgst = Ea pubKey (SOME dgst)

   [symKey_TY_DEF]  Definition

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

   [symKey_case_def]  Definition

      |- ∀a f. symKey_CASE (sym a) f = f a

   [symKey_size_def]  Definition

      |- ∀a. symKey_size (sym a) = 1 + a

   [symMsg_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0'.
                ∀'symMsg' .
                  (∀a0'.
                     (∃a0 a1.
                        a0' =
                        (λa0 a1.
                           ind_type$CONSTR 0 (a0,a1) (λn. ind_type$BOTTOM))
                          a0 a1) ⇒
                     'symMsg' a0') ⇒
                  'symMsg' a0') rep

   [symMsg_case_def]  Definition

      |- ∀a0 a1 f. symMsg_CASE (Es a0 a1) f = f a0 a1

   [symMsg_size_def]  Definition

      |- ∀f a0 a1.
           symMsg_size f (Es a0 a1) =
           1 + (symKey_size a0 + option_size f a1)

   [asymMsg_11]  Theorem

      |- ∀a0 a1 a0' a1'. (Ea a0 a1 = Ea a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')

   [asymMsg_Axiom]  Theorem

      |- ∀f. ∃fn. ∀a0 a1. fn (Ea a0 a1) = f a0 a1

   [asymMsg_case_cong]  Theorem

      |- ∀M M' f.
           (M = M') ∧ (∀a0 a1. (M' = Ea a0 a1) ⇒ (f a0 a1 = f' a0 a1)) ⇒
           (asymMsg_CASE M f = asymMsg_CASE M' f')

   [asymMsg_induction]  Theorem

      |- ∀P. (∀p $o. P (Ea p $o)) ⇒ ∀a. P a

   [asymMsg_nchotomy]  Theorem

      |- ∀aa. ∃p $o. aa = Ea p $o

   [asymMsg_one_one]  Theorem

      |- ∀a0 a1 a0' a1'. (Ea a0 a1 = Ea a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')

   [datatype_asymMsg]  Theorem

      |- DATATYPE (asymMsg Ea)

   [datatype_digest]  Theorem

      |- DATATYPE (digest hash)

   [datatype_pKey]  Theorem

      |- DATATYPE (pKey pubK privK)

   [datatype_symKey]  Theorem

      |- DATATYPE (symKey sym)

   [datatype_symMsg]  Theorem

      |- DATATYPE (symMsg Es)

   [deciphP_clauses]  Theorem

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

   [deciphP_def]  Theorem

      |- (deciphP key (Ea (privK P) (SOME x)) =
          if key = pubK P then SOME x else NONE) ∧
         (deciphP key (Ea (pubK P) (SOME x)) =
          if key = privK P then SOME x else NONE) ∧
         (deciphP k1 (Ea k2 NONE) = NONE)

   [deciphP_ind]  Theorem

      |- ∀P'.
           (∀key P x. P' key (Ea (privK P) (SOME x))) ∧
           (∀key P x. P' key (Ea (pubK P) (SOME x))) ∧
           (∀k1 k2. P' k1 (Ea k2 NONE)) ⇒
           ∀v v1. P' v v1

   [deciphP_one_one]  Theorem

      |- (∀P1 P2 text1 text2.
            (deciphP (pubK P1) (Ea (privK P2) (SOME text2)) = SOME text1) ⇔
            (P1 = P2) ∧ (text1 = text2)) ∧
         (∀P1 P2 text1 text2.
            (deciphP (privK P1) (Ea (pubK P2) (SOME text2)) = SOME text1) ⇔
            (P1 = P2) ∧ (text1 = text2)) ∧
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

   [deciphS_clauses]  Theorem

      |- (∀k text. deciphS k (Es k (SOME text)) = SOME text) ∧
         (∀k1 k2 text.
            (deciphS k1 (Es k2 (SOME text)) = SOME text) ⇔ (k1 = k2)) ∧
         (∀k1 k2 text. (deciphS k1 (Es k2 (SOME text)) = NONE) ⇔ k1 ≠ k2) ∧
         ∀k1 k2. deciphS k1 (Es k2 NONE) = NONE

   [deciphS_def]  Theorem

      |- (deciphS k1 (Es k2 (SOME x)) = if k1 = k2 then SOME x else NONE) ∧
         (deciphS k1 (Es k2 NONE) = NONE)

   [deciphS_ind]  Theorem

      |- ∀P.
           (∀k1 k2 x. P k1 (Es k2 (SOME x))) ∧
           (∀k1 k2. P k1 (Es k2 NONE)) ⇒
           ∀v v1. P v v1

   [deciphS_one_one]  Theorem

      |- (∀k1 k2 text1 text2.
            (deciphS k1 (Es k2 (SOME text2)) = SOME text1) ⇔
            (k1 = k2) ∧ (text1 = text2)) ∧
         ∀enMsg text key.
           (deciphS key enMsg = SOME text) ⇔ (enMsg = Es key (SOME text))

   [digest_11]  Theorem

      |- ∀a a'. (hash a = hash a') ⇔ (a = a')

   [digest_Axiom]  Theorem

      |- ∀f. ∃fn. ∀a. fn (hash a) = f a

   [digest_case_cong]  Theorem

      |- ∀M M' f.
           (M = M') ∧ (∀a. (M' = hash a) ⇒ (f a = f' a)) ⇒
           (digest_CASE M f = digest_CASE M' f')

   [digest_induction]  Theorem

      |- ∀P. (∀ $o. P (hash $o)) ⇒ ∀d. P d

   [digest_nchotomy]  Theorem

      |- ∀dd. ∃ $o. dd = hash $o

   [digest_one_one]  Theorem

      |- ∀a a'. (hash a = hash a') ⇔ (a = a')

   [option_distinct]  Theorem

      |- ∀x. NONE ≠ SOME x

   [option_one_one]  Theorem

      |- ∀x y. (SOME x = SOME y) ⇔ (x = y)

   [pKey_11]  Theorem

      |- (∀a a'. (pubK a = pubK a') ⇔ (a = a')) ∧
         ∀a a'. (privK a = privK a') ⇔ (a = a')

   [pKey_Axiom]  Theorem

      |- ∀f0 f1. ∃fn. (∀a. fn (pubK a) = f0 a) ∧ ∀a. fn (privK a) = f1 a

   [pKey_case_cong]  Theorem

      |- ∀M M' f f1.
           (M = M') ∧ (∀a. (M' = pubK a) ⇒ (f a = f' a)) ∧
           (∀a. (M' = privK a) ⇒ (f1 a = f1' a)) ⇒
           (pKey_CASE M f f1 = pKey_CASE M' f' f1')

   [pKey_distinct]  Theorem

      |- ∀a' a. pubK a ≠ privK a'

   [pKey_distinct_clauses]  Theorem

      |- (∀a' a. pubK a ≠ privK a') ∧ ∀a' a. privK a' ≠ pubK a

   [pKey_induction]  Theorem

      |- ∀P. (∀p. P (pubK p)) ∧ (∀p. P (privK p)) ⇒ ∀p. P p

   [pKey_nchotomy]  Theorem

      |- ∀pp. (∃p. pp = pubK p) ∨ ∃p. pp = privK p

   [pKey_one_one]  Theorem

      |- (∀a a'. (pubK a = pubK a') ⇔ (a = a')) ∧
         ∀a a'. (privK a = privK a') ⇔ (a = a')

   [signVerifyOK]  Theorem

      |- ∀P msg.
           signVerify (pubK P) (sign (privK P) (hash (SOME msg)))
             (SOME msg)

   [signVerify_one_one]  Theorem

      |- (∀P m1 m2.
            signVerify (pubK P) (Ea (privK P) (SOME (hash (SOME m1))))
              (SOME m2) ⇔ (m1 = m2)) ∧
         (∀signature P text.
            signVerify (pubK P) signature (SOME text) ⇔
            (signature = sign (privK P) (hash (SOME text)))) ∧
         ∀text2 text1 P2 P1.
           signVerify (pubK P1) (sign (privK P2) (hash (SOME text2)))
             (SOME text1) ⇔ (P1 = P2) ∧ (text1 = text2)

   [sign_one_one]  Theorem

      |- ∀pubKey1 pubKey2 m1 m2.
           (sign pubKey1 (hash m1) = sign pubKey2 (hash m2)) ⇔
           (pubKey1 = pubKey2) ∧ (m1 = m2)

   [symKey_11]  Theorem

      |- ∀a a'. (sym a = sym a') ⇔ (a = a')

   [symKey_Axiom]  Theorem

      |- ∀f. ∃fn. ∀a. fn (sym a) = f a

   [symKey_case_cong]  Theorem

      |- ∀M M' f.
           (M = M') ∧ (∀a. (M' = sym a) ⇒ (f a = f' a)) ⇒
           (symKey_CASE M f = symKey_CASE M' f')

   [symKey_induction]  Theorem

      |- ∀P. (∀n. P (sym n)) ⇒ ∀s. P s

   [symKey_nchotomy]  Theorem

      |- ∀ss. ∃n. ss = sym n

   [symKey_one_one]  Theorem

      |- ∀a a'. (sym a = sym a') ⇔ (a = a')

   [symMsg_11]  Theorem

      |- ∀a0 a1 a0' a1'. (Es a0 a1 = Es a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')

   [symMsg_Axiom]  Theorem

      |- ∀f. ∃fn. ∀a0 a1. fn (Es a0 a1) = f a0 a1

   [symMsg_case_cong]  Theorem

      |- ∀M M' f.
           (M = M') ∧ (∀a0 a1. (M' = Es a0 a1) ⇒ (f a0 a1 = f' a0 a1)) ⇒
           (symMsg_CASE M f = symMsg_CASE M' f')

   [symMsg_induction]  Theorem

      |- ∀P. (∀s $o. P (Es s $o)) ⇒ ∀s. P s

   [symMsg_nchotomy]  Theorem

      |- ∀ss. ∃s $o. ss = Es s $o

   [symMsg_one_one]  Theorem

      |- ∀a0 a1 a0' a1'. (Es a0 a1 = Es a0' a1') ⇔ (a0 = a0') ∧ (a1 = a1')


*)
end
