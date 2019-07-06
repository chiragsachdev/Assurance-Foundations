structure SM0r3Theory :> SM0r3Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading SM0r3Theory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open SM0r2Theory certStructureTheory inMsgTheory
  in end;
  val _ = Theory.link_parents
          ("SM0r3",
          Arbnum.fromString "1555472196",
          Arbnum.fromString "443119")
          [("inMsg",
           Arbnum.fromString "1555472148",
           Arbnum.fromString "640734"),
           ("certStructure",
           Arbnum.fromString "1555472147",
           Arbnum.fromString "557690"),
           ("SM0r2",
           Arbnum.fromString "1555472173",
           Arbnum.fromString "751598")];
  val _ = Theory.incorporate_types "SM0r3" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("list", "list"),
   ID("certStructure", "certificate"), ID("m0Types", "privcmd"),
   ID("m0Types", "npriv"), ID("aclfoundation", "Kripke"),
   ID("principal", "principal"), ID("ssm1", "inst"),
   ID("m0Types", "command"), ID("m0Types", "state"), ID("ssm1", "trType"),
   ID("aclfoundation", "po"), ID("m0Types", "output"),
   ID("aclfoundation", "Form"), ID("inMsg", "inMsg"), ID("bool", "!"),
   ID("min", "bool"), ID("pair", ","), ID("pair", "prod"),
   ID("bool", "/\\"), ID("num", "0"), ID("num", "num"), ID("min", "="),
   ID("min", "==>"), ID("list", "APPEND"), ID("principal", "Bob"),
   ID("principal", "staff"), ID("ssm1", "CFG"),
   ID("ssm1", "configuration"), ID("ssm2", "CFG2"),
   ID("ssm2", "configuration2"), ID("ssm2", "CFG2Interpret"),
   ID("list", "CONS"), ID("principal", "KeyS"), ID("cipher", "pKey"),
   ID("list", "MAP"), ID("inMsg", "MSG"), ID("cipher", "asymMsg"),
   ID("cipher", "digest"), ID("inMsg", "order"),
   ID("inMsg", "MsgInterpret"), ID("aclfoundation", "Name"),
   ID("aclfoundation", "Princ"), ID("principal", "Operator"),
   ID("principal", "role"), ID("inMsg", "Order"), ID("m0Types", "PR"),
   ID("principal", "Role"), ID("SM0", "SM0StateInterp"),
   ID("option", "SOME"), ID("option", "option"), ID("ssm1", "SOME"),
   ID("ssm1", "TR"), ID("ssm2", "TR2"), ID("principal", "ca"),
   ID("principal", "authority"),
   ID("certStructure", "certificateInterpret"),
   ID("SM0r3", "certificatesr3"), ID("SM0r1", "certsr1"),
   ID("SM0r2", "certsr2"), ID("SM0r2", "certsr2root"),
   ID("SM0r2", "certsr2signed"), ID("ssm1", "exec"), ID("cipher", "hash"),
   ID("SM0r2", "inputOKr2"), ID("SM0r1", "mapSM0inputOperatorBob"),
   ID("SM0r2", "mapSM0r1input"), ID("certStructure", "mkRCert"),
   ID("certStructure", "mkSCert"), ID("inMsg", "mkinMsg"),
   ID("cipher", "privK"), ID("aclfoundation", "prop"),
   ID("cipher", "pubK"), ID("aclfoundation", "quoting"),
   ID("aclrules", "sat"), ID("aclfoundation", "says"),
   ID("cipher", "sign")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'b", TYV "'a", TYOP [2, 1, 0], TYOP [1, 2], TYOP [3],
   TYOP [0, 4, 3], TYOP [4], TYOP [0, 6, 5], TYV "'e", TYV "'d", TYOP [6],
   TYOP [8], TYOP [7, 11], TYOP [5, 12, 0, 10, 9, 8], TYOP [9],
   TYOP [10, 11], TYOP [0, 15, 14], TYOP [0, 14, 16], TYOP [11, 9],
   TYOP [11, 8], TYOP [12], TYOP [0, 15, 20], TYOP [0, 14, 21],
   TYOP [13, 12, 10, 9, 8], TYOP [1, 23], TYOP [14], TYOP [1, 25],
   TYOP [1, 20], TYOP [16], TYOP [0, 13, 28], TYOP [0, 29, 28],
   TYOP [0, 22, 28], TYOP [0, 31, 28], TYOP [0, 17, 28], TYOP [0, 33, 28],
   TYOP [0, 6, 28], TYOP [0, 35, 28], TYOP [0, 18, 28], TYOP [0, 37, 28],
   TYOP [0, 19, 28], TYOP [0, 39, 28], TYOP [0, 4, 28], TYOP [0, 41, 28],
   TYOP [18, 18, 19], TYOP [18, 13, 43], TYOP [0, 43, 44],
   TYOP [0, 13, 45], TYOP [0, 19, 43], TYOP [0, 18, 47], TYOP [0, 28, 28],
   TYOP [0, 28, 49], TYOP [21], TYOP [13, 12, 10, 1, 0], TYOP [1, 52],
   TYOP [0, 53, 28], TYOP [0, 53, 54], TYOP [0, 3, 28], TYOP [0, 3, 56],
   TYOP [0, 53, 53], TYOP [0, 53, 58], TYOP [0, 3, 3], TYOP [0, 3, 60],
   TYOP [26], TYOP [28, 11, 9, 8, 20, 10, 14], TYOP [0, 27, 63],
   TYOP [0, 14, 64], TYOP [0, 24, 65], TYOP [0, 24, 66], TYOP [0, 14, 23],
   TYOP [0, 68, 67], TYOP [0, 23, 28], TYOP [0, 70, 69], TYOP [2, 9, 8],
   TYOP [30, 72, 11, 9, 8, 25, 20, 10, 14], TYOP [0, 27, 73],
   TYOP [0, 14, 74], TYOP [0, 26, 75], TYOP [0, 68, 76], TYOP [1, 72],
   TYOP [0, 78, 77], TYOP [0, 70, 79], TYOP [0, 72, 23], TYOP [0, 81, 80],
   TYOP [0, 25, 23], TYOP [0, 83, 82], TYOP [0, 73, 28], TYOP [0, 44, 85],
   TYOP [0, 24, 24], TYOP [0, 23, 87], TYOP [0, 26, 26], TYOP [0, 25, 89],
   TYOP [0, 27, 27], TYOP [0, 20, 91], TYOP [34, 62], TYOP [0, 93, 10],
   TYOP [0, 53, 3], TYOP [0, 52, 2], TYOP [0, 96, 95], TYOP [0, 3, 53],
   TYOP [0, 2, 52], TYOP [0, 99, 98], TYOP [39], TYOP [38, 101],
   TYOP [37, 102, 62], TYOP [0, 103, 25], TYOP [0, 101, 104],
   TYOP [0, 62, 105], TYOP [42, 10], TYOP [0, 10, 107], TYOP [44],
   TYOP [0, 11, 101], TYOP [0, 109, 110], TYOP [0, 4, 11],
   TYOP [0, 109, 10], TYOP [50, 101], TYOP [0, 101, 114], TYOP [0, 11, 12],
   TYOP [0, 63, 28], TYOP [0, 63, 117], TYOP [0, 15, 118],
   TYOP [0, 44, 119], TYOP [0, 73, 85], TYOP [0, 15, 121],
   TYOP [0, 44, 122], TYOP [55], TYOP [0, 51, 124], TYOP [0, 4, 78],
   TYOP [0, 6, 126], TYOP [0, 4, 53], TYOP [0, 6, 128], TYOP [0, 4, 24],
   TYOP [0, 6, 130], TYOP [0, 11, 15], TYOP [0, 114, 102],
   TYOP [0, 23, 23], TYOP [0, 124, 96], TYOP [0, 23, 25], TYOP [0, 62, 93],
   TYOP [0, 12, 23], TYOP [0, 107, 107], TYOP [0, 107, 139],
   TYOP [0, 44, 70], TYOP [0, 107, 134], TYOP [0, 102, 103],
   TYOP [0, 93, 143]]
  end
  val _ = Theory.incorporate_consts "SM0r3" tyvector
     [("certificatesr3", 7)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 13), TMV("NS", 17), TMV("Oi", 18), TMV("Os", 19),
   TMV("Out", 22), TMV("ins", 24), TMV("ins", 26), TMV("ins2", 26),
   TMV("npriv", 6), TMV("outs", 27), TMV("privcmd", 4), TMV("s", 14),
   TMC(15, 30), TMC(15, 32), TMC(15, 34), TMC(15, 36), TMC(15, 38),
   TMC(15, 40), TMC(15, 42), TMC(17, 46), TMC(17, 48), TMC(19, 50),
   TMC(20, 51), TMC(22, 50), TMC(22, 55), TMC(22, 57), TMC(23, 50),
   TMC(24, 59), TMC(24, 61), TMC(25, 62), TMC(27, 71), TMC(29, 84),
   TMC(31, 86), TMC(32, 88), TMC(32, 90), TMC(32, 92), TMC(33, 94),
   TMC(35, 97), TMC(35, 100), TMC(36, 106), TMC(40, 83), TMC(41, 108),
   TMC(43, 109), TMC(45, 111), TMC(46, 112), TMC(47, 113), TMC(48, 68),
   TMC(49, 115), TMC(51, 116), TMC(52, 120), TMC(53, 123), TMC(54, 125),
   TMC(56, 99), TMC(56, 81), TMC(57, 7), TMC(57, 127), TMC(58, 129),
   TMC(59, 129), TMC(59, 131), TMC(60, 129), TMC(61, 129), TMC(62, 132),
   TMC(63, 133), TMC(64, 70), TMC(65, 134), TMC(66, 134), TMC(67, 96),
   TMC(68, 135), TMC(69, 136), TMC(70, 137), TMC(71, 138), TMC(72, 137),
   TMC(73, 140), TMC(74, 141), TMC(75, 142), TMC(76, 144)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op certificatesr3_def x = x
    val op certificatesr3_def =
    ThmBind.DT(((("SM0r3",0),[]),[]),
               [ThmBind.read"%15%8%18%10%25%54$1@$0@2%28%37%66@%27%56$1@$0@2%59$1@$0@4%37%67%51%22@3%60$1@$0@4|@|@"])
  fun op certificatesr3_certsr2_map_thm x = x
    val op certificatesr3_certsr2_map_thm =
    ThmBind.DT(((("SM0r3",1),
                [("SM0r2",[5]),("SM0r3",[0]),("bool",[25,35,55]),
                 ("certStructure",[29,30]),("list",[58])]),["DISK_THM"]),
               [ThmBind.read"%15%8%18%10%24%38%52@%54$1@$0@3%57$1@$0@2|@|@"])
  fun op mkinMsg_SM0r2_Bob_Operator_privcmd_lemma x = x
    val op mkinMsg_SM0r2_Bob_Operator_privcmd_lemma =
    ThmBind.DT(((("SM0r3",2),
                [("SM0",[15]),("SM0r1",[9,12]),("SM0r2",[3,4,5,8]),
                 ("SM0r3",[0]),("aclDrules",[3,4,16]),("aclrules",[32,33]),
                 ("bool",[25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("certStructure",[29,30]),("inMsg",[36]),("list",[58]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm2",[16])]),["DISK_THM"]),
               [ThmBind.read"%26%32%19%0@%20%2@%3@3%31%40@%53@%63@%55%8@%10@2%46@%34%68%65%64%74%41%45%42@3%70%48%44%10@8%6@2%11@%9@3%73%19%0@%20%2@%3@3%70%48%44%10@5"])
  fun op Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm
    x = x
    val op Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm
    =
    ThmBind.DT(((("SM0r3",3),
                [("SM0",[15]),("SM0r1",[9,12]),("SM0r2",[3,4,5,8]),
                 ("SM0r3",[0]),("aclDrules",[3,4,16]),("aclrules",[32,33]),
                 ("bool",[25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("certStructure",[29,30]),("inMsg",[36]),("list",[58]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm2",[16,26])]),["DISK_THM"]),
               [ThmBind.read"%14%1%13%4%12%0%16%2%17%3%23%50%19$2@%20$1@$0@3%61%44%10@3%31%40@%53@%63@%55%8@%10@2%46@%34%68%65%64%74%41%45%42@3%70%48%44%10@8%6@2%11@%9@2%31%40@%53@%63@%55%8@%10@2%46@%6@$4%11@%61%44%10@4%35$3%11@%61%44%10@4%9@4%21%63%40%68%65%64%74%41%45%42@3%70%48%44%10@10%21%32%19$2@%20$1@$0@3%31%40@%53@%63@%55%8@%10@2%46@%34%68%65%64%74%41%45%42@3%70%48%44%10@8%6@2%11@%9@3%73%19$2@%20$1@$0@3%70%48%44%10@7|@|@|@|@|@"])
  fun op Operator_Bob_privcmd_exec_privcmd_justified_thm x = x
    val op Operator_Bob_privcmd_exec_privcmd_justified_thm =
    ThmBind.DT(((("SM0r3",4),
                [("SM0",[15]),("SM0r1",[9,12]),("SM0r2",[3,4,5,8]),
                 ("SM0r3",[0]),("aclDrules",[3,4,16]),("aclrules",[32,33]),
                 ("bool",[25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("certStructure",[29,30]),("inMsg",[35,36]),("list",[58]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm2",[16,26])]),["DISK_THM"]),
               [ThmBind.read"%14%1%13%4%12%0%16%2%17%3%23%50%19$2@%20$1@$0@3%61%44%10@3%31%40@%53@%63@%55%8@%10@2%46@%34%39%29@%43%42@%44%10@3%75%69%29@2%62%47%43%42@%44%10@7%6@2%11@%9@2%31%40@%53@%63@%55%8@%10@2%46@%6@$4%11@%61%44%10@4%35$3%11@%61%44%10@4%9@4%21%63%40%39%29@%43%42@%44%10@3%75%69%29@2%62%47%43%42@%44%10@9%21%32%19$2@%20$1@$0@3%31%40@%53@%63@%55%8@%10@2%46@%34%39%29@%43%42@%44%10@3%75%69%29@2%62%47%43%42@%44%10@7%6@2%11@%9@3%73%19$2@%20$1@$0@3%70%48%44%10@7|@|@|@|@|@"])
  fun op Bob_TR2_iff_TR_privcmd x = x
    val op Bob_TR2_iff_TR_privcmd =
    ThmBind.DT(((("SM0r3",5),
                [("SM0",[15]),("SM0r1",[9,12]),("SM0r2",[3,4,5,8,9]),
                 ("SM0r3",[0]),("aclDrules",[3,4,16]),("aclrules",[32,33]),
                 ("bool",[25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("certStructure",[29,30]),("inMsg",[36]),("list",[58]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm2",[16,29])]),["DISK_THM"]),
               [ThmBind.read"%14%1%13%4%12%0%16%2%17%3%23%50%19$2@%20$1@$0@3%61%44%10@3%31%40@%53@%63@%55%8@%10@2%46@%34%68%65%64%74%41%45%42@3%70%48%44%10@8%7@2%11@%9@2%31%40@%53@%63@%55%8@%10@2%46@%7@$4%11@%61%44%10@4%35$3%11@%61%44%10@4%9@4%49%19$2@%20$1@$0@3%61%44%10@3%30%63@%46@%58%8@%10@2%33%74%72%41%36%71%29@4%41%45%42@4%70%48%44%10@5%5@2%11@%9@2%30%63@%46@%58%8@%10@2%5@$4%11@%61%44%10@4%35$3%11@%61%44%10@4%9@4|@|@|@|@|@"])

  val _ = DB.bindl "SM0r3"
  [("certificatesr3_def",certificatesr3_def,DB.Def),
   ("certificatesr3_certsr2_map_thm",
    certificatesr3_certsr2_map_thm,
    DB.Thm),
   ("mkinMsg_SM0r2_Bob_Operator_privcmd_lemma",
    mkinMsg_SM0r2_Bob_Operator_privcmd_lemma,
    DB.Thm),
   ("Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm",
    Operator_Bob_privcmd_exec_privcmd_justified_with_refinements_thm,
    DB.Thm),
   ("Operator_Bob_privcmd_exec_privcmd_justified_thm",
    Operator_Bob_privcmd_exec_privcmd_justified_thm,
    DB.Thm), ("Bob_TR2_iff_TR_privcmd",Bob_TR2_iff_TR_privcmd,DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0r3",
    thydataty = "compute",
    read = ThmBind.read,
    data = "SM0r3.certificatesr3_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0r3",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data = "OO14.certificatesr33.%54"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val SM0r3_grammars = merge_grammars ["inMsg", "certStructure", "SM0r2"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="SM0r3"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val SM0r3_grammars = 
    Portable.## (addtyUDs,addtmUDs) SM0r3_grammars
  val _ = Parse.grammarDB_insert("SM0r3",SM0r3_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "SM0r3"
end
