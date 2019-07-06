structure solutions1Theory :> solutions1Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading solutions1Theory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open example1Theory
  in end;
  val _ = Theory.link_parents
          ("solutions1",
          Arbnum.fromString "1553033132",
          Arbnum.fromString "794835")
          [("example1",
           Arbnum.fromString "1553033126",
           Arbnum.fromString "662190")];
  val _ = Theory.incorporate_types "solutions1" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("aclfoundation", "Kripke"), ID("example1", "staff"),
   ID("example1", "commands"), ID("aclfoundation", "po"), ID("pair", ","),
   ID("min", "fun"), ID("pair", "prod"), ID("min", "==>"),
   ID("min", "bool"), ID("example1", "Alice"), ID("example1", "Bob"),
   ID("aclfoundation", "Name"), ID("aclfoundation", "Princ"),
   ID("aclfoundation", "controls"), ID("aclfoundation", "Form"),
   ID("example1", "go"), ID("aclfoundation", "impf"),
   ID("example1", "launch"), ID("aclfoundation", "meet"),
   ID("aclfoundation", "prop"), ID("aclrules", "sat"),
   ID("aclfoundation", "says")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'e", TYV "'d", TYOP [1], TYV "'b", TYOP [2],
   TYOP [0, 4, 3, 2, 1, 0], TYOP [3, 1], TYOP [3, 0], TYOP [6, 6, 7],
   TYOP [6, 5, 8], TYOP [5, 8, 9], TYOP [5, 5, 10], TYOP [5, 7, 8],
   TYOP [5, 6, 12], TYOP [8], TYOP [5, 14, 14], TYOP [5, 14, 15],
   TYOP [12, 2], TYOP [5, 2, 17], TYOP [14, 4, 2, 1, 0], TYOP [5, 19, 19],
   TYOP [5, 17, 20], TYOP [5, 19, 20], TYOP [5, 17, 17], TYOP [5, 17, 23],
   TYOP [5, 4, 19], TYOP [5, 19, 14], TYOP [5, 9, 26]]
  end
  val _ = Theory.incorporate_consts "solutions1" tyvector [];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 5), TMV("Oi", 6), TMV("Os", 7), TMC(4, 11), TMC(4, 13),
   TMC(7, 16), TMC(9, 2), TMC(10, 2), TMC(11, 18), TMC(13, 21), TMC(15, 4),
   TMC(16, 22), TMC(17, 4), TMC(18, 24), TMC(19, 25), TMC(20, 27),
   TMC(21, 21)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op aclExercise1 x = x
    val op aclExercise1 =
    ThmBind.DT(((("solutions1",0),
                [("aclDrules",[7]),("aclrules",[62]),
                 ("bool",[57])]),["DISK_THM"]),
               [ThmBind.read"%5%15%3%0@%4%1@%2@3%16%8%6@2%14%10@4%5%15%3%0@%4%1@%2@3%16%8%7@2%14%10@4%15%3%0@%4%1@%2@3%16%13%8%6@2%8%7@3%14%10@5"])
  fun op aclExercise1A x = x
    val op aclExercise1A =
    ThmBind.DT(((("solutions1",1),
                [("aclDrules",[7]),("aclrules",[62]),
                 ("bool",[25,26,46,47,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%5%15%3%0@%4%1@%2@3%16%8%6@2%14%10@4%5%15%3%0@%4%1@%2@3%16%8%7@2%14%10@4%15%3%0@%4%1@%2@3%16%13%8%6@2%8%7@3%14%10@5"])
  fun op aclExercise1B x = x
    val op aclExercise1B =
    ThmBind.DT(((("solutions1",2),
                [("aclDrules",[7]),("aclrules",[62]),
                 ("bool",[25,26,46,47,52,53,57,62]),
                 ("sat",[1,3,5,6,7,11,14,15])]),["DISK_THM"]),
               [ThmBind.read"%5%15%3%0@%4%1@%2@3%16%8%6@2%14%10@4%5%15%3%0@%4%1@%2@3%16%8%7@2%14%10@4%15%3%0@%4%1@%2@3%16%13%8%6@2%8%7@3%14%10@5"])
  fun op aclExercise2 x = x
    val op aclExercise2 =
    ThmBind.DT(((("solutions1",3),
                [("aclDrules",[3]),("aclrules",[23,24])]),["DISK_THM"]),
               [ThmBind.read"%5%15%3%0@%4%1@%2@3%16%8%6@2%14%10@4%5%15%3%0@%4%1@%2@3%9%8%6@2%14%10@4%5%15%3%0@%4%1@%2@3%11%14%10@2%14%12@4%15%3%0@%4%1@%2@3%16%8%7@2%14%12@6"])
  fun op aclExercise2A x = x
    val op aclExercise2A =
    ThmBind.DT(((("solutions1",4),
                [("aclDrules",[3]),("aclrules",[23,24]),
                 ("bool",[25,26,46,47,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%5%15%3%0@%4%1@%2@3%16%8%6@2%14%10@4%5%15%3%0@%4%1@%2@3%9%8%6@2%14%10@4%5%15%3%0@%4%1@%2@3%11%14%10@2%14%12@4%15%3%0@%4%1@%2@3%16%8%7@2%14%12@6"])
  fun op aclExercise2B x = x
    val op aclExercise2B =
    ThmBind.DT(((("solutions1",5),
                [("aclDrules",[3]),("aclrules",[23,24]),
                 ("bool",[25,26,46,47,52,53,62]),
                 ("sat",[1,3,5,6,7,11,14,15])]),["DISK_THM"]),
               [ThmBind.read"%5%15%3%0@%4%1@%2@3%16%8%6@2%14%10@4%5%15%3%0@%4%1@%2@3%9%8%6@2%14%10@4%5%15%3%0@%4%1@%2@3%11%14%10@2%14%12@4%15%3%0@%4%1@%2@3%16%8%7@2%14%12@6"])

  val _ = DB.bindl "solutions1"
  [("aclExercise1",aclExercise1,DB.Thm),
   ("aclExercise1A",aclExercise1A,DB.Thm),
   ("aclExercise1B",aclExercise1B,DB.Thm),
   ("aclExercise2",aclExercise2,DB.Thm),
   ("aclExercise2A",aclExercise2A,DB.Thm),
   ("aclExercise2B",aclExercise2B,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val solutions1_grammars = merge_grammars ["example1"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="solutions1"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val solutions1_grammars = 
    Portable.## (addtyUDs,addtmUDs) solutions1_grammars
  val _ = Parse.grammarDB_insert("solutions1",solutions1_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "solutions1"
end
