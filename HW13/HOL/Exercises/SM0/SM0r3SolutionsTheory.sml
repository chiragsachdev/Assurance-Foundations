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
          Arbnum.fromString "1556067625",
          Arbnum.fromString "525491")
          [("SM0r3",
           Arbnum.fromString "1556067618",
           Arbnum.fromString "311987")];
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
   ID("m0Types", "output"), ID("inMsg", "inMsg"), ID("bool", "!"),
   ID("min", "bool"), ID("pair", ","), ID("pair", "prod"),
   ID("bool", "/\\"), ID("num", "0"), ID("num", "num"), ID("min", "="),
   ID("min", "==>"), ID("list", "APPEND"), ID("principal", "Alice"),
   ID("principal", "staff"), ID("principal", "Bob"), ID("ssm1", "CFG"),
   ID("ssm1", "configuration"), ID("ssm2", "CFG2"),
   ID("ssm2", "configuration2"), ID("ssm2", "CFG2Interpret"),
   ID("ssm1", "CFGInterpret"), ID("list", "CONS"),
   ID("principal", "Commander"), ID("principal", "role"),
   ID("principal", "KeyS"), ID("cipher", "pKey"), ID("list", "MAP"),
   ID("inMsg", "MSG"), ID("cipher", "asymMsg"), ID("cipher", "digest"),
   ID("inMsg", "order"), ID("inMsg", "MsgInterpret"), ID("list", "NIL"),
   ID("ssm1", "NONE"), ID("aclfoundation", "Name"),
   ID("aclfoundation", "Princ"), ID("principal", "Operator"),
   ID("inMsg", "Order"), ID("m0Types", "PR"), ID("principal", "Role"),
   ID("SM0", "SM0StateInterp"), ID("option", "SOME"),
   ID("option", "option"), ID("ssm1", "SOME"), ID("principal", "Staff"),
   ID("ssm1", "TR"), ID("ssm2", "TR2"), ID("principal", "ca"),
   ID("principal", "authority"),
   ID("certStructure", "certificateInterpret"),
   ID("SM0r3Solutions", "certificatesr3a"), ID("SM0", "certs"),
   ID("SM0r3Solutions", "certsr1a"), ID("SM0r3Solutions", "certsr2a"),
   ID("SM0r2", "certsr2root"), ID("SM0r2", "certsr2signed"),
   ID("cipher", "hash"), ID("SM0r2", "inputOKr2"),
   ID("SM0r1", "mapSM0inputOperatorBob"), ID("SM0r2", "mapSM0r1input"),
   ID("certStructure", "mkRCert"), ID("certStructure", "mkSCert"),
   ID("inMsg", "mkinMsg"), ID("cipher", "privK"),
   ID("aclfoundation", "prop"), ID("cipher", "pubK"),
   ID("aclfoundation", "quoting"), ID("aclfoundation", "reps"),
   ID("aclrules", "sat"), ID("aclfoundation", "says"),
   ID("cipher", "sign"), ID("ssm1", "trap")]
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
   TYOP [12, 12], TYOP [13], TYOP [0, 26, 31], TYOP [0, 25, 32], TYOP [14],
   TYOP [1, 34], TYOP [1, 31], TYOP [16], TYOP [0, 24, 37],
   TYOP [0, 38, 37], TYOP [0, 3, 37], TYOP [0, 40, 37], TYOP [0, 33, 37],
   TYOP [0, 42, 37], TYOP [0, 28, 37], TYOP [0, 44, 37], TYOP [0, 10, 37],
   TYOP [0, 46, 37], TYOP [0, 29, 37], TYOP [0, 48, 37], TYOP [0, 30, 37],
   TYOP [0, 50, 37], TYOP [0, 8, 37], TYOP [0, 52, 37], TYOP [18, 29, 30],
   TYOP [18, 24, 54], TYOP [0, 54, 55], TYOP [0, 24, 56], TYOP [0, 30, 54],
   TYOP [0, 29, 58], TYOP [0, 37, 37], TYOP [0, 37, 60], TYOP [21],
   TYOP [0, 6, 37], TYOP [0, 6, 63], TYOP [0, 15, 37], TYOP [0, 15, 65],
   TYOP [0, 20, 37], TYOP [0, 20, 67], TYOP [0, 6, 6], TYOP [0, 6, 69],
   TYOP [0, 15, 15], TYOP [0, 15, 71], TYOP [0, 20, 20], TYOP [0, 20, 73],
   TYOP [26], TYOP [29, 3, 13, 12, 31, 2, 25], TYOP [0, 36, 76],
   TYOP [0, 25, 77], TYOP [0, 15, 78], TYOP [0, 15, 79], TYOP [0, 25, 14],
   TYOP [0, 81, 80], TYOP [0, 14, 37], TYOP [0, 83, 82], TYOP [8, 13, 12],
   TYOP [31, 85, 3, 13, 12, 34, 31, 2, 25], TYOP [0, 36, 86],
   TYOP [0, 25, 87], TYOP [0, 35, 88], TYOP [0, 81, 89], TYOP [1, 85],
   TYOP [0, 91, 90], TYOP [0, 83, 92], TYOP [0, 85, 14], TYOP [0, 94, 93],
   TYOP [0, 34, 14], TYOP [0, 96, 95], TYOP [0, 86, 37], TYOP [0, 55, 98],
   TYOP [0, 76, 37], TYOP [0, 55, 100], TYOP [0, 14, 71], TYOP [0, 35, 35],
   TYOP [0, 34, 103], TYOP [0, 36, 36], TYOP [0, 31, 105], TYOP [36],
   TYOP [38, 75], TYOP [0, 108, 2], TYOP [0, 6, 20], TYOP [0, 5, 19],
   TYOP [0, 111, 110], TYOP [0, 20, 6], TYOP [0, 19, 5],
   TYOP [0, 114, 113], TYOP [43], TYOP [42, 116], TYOP [41, 117, 75],
   TYOP [0, 118, 34], TYOP [0, 116, 119], TYOP [0, 75, 120], TYOP [48, 2],
   TYOP [0, 2, 122], TYOP [0, 3, 116], TYOP [0, 107, 124], TYOP [0, 8, 3],
   TYOP [0, 107, 2], TYOP [55, 116], TYOP [0, 116, 128], TYOP [0, 3, 4],
   TYOP [0, 75, 2], TYOP [0, 76, 100], TYOP [0, 26, 132],
   TYOP [0, 55, 133], TYOP [0, 86, 98], TYOP [0, 26, 135],
   TYOP [0, 55, 136], TYOP [61], TYOP [0, 62, 138], TYOP [0, 3, 91],
   TYOP [0, 8, 140], TYOP [0, 10, 141], TYOP [0, 8, 15], TYOP [0, 10, 143],
   TYOP [0, 8, 6], TYOP [0, 10, 145], TYOP [0, 128, 117], TYOP [0, 14, 14],
   TYOP [0, 138, 111], TYOP [0, 14, 34], TYOP [0, 75, 108],
   TYOP [0, 4, 14], TYOP [0, 122, 122], TYOP [0, 122, 153],
   TYOP [0, 122, 148], TYOP [0, 122, 155], TYOP [0, 55, 83],
   TYOP [0, 117, 118], TYOP [0, 108, 158], TYOP [0, 3, 26]]
  end
  val _ = Theory.incorporate_consts "SM0r3Solutions" tyvector
     [("certsr2a", 11), ("certsr1a", 18), ("certificatesr3a", 23)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 24), TMV("NS", 28), TMV("Oi", 29), TMV("Os", 30),
   TMV("Out", 33), TMV("cmd", 3), TMV("ins", 15), TMV("ins", 35),
   TMV("ins2", 35), TMV("npriv", 10), TMV("outs", 36), TMV("privcmd", 8),
   TMV("s", 25), TMC(15, 39), TMC(15, 41), TMC(15, 43), TMC(15, 45),
   TMC(15, 47), TMC(15, 49), TMC(15, 51), TMC(15, 53), TMC(17, 57),
   TMC(17, 59), TMC(19, 61), TMC(20, 62), TMC(22, 61), TMC(22, 64),
   TMC(22, 66), TMC(22, 68), TMC(23, 61), TMC(24, 70), TMC(24, 72),
   TMC(24, 74), TMC(25, 75), TMC(27, 75), TMC(28, 84), TMC(30, 97),
   TMC(32, 99), TMC(33, 101), TMC(34, 102), TMC(34, 104), TMC(34, 106),
   TMC(35, 107), TMC(37, 109), TMC(39, 112), TMC(39, 115), TMC(40, 121),
   TMC(44, 96), TMC(45, 15), TMC(46, 4), TMC(47, 123), TMC(49, 107),
   TMC(50, 125), TMC(51, 126), TMC(52, 127), TMC(53, 81), TMC(54, 129),
   TMC(56, 130), TMC(57, 131), TMC(58, 134), TMC(59, 137), TMC(60, 139),
   TMC(62, 114), TMC(62, 94), TMC(63, 23), TMC(63, 142), TMC(64, 144),
   TMC(65, 11), TMC(65, 18), TMC(66, 11), TMC(66, 18), TMC(67, 146),
   TMC(68, 146), TMC(69, 147), TMC(70, 83), TMC(71, 148), TMC(72, 148),
   TMC(73, 111), TMC(74, 149), TMC(75, 150), TMC(76, 151), TMC(77, 152),
   TMC(78, 151), TMC(79, 154), TMC(80, 156), TMC(81, 157), TMC(82, 155),
   TMC(83, 159), TMC(84, 160)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op certsr1a_def x = x
    val op certsr1a_def =
    ThmBind.DT(((("SM0r3Solutions",0),[]),[]),
               [ThmBind.read"%17%9%20%11%14%5%27%68$2@$1@$0@2%31%66$2@$1@2%39%84%50%58%33@3%50%54%42@3%81%57$0@4%39%84%50%58%34@3%50%54%51@3%81%57$0@4%48@4|@|@|@"])
  fun op certsr2a_def x = x
    val op certsr2a_def =
    ThmBind.DT(((("SM0r3Solutions",1),[]),[]),
               [ThmBind.read"%17%9%20%11%14%5%26%69$2@$1@$0@2%30%30%67$2@$1@$0@2%71$2@$1@3%72$2@$1@3|@|@|@"])
  fun op certificatesr3a_def x = x
    val op certificatesr3a_def =
    ThmBind.DT(((("SM0r3Solutions",2),[]),[]),
               [ThmBind.read"%17%9%20%11%14%5%28%64$2@$1@$0@2%32%44%77@%30%67$2@$1@$0@2%71$2@$1@4%44%78%61%24@3%72$2@$1@4|@|@|@"])
  fun op SM0r2_mapSM0r1_Alice_Commander_trap_privcmd_lemma x = x
    val op SM0r2_mapSM0r1_Alice_Commander_trap_privcmd_lemma =
    ThmBind.DT(((("SM0r3Solutions",3),
                [("SM0",[15]),("SM0r1",[12]),("SM0r2",[3,4,8]),
                 ("SM0r3Solutions",[0,1]),("aclDrules",[3,6,16]),
                 ("aclrules",[23,32,33]),
                 ("bool",[25,26,46,47,50,52,53,57,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm1",[52])]),["DISK_THM"]),
               [ThmBind.read"%29%38%21%0@%22%2@%3@3%35%74@%55@%70%9@%11@%53%11@3%39%76%75%86%50%54%42@3%81%57%53%11@7%6@2%12@%10@3%85%21%0@%22%2@%3@3%81%49@3"])
  fun op SM0r2_Commander_Alice_trap_privcmd_justified_thm x = x
    val op SM0r2_Commander_Alice_trap_privcmd_justified_thm =
    ThmBind.DT(((("SM0r3Solutions",4),
                [("SM0",[15]),("SM0r1",[12]),("SM0r2",[3,4,8]),
                 ("SM0r3Solutions",[0,1]),("aclDrules",[3,6,16]),
                 ("aclrules",[23,32,33]),
                 ("bool",[25,26,35,46,47,50,52,53,57,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm1",[52,63])]),["DISK_THM"]),
               [ThmBind.read"%16%1%15%4%13%0%18%2%19%3%25%59%21$2@%22$1@$0@3%88%53%11@3%35%74@%55@%70%9@%11@%53%11@3%39%86%83%50%43%82%33@4%50%54%42@4%81%57%53%11@5%6@2%12@%10@2%35%74@%55@%70%9@%11@%53%11@3%6@$4%12@%88%53%11@4%41$3%12@%88%53%11@4%10@4%23%74%86%83%50%43%82%33@4%50%54%42@4%81%57%53%11@6%23%38%21$2@%22$1@$0@3%35%74@%55@%70%9@%11@%53%11@3%39%86%83%50%43%82%33@4%50%54%42@4%81%57%53%11@5%6@2%12@%10@3%85%21$2@%22$1@$0@3%81%49@5|@|@|@|@|@"])
  fun op SM0r2_Commander_mapSM0r1input_trap_privcmd_justifed_thm x = x
    val op SM0r2_Commander_mapSM0r1input_trap_privcmd_justifed_thm =
    ThmBind.DT(((("SM0r3Solutions",5),
                [("SM0",[15]),("SM0r1",[12]),("SM0r2",[3,4,8]),
                 ("SM0r3Solutions",[0,1]),("aclDrules",[3,6,16]),
                 ("aclrules",[23,32,33]),
                 ("bool",
                 [13,25,26,27,29,35,46,47,50,51,52,53,55,57,62,72,92,93,
                  95]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,2,3]),("ssm1",[52,63])]),["DISK_THM"]),
               [ThmBind.read"%16%1%15%4%13%0%18%2%19%3%25%59%21$2@%22$1@$0@3%88%53%11@3%35%74@%55@%70%9@%11@%53%11@3%39%76%75%86%50%54%42@3%81%57%53%11@7%6@2%12@%10@2%35%74@%55@%70%9@%11@%53%11@3%6@$4%12@%88%53%11@4%41$3%12@%88%53%11@4%10@4%23%74%76%75%86%50%54%42@3%81%57%53%11@8%23%38%21$2@%22$1@$0@3%35%74@%55@%70%9@%11@%53%11@3%39%76%75%86%50%54%42@3%81%57%53%11@7%6@2%12@%10@3%85%21$2@%22$1@$0@3%81%49@5|@|@|@|@|@"])
  fun op certificatesr3a_certsr2a_map_thm x = x
    val op certificatesr3a_certsr2a_map_thm =
    ThmBind.DT(((("SM0r3Solutions",6),
                [("SM0r3Solutions",[1,2]),("bool",[25,35,55]),
                 ("certStructure",[29,30]),("list",[58])]),["DISK_THM"]),
               [ThmBind.read"%17%9%20%11%26%45%62@%64$1@$0@%53$0@4%69$1@$0@%53$0@3|@|@"])
  fun op SM0r3_mkinMsg_SM0r2_Alice_Commander_trap_privcmd_lemma x = x
    val op SM0r3_mkinMsg_SM0r2_Alice_Commander_trap_privcmd_lemma =
    ThmBind.DT(((("SM0r3Solutions",7),
                [("SM0",[15]),("SM0r1",[12]),("SM0r2",[3,4,8]),
                 ("SM0r3Solutions",[0,1,2]),("aclDrules",[3,6,16]),
                 ("aclrules",[23,32,33]),
                 ("bool",[25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("certStructure",[29,30]),("inMsg",[36]),("list",[58]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm2",[16])]),["DISK_THM"]),
               [ThmBind.read"%29%37%21%0@%22%2@%3@3%36%47@%63@%74@%65%9@%11@%53%11@3%55@%40%79%76%75%86%50%54%42@3%81%57%53%11@8%7@2%12@%10@3%85%21%0@%22%2@%3@3%81%49@3"])
  fun
    op SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_with_refinements_thm
    x = x
    val
    op SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_with_refinements_thm
    =
    ThmBind.DT(((("SM0r3Solutions",8),
                [("SM0",[15]),("SM0r1",[12]),("SM0r2",[3,4,8]),
                 ("SM0r3Solutions",[0,1,2]),("aclDrules",[3,6,16]),
                 ("aclrules",[23,32,33]),
                 ("bool",[25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("certStructure",[29,30]),("inMsg",[36]),("list",[58]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm2",[16,27])]),["DISK_THM"]),
               [ThmBind.read"%16%1%15%4%13%0%18%2%19%3%25%60%21$2@%22$1@$0@3%88%53%11@3%36%47@%63@%74@%65%9@%11@%53%11@3%55@%40%79%76%75%86%50%54%42@3%81%57%53%11@8%7@2%12@%10@2%36%47@%63@%74@%65%9@%11@%53%11@3%55@%7@$4%12@%88%53%11@4%41$3%12@%88%53%11@4%10@4%23%74%47%79%76%75%86%50%54%42@3%81%57%53%11@10%23%37%21$2@%22$1@$0@3%36%47@%63@%74@%65%9@%11@%53%11@3%55@%40%79%76%75%86%50%54%42@3%81%57%53%11@8%7@2%12@%10@3%85%21$2@%22$1@$0@3%81%49@5|@|@|@|@|@"])
  fun op SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_thm x = x
    val op SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_thm =
    ThmBind.DT(((("SM0r3Solutions",9),
                [("SM0",[15]),("SM0r1",[12]),("SM0r2",[3,4,8]),
                 ("SM0r3Solutions",[0,1,2]),("aclDrules",[3,6,16]),
                 ("aclrules",[23,32,33]),
                 ("bool",[25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("certStructure",[29,30]),("inMsg",[35,36]),("list",[58]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm2",[16,27])]),["DISK_THM"]),
               [ThmBind.read"%16%1%15%4%13%0%18%2%19%3%25%60%21$2@%22$1@$0@3%88%53%11@3%36%47@%63@%74@%65%9@%11@%53%11@3%55@%40%46%33@%52%42@%53%11@3%87%80%33@2%73%56%52%42@%53%11@7%7@2%12@%10@2%36%47@%63@%74@%65%9@%11@%53%11@3%55@%7@$4%12@%88%53%11@4%41$3%12@%88%53%11@4%10@4%23%74%47%46%33@%52%42@%53%11@3%87%80%33@2%73%56%52%42@%53%11@9%23%37%21$2@%22$1@$0@3%36%47@%63@%74@%65%9@%11@%53%11@3%55@%40%46%33@%52%42@%53%11@3%87%80%33@2%73%56%52%42@%53%11@7%7@2%12@%10@3%85%21$2@%22$1@$0@3%81%49@5|@|@|@|@|@"])
  fun op SM0r3_Alice_TR2_iff_TR_trap_privcmd x = x
    val op SM0r3_Alice_TR2_iff_TR_trap_privcmd =
    ThmBind.DT(((("SM0r3Solutions",10),
                [("SM0",[15]),("SM0r1",[12]),("SM0r2",[3,4,8]),
                 ("SM0r3Solutions",[0,1,2]),("aclDrules",[3,6,16]),
                 ("aclrules",[23,32,33]),
                 ("bool",[25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("certStructure",[29,30]),("inMsg",[36]),("list",[58]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,2,3]),
                 ("ssm1",[52]),("ssm2",[16,30])]),["DISK_THM"]),
               [ThmBind.read"%16%1%15%4%13%0%18%2%19%3%25%60%21$2@%22$1@$0@3%88%53%11@3%36%47@%63@%74@%65%9@%11@%53%11@3%55@%40%79%76%75%86%50%54%42@3%81%57%53%11@8%8@2%12@%10@2%36%47@%63@%74@%65%9@%11@%53%11@3%55@%8@$4%12@%88%53%11@4%41$3%12@%88%53%11@4%10@4%59%21$2@%22$1@$0@3%88%53%11@3%35%74@%55@%70%9@%11@%53%11@3%39%86%83%50%43%82%33@4%50%54%42@4%81%57%53%11@5%6@2%12@%10@2%35%74@%55@%70%9@%11@%53%11@3%6@$4%12@%88%53%11@4%41$3%12@%88%53%11@4%10@4|@|@|@|@|@"])

  val _ = DB.bindl "SM0r3Solutions"
  [("certsr1a_def",certsr1a_def,DB.Def),
   ("certsr2a_def",certsr2a_def,DB.Def),
   ("certificatesr3a_def",certificatesr3a_def,DB.Def),
   ("SM0r2_mapSM0r1_Alice_Commander_trap_privcmd_lemma",
    SM0r2_mapSM0r1_Alice_Commander_trap_privcmd_lemma,
    DB.Thm),
   ("SM0r2_Commander_Alice_trap_privcmd_justified_thm",
    SM0r2_Commander_Alice_trap_privcmd_justified_thm,
    DB.Thm),
   ("SM0r2_Commander_mapSM0r1input_trap_privcmd_justifed_thm",
    SM0r2_Commander_mapSM0r1input_trap_privcmd_justifed_thm,
    DB.Thm),
   ("certificatesr3a_certsr2a_map_thm",
    certificatesr3a_certsr2a_map_thm,
    DB.Thm),
   ("SM0r3_mkinMsg_SM0r2_Alice_Commander_trap_privcmd_lemma",
    SM0r3_mkinMsg_SM0r2_Alice_Commander_trap_privcmd_lemma,
    DB.Thm),
   ("SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_with_refinements_thm",
    SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_with_refinements_thm,
    DB.Thm),
   ("SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_thm",
    SM0r3_Commander_Alice_privcmd_trap_privcmd_justified_thm,
    DB.Thm),
   ("SM0r3_Alice_TR2_iff_TR_trap_privcmd",
    SM0r3_Alice_TR2_iff_TR_trap_privcmd,
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
    data = "OO8.certsr1a3.%68OO8.certsr2a3.%69OO15.certificatesr3a3.%64"
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
