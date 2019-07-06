structure SM0r3SolutionsTheory :> SM0r3SolutionsTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading SM0r3SolutionsTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open SM0r3Theory
  in end;
  val _ = Theory.link_parents
          ("SM0r3Solutions",
          Arbnum.fromString "1555472201",
          Arbnum.fromString "236746")
          [("SM0r3",
           Arbnum.fromString "1555472196",
           Arbnum.fromString "443119")];
  val _ = Theory.incorporate_types "SM0r3Solutions" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"), ID("aclfoundation", "Form"),
   ID("principal", "principal"), ID("ssm1", "inst"),
   ID("m0Types", "command"), ID("m0Types", "privcmd"),
   ID("m0Types", "npriv"), ID("certStructure", "certificate"),
   ID("aclfoundation", "Kripke"), ID("m0Types", "state"),
   ID("ssm1", "trType"), ID("aclfoundation", "po"),
   ID("m0Types", "output"), ID("bool", "!"), ID("min", "bool"),
   ID("pair", ","), ID("pair", "prod"), ID("bool", "/\\"), ID("num", "0"),
   ID("num", "num"), ID("min", "="), ID("min", "==>"),
   ID("list", "APPEND"), ID("principal", "Alice"),
   ID("principal", "staff"), ID("principal", "Bob"), ID("ssm1", "CFG"),
   ID("ssm1", "configuration"), ID("ssm1", "CFGInterpret"),
   ID("list", "CONS"), ID("principal", "Commander"),
   ID("principal", "role"), ID("list", "MAP"), ID("list", "NIL"),
   ID("ssm1", "NONE"), ID("aclfoundation", "Name"),
   ID("aclfoundation", "Princ"), ID("principal", "Operator"),
   ID("m0Types", "PR"), ID("principal", "Role"),
   ID("SM0", "SM0StateInterp"), ID("ssm1", "SOME"),
   ID("principal", "Staff"), ID("ssm1", "TR"), ID("principal", "ca"),
   ID("principal", "authority"), ID("SM0r3Solutions", "certificatesr3a"),
   ID("SM0", "certs"), ID("SM0r3Solutions", "certsr1a"),
   ID("SM0r3Solutions", "certsr2a"), ID("SM0r2", "certsr2root"),
   ID("SM0r2", "certsr2signed"), ID("SM0", "inputOK"),
   ID("SM0r1", "inputOKr1"), ID("SM0r1", "mapSM0inputOperatorBob"),
   ID("certStructure", "mkRCert"), ID("certStructure", "mkSCert"),
   ID("aclfoundation", "prop"), ID("aclfoundation", "quoting"),
   ID("aclfoundation", "reps"), ID("aclrules", "sat"),
   ID("aclfoundation", "says"), ID("ssm1", "trap")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'b", TYV "'a", TYOP [3], TYOP [5], TYOP [4, 3],
   TYOP [2, 4, 2, 1, 0], TYOP [1, 5], TYOP [0, 3, 6], TYOP [6],
   TYOP [0, 8, 7], TYOP [7], TYOP [0, 10, 9], TYV "'e", TYV "'d",
   TYOP [2, 4, 2, 13, 12], TYOP [1, 14], TYOP [0, 3, 15], TYOP [0, 8, 16],
   TYOP [0, 10, 17], TYOP [8, 1, 0], TYOP [1, 19], TYOP [0, 3, 20],
   TYOP [0, 8, 21], TYOP [0, 10, 22], TYOP [9, 4, 0, 2, 13, 12], TYOP [10],
   TYOP [11, 3], TYOP [0, 26, 25], TYOP [0, 25, 27], TYOP [12, 13],
   TYOP [12, 12], TYOP [13], TYOP [0, 26, 31], TYOP [0, 25, 32],
   TYOP [1, 31], TYOP [15], TYOP [0, 24, 35], TYOP [0, 36, 35],
   TYOP [0, 3, 35], TYOP [0, 38, 35], TYOP [0, 33, 35], TYOP [0, 40, 35],
   TYOP [0, 28, 35], TYOP [0, 42, 35], TYOP [0, 15, 35], TYOP [0, 44, 35],
   TYOP [0, 34, 35], TYOP [0, 46, 35], TYOP [0, 10, 35], TYOP [0, 48, 35],
   TYOP [0, 29, 35], TYOP [0, 50, 35], TYOP [0, 30, 35], TYOP [0, 52, 35],
   TYOP [0, 8, 35], TYOP [0, 54, 35], TYOP [0, 25, 35], TYOP [0, 56, 35],
   TYOP [17, 29, 30], TYOP [17, 24, 58], TYOP [0, 58, 59],
   TYOP [0, 24, 60], TYOP [0, 30, 58], TYOP [0, 29, 62], TYOP [0, 35, 35],
   TYOP [0, 35, 64], TYOP [20], TYOP [0, 6, 35], TYOP [0, 6, 67],
   TYOP [0, 15, 44], TYOP [0, 20, 35], TYOP [0, 20, 70], TYOP [0, 6, 6],
   TYOP [0, 6, 72], TYOP [0, 15, 15], TYOP [0, 15, 74], TYOP [0, 20, 20],
   TYOP [0, 20, 76], TYOP [25], TYOP [28, 3, 13, 12, 31, 2, 25],
   TYOP [0, 34, 79], TYOP [0, 25, 80], TYOP [0, 15, 81], TYOP [0, 15, 82],
   TYOP [0, 25, 14], TYOP [0, 84, 83], TYOP [0, 14, 35], TYOP [0, 86, 85],
   TYOP [0, 79, 35], TYOP [0, 59, 88], TYOP [0, 14, 74], TYOP [0, 34, 34],
   TYOP [0, 31, 91], TYOP [32], TYOP [0, 6, 20], TYOP [0, 5, 19],
   TYOP [0, 95, 94], TYOP [37, 2], TYOP [0, 2, 97], TYOP [0, 8, 3],
   TYOP [0, 93, 2], TYOP [0, 3, 4], TYOP [0, 78, 2], TYOP [0, 79, 88],
   TYOP [0, 26, 103], TYOP [0, 59, 104], TYOP [46], TYOP [0, 66, 106],
   TYOP [0, 8, 15], TYOP [0, 10, 108], TYOP [0, 8, 6], TYOP [0, 10, 110],
   TYOP [0, 14, 14], TYOP [0, 106, 95], TYOP [0, 4, 14], TYOP [0, 97, 97],
   TYOP [0, 97, 115], TYOP [0, 97, 112], TYOP [0, 97, 117],
   TYOP [0, 59, 86], TYOP [0, 3, 26]]
  end
  val _ = Theory.incorporate_consts "SM0r3Solutions" tyvector
     [("certsr2a", 11), ("certsr1a", 18), ("certificatesr3a", 23)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 24), TMV("NS", 28), TMV("Oi", 29), TMV("Os", 30),
   TMV("Out", 33), TMV("cmd", 3), TMV("ins", 15), TMV("npriv", 10),
   TMV("outs", 34), TMV("privcmd", 8), TMV("s", 25), TMC(14, 37),
   TMC(14, 39), TMC(14, 41), TMC(14, 43), TMC(14, 45), TMC(14, 47),
   TMC(14, 49), TMC(14, 51), TMC(14, 53), TMC(14, 55), TMC(14, 57),
   TMC(16, 61), TMC(16, 63), TMC(18, 65), TMC(19, 66), TMC(21, 65),
   TMC(21, 68), TMC(21, 69), TMC(21, 71), TMC(22, 65), TMC(23, 73),
   TMC(23, 75), TMC(23, 77), TMC(24, 78), TMC(26, 78), TMC(27, 87),
   TMC(29, 89), TMC(30, 90), TMC(30, 92), TMC(31, 93), TMC(33, 96),
   TMC(34, 15), TMC(35, 4), TMC(36, 98), TMC(38, 93), TMC(39, 99),
   TMC(40, 100), TMC(41, 84), TMC(42, 101), TMC(43, 102), TMC(44, 105),
   TMC(45, 107), TMC(47, 23), TMC(48, 109), TMC(49, 11), TMC(49, 18),
   TMC(50, 11), TMC(51, 111), TMC(52, 111), TMC(53, 86), TMC(54, 86),
   TMC(55, 112), TMC(56, 95), TMC(57, 113), TMC(58, 114), TMC(59, 116),
   TMC(60, 118), TMC(61, 119), TMC(62, 117), TMC(63, 120)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op certsr1a_def x = x
    val op certsr1a_def =
    ThmBind.DT(((("SM0r3Solutions",0),[]),[]),
               [ThmBind.read"%17%7%20%9%12%5%28%56$2@$1@$0@2%32%54$2@$1@2%38%67%44%50%34@3%44%47%40@3%65%49$0@4%38%67%44%50%35@3%44%47%45@3%65%49$0@4%42@4|@|@|@"])
  fun op certsr2a_def x = x
    val op certsr2a_def =
    ThmBind.DT(((("SM0r3Solutions",1),[]),[]),
               [ThmBind.read"%17%7%20%9%12%5%27%57$2@$1@$0@2%31%31%55$2@$1@$0@2%58$2@$1@3%59$2@$1@3|@|@|@"])
  fun op certificatesr3a_def x = x
    val op certificatesr3a_def =
    ThmBind.DT(((("SM0r3Solutions",2),[]),[]),
               [ThmBind.read"%17%7%20%9%12%5%29%53$2@$1@$0@2%33%41%63@%31%55$2@$1@$0@2%58$2@$1@4%41%64%52%25@3%59$2@$1@4|@|@|@"])
  fun op SM0_Commander_privcmd_trapped_lemma x = x
    val op SM0_Commander_privcmd_trapped_lemma =
    ThmBind.DT(((("SM0r3Solutions",3),
                [("SM0",[11,15]),("aclDrules",[3]),("aclrules",[23,63]),
                 ("bool",[25,26,46,47,50,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,3]),
                 ("ssm1",[52])]),["DISK_THM"]),
               [ThmBind.read"%30%37%22%0@%23%2@%3@3%36%60@%48@%54%7@%9@2%38%69%44%47%40@3%65%49%46%9@5%6@2%10@%8@3%68%22%0@%23%2@%3@3%65%43@3"])
  fun op SM0_Commander_trap_privcmd_justified_thm x = x
    val op SM0_Commander_trap_privcmd_justified_thm =
    ThmBind.DT(((("SM0r3Solutions",4),
                [("SM0",[11,15]),("aclDrules",[3]),("aclrules",[23,63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,63])]),["DISK_THM"]),
               [ThmBind.read"%14%1%13%4%11%0%18%2%19%3%26%51%22$2@%23$1@$0@3%70%46%9@3%36%60@%48@%54%7@%9@2%38%69%44%47%40@3%65%49%46%9@5%6@2%10@%8@2%36%60@%48@%54%7@%9@2%6@$4%10@%70%46%9@4%39$3%10@%70%46%9@4%8@4%24%60%69%44%47%40@3%65%49%46%9@6%24%37%22$2@%23$1@$0@3%36%60@%48@%54%7@%9@2%38%69%44%47%40@3%65%49%46%9@5%6@2%10@%8@3%68%22$2@%23$1@$0@3%65%43@5|@|@|@|@|@"])
  fun op SM0r1_mapSM0_Alice_Commander_trap_privcmd_lemma x = x
    val op SM0r1_mapSM0_Alice_Commander_trap_privcmd_lemma =
    ThmBind.DT(((("SM0r3Solutions",5),
                [("SM0",[15]),("SM0r1",[12]),("SM0r3Solutions",[0]),
                 ("aclDrules",[6]),("aclrules",[23]),
                 ("bool",[25,26,46,47,50,52,53,57,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm1",[52])]),["DISK_THM"]),
               [ThmBind.read"%30%37%22%0@%23%2@%3@3%36%61@%48@%56%7@%9@%46%9@3%38%62%69%44%47%40@3%65%49%46%9@6%6@2%10@%8@3%68%22%0@%23%2@%3@3%65%43@3"])
  fun op SM0r1_Commander_Alice_trap_privcmd_justified_thm x = x
    val op SM0r1_Commander_Alice_trap_privcmd_justified_thm =
    ThmBind.DT(((("SM0r3Solutions",6),
                [("SM0",[15]),("SM0r1",[12]),("SM0r3Solutions",[0]),
                 ("aclDrules",[6]),("aclrules",[23]),
                 ("bool",[25,26,35,46,47,50,52,53,57,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm1",[52,63])]),["DISK_THM"]),
               [ThmBind.read"%14%1%13%4%11%0%18%2%19%3%26%51%22$2@%23$1@$0@3%70%46%9@3%36%61@%48@%56%7@%9@%46%9@3%38%69%66%44%50%34@3%44%47%40@4%65%49%46%9@5%6@2%10@%8@2%36%61@%48@%56%7@%9@%46%9@3%6@$4%10@%70%46%9@4%39$3%10@%70%46%9@4%8@4%24%61%69%66%44%50%34@3%44%47%40@4%65%49%46%9@6%24%37%22$2@%23$1@$0@3%36%61@%48@%56%7@%9@%46%9@3%38%69%66%44%50%34@3%44%47%40@4%65%49%46%9@5%6@2%10@%8@3%68%22$2@%23$1@$0@3%65%43@5|@|@|@|@|@"])
  fun op SM0r1_Commander_mapSM0inputOperatorBob_trap_privcmd_justified_thm
    x = x
    val
    op SM0r1_Commander_mapSM0inputOperatorBob_trap_privcmd_justified_thm =
    ThmBind.DT(((("SM0r3Solutions",7),
                [("SM0",[15]),("SM0r1",[12]),("SM0r3Solutions",[0]),
                 ("aclDrules",[6]),("aclrules",[23]),
                 ("bool",[25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm1",[52,63])]),["DISK_THM"]),
               [ThmBind.read"%21%10%20%9%16%8%17%7%15%6%14%1%13%4%11%0%18%2%19%3%26%51%22$2@%23$1@$0@3%70%46$8@3%36%61@%48@%56$6@$8@%46$8@3%38%62%69%44%47%40@3%65%49%46$8@6$5@2$9@$7@2%36%61@%48@%56$6@$8@%46$8@3$5@$4$9@%70%46$8@4%39$3$9@%70%46$8@4$7@4%24%61%62%69%44%47%40@3%65%49%46$8@7%24%37%22$2@%23$1@$0@3%36%61@%48@%56$6@$8@%46$8@3%38%62%69%44%47%40@3%65%49%46$8@6$5@2$9@$7@3%68%22$2@%23$1@$0@3%65%43@5|@|@|@|@|@|@|@|@|@|@"])

  val _ = DB.bindl "SM0r3Solutions"
  [("certsr1a_def",certsr1a_def,DB.Def),
   ("certsr2a_def",certsr2a_def,DB.Def),
   ("certificatesr3a_def",certificatesr3a_def,DB.Def),
   ("SM0_Commander_privcmd_trapped_lemma",
    SM0_Commander_privcmd_trapped_lemma,
    DB.Thm),
   ("SM0_Commander_trap_privcmd_justified_thm",
    SM0_Commander_trap_privcmd_justified_thm,
    DB.Thm),
   ("SM0r1_mapSM0_Alice_Commander_trap_privcmd_lemma",
    SM0r1_mapSM0_Alice_Commander_trap_privcmd_lemma,
    DB.Thm),
   ("SM0r1_Commander_Alice_trap_privcmd_justified_thm",
    SM0r1_Commander_Alice_trap_privcmd_justified_thm,
    DB.Thm),
   ("SM0r1_Commander_mapSM0inputOperatorBob_trap_privcmd_justified_thm",
    SM0r1_Commander_mapSM0inputOperatorBob_trap_privcmd_justified_thm,
    DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0r3Solutions",
    thydataty = "compute",
    read = ThmBind.read,
    data =
        "SM0r3Solutions.certsr1a_def SM0r3Solutions.certsr2a_def SM0r3Solutions.certificatesr3a_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0r3Solutions",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data = "OO8.certsr1a3.%56OO8.certsr2a3.%57OO15.certificatesr3a3.%53"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val SM0r3Solutions_grammars = merge_grammars ["SM0r3"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="SM0r3Solutions"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val SM0r3Solutions_grammars = 
    Portable.## (addtyUDs,addtmUDs) SM0r3Solutions_grammars
  val _ = Parse.grammarDB_insert("SM0r3Solutions",SM0r3Solutions_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "SM0r3Solutions"
end
