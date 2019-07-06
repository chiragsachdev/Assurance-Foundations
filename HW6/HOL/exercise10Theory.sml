structure exercise10Theory :> exercise10Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading exercise10Theory ... " else ()
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
          ("exercise10",
          Arbnum.fromString "1551232270",
          Arbnum.fromString "148913")
          [("indexedLists",
           Arbnum.fromString "1503148856",
           Arbnum.fromString "404777"),
           ("patternMatches",
           Arbnum.fromString "1503148884",
           Arbnum.fromString "20925")];
  val _ = Theory.incorporate_types "exercise10" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("bool", "!"), ID("bool", "/\\"),
   ID("min", "==>"), ID("bool", "\\/"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYV "'a", TYOP [0, 1, 0], TYOP [0, 2, 0], TYOP [0, 0, 0],
   TYOP [0, 0, 4]]
  end
  val _ = Theory.incorporate_consts "exercise10" tyvector [];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 2), TMV("P", 2), TMV("p", 0), TMV("q", 0), TMV("r", 0),
   TMV("s", 1), TMV("s", 0), TMV("x", 1), TMC(2, 3), TMC(3, 5), TMC(4, 5),
   TMC(5, 5), TMC(6, 4)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op problem1_thm x = x
    val op problem1_thm =
    ThmBind.DT(((("exercise10",0),[]),[]),
               [ThmBind.read"%0%5@", ThmBind.read"%1%5@",
                ThmBind.read"%8%7%10%1$0@2%0$0@2|@"])
  fun op problem2_thm x = x
    val op problem2_thm =
    ThmBind.DT(((("exercise10",1),[("bool",[27,47])]),["DISK_THM"]),
               [ThmBind.read"%10%2@%12%3@2", ThmBind.read"%12%6@",
                ThmBind.read"%10%4@%6@", ThmBind.read"%10%9%2@%3@2%4@"])
  fun op problem3_thm x = x
    val op problem3_thm =
    ThmBind.DT(((("exercise10",2),
                [("bool",[25,27,29,53,62,93,95])]),["DISK_THM"]),
               [ThmBind.read"%11%4@%6@", ThmBind.read"%12%9%2@%3@2",
                ThmBind.read"%10%12%2@2%4@", ThmBind.read"%10%12%3@2%6@"])

  val _ = DB.bindl "exercise10"
  [("problem1_thm",problem1_thm,DB.Thm),
   ("problem2_thm",problem2_thm,DB.Thm),
   ("problem3_thm",problem3_thm,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val exercise10_grammars = merge_grammars ["indexedLists",
                                            "patternMatches"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="exercise10"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val exercise10_grammars = 
    Portable.## (addtyUDs,addtmUDs) exercise10_grammars
  val _ = Parse.grammarDB_insert("exercise10",exercise10_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "exercise10"
end
