structure hw5Theory :> hw5Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading hw5Theory ... " else ()
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
          ("hw5",Arbnum.fromString "1550633343",Arbnum.fromString "244375")
          [("indexedLists",
           Arbnum.fromString "1503148856",
           Arbnum.fromString "404777"),
           ("patternMatches",
           Arbnum.fromString "1503148884",
           Arbnum.fromString "20925")];
  val _ = Theory.incorporate_types "hw5" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "bool"), ID("bool", "!"), ID("min", "fun"), ID("bool", "/\\"),
   ID("min", "="), ID("min", "==>")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [2, 0, 0], TYOP [2, 1, 0], TYOP [2, 0, 1]]
  end
  val _ = Theory.incorporate_consts "hw5" tyvector [];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("p", 0), TMV("q", 0), TMV("r", 0), TMC(1, 2), TMC(3, 3), TMC(4, 3),
   TMC(5, 3)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op problem1Thm x = x
    val op problem1Thm =
    ThmBind.DT(((("hw5",0),[]),[]),
               [ThmBind.read"%6%6%1@%2@2%6%6%0@%1@2%6%6%1@%2@2%1@3",
                ThmBind.read"%0"])
  fun op conSymThm x = x
    val op conSymThm =
    ThmBind.DT(((("hw5",1),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%5%4%0@%1@2%4%1@%0@2"])
  fun op conSymThmAll x = x
    val op conSymThmAll =
    ThmBind.DT(((("hw5",2),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%3%0%3%1%5%4$1@$0@2%4$0@$1@2|@|@"])

  val _ = DB.bindl "hw5"
  [("problem1Thm",problem1Thm,DB.Thm), ("conSymThm",conSymThm,DB.Thm),
   ("conSymThmAll",conSymThmAll,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val hw5_grammars = merge_grammars ["indexedLists", "patternMatches"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="hw5"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val hw5_grammars = 
    Portable.## (addtyUDs,addtmUDs) hw5_grammars
  val _ = Parse.grammarDB_insert("hw5",hw5_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "hw5"
end
