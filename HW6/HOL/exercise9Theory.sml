structure exercise9Theory :> exercise9Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading exercise9Theory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open indexedListsTheory patternMatchesTheory
  in end;
  val _ = Theory.link_parents
          ("exercise9",
          Arbnum.fromString "1551232270",
          Arbnum.fromString "100118")
          [("indexedLists",
           Arbnum.fromString "1503148856",
           Arbnum.fromString "404777"),
           ("patternMatches",
           Arbnum.fromString "1503148884",
           Arbnum.fromString "20925")];
  val _ = Theory.incorporate_types "exercise9" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "bool"), ID("bool", "!"), ID("min", "fun"), ID("bool", "/\\"),
   ID("min", "==>"), ID("bool", "\\/")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [2, 0, 0], TYOP [2, 1, 0], TYOP [2, 0, 1]]
  end
  val _ = Theory.incorporate_consts "exercise9" tyvector [];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("p", 0), TMV("q", 0), TMV("r", 0), TMV("s", 0), TMC(1, 2),
   TMC(3, 3), TMC(4, 3), TMC(5, 3)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op absorptionRule x = x
    val op absorptionRule =
    ThmBind.DT(((("exercise9",0),[]),[]),
               [ThmBind.read"%4%0%4%1%6%6$1@$0@2%6$1@%5$1@$0@3|@|@"])
  fun op constructiveDilemmaRule x = x
    val op constructiveDilemmaRule =
    ThmBind.DT(((("exercise9",1),[("bool",[25,51,62])]),["DISK_THM"]),
               [ThmBind.read"%4%0%4%1%4%2%4%3%6%5%6$3@$2@2%6$1@$0@3%6%7$3@$1@2%7$2@$0@3|@|@|@|@"])
  fun op absorptionRule2 x = x
    val op absorptionRule2 =
    ThmBind.DT(((("exercise9",2),
                [("bool",[25,26,46,47,52,53,62,70]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%4%0%4%1%6%6$1@$0@2%6$1@%5$1@$0@3|@|@"])
  fun op constructiveDilemmaRule2 x = x
    val op constructiveDilemmaRule2 =
    ThmBind.DT(((("exercise9",3),
                [("bool",[25,26,46,47,52,53,62,70]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%4%0%4%1%4%2%4%3%6%5%6$3@$2@2%6$1@$0@3%6%7$3@$1@2%7$2@$0@3|@|@|@|@"])

  val _ = DB.bindl "exercise9"
  [("absorptionRule",absorptionRule,DB.Thm),
   ("constructiveDilemmaRule",constructiveDilemmaRule,DB.Thm),
   ("absorptionRule2",absorptionRule2,DB.Thm),
   ("constructiveDilemmaRule2",constructiveDilemmaRule2,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val exercise9_grammars = merge_grammars ["indexedLists",
                                           "patternMatches"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="exercise9"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val exercise9_grammars = 
    Portable.## (addtyUDs,addtmUDs) exercise9_grammars
  val _ = Parse.grammarDB_insert("exercise9",exercise9_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "exercise9"
end
