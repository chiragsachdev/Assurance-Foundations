structure cryptoExercisesTheory :> cryptoExercisesTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading cryptoExercisesTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open cipherTheory stringTheory
  in end;
  val _ = Theory.link_parents
          ("cryptoExercises",
          Arbnum.fromString "1553655652",
          Arbnum.fromString "280082")
          [("cipher",
           Arbnum.fromString "1553655648",
           Arbnum.fromString "659030"),
           ("string",
           Arbnum.fromString "1503148899",
           Arbnum.fromString "21753")];
  val _ = Theory.incorporate_types "cryptoExercises" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("cipher", "asymMsg"), ID("cipher", "symMsg"), ID("cipher", "symKey"),
   ID("cipher", "pKey"), ID("cipher", "digest"), ID("list", "list"),
   ID("string", "char"), ID("bool", "!"), ID("min", "fun"),
   ID("min", "bool"), ID("bool", "/\\"), ID("min", "="),
   ID("option", "option"), ID("arithmetic", "BIT1"), ID("num", "num"),
   ID("arithmetic", "BIT2"), ID("string", "CHR"), ID("list", "CONS"),
   ID("cipher", "Ea"), ID("cipher", "Es"), ID("list", "NIL"),
   ID("arithmetic", "NUMERAL"), ID("option", "SOME"),
   ID("arithmetic", "ZERO"), ID("cipher", "deciphP"),
   ID("cipher", "deciphS"), ID("cipher", "hash"), ID("cipher", "privK"),
   ID("cipher", "pubK"), ID("cipher", "sign"), ID("cipher", "signVerify")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'a", TYV "'b", TYOP [0, 1, 0], TYOP [1, 0], TYOP [2], TYOP [3, 0],
   TYOP [6], TYOP [5, 6], TYOP [4, 7], TYOP [0, 8, 0], TYOP [9],
   TYOP [8, 0, 10], TYOP [8, 11, 10], TYOP [8, 1, 10], TYOP [8, 13, 10],
   TYOP [8, 9, 10], TYOP [8, 15, 10], TYOP [8, 7, 10], TYOP [8, 17, 10],
   TYOP [8, 5, 10], TYOP [8, 19, 10], TYOP [8, 4, 10], TYOP [8, 21, 10],
   TYOP [8, 3, 10], TYOP [8, 23, 10], TYOP [8, 10, 10], TYOP [8, 10, 25],
   TYOP [8, 2, 10], TYOP [8, 2, 27], TYOP [8, 9, 15], TYOP [8, 7, 17],
   TYOP [12, 0], TYOP [8, 31, 10], TYOP [8, 31, 32], TYOP [12, 1],
   TYOP [8, 34, 10], TYOP [8, 34, 35], TYOP [12, 7], TYOP [8, 37, 10],
   TYOP [8, 37, 38], TYOP [8, 5, 19], TYOP [8, 4, 21], TYOP [8, 3, 23],
   TYOP [14], TYOP [8, 43, 43], TYOP [8, 43, 6], TYOP [8, 7, 7],
   TYOP [8, 6, 46], TYOP [8, 34, 2], TYOP [8, 5, 48], TYOP [0, 7, 0],
   TYOP [8, 37, 50], TYOP [8, 5, 51], TYOP [8, 31, 3], TYOP [8, 4, 53],
   TYOP [1, 7], TYOP [8, 37, 55], TYOP [8, 4, 56], TYOP [8, 0, 31],
   TYOP [8, 1, 34], TYOP [8, 7, 37], TYOP [8, 2, 34], TYOP [8, 5, 61],
   TYOP [8, 50, 37], TYOP [8, 5, 63], TYOP [8, 3, 31], TYOP [8, 4, 65],
   TYOP [8, 55, 37], TYOP [8, 4, 67], TYOP [8, 37, 8], TYOP [8, 0, 5],
   TYOP [8, 8, 9], TYOP [8, 5, 71], TYOP [8, 9, 38], TYOP [8, 5, 73]]
  end
  val _ = Theory.incorporate_consts "cryptoExercises" tyvector [];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("Alice", 0), TMV("P", 0), TMV("enMsg", 2), TMV("enMsg", 3),
   TMV("k", 4), TMV("key", 5), TMV("key", 4), TMV("keyAlice", 4),
   TMV("message", 0), TMV("message", 1), TMV("signature", 9),
   TMV("text", 7), TMC(7, 12), TMC(7, 14), TMC(7, 16), TMC(7, 18),
   TMC(7, 20), TMC(7, 22), TMC(7, 24), TMC(10, 26), TMC(11, 28),
   TMC(11, 29), TMC(11, 26), TMC(11, 30), TMC(11, 33), TMC(11, 36),
   TMC(11, 39), TMC(11, 40), TMC(11, 41), TMC(11, 42), TMC(13, 44),
   TMC(15, 44), TMC(16, 45), TMC(17, 47), TMC(18, 49), TMC(18, 52),
   TMC(19, 54), TMC(19, 57), TMC(20, 7), TMC(21, 44), TMC(22, 58),
   TMC(22, 59), TMC(22, 60), TMC(23, 43), TMC(24, 62), TMC(24, 64),
   TMC(25, 66), TMC(25, 68), TMC(26, 69), TMC(27, 70), TMC(28, 70),
   TMC(29, 72), TMC(30, 74)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op exercise15_6_1a_thm x = x
    val op exercise15_6_1a_thm =
    ThmBind.DT(((("cryptoExercises",0),
                [("bool",[25,26,46,47,52,53,62,70,93]),("cipher",[85]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%17%6%18%3%12%8%22%24%46$2@$1@2%40$0@3%29$1@%36$2@%40$0@4|@|@|@"])
  fun op exercise15_6_1b_thm x = x
    val op exercise15_6_1b_thm =
    ThmBind.DT(((("cryptoExercises",1),
                [("bool",
                 [13,25,26,27,29,46,47,50,51,52,53,55,62,70,92,93,95]),
                 ("cipher",[85]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%17%7%17%4%15%11%22%26%47$2@%37$1@%42$0@4%42%33%32%39%31%30%31%30%31%30%43@9%33%32%39%31%30%30%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%31%31%31%30%30%31%43@9%33%32%39%31%31%30%30%31%31%43@9%33%32%39%30%30%30%30%31%31%43@9%33%32%39%30%31%31%31%30%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%30%30%30%43@9%33%32%39%31%30%31%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%30%31%43@9%33%32%39%30%31%31%30%30%31%43@9%38@21%19%28$1@$2@2%23$0@%33%32%39%31%30%31%30%31%30%43@9%33%32%39%31%30%30%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%31%31%31%30%30%31%43@9%33%32%39%31%31%30%30%31%31%43@9%33%32%39%30%30%30%30%31%31%43@9%33%32%39%30%31%31%31%30%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%30%30%30%43@9%33%32%39%31%30%31%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%30%31%43@9%33%32%39%30%31%31%30%30%31%43@9%38@21|@|@|@"])
  fun op exercise15_6_2a_thm x = x
    val op exercise15_6_2a_thm =
    ThmBind.DT(((("cryptoExercises",2),
                [("bool",[25,26,46,47,52,53,62,70,93]),("cipher",[86]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%12%1%13%9%22%25%44%50$1@2%2@2%41$0@3%20%2@%34%49$1@2%41$0@4|@|@"])
  fun op exercise15_6_2b_thm x = x
    val op exercise15_6_2b_thm =
    ThmBind.DT(((("cryptoExercises",3),
                [("bool",
                 [13,25,26,27,29,46,47,50,51,52,53,55,62,70,92,93,95]),
                 ("cipher",[86]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%16%5%15%11%22%26%45%50%0@2%35$1@%42$0@4%42%33%32%39%31%30%31%30%31%30%43@9%33%32%39%31%30%30%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%31%31%31%30%30%31%43@9%33%32%39%31%31%30%30%31%31%43@9%33%32%39%30%30%30%30%31%31%43@9%33%32%39%30%31%31%31%30%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%30%30%30%43@9%33%32%39%31%30%31%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%30%31%43@9%33%32%39%30%31%31%30%30%31%43@9%38@21%19%27$1@%49%0@3%23$0@%33%32%39%31%30%31%30%31%30%43@9%33%32%39%31%30%30%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%31%31%31%30%30%31%43@9%33%32%39%31%31%30%30%31%31%43@9%33%32%39%30%30%30%30%31%31%43@9%33%32%39%30%31%31%31%30%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%30%30%30%43@9%33%32%39%31%30%31%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%30%31%43@9%33%32%39%30%31%31%30%30%31%43@9%38@21|@|@"])
  fun op exercise15_6_3_thm x = x
    val op exercise15_6_3_thm =
    ThmBind.DT(((("cryptoExercises",4),
                [("bool",[25,26,46,47,52,53,62,70,93]),("cipher",[87]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%14%10%22%52%50%0@2$0@%42%33%32%39%31%30%31%30%31%30%43@9%33%32%39%31%30%30%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%31%31%31%30%30%31%43@9%33%32%39%31%31%30%30%31%31%43@9%33%32%39%30%30%30%30%31%31%43@9%33%32%39%30%31%31%31%30%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%30%30%30%43@9%33%32%39%31%30%31%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%30%31%43@9%33%32%39%30%31%31%30%30%31%43@9%38@21%21$0@%51%49%0@2%48%42%33%32%39%31%30%31%30%31%30%43@9%33%32%39%31%30%30%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%31%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%31%31%31%30%30%31%43@9%33%32%39%31%31%30%30%31%31%43@9%33%32%39%30%30%30%30%31%31%43@9%33%32%39%30%31%31%31%30%31%43@9%33%32%39%31%30%30%30%30%43@8%33%32%39%30%31%30%30%30%30%43@9%33%32%39%31%30%31%31%30%31%43@9%33%32%39%30%31%30%31%30%31%43@9%33%32%39%30%30%31%30%30%31%43@9%33%32%39%30%31%31%30%30%31%43@9%38@23|@"])

  val _ = DB.bindl "cryptoExercises"
  [("exercise15_6_1a_thm",exercise15_6_1a_thm,DB.Thm),
   ("exercise15_6_1b_thm",exercise15_6_1b_thm,DB.Thm),
   ("exercise15_6_2a_thm",exercise15_6_2a_thm,DB.Thm),
   ("exercise15_6_2b_thm",exercise15_6_2b_thm,DB.Thm),
   ("exercise15_6_3_thm",exercise15_6_3_thm,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val cryptoExercises_grammars = merge_grammars ["cipher", "string"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="cryptoExercises"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val cryptoExercises_grammars = 
    Portable.## (addtyUDs,addtmUDs) cryptoExercises_grammars
  val _ = Parse.grammarDB_insert("cryptoExercises",cryptoExercises_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "cryptoExercises"
end
