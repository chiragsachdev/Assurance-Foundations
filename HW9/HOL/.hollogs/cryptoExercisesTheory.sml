<<HOL message: Created theory "cryptoExercises">>
Saved theorem _____ "exercise15_6_1a_thm"
Saved theorem _____ "exercise15_6_1b_thm"
Saved theorem _____ "exercise15_6_2a_thm"
Saved theorem _____ "exercise15_6_2b_thm"
Saved theorem _____ "exercise15_6_3_thm"
Exporting theory "cryptoExercises" ... done.
Theory "cryptoExercises" took 0.87790s to build
Theory: cryptoExercises

Parents:
    cipher
    string

Theorems:
    exercise15_6_1a_thm
      |- ∀key enMsg message.
           (deciphS key enMsg = SOME message) ⇔
           (enMsg = Es key (SOME message))
    exercise15_6_1b_thm
      |- ∀keyAlice k text.
           (deciphS keyAlice (Es k (SOME text)) =
            SOME "This is from Alice") ⇔
           (k = keyAlice) ∧ (text = "This is from Alice")
    exercise15_6_2a_thm
      |- ∀P message.
           (deciphP (pubK P) enMsg = SOME message) ⇔
           (enMsg = Ea (privK P) (SOME message))
    exercise15_6_2b_thm
      |- ∀key text.
           (deciphP (pubK Alice) (Ea key (SOME text)) =
            SOME "This is from Alice") ⇔
           (key = privK Alice) ∧ (text = "This is from Alice")
    exercise15_6_3_thm
      |- ∀signature.
           signVerify (pubK Alice) signature
             (SOME "This is from Alice") ⇔
           (signature =
            sign (privK Alice) (hash (SOME "This is from Alice")))
Completed load of cryptoExercisesScript
