signature certStructureTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val certificateInterpret_primitive_def : thm
    val certificate_TY_DEF : thm
    val certificate_case_def : thm
    val certificate_size_def : thm
    val checkcert_primitive_def : thm
    val mkRCert_def : thm
    val mkSCert_def : thm

  (*  Theorems  *)
    val MAP_certificateInterpret_mkRCert_thm : thm
    val MAP_certificateInterpret_mkSCert_thm : thm
    val certificateInterpretRCert_thm : thm
    val certificateInterpretSCert_thm : thm
    val certificateInterpret_def : thm
    val certificateInterpret_ind : thm
    val certificateInterpret_mkRCert_thm : thm
    val certificateInterpret_mkSCert_thm : thm
    val certificate_11 : thm
    val certificate_Axiom : thm
    val certificate_case_cong : thm
    val certificate_distinct : thm
    val certificate_distinct_thm : thm
    val certificate_induction : thm
    val certificate_nchotomy : thm
    val certificate_one_one : thm
    val checkcert_def : thm
    val checkcert_ind : thm
    val datatype_certificate : thm

  val certStructure_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [m0Types] Parent theory of "certStructure"

   [principal] Parent theory of "certStructure"

   [ssm1] Parent theory of "certStructure"

   [certificateInterpret_primitive_def]  Definition

      |- certificateInterpret =
         WFREC (@R. WF R)
           (λcertificateInterpret a.
              case a of
                RCert formula =>
                  I (if checkcert (RCert formula) then formula else TT)
              | SCert (Staff v4) formula' signature => ARB
              | SCert (Authority v6) formula' signature => ARB
              | SCert (Role v8) formula' signature => ARB
              | SCert (KeyS v10) formula' signature => ARB
              | SCert (KeyA (pubK auth)) formula' signature =>
                  I
                    (if
                       checkcert
                         (SCert (KeyA (pubK auth)) formula' signature)
                     then
                       formula'
                     else TT)
              | SCert (KeyA (privK v24)) formula' signature => ARB
              | SCert (Machine v13) formula' signature => ARB)

   [certificate_TY_DEF]  Definition

      |- ∃rep.
           TYPE_DEFINITION
             (λa0'.
                ∀'certificate' .
                  (∀a0'.
                     (∃a.
                        a0' =
                        (λa.
                           ind_type$CONSTR 0 (a,ARB,ARB)
                             (λn. ind_type$BOTTOM)) a) ∨
                     (∃a0 a1 a2.
                        a0' =
                        (λa0 a1 a2.
                           ind_type$CONSTR (SUC 0) (a1,a0,a2)
                             (λn. ind_type$BOTTOM)) a0 a1 a2) ⇒
                     'certificate' a0') ⇒
                  'certificate' a0') rep

   [certificate_case_def]  Definition

      |- (∀a f f1. certificate_CASE (RCert a) f f1 = f a) ∧
         ∀a0 a1 a2 f f1.
           certificate_CASE (SCert a0 a1 a2) f f1 = f1 a0 a1 a2

   [certificate_size_def]  Definition

      |- (∀f f1 a.
            certificate_size f f1 (RCert a) =
            1 + Form_size (inst_size command_size) principal_size f f1 a) ∧
         ∀f f1 a0 a1 a2.
           certificate_size f f1 (SCert a0 a1 a2) =
           1 +
           (principal_size a0 +
            (Form_size (inst_size command_size) principal_size f f1 a1 +
             asymMsg_size
               (digest_size
                  (Form_size (inst_size command_size) principal_size f f1))
               authority_size a2))

   [checkcert_primitive_def]  Definition

      |- checkcert =
         WFREC (@R. WF R)
           (λcheckcert a.
              case a of
                RCert formula => I T
              | SCert (Staff v4) formula' signature => ARB
              | SCert (Authority v6) formula' signature => ARB
              | SCert (Role v8) formula' signature => ARB
              | SCert (KeyS v10) formula' signature => ARB
              | SCert (KeyA (pubK auth)) formula' signature =>
                  I (signVerify (pubK auth) signature (SOME formula'))
              | SCert (KeyA (privK v24)) formula' signature => ARB
              | SCert (Machine v13) formula' signature => ARB)

   [mkRCert_def]  Definition

      |- ∀formula. mkRCert formula = RCert formula

   [mkSCert_def]  Definition

      |- ∀auth formula.
           mkSCert auth formula =
           SCert (KeyA (pubK auth)) formula
             (sign (privK auth) (hash (SOME formula)))

   [MAP_certificateInterpret_mkRCert_thm]  Theorem

      |- ∀formList.
           MAP certificateInterpret (MAP mkRCert formList) = formList

   [MAP_certificateInterpret_mkSCert_thm]  Theorem

      |- ∀formList auth.
           MAP certificateInterpret (MAP (mkSCert auth) formList) =
           formList

   [certificateInterpretRCert_thm]  Theorem

      |- ∀formula. certificateInterpret (RCert formula) = formula

   [certificateInterpretSCert_thm]  Theorem

      |- ∀formula auth.
           certificateInterpret
             (SCert (KeyA (pubK auth)) formula
                (sign (privK auth) (hash (SOME formula)))) =
           formula

   [certificateInterpret_def]  Theorem

      |- (certificateInterpret (RCert formula) =
          if checkcert (RCert formula) then formula else TT) ∧
         (certificateInterpret
            (SCert (KeyA (pubK auth)) formula signature) =
          if checkcert (SCert (KeyA (pubK auth)) formula signature) then
            formula
          else TT)

   [certificateInterpret_ind]  Theorem

      |- ∀P.
           (∀formula. P (RCert formula)) ∧
           (∀auth formula signature.
              P (SCert (KeyA (pubK auth)) formula signature)) ∧
           (∀v5 v15 v16. P (SCert (Staff v5) v15 v16)) ∧
           (∀v7 v17 v18. P (SCert (Authority v7) v17 v18)) ∧
           (∀v9 v19 v20. P (SCert (Role v9) v19 v20)) ∧
           (∀v11 v21 v22. P (SCert (KeyS v11) v21 v22)) ∧
           (∀v25 v26 v27. P (SCert (KeyA (privK v25)) v26 v27)) ∧
           (∀v14 v28 v29. P (SCert (Machine v14) v28 v29)) ⇒
           ∀v. P v

   [certificateInterpret_mkRCert_thm]  Theorem

      |- ∀formula. certificateInterpret (mkRCert formula) = formula

   [certificateInterpret_mkSCert_thm]  Theorem

      |- ∀formula auth.
           certificateInterpret (mkSCert auth formula) = formula

   [certificate_11]  Theorem

      |- (∀a a'. (RCert a = RCert a') ⇔ (a = a')) ∧
         ∀a0 a1 a2 a0' a1' a2'.
           (SCert a0 a1 a2 = SCert a0' a1' a2') ⇔
           (a0 = a0') ∧ (a1 = a1') ∧ (a2 = a2')

   [certificate_Axiom]  Theorem

      |- ∀f0 f1.
           ∃fn.
             (∀a. fn (RCert a) = f0 a) ∧
             ∀a0 a1 a2. fn (SCert a0 a1 a2) = f1 a0 a1 a2

   [certificate_case_cong]  Theorem

      |- ∀M M' f f1.
           (M = M') ∧ (∀a. (M' = RCert a) ⇒ (f a = f' a)) ∧
           (∀a0 a1 a2.
              (M' = SCert a0 a1 a2) ⇒ (f1 a0 a1 a2 = f1' a0 a1 a2)) ⇒
           (certificate_CASE M f f1 = certificate_CASE M' f' f1')

   [certificate_distinct]  Theorem

      |- ∀a2 a1 a0 a. RCert a ≠ SCert a0 a1 a2

   [certificate_distinct_thm]  Theorem

      |- ∀a2 a1 a0 a. RCert a ≠ SCert a0 a1 a2

   [certificate_induction]  Theorem

      |- ∀P. (∀F. P (RCert F)) ∧ (∀p F a. P (SCert p F a)) ⇒ ∀c. P c

   [certificate_nchotomy]  Theorem

      |- ∀cc. (∃F. cc = RCert F) ∨ ∃p F a. cc = SCert p F a

   [certificate_one_one]  Theorem

      |- (∀a a'. (RCert a = RCert a') ⇔ (a = a')) ∧
         ∀a0 a1 a2 a0' a1' a2'.
           (SCert a0 a1 a2 = SCert a0' a1' a2') ⇔
           (a0 = a0') ∧ (a1 = a1') ∧ (a2 = a2')

   [checkcert_def]  Theorem

      |- (checkcert (RCert formula) ⇔ T) ∧
         (checkcert (SCert (KeyA (pubK auth)) formula signature) ⇔
          signVerify (pubK auth) signature (SOME formula))

   [checkcert_ind]  Theorem

      |- ∀P.
           (∀formula. P (RCert formula)) ∧
           (∀auth formula signature.
              P (SCert (KeyA (pubK auth)) formula signature)) ∧
           (∀v5 v15 v16. P (SCert (Staff v5) v15 v16)) ∧
           (∀v7 v17 v18. P (SCert (Authority v7) v17 v18)) ∧
           (∀v9 v19 v20. P (SCert (Role v9) v19 v20)) ∧
           (∀v11 v21 v22. P (SCert (KeyS v11) v21 v22)) ∧
           (∀v25 v26 v27. P (SCert (KeyA (privK v25)) v26 v27)) ∧
           (∀v14 v28 v29. P (SCert (Machine v14) v28 v29)) ⇒
           ∀v. P v

   [datatype_certificate]  Theorem

      |- DATATYPE (certificate RCert SCert)


*)
end
