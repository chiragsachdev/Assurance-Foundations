structure satListTheory :> satListTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading satListTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open aclDrulesTheory
  in end;
  val _ = Theory.link_parents
          ("satList",
          Arbnum.fromString "1556067497",
          Arbnum.fromString "862233")
          [("aclDrules",
           Arbnum.fromString "1534466515",
           Arbnum.fromString "648647")];
  val _ = Theory.incorporate_types "satList" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("list", "list"),
   ID("aclfoundation", "Form"), ID("pair", "prod"),
   ID("aclfoundation", "po"), ID("aclfoundation", "Kripke"),
   ID("bool", "!"), ID("pair", ","), ID("bool", "/\\"), ID("min", "="),
   ID("list", "APPEND"), ID("list", "CONS"), ID("list", "FOLDR"),
   ID("list", "MAP"), ID("list", "NIL"), ID("bool", "T"),
   ID("aclrules", "sat"), ID("satList", "satList")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYV "'Sec", TYV "'Int", TYV "'pName", TYV "'prop",
   TYOP [3, 4, 3, 2, 1], TYOP [2, 5], TYOP [0, 6, 0], TYOP [5, 1],
   TYOP [5, 2], TYOP [4, 9, 8], TYV "'world", TYOP [6, 4, 11, 3, 2, 1],
   TYOP [4, 12, 10], TYOP [0, 13, 7], TYOP [0, 5, 0], TYOP [0, 15, 0],
   TYOP [0, 12, 0], TYOP [0, 17, 0], TYOP [0, 7, 0], TYOP [0, 9, 0],
   TYOP [0, 20, 0], TYOP [0, 8, 0], TYOP [0, 22, 0], TYOP [0, 10, 13],
   TYOP [0, 12, 24], TYOP [0, 8, 10], TYOP [0, 9, 26], TYOP [0, 0, 0],
   TYOP [0, 0, 28], TYOP [0, 6, 6], TYOP [0, 6, 30], TYOP [0, 5, 30],
   TYOP [2, 0], TYOP [0, 33, 0], TYOP [0, 0, 34], TYOP [0, 29, 35],
   TYOP [0, 6, 33], TYOP [0, 15, 37], TYOP [0, 13, 15]]
  end
  val _ = Theory.incorporate_consts "satList" tyvector [("satList", 14)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 12), TMV("Oi", 9), TMV("Os", 8), TMV("f", 5),
   TMV("formList", 6), TMV("h", 5), TMV("l1", 6), TMV("l2", 6),
   TMV("t", 6), TMV("x", 0), TMV("y", 0), TMC(7, 16), TMC(7, 18),
   TMC(7, 19), TMC(7, 21), TMC(7, 23), TMC(8, 25), TMC(8, 27), TMC(9, 29),
   TMC(10, 29), TMC(11, 31), TMC(12, 32), TMC(13, 36), TMC(14, 38),
   TMC(15, 6), TMC(16, 0), TMC(17, 39), TMC(18, 14)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op satList_def x = x
    val op satList_def =
    ThmBind.DT(((("satList",0),[("pair",[16])]),["DISK_THM"]),
               [ThmBind.read"%12%0%14%1%15%2%13%4%19%27%16$3@%17$2@$1@3$0@2%22%9%10%18$1@$0@||@%25@%23%3%26%16$4@%17$3@$2@3$0@|@$0@3|@|@|@|@"])
  fun op satList_nil x = x
    val op satList_nil =
    ThmBind.DT(((("satList",1),
                [("bool",[25]),("list",[23,27]),
                 ("satList",[0])]),["DISK_THM"]),
               [ThmBind.read"%27%16%0@%17%1@%2@3%24@"])
  fun op satList_conj x = x
    val op satList_conj =
    ThmBind.DT(((("satList",2),
                [("bool",
                 [14,25,26,35,42,46,47,50,52,53,55,57,62,70,92,93,95]),
                 ("list",[20,23,27,43]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[0])]),["DISK_THM"]),
               [ThmBind.read"%13%6%13%7%12%0%14%1%15%2%19%18%27%16$2@%17$1@$0@3$4@2%27%16$2@%17$1@$0@3$3@3%27%16$2@%17$1@$0@3%20$4@$3@3|@|@|@|@|@"])
  fun op satList_CONS x = x
    val op satList_CONS =
    ThmBind.DT(((("satList",3),
                [("bool",[25,55]),("list",[23,27]),
                 ("satList",[0])]),["DISK_THM"]),
               [ThmBind.read"%11%5%13%8%12%0%14%1%15%2%19%27%16$2@%17$1@$0@3%21$4@$3@3%18%26%16$2@%17$1@$0@3$4@2%27%16$2@%17$1@$0@3$3@3|@|@|@|@|@"])

  val _ = DB.bindl "satList"
  [("satList_def",satList_def,DB.Def), ("satList_nil",satList_nil,DB.Thm),
   ("satList_conj",satList_conj,DB.Thm),
   ("satList_CONS",satList_CONS,DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "satList",
    thydataty = "compute",
    read = ThmBind.read,
    data = "satList.satList_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "satList",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "RMT7.satListG7.satListOCI0.IR540.H1.RK7.satListS1.0.XOO7.satList3.%27"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val satList_grammars = merge_grammars ["aclDrules"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="satList"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val satList_grammars = 
    Portable.## (addtyUDs,addtmUDs) satList_grammars
  val _ = Parse.grammarDB_insert("satList",satList_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "satList"
end
