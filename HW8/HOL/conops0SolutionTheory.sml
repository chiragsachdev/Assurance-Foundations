structure conops0SolutionTheory :> conops0SolutionTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading conops0SolutionTheory ... " else ()
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
          ("conops0Solution",
          Arbnum.fromString "1553033126",
          Arbnum.fromString "707780")
          [("aclDrules",
           Arbnum.fromString "1534466515",
           Arbnum.fromString "648647")];
  val _ = Theory.incorporate_types "conops0Solution"
       [("roles", 0), ("principals", 0), ("people", 0), ("keyPrinc", 0),
        ("commands", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("conops0Solution", "commands"), ID("min", "fun"), ID("num", "num"),
   ID("conops0Solution", "roles"), ID("conops0Solution", "principals"),
   ID("conops0Solution", "keyPrinc"), ID("conops0Solution", "people"),
   ID("min", "bool"), ID("ind_type", "recspace"), ID("pair", "prod"),
   ID("aclfoundation", "Kripke"), ID("aclfoundation", "po"),
   ID("bool", "!"), ID("arithmetic", "+"), ID("pair", ","),
   ID("bool", "/\\"), ID("num", "0"), ID("prim_rec", "<"), ID("min", "="),
   ID("min", "==>"), ID("bool", "?"), ID("bool", "ARB"),
   ID("conops0Solution", "Alice"), ID("conops0Solution", "Ap"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("conops0Solution", "Bob"),
   ID("conops0Solution", "CA"), ID("bool", "COND"),
   ID("ind_type", "CONSTR"), ID("conops0Solution", "Commander"),
   ID("bool", "DATATYPE"), ID("conops0Solution", "Key"),
   ID("arithmetic", "NUMERAL"), ID("aclfoundation", "Name"),
   ID("aclfoundation", "Princ"), ID("conops0Solution", "Operator"),
   ID("conops0Solution", "PR"), ID("conops0Solution", "Role"),
   ID("num", "SUC"), ID("conops0Solution", "Staff"),
   ID("bool", "TYPE_DEFINITION"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("conops0Solution", "abort"),
   ID("conops0Solution", "activate"),
   ID("conops0Solution", "commands2num"),
   ID("conops0Solution", "commands_CASE"),
   ID("conops0Solution", "commands_size"), ID("aclfoundation", "controls"),
   ID("aclfoundation", "Form"), ID("conops0Solution", "go"),
   ID("aclfoundation", "impf"), ID("conops0Solution", "keyPrinc_CASE"),
   ID("conops0Solution", "keyPrinc_size"), ID("conops0Solution", "launch"),
   ID("conops0Solution", "nogo"), ID("conops0Solution", "num2commands"),
   ID("conops0Solution", "num2people"), ID("conops0Solution", "num2roles"),
   ID("conops0Solution", "people2num"),
   ID("conops0Solution", "people_CASE"),
   ID("conops0Solution", "people_size"),
   ID("conops0Solution", "principals_CASE"),
   ID("conops0Solution", "principals_size"), ID("aclfoundation", "prop"),
   ID("aclfoundation", "quoting"), ID("aclfoundation", "reps"),
   ID("conops0Solution", "roles2num"), ID("conops0Solution", "roles_CASE"),
   ID("conops0Solution", "roles_size"), ID("aclrules", "sat"),
   ID("aclfoundation", "says"), ID("aclfoundation", "speaks_for"),
   ID("conops0Solution", "stand_down"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [2], TYOP [3], TYOP [1, 2, 1], TYV "'a", TYOP [1, 4, 4],
   TYOP [1, 4, 5], TYOP [1, 4, 6], TYOP [1, 2, 7], TYOP [4],
   TYOP [1, 9, 1], TYOP [5], TYOP [1, 11, 4], TYOP [1, 12, 4],
   TYOP [1, 12, 13], TYOP [1, 9, 14], TYOP [6], TYOP [1, 16, 1],
   TYOP [1, 16, 6], TYOP [1, 1, 2], TYOP [1, 1, 16], TYOP [1, 1, 0],
   TYOP [1, 11, 1], TYOP [1, 1, 4], TYOP [1, 23, 4], TYOP [1, 2, 4],
   TYOP [1, 25, 24], TYOP [1, 16, 4], TYOP [1, 27, 26], TYOP [1, 11, 28],
   TYOP [1, 0, 1], TYOP [1, 4, 7], TYOP [1, 4, 31], TYOP [1, 4, 32],
   TYOP [1, 0, 33], TYOP [1, 16, 11], TYOP [1, 2, 11], TYOP [1, 11, 9],
   TYOP [1, 1, 11], TYOP [7], TYOP [9, 2, 1], TYOP [9, 16, 40],
   TYOP [8, 41], TYOP [1, 42, 39], TYOP [8, 11], TYOP [1, 44, 39],
   TYV "'e", TYV "'d", TYV "'b", TYOP [10, 0, 48, 9, 47, 46],
   TYOP [11, 47], TYOP [11, 46], TYOP [1, 0, 39], TYOP [1, 11, 39],
   TYOP [1, 16, 39], TYOP [1, 9, 39], TYOP [1, 2, 39], TYOP [1, 0, 52],
   TYOP [1, 0, 57], TYOP [1, 0, 58], TYOP [1, 0, 59], TYOP [1, 0, 60],
   TYOP [1, 0, 4], TYOP [1, 9, 4], TYOP [1, 38, 39], TYOP [1, 36, 64],
   TYOP [1, 35, 65], TYOP [1, 16, 54], TYOP [1, 37, 39], TYOP [1, 37, 68],
   TYOP [1, 11, 42], TYOP [1, 9, 44], TYOP [1, 2, 56], TYOP [1, 2, 72],
   TYOP [1, 4, 39], TYOP [1, 74, 39], TYOP [1, 52, 39], TYOP [1, 76, 39],
   TYOP [1, 12, 39], TYOP [1, 78, 39], TYOP [1, 53, 39], TYOP [1, 80, 39],
   TYOP [1, 23, 39], TYOP [1, 82, 39], TYOP [1, 27, 39], TYOP [1, 84, 39],
   TYOP [1, 54, 39], TYOP [1, 86, 39], TYOP [1, 55, 39], TYOP [1, 88, 39],
   TYOP [1, 45, 39], TYOP [1, 90, 39], TYOP [1, 43, 39], TYOP [1, 92, 39],
   TYOP [1, 25, 39], TYOP [1, 94, 39], TYOP [1, 56, 39], TYOP [1, 96, 39],
   TYOP [1, 1, 39], TYOP [1, 98, 39], TYOP [1, 1, 1], TYOP [1, 1, 100],
   TYOP [9, 50, 51], TYOP [9, 49, 102], TYOP [1, 102, 103],
   TYOP [1, 49, 104], TYOP [1, 40, 41], TYOP [1, 16, 106],
   TYOP [1, 51, 102], TYOP [1, 50, 108], TYOP [1, 1, 40], TYOP [1, 2, 110],
   TYOP [1, 39, 39], TYOP [1, 39, 112], TYOP [1, 1, 98], TYOP [1, 4, 74],
   TYOP [1, 11, 53], TYOP [1, 9, 55], TYOP [1, 44, 45], TYOP [1, 42, 43],
   TYOP [1, 62, 39], TYOP [1, 120, 39], TYOP [1, 30, 39],
   TYOP [1, 122, 39], TYOP [1, 70, 39], TYOP [1, 124, 39],
   TYOP [1, 17, 39], TYOP [1, 126, 39], TYOP [1, 63, 39],
   TYOP [1, 128, 39], TYOP [1, 71, 39], TYOP [1, 130, 39], TYOP [1, 3, 39],
   TYOP [1, 132, 39], TYOP [1, 39, 6], TYOP [1, 1, 44], TYOP [1, 135, 44],
   TYOP [1, 11, 136], TYOP [1, 1, 137], TYOP [1, 1, 42], TYOP [1, 139, 42],
   TYOP [1, 41, 140], TYOP [1, 1, 141], TYOP [36, 9], TYOP [1, 9, 143],
   TYOP [1, 98, 122], TYOP [1, 98, 126], TYOP [1, 98, 132],
   TYOP [1, 45, 130], TYOP [1, 43, 124], TYOP [51, 0, 9, 47, 46],
   TYOP [1, 150, 150], TYOP [1, 143, 151], TYOP [1, 150, 151],
   TYOP [1, 0, 150], TYOP [1, 143, 143], TYOP [1, 143, 155],
   TYOP [1, 143, 152], TYOP [1, 150, 39], TYOP [1, 103, 158],
   TYOP [1, 143, 150], TYOP [1, 143, 160]]
  end
  val _ = Theory.incorporate_consts "conops0Solution" tyvector
     [("stand_down", 0), ("roles_size", 3), ("roles_CASE", 8),
      ("roles2num", 3), ("principals_size", 10), ("principals_CASE", 15),
      ("people_size", 17), ("people_CASE", 18), ("people2num", 17),
      ("num2roles", 19), ("num2people", 20), ("num2commands", 21),
      ("nogo", 0), ("launch", 0), ("keyPrinc_size", 22),
      ("keyPrinc_CASE", 29), ("go", 0), ("commands_size", 30),
      ("commands_CASE", 34), ("commands2num", 30), ("activate", 0),
      ("abort", 0), ("Staff", 35), ("Role", 36), ("PR", 37),
      ("Operator", 2), ("Key", 37), ("Commander", 2), ("CA", 2),
      ("Bob", 16), ("Ap", 38), ("Alice", 16)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'keyPrinc'", 43), TMV("'principals'", 45), TMV("M", 49),
   TMV("M", 0), TMV("M", 11), TMV("M", 16), TMV("M", 9), TMV("M", 2),
   TMV("M'", 0), TMV("M'", 11), TMV("M'", 16), TMV("M'", 9), TMV("M'", 2),
   TMV("Oi", 50), TMV("Os", 51), TMV("P", 52), TMV("P", 53), TMV("P", 54),
   TMV("P", 55), TMV("P", 56), TMV("a", 0), TMV("a", 11), TMV("a", 1),
   TMV("a", 16), TMV("a", 2), TMV("a'", 0), TMV("a'", 11), TMV("a'", 1),
   TMV("a'", 16), TMV("a'", 2), TMV("a0", 44), TMV("a0", 42),
   TMV("commands", 61), TMV("f", 62), TMV("f", 12), TMV("f", 27),
   TMV("f", 25), TMV("f'", 12), TMV("f'", 27), TMV("f0", 12),
   TMV("f0", 27), TMV("f1", 12), TMV("f1", 25), TMV("f1'", 12),
   TMV("f1'", 25), TMV("f2", 23), TMV("f2'", 23), TMV("fn", 12),
   TMV("fn", 63), TMV("k", 11), TMV("keyPrinc", 66), TMV("kk", 11),
   TMV("m", 1), TMV("n", 1), TMV("p", 16), TMV("p", 9), TMV("people", 67),
   TMV("pp", 9), TMV("principals", 69), TMV("r", 1), TMV("r", 2),
   TMV("r'", 1), TMV("rep", 30), TMV("rep", 70), TMV("rep", 17),
   TMV("rep", 71), TMV("rep", 3), TMV("roles", 73), TMV("v0", 4),
   TMV("v0'", 4), TMV("v1", 4), TMV("v1'", 4), TMV("v2", 4), TMV("v2'", 4),
   TMV("v3", 4), TMV("v3'", 4), TMV("v4", 4), TMV("v4'", 4), TMV("v5", 4),
   TMV("v5'", 4), TMV("x", 0), TMV("x", 16), TMV("x", 2), TMV("x0", 4),
   TMV("x1", 4), TMV("x2", 4), TMV("x3", 4), TMV("x4", 4), TMV("x5", 4),
   TMC(12, 75), TMC(12, 76), TMC(12, 77), TMC(12, 79), TMC(12, 81),
   TMC(12, 83), TMC(12, 85), TMC(12, 87), TMC(12, 89), TMC(12, 91),
   TMC(12, 93), TMC(12, 95), TMC(12, 97), TMC(12, 80), TMC(12, 99),
   TMC(12, 86), TMC(12, 88), TMC(12, 90), TMC(12, 92), TMC(12, 96),
   TMC(13, 101), TMC(14, 105), TMC(14, 107), TMC(14, 109), TMC(14, 111),
   TMC(15, 113), TMC(16, 1), TMC(17, 114), TMC(18, 115), TMC(18, 113),
   TMC(18, 57), TMC(18, 116), TMC(18, 114), TMC(18, 67), TMC(18, 117),
   TMC(18, 118), TMC(18, 119), TMC(18, 72), TMC(19, 113), TMC(20, 76),
   TMC(20, 121), TMC(20, 123), TMC(20, 79), TMC(20, 125), TMC(20, 85),
   TMC(20, 127), TMC(20, 129), TMC(20, 131), TMC(20, 95), TMC(20, 133),
   TMC(20, 80), TMC(20, 99), TMC(20, 86), TMC(20, 96), TMC(21, 1),
   TMC(21, 16), TMC(21, 2), TMC(22, 16), TMC(23, 38), TMC(24, 100),
   TMC(25, 100), TMC(26, 44), TMC(26, 42), TMC(27, 16), TMC(28, 2),
   TMC(29, 134), TMC(30, 138), TMC(30, 142), TMC(31, 2), TMC(32, 112),
   TMC(33, 37), TMC(34, 100), TMC(35, 144), TMC(37, 2), TMC(38, 37),
   TMC(39, 36), TMC(40, 100), TMC(41, 35), TMC(42, 145), TMC(42, 146),
   TMC(42, 147), TMC(42, 148), TMC(42, 149), TMC(43, 1), TMC(44, 113),
   TMC(45, 0), TMC(46, 0), TMC(47, 30), TMC(48, 34), TMC(49, 30),
   TMC(50, 152), TMC(52, 0), TMC(53, 153), TMC(54, 29), TMC(55, 22),
   TMC(56, 0), TMC(57, 0), TMC(58, 21), TMC(59, 20), TMC(60, 19),
   TMC(61, 17), TMC(62, 18), TMC(63, 17), TMC(64, 15), TMC(65, 10),
   TMC(66, 154), TMC(67, 156), TMC(68, 157), TMC(69, 3), TMC(70, 8),
   TMC(71, 3), TMC(72, 159), TMC(73, 152), TMC(74, 161), TMC(75, 0),
   TMC(76, 112)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op commands_TY_DEF x = x
    val op commands_TY_DEF =
    ThmBind.DT(((("conops0Solution",0),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%130%62%167%53%116$0@%160%149%149%172@4|@$0@|@"])
  fun op commands_BIJ x = x
    val op commands_BIJ =
    ThmBind.DT(((("conops0Solution",1),
                [("bool",[116]),("conops0Solution",[0])]),["DISK_THM"]),
               [ThmBind.read"%114%90%20%119%186%176$0@3$0@|@2%103%59%118%53%116$0@%160%149%149%172@4|$0@2%121%176%186$0@3$0@2|@2"])






  fun op commands_size_def x = x
    val op commands_size_def =
    ThmBind.DT(((("conops0Solution",17),[]),[]),
               [ThmBind.read"%90%80%121%178$0@2%115@|@"])
  fun op commands_CASE x = x
    val op commands_CASE =
    ThmBind.DT(((("conops0Solution",18),[]),[]),
               [ThmBind.read"%90%80%89%68%89%70%89%72%89%74%89%76%89%78%117%177$6@$5@$4@$3@$2@$1@$0@2%52%154%116$0@%160%149%172@4%154%121$0@%115@2$6@$5@2%154%116$0@%160%148%148%172@5$4@%154%116$0@%160%149%148%172@5$3@%154%121$0@%160%149%148%172@5$2@$1@4|%176$6@3|@|@|@|@|@|@|@"])
  fun op people_TY_DEF x = x
    val op people_TY_DEF =
    ThmBind.DT(((("conops0Solution",26),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%134%64%168%53%116$0@%160%149%172@3|@$0@|@"])
  fun op people_BIJ x = x
    val op people_BIJ =
    ThmBind.DT(((("conops0Solution",27),
                [("bool",[116]),("conops0Solution",[26])]),["DISK_THM"]),
               [ThmBind.read"%114%104%23%122%187%189$0@3$0@|@2%103%59%118%53%116$0@%160%149%172@3|$0@2%121%189%187$0@3$0@2|@2"])


  fun op people_size_def x = x
    val op people_size_def =
    ThmBind.DT(((("conops0Solution",39),[]),[]),
               [ThmBind.read"%104%81%121%191$0@2%115@|@"])
  fun op people_CASE x = x
    val op people_CASE =
    ThmBind.DT(((("conops0Solution",40),[]),[]),
               [ThmBind.read"%104%81%89%68%89%70%117%190$2@$1@$0@2%52%154%121$0@%115@2$2@$1@|%189$2@3|@|@|@"])
  fun op roles_TY_DEF x = x
    val op roles_TY_DEF =
    ThmBind.DT(((("conops0Solution",48),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%138%66%169%53%116$0@%160%148%148%172@4|@$0@|@"])
  fun op roles_BIJ x = x
    val op roles_BIJ =
    ThmBind.DT(((("conops0Solution",49),
                [("bool",[116]),("conops0Solution",[48])]),["DISK_THM"]),
               [ThmBind.read"%114%108%24%126%188%197$0@3$0@|@2%103%59%118%53%116$0@%160%148%148%172@4|$0@2%121%197%188$0@3$0@2|@2"])



  fun op roles_size_def x = x
    val op roles_size_def =
    ThmBind.DT(((("conops0Solution",62),[]),[]),
               [ThmBind.read"%108%82%121%199$0@2%115@|@"])
  fun op roles_CASE x = x
    val op roles_CASE =
    ThmBind.DT(((("conops0Solution",63),[]),[]),
               [ThmBind.read"%108%82%89%68%89%70%89%72%117%198$3@$2@$1@$0@2%52%154%116$0@%160%148%172@4$3@%154%121$0@%160%148%172@4$2@$1@2|%197$3@3|@|@|@|@"])
  fun op keyPrinc_TY_DEF x = x
    val op keyPrinc_TY_DEF =
    ThmBind.DT(((("conops0Solution",71),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%132%63%171%31%99%0%127%107%31%127%173%141%23%125$1@%23%156%115@%111$0@%113%145@%143@3%53%151|@|$0@2|@2%173%142%24%125$1@%24%156%165%115@2%111%144@%113$0@%143@3%53%151|@|$0@2|@2%140%22%125$1@%22%156%165%165%115@3%111%144@%113%145@$0@3%53%151|@|$0@2|@4$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op keyPrinc_case_def x = x
    val op keyPrinc_case_def =
    ThmBind.DT(((("conops0Solution",79),
                [("bool",[26,180]),
                 ("conops0Solution",[72,73,74,75,76,77,78]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%114%104%23%95%35%100%42%94%45%117%182%166$3@2$2@$1@$0@2$2$3@2|@|@|@|@2%114%108%24%95%35%100%42%94%45%117%182%164$3@2$2@$1@$0@2$1$3@2|@|@|@|@2%103%22%95%35%100%42%94%45%117%182%147$3@2$2@$1@$0@2$0$3@2|@|@|@|@3"])
  fun op keyPrinc_size_def x = x
    val op keyPrinc_size_def =
    ThmBind.DT(((("conops0Solution",80),
                [("bool",[26,180]),
                 ("conops0Solution",[72,73,74,75,76,77,78]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%114%104%23%121%183%166$0@3%109%160%148%172@3%191$0@3|@2%114%108%24%121%183%164$0@3%109%160%148%172@3%199$0@3|@2%103%22%121%183%147$0@3%109%160%148%172@3$0@2|@3"])
  fun op principals_TY_DEF x = x
    val op principals_TY_DEF =
    ThmBind.DT(((("conops0Solution",88),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%136%65%170%30%98%1%127%106%30%127%173%139%21%124$1@%21%155%115@$0@%53%150|@|$0@2|@2%139%21%124$1@%21%155%165%115@2$0@%53%150|@|$0@2|@3$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op principals_case_def x = x
    val op principals_case_def =
    ThmBind.DT(((("conops0Solution",94),
                [("bool",[26,180]),("conops0Solution",[89,90,91,92,93]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%114%102%21%92%34%92%41%117%192%163$2@2$1@$0@2$1$2@2|@|@|@2%102%21%92%34%92%41%117%192%159$2@2$1@$0@2$0$2@2|@|@|@2"])
  fun op principals_size_def x = x
    val op principals_size_def =
    ThmBind.DT(((("conops0Solution",95),
                [("bool",[26,180]),("conops0Solution",[89,90,91,92,93]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%114%102%21%121%193%163$0@3%109%160%148%172@3%183$0@3|@2%102%21%121%193%159$0@3%109%160%148%172@3%183$0@3|@2"])
  fun op num2commands_commands2num x = x
    val op num2commands_commands2num =
    ThmBind.DT(((("conops0Solution",2),
                [("conops0Solution",[1])]),["DISK_THM"]),
               [ThmBind.read"%90%20%119%186%176$0@3$0@|@"])
  fun op commands2num_num2commands x = x
    val op commands2num_num2commands =
    ThmBind.DT(((("conops0Solution",3),
                [("conops0Solution",[1])]),["DISK_THM"]),
               [ThmBind.read"%103%59%118%116$0@%160%149%149%172@5%121%176%186$0@3$0@2|@"])
  fun op num2commands_11 x = x
    val op num2commands_11 =
    ThmBind.DT(((("conops0Solution",4),
                [("bool",[26]),("conops0Solution",[1])]),["DISK_THM"]),
               [ThmBind.read"%103%59%103%61%127%116$1@%160%149%149%172@5%127%116$0@%160%149%149%172@5%118%119%186$1@2%186$0@3%121$1@$0@4|@|@"])
  fun op commands2num_11 x = x
    val op commands2num_11 =
    ThmBind.DT(((("conops0Solution",5),
                [("bool",[26]),("conops0Solution",[1])]),["DISK_THM"]),
               [ThmBind.read"%90%20%90%25%118%121%176$1@2%176$0@3%119$1@$0@2|@|@"])
  fun op num2commands_ONTO x = x
    val op num2commands_ONTO =
    ThmBind.DT(((("conops0Solution",6),
                [("bool",[25,62]),("conops0Solution",[1])]),["DISK_THM"]),
               [ThmBind.read"%90%20%140%59%114%119$1@%186$0@3%116$0@%160%149%149%172@5|@|@"])
  fun op commands2num_ONTO x = x
    val op commands2num_ONTO =
    ThmBind.DT(((("conops0Solution",7),
                [("bool",[26]),("conops0Solution",[1])]),["DISK_THM"]),
               [ThmBind.read"%103%59%118%116$0@%160%149%149%172@5%128%20%121$1@%176$0@2|@2|@"])
  fun op num2commands_thm x = x
    val op num2commands_thm =
    ThmBind.DT(((("conops0Solution",14),
                [("conops0Solution",[8,9,10,11,12,13])]),[]),
               [ThmBind.read"%114%119%186%115@2%180@2%114%119%186%160%148%172@4%185@2%114%119%186%160%149%172@4%184@2%114%119%186%160%148%148%172@5%174@2%114%119%186%160%149%148%172@5%175@2%119%186%160%148%149%172@5%203@6"])
  fun op commands2num_thm x = x
    val op commands2num_thm =
    ThmBind.DT(((("conops0Solution",15),
                [("bool",[25,53]),("conops0Solution",[3,8,9,10,11,12,13]),
                 ("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%114%121%176%180@2%115@2%114%121%176%185@2%160%148%172@4%114%121%176%184@2%160%149%172@4%114%121%176%174@2%160%148%148%172@5%114%121%176%175@2%160%149%148%172@5%121%176%203@2%160%148%149%172@9"])
  fun op commands_EQ_commands x = x
    val op commands_EQ_commands =
    ThmBind.DT(((("conops0Solution",16),
                [("bool",[57]),("conops0Solution",[5])]),["DISK_THM"]),
               [ThmBind.read"%90%20%90%25%118%119$1@$0@2%121%176$1@2%176$0@3|@|@"])
  fun op commands_case_def x = x
    val op commands_case_def =
    ThmBind.DT(((("conops0Solution",19),
                [("bool",[53,55,63]),("conops0Solution",[15,18]),
                 ("numeral",[3,6,7])]),["DISK_THM"]),
               [ThmBind.read"%114%89%68%89%70%89%72%89%74%89%76%89%78%117%177%180@$5@$4@$3@$2@$1@$0@2$5@|@|@|@|@|@|@2%114%89%68%89%70%89%72%89%74%89%76%89%78%117%177%185@$5@$4@$3@$2@$1@$0@2$4@|@|@|@|@|@|@2%114%89%68%89%70%89%72%89%74%89%76%89%78%117%177%184@$5@$4@$3@$2@$1@$0@2$3@|@|@|@|@|@|@2%114%89%68%89%70%89%72%89%74%89%76%89%78%117%177%174@$5@$4@$3@$2@$1@$0@2$2@|@|@|@|@|@|@2%114%89%68%89%70%89%72%89%74%89%76%89%78%117%177%175@$5@$4@$3@$2@$1@$0@2$1@|@|@|@|@|@|@2%89%68%89%70%89%72%89%74%89%76%89%78%117%177%203@$5@$4@$3@$2@$1@$0@2$0@|@|@|@|@|@|@6"])
  fun op datatype_commands x = x
    val op datatype_commands =
    ThmBind.DT(((("conops0Solution",20),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%158%32%180@%185@%184@%174@%175@%203@2"])
  fun op commands_distinct x = x
    val op commands_distinct =
    ThmBind.DT(((("conops0Solution",21),
                [("conops0Solution",[15,16]),
                 ("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%114%204%119%180@%185@3%114%204%119%180@%184@3%114%204%119%180@%174@3%114%204%119%180@%175@3%114%204%119%180@%203@3%114%204%119%185@%184@3%114%204%119%185@%174@3%114%204%119%185@%175@3%114%204%119%185@%203@3%114%204%119%184@%174@3%114%204%119%184@%175@3%114%204%119%184@%203@3%114%204%119%174@%175@3%114%204%119%174@%203@3%204%119%175@%203@16"])
  fun op commands_case_cong x = x
    val op commands_case_cong =
    ThmBind.DT(((("conops0Solution",22),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("conops0Solution",[6,8,9,10,11,12,13,19]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%90%3%90%8%89%68%89%70%89%72%89%74%89%76%89%78%127%114%119$7@$6@2%114%127%119$6@%180@2%117$5@%69@3%114%127%119$6@%185@2%117$4@%71@3%114%127%119$6@%184@2%117$3@%73@3%114%127%119$6@%174@2%117$2@%75@3%114%127%119$6@%175@2%117$1@%77@3%127%119$6@%203@2%117$0@%79@9%117%177$7@$5@$4@$3@$2@$1@$0@2%177$6@%69@%71@%73@%75@%77@%79@3|@|@|@|@|@|@|@|@"])
  fun op commands_nchotomy x = x
    val op commands_nchotomy =
    ThmBind.DT(((("conops0Solution",23),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("conops0Solution",[6,8,9,10,11,12,13]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%90%20%173%119$0@%180@2%173%119$0@%185@2%173%119$0@%184@2%173%119$0@%174@2%173%119$0@%175@2%119$0@%203@6|@"])
  fun op commands_Axiom x = x
    val op commands_Axiom =
    ThmBind.DT(((("conops0Solution",24),
                [("bool",[8,14,25,53,55,63]),("conops0Solution",[15]),
                 ("numeral",[3,8])]),["DISK_THM"]),
               [ThmBind.read"%89%83%89%84%89%85%89%86%89%87%89%88%129%33%114%117$0%180@2$6@2%114%117$0%185@2$5@2%114%117$0%184@2$4@2%114%117$0%174@2$3@2%114%117$0%175@2$2@2%117$0%203@2$1@6|@|@|@|@|@|@|@"])
  fun op commands_induction x = x
    val op commands_induction =
    ThmBind.DT(((("conops0Solution",25),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("conops0Solution",[6,8,9,10,11,12,13]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%91%15%127%114$0%174@2%114$0%175@2%114$0%180@2%114$0%184@2%114$0%185@2$0%203@7%90%20$1$0@|@2|@"])
  fun op num2people_people2num x = x
    val op num2people_people2num =
    ThmBind.DT(((("conops0Solution",28),
                [("conops0Solution",[27])]),["DISK_THM"]),
               [ThmBind.read"%104%23%122%187%189$0@3$0@|@"])
  fun op people2num_num2people x = x
    val op people2num_num2people =
    ThmBind.DT(((("conops0Solution",29),
                [("conops0Solution",[27])]),["DISK_THM"]),
               [ThmBind.read"%103%59%118%116$0@%160%149%172@4%121%189%187$0@3$0@2|@"])
  fun op num2people_11 x = x
    val op num2people_11 =
    ThmBind.DT(((("conops0Solution",30),
                [("bool",[26]),("conops0Solution",[27])]),["DISK_THM"]),
               [ThmBind.read"%103%59%103%61%127%116$1@%160%149%172@4%127%116$0@%160%149%172@4%118%122%187$1@2%187$0@3%121$1@$0@4|@|@"])
  fun op people2num_11 x = x
    val op people2num_11 =
    ThmBind.DT(((("conops0Solution",31),
                [("bool",[26]),("conops0Solution",[27])]),["DISK_THM"]),
               [ThmBind.read"%104%23%104%28%118%121%189$1@2%189$0@3%122$1@$0@2|@|@"])
  fun op num2people_ONTO x = x
    val op num2people_ONTO =
    ThmBind.DT(((("conops0Solution",32),
                [("bool",[25,62]),("conops0Solution",[27])]),["DISK_THM"]),
               [ThmBind.read"%104%23%140%59%114%122$1@%187$0@3%116$0@%160%149%172@4|@|@"])
  fun op people2num_ONTO x = x
    val op people2num_ONTO =
    ThmBind.DT(((("conops0Solution",33),
                [("bool",[26]),("conops0Solution",[27])]),["DISK_THM"]),
               [ThmBind.read"%103%59%118%116$0@%160%149%172@4%141%23%121$1@%189$0@2|@2|@"])
  fun op num2people_thm x = x
    val op num2people_thm =
    ThmBind.DT(((("conops0Solution",36),[("conops0Solution",[34,35])]),[]),
               [ThmBind.read"%114%122%187%115@2%146@2%122%187%160%148%172@4%152@2"])
  fun op people2num_thm x = x
    val op people2num_thm =
    ThmBind.DT(((("conops0Solution",37),
                [("bool",[25,53]),("conops0Solution",[29,34,35]),
                 ("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%114%121%189%146@2%115@2%121%189%152@2%160%148%172@4"])
  fun op people_EQ_people x = x
    val op people_EQ_people =
    ThmBind.DT(((("conops0Solution",38),
                [("bool",[57]),("conops0Solution",[31])]),["DISK_THM"]),
               [ThmBind.read"%104%23%104%28%118%122$1@$0@2%121%189$1@2%189$0@3|@|@"])
  fun op people_case_def x = x
    val op people_case_def =
    ThmBind.DT(((("conops0Solution",41),
                [("bool",[55,63]),("conops0Solution",[37,40]),
                 ("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%114%89%68%89%70%117%190%146@$1@$0@2$1@|@|@2%89%68%89%70%117%190%152@$1@$0@2$0@|@|@2"])
  fun op datatype_people x = x
    val op datatype_people =
    ThmBind.DT(((("conops0Solution",42),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%158%56%146@%152@2"])
  fun op people_distinct x = x
    val op people_distinct =
    ThmBind.DT(((("conops0Solution",43),
                [("conops0Solution",[37,38]),
                 ("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%204%122%146@%152@2"])
  fun op people_case_cong x = x
    val op people_case_cong =
    ThmBind.DT(((("conops0Solution",44),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("conops0Solution",[32,34,35,41]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%104%5%104%10%89%68%89%70%127%114%122$3@$2@2%114%127%122$2@%146@2%117$1@%69@3%127%122$2@%152@2%117$0@%71@5%117%190$3@$1@$0@2%190$2@%69@%71@3|@|@|@|@"])
  fun op people_nchotomy x = x
    val op people_nchotomy =
    ThmBind.DT(((("conops0Solution",45),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("conops0Solution",[32,34,35]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%104%23%173%122$0@%146@2%122$0@%152@2|@"])
  fun op people_Axiom x = x
    val op people_Axiom =
    ThmBind.DT(((("conops0Solution",46),
                [("bool",[8,14,25,55,63]),("conops0Solution",[37]),
                 ("numeral",[3,8])]),["DISK_THM"]),
               [ThmBind.read"%89%83%89%84%133%35%114%117$0%146@2$2@2%117$0%152@2$1@2|@|@|@"])
  fun op people_induction x = x
    val op people_induction =
    ThmBind.DT(((("conops0Solution",47),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("conops0Solution",[32,34,35]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%96%17%127%114$0%146@2$0%152@3%104%23$1$0@|@2|@"])
  fun op num2roles_roles2num x = x
    val op num2roles_roles2num =
    ThmBind.DT(((("conops0Solution",50),
                [("conops0Solution",[49])]),["DISK_THM"]),
               [ThmBind.read"%108%24%126%188%197$0@3$0@|@"])
  fun op roles2num_num2roles x = x
    val op roles2num_num2roles =
    ThmBind.DT(((("conops0Solution",51),
                [("conops0Solution",[49])]),["DISK_THM"]),
               [ThmBind.read"%103%59%118%116$0@%160%148%148%172@5%121%197%188$0@3$0@2|@"])
  fun op num2roles_11 x = x
    val op num2roles_11 =
    ThmBind.DT(((("conops0Solution",52),
                [("bool",[26]),("conops0Solution",[49])]),["DISK_THM"]),
               [ThmBind.read"%103%59%103%61%127%116$1@%160%148%148%172@5%127%116$0@%160%148%148%172@5%118%126%188$1@2%188$0@3%121$1@$0@4|@|@"])
  fun op roles2num_11 x = x
    val op roles2num_11 =
    ThmBind.DT(((("conops0Solution",53),
                [("bool",[26]),("conops0Solution",[49])]),["DISK_THM"]),
               [ThmBind.read"%108%24%108%29%118%121%197$1@2%197$0@3%126$1@$0@2|@|@"])
  fun op num2roles_ONTO x = x
    val op num2roles_ONTO =
    ThmBind.DT(((("conops0Solution",54),
                [("bool",[25,62]),("conops0Solution",[49])]),["DISK_THM"]),
               [ThmBind.read"%108%24%140%59%114%126$1@%188$0@3%116$0@%160%148%148%172@5|@|@"])
  fun op roles2num_ONTO x = x
    val op roles2num_ONTO =
    ThmBind.DT(((("conops0Solution",55),
                [("bool",[26]),("conops0Solution",[49])]),["DISK_THM"]),
               [ThmBind.read"%103%59%118%116$0@%160%148%148%172@5%142%24%121$1@%197$0@2|@2|@"])
  fun op num2roles_thm x = x
    val op num2roles_thm =
    ThmBind.DT(((("conops0Solution",59),
                [("conops0Solution",[56,57,58])]),[]),
               [ThmBind.read"%114%126%188%115@2%157@2%114%126%188%160%148%172@4%162@2%126%188%160%149%172@4%153@3"])
  fun op roles2num_thm x = x
    val op roles2num_thm =
    ThmBind.DT(((("conops0Solution",60),
                [("bool",[25]),("conops0Solution",[51,56,57,58]),
                 ("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%114%121%197%157@2%115@2%114%121%197%162@2%160%148%172@4%121%197%153@2%160%149%172@5"])
  fun op roles_EQ_roles x = x
    val op roles_EQ_roles =
    ThmBind.DT(((("conops0Solution",61),
                [("bool",[57]),("conops0Solution",[53])]),["DISK_THM"]),
               [ThmBind.read"%108%24%108%29%118%126$1@$0@2%121%197$1@2%197$0@3|@|@"])
  fun op roles_case_def x = x
    val op roles_case_def =
    ThmBind.DT(((("conops0Solution",64),
                [("bool",[55,63]),("conops0Solution",[60,63]),
                 ("numeral",[3,6,7])]),["DISK_THM"]),
               [ThmBind.read"%114%89%68%89%70%89%72%117%198%157@$2@$1@$0@2$2@|@|@|@2%114%89%68%89%70%89%72%117%198%162@$2@$1@$0@2$1@|@|@|@2%89%68%89%70%89%72%117%198%153@$2@$1@$0@2$0@|@|@|@3"])
  fun op datatype_roles x = x
    val op datatype_roles =
    ThmBind.DT(((("conops0Solution",65),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%158%67%157@%162@%153@2"])
  fun op roles_distinct x = x
    val op roles_distinct =
    ThmBind.DT(((("conops0Solution",66),
                [("conops0Solution",[60,61]),
                 ("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%114%204%126%157@%162@3%114%204%126%157@%153@3%204%126%162@%153@4"])
  fun op roles_case_cong x = x
    val op roles_case_cong =
    ThmBind.DT(((("conops0Solution",67),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("conops0Solution",[54,56,57,58,64]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%108%7%108%12%89%68%89%70%89%72%127%114%126$4@$3@2%114%127%126$3@%157@2%117$2@%69@3%114%127%126$3@%162@2%117$1@%71@3%127%126$3@%153@2%117$0@%73@6%117%198$4@$2@$1@$0@2%198$3@%69@%71@%73@3|@|@|@|@|@"])
  fun op roles_nchotomy x = x
    val op roles_nchotomy =
    ThmBind.DT(((("conops0Solution",68),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("conops0Solution",[54,56,57,58]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%108%24%173%126$0@%157@2%173%126$0@%162@2%126$0@%153@3|@"])
  fun op roles_Axiom x = x
    val op roles_Axiom =
    ThmBind.DT(((("conops0Solution",69),
                [("bool",[8,14,25,53,55,63]),("conops0Solution",[60]),
                 ("numeral",[3,8])]),["DISK_THM"]),
               [ThmBind.read"%89%83%89%84%89%85%137%36%114%117$0%157@2$3@2%114%117$0%162@2$2@2%117$0%153@2$1@3|@|@|@|@"])
  fun op roles_induction x = x
    val op roles_induction =
    ThmBind.DT(((("conops0Solution",70),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("conops0Solution",[54,56,57,58]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%101%19%127%114$0%153@2%114$0%157@2$0%162@4%108%24$1$0@|@2|@"])
  fun op datatype_keyPrinc x = x
    val op datatype_keyPrinc =
    ThmBind.DT(((("conops0Solution",81),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%158%50%166@%164@%147@2"])
  fun op keyPrinc_11 x = x
    val op keyPrinc_11 =
    ThmBind.DT(((("conops0Solution",82),
                [("bool",[26,55,62,180]),
                 ("conops0Solution",[72,73,74,75,76,77,78]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%114%104%23%104%28%118%120%166$1@2%166$0@3%122$1@$0@2|@|@2%114%108%24%108%29%118%120%164$1@2%164$0@3%126$1@$0@2|@|@2%103%22%103%27%118%120%147$1@2%147$0@3%121$1@$0@2|@|@3"])
  fun op keyPrinc_distinct x = x
    val op keyPrinc_distinct =
    ThmBind.DT(((("conops0Solution",83),
                [("bool",[25,26,35,46,50,53,55,62,180]),
                 ("conops0Solution",[72,73,74,75,76,77,78]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%114%108%29%104%23%204%120%166$0@2%164$1@3|@|@2%114%103%27%104%23%204%120%166$0@2%147$1@3|@|@2%103%27%108%24%204%120%164$0@2%147$1@3|@|@3"])
  fun op keyPrinc_case_cong x = x
    val op keyPrinc_case_cong =
    ThmBind.DT(((("conops0Solution",84),
                [("bool",[26,180]),
                 ("conops0Solution",
                 [72,73,74,75,76,77,78,79])]),["DISK_THM"]),
               [ThmBind.read"%102%4%102%9%95%35%100%42%94%45%127%114%120$4@$3@2%114%104%23%127%120$4@%166$0@3%117$3$0@2%38$0@3|@2%114%108%24%127%120$4@%164$0@3%117$2$0@2%44$0@3|@2%103%22%127%120$4@%147$0@3%117$1$0@2%46$0@3|@5%117%182$4@$2@$1@$0@2%182$3@%38@%44@%46@3|@|@|@|@|@"])
  fun op keyPrinc_nchotomy x = x
    val op keyPrinc_nchotomy =
    ThmBind.DT(((("conops0Solution",85),
                [("bool",[26,180]),
                 ("conops0Solution",
                 [72,73,74,75,76,77,78])]),["DISK_THM"]),
               [ThmBind.read"%102%51%173%141%54%120$1@%166$0@2|@2%173%142%60%120$1@%164$0@2|@2%140%53%120$1@%147$0@2|@3|@"])
  fun op keyPrinc_Axiom x = x
    val op keyPrinc_Axiom =
    ThmBind.DT(((("conops0Solution",86),
                [("bool",[26,180]),
                 ("conops0Solution",[72,73,74,75,76,77,78]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%95%40%100%42%94%45%131%47%114%104%23%117$1%166$0@3$4$0@2|@2%114%108%24%117$1%164$0@3$3$0@2|@2%103%22%117$1%147$0@3$2$0@2|@3|@|@|@|@"])
  fun op keyPrinc_induction x = x
    val op keyPrinc_induction =
    ThmBind.DT(((("conops0Solution",87),
                [("bool",[26]),
                 ("conops0Solution",
                 [72,73,74,75,76,77,78])]),["DISK_THM"]),
               [ThmBind.read"%93%16%127%114%104%54$1%166$0@2|@2%114%108%60$1%164$0@2|@2%103%53$1%147$0@2|@4%102%49$1$0@|@2|@"])
  fun op datatype_principals x = x
    val op datatype_principals =
    ThmBind.DT(((("conops0Solution",96),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%158%58%163@%159@2"])
  fun op principals_11 x = x
    val op principals_11 =
    ThmBind.DT(((("conops0Solution",97),
                [("bool",[26,55,62,180]),
                 ("conops0Solution",[89,90,91,92,93]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%114%102%21%102%26%118%123%163$1@2%163$0@3%120$1@$0@2|@|@2%102%21%102%26%118%123%159$1@2%159$0@3%120$1@$0@2|@|@2"])
  fun op principals_distinct x = x
    val op principals_distinct =
    ThmBind.DT(((("conops0Solution",98),
                [("bool",[25,26,46,53,62,180]),
                 ("conops0Solution",[89,90,91,92,93]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%102%26%102%21%204%123%163$0@2%159$1@3|@|@"])
  fun op principals_case_cong x = x
    val op principals_case_cong =
    ThmBind.DT(((("conops0Solution",99),
                [("bool",[26,180]),
                 ("conops0Solution",[89,90,91,92,93,94])]),["DISK_THM"]),
               [ThmBind.read"%105%6%105%11%92%34%92%41%127%114%123$3@$2@2%114%102%21%127%123$3@%163$0@3%117$2$0@2%37$0@3|@2%102%21%127%123$3@%159$0@3%117$1$0@2%43$0@3|@4%117%192$3@$1@$0@2%192$2@%37@%43@3|@|@|@|@"])
  fun op principals_nchotomy x = x
    val op principals_nchotomy =
    ThmBind.DT(((("conops0Solution",100),
                [("bool",[26,180]),
                 ("conops0Solution",[89,90,91,92,93])]),["DISK_THM"]),
               [ThmBind.read"%105%57%173%139%49%123$1@%163$0@2|@2%139%49%123$1@%159$0@2|@2|@"])
  fun op principals_Axiom x = x
    val op principals_Axiom =
    ThmBind.DT(((("conops0Solution",101),
                [("bool",[26,180]),("conops0Solution",[89,90,91,92,93]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%92%39%92%41%135%48%114%102%21%117$1%163$0@3$3$0@2|@2%102%21%117$1%159$0@3$2$0@2|@2|@|@|@"])
  fun op principals_induction x = x
    val op principals_induction =
    ThmBind.DT(((("conops0Solution",102),
                [("bool",[26]),
                 ("conops0Solution",[89,90,91,92,93])]),["DISK_THM"]),
               [ThmBind.read"%97%18%127%114%102%49$1%163$0@2|@2%102%49$1%159$0@2|@3%105%55$1$0@|@2|@"])
  fun op OpRuleLaunch_thm x = x
    val op OpRuleLaunch_thm =
    ThmBind.DT(((("conops0Solution",103),
                [("aclDrules",[3,4,16]),
                 ("aclrules",[23,24,32,33])]),["DISK_THM"]),
               [ThmBind.read"%127%200%110%2@%112%13@%14@3%179%161%163%164%157@4%194%180@4%127%200%110%2@%112%13@%14@3%196%161%163%166%146@4%161%163%164%157@4%194%180@4%127%200%110%2@%112%13@%14@3%201%195%161%159%166%146@4%161%163%164%157@5%194%180@4%127%200%110%2@%112%13@%14@3%181%194%180@2%194%184@4%127%200%110%2@%112%13@%14@3%202%161%159%164%153@4%161%163%164%153@6%127%200%110%2@%112%13@%14@3%201%161%159%164%153@4%202%161%159%166%146@4%161%163%166%146@7%127%200%110%2@%112%13@%14@3%179%161%163%164%153@4%202%161%159%166%146@4%161%163%166%146@7%200%110%2@%112%13@%14@3%201%195%161%159%166%152@4%161%163%164%162@5%194%184@10"])
  fun op OpRuleAbort_thm x = x
    val op OpRuleAbort_thm =
    ThmBind.DT(((("conops0Solution",104),
                [("aclDrules",[3,4,16]),
                 ("aclrules",[23,24,32,33])]),["DISK_THM"]),
               [ThmBind.read"%127%200%110%2@%112%13@%14@3%179%161%163%164%157@4%194%185@4%127%200%110%2@%112%13@%14@3%196%161%163%166%146@4%161%163%164%157@4%194%185@4%127%200%110%2@%112%13@%14@3%201%195%161%159%166%146@4%161%163%164%157@5%194%185@4%127%200%110%2@%112%13@%14@3%181%194%185@2%194%174@4%127%200%110%2@%112%13@%14@3%202%161%159%164%153@4%161%163%164%153@6%127%200%110%2@%112%13@%14@3%201%161%159%164%153@4%202%161%159%166%146@4%161%163%166%146@7%127%200%110%2@%112%13@%14@3%179%161%163%164%153@4%202%161%159%166%146@4%161%163%166%146@7%200%110%2@%112%13@%14@3%201%195%161%159%166%152@4%161%163%164%162@5%194%174@10"])
  fun op ApRuleActivate_thm x = x
    val op ApRuleActivate_thm =
    ThmBind.DT(((("conops0Solution",105),
                [("aclDrules",[3,4,16]),
                 ("aclrules",[23,32,33])]),["DISK_THM"]),
               [ThmBind.read"%127%200%110%2@%112%13@%14@3%179%161%163%164%162@4%194%184@4%127%200%110%2@%112%13@%14@3%196%161%163%166%152@4%161%163%164%162@4%194%184@4%127%200%110%2@%112%13@%14@3%201%195%161%159%166%152@4%161%163%164%162@5%194%184@4%127%200%110%2@%112%13@%14@3%181%194%184@2%194%175@4%127%200%110%2@%112%13@%14@3%202%161%159%164%153@4%161%163%164%153@6%127%200%110%2@%112%13@%14@3%201%161%159%164%153@4%202%161%159%166%152@4%161%163%166%152@7%127%200%110%2@%112%13@%14@3%179%161%163%164%153@4%202%161%159%166%152@4%161%163%166%152@7%200%110%2@%112%13@%14@3%194%175@9"])
  fun op ApRuleStandDown_thm x = x
    val op ApRuleStandDown_thm =
    ThmBind.DT(((("conops0Solution",106),
                [("aclDrules",[3,4,16]),
                 ("aclrules",[23,32,33])]),["DISK_THM"]),
               [ThmBind.read"%127%200%110%2@%112%13@%14@3%179%161%163%164%162@4%194%174@4%127%200%110%2@%112%13@%14@3%196%161%163%166%152@4%161%163%164%162@4%194%174@4%127%200%110%2@%112%13@%14@3%201%195%161%159%166%152@4%161%163%164%162@5%194%174@4%127%200%110%2@%112%13@%14@3%181%194%174@2%194%203@4%127%200%110%2@%112%13@%14@3%202%161%159%164%153@4%161%163%164%153@6%127%200%110%2@%112%13@%14@3%201%161%159%164%153@4%202%161%159%166%152@4%161%163%166%152@7%127%200%110%2@%112%13@%14@3%179%161%163%164%153@4%202%161%159%166%152@4%161%163%166%152@7%200%110%2@%112%13@%14@3%194%203@9"])

  val _ = DB.bindl "conops0Solution"
  [("commands_TY_DEF",commands_TY_DEF,DB.Def),
   ("commands_BIJ",commands_BIJ,DB.Def),
   ("commands_size_def",commands_size_def,DB.Def),
   ("commands_CASE",commands_CASE,DB.Def),
   ("people_TY_DEF",people_TY_DEF,DB.Def),
   ("people_BIJ",people_BIJ,DB.Def),
   ("people_size_def",people_size_def,DB.Def),
   ("people_CASE",people_CASE,DB.Def),
   ("roles_TY_DEF",roles_TY_DEF,DB.Def), ("roles_BIJ",roles_BIJ,DB.Def),
   ("roles_size_def",roles_size_def,DB.Def),
   ("roles_CASE",roles_CASE,DB.Def),
   ("keyPrinc_TY_DEF",keyPrinc_TY_DEF,DB.Def),
   ("keyPrinc_case_def",keyPrinc_case_def,DB.Def),
   ("keyPrinc_size_def",keyPrinc_size_def,DB.Def),
   ("principals_TY_DEF",principals_TY_DEF,DB.Def),
   ("principals_case_def",principals_case_def,DB.Def),
   ("principals_size_def",principals_size_def,DB.Def),
   ("num2commands_commands2num",num2commands_commands2num,DB.Thm),
   ("commands2num_num2commands",commands2num_num2commands,DB.Thm),
   ("num2commands_11",num2commands_11,DB.Thm),
   ("commands2num_11",commands2num_11,DB.Thm),
   ("num2commands_ONTO",num2commands_ONTO,DB.Thm),
   ("commands2num_ONTO",commands2num_ONTO,DB.Thm),
   ("num2commands_thm",num2commands_thm,DB.Thm),
   ("commands2num_thm",commands2num_thm,DB.Thm),
   ("commands_EQ_commands",commands_EQ_commands,DB.Thm),
   ("commands_case_def",commands_case_def,DB.Thm),
   ("datatype_commands",datatype_commands,DB.Thm),
   ("commands_distinct",commands_distinct,DB.Thm),
   ("commands_case_cong",commands_case_cong,DB.Thm),
   ("commands_nchotomy",commands_nchotomy,DB.Thm),
   ("commands_Axiom",commands_Axiom,DB.Thm),
   ("commands_induction",commands_induction,DB.Thm),
   ("num2people_people2num",num2people_people2num,DB.Thm),
   ("people2num_num2people",people2num_num2people,DB.Thm),
   ("num2people_11",num2people_11,DB.Thm),
   ("people2num_11",people2num_11,DB.Thm),
   ("num2people_ONTO",num2people_ONTO,DB.Thm),
   ("people2num_ONTO",people2num_ONTO,DB.Thm),
   ("num2people_thm",num2people_thm,DB.Thm),
   ("people2num_thm",people2num_thm,DB.Thm),
   ("people_EQ_people",people_EQ_people,DB.Thm),
   ("people_case_def",people_case_def,DB.Thm),
   ("datatype_people",datatype_people,DB.Thm),
   ("people_distinct",people_distinct,DB.Thm),
   ("people_case_cong",people_case_cong,DB.Thm),
   ("people_nchotomy",people_nchotomy,DB.Thm),
   ("people_Axiom",people_Axiom,DB.Thm),
   ("people_induction",people_induction,DB.Thm),
   ("num2roles_roles2num",num2roles_roles2num,DB.Thm),
   ("roles2num_num2roles",roles2num_num2roles,DB.Thm),
   ("num2roles_11",num2roles_11,DB.Thm),
   ("roles2num_11",roles2num_11,DB.Thm),
   ("num2roles_ONTO",num2roles_ONTO,DB.Thm),
   ("roles2num_ONTO",roles2num_ONTO,DB.Thm),
   ("num2roles_thm",num2roles_thm,DB.Thm),
   ("roles2num_thm",roles2num_thm,DB.Thm),
   ("roles_EQ_roles",roles_EQ_roles,DB.Thm),
   ("roles_case_def",roles_case_def,DB.Thm),
   ("datatype_roles",datatype_roles,DB.Thm),
   ("roles_distinct",roles_distinct,DB.Thm),
   ("roles_case_cong",roles_case_cong,DB.Thm),
   ("roles_nchotomy",roles_nchotomy,DB.Thm),
   ("roles_Axiom",roles_Axiom,DB.Thm),
   ("roles_induction",roles_induction,DB.Thm),
   ("datatype_keyPrinc",datatype_keyPrinc,DB.Thm),
   ("keyPrinc_11",keyPrinc_11,DB.Thm),
   ("keyPrinc_distinct",keyPrinc_distinct,DB.Thm),
   ("keyPrinc_case_cong",keyPrinc_case_cong,DB.Thm),
   ("keyPrinc_nchotomy",keyPrinc_nchotomy,DB.Thm),
   ("keyPrinc_Axiom",keyPrinc_Axiom,DB.Thm),
   ("keyPrinc_induction",keyPrinc_induction,DB.Thm),
   ("datatype_principals",datatype_principals,DB.Thm),
   ("principals_11",principals_11,DB.Thm),
   ("principals_distinct",principals_distinct,DB.Thm),
   ("principals_case_cong",principals_case_cong,DB.Thm),
   ("principals_nchotomy",principals_nchotomy,DB.Thm),
   ("principals_Axiom",principals_Axiom,DB.Thm),
   ("principals_induction",principals_induction,DB.Thm),
   ("OpRuleLaunch_thm",OpRuleLaunch_thm,DB.Thm),
   ("OpRuleAbort_thm",OpRuleAbort_thm,DB.Thm),
   ("ApRuleActivate_thm",ApRuleActivate_thm,DB.Thm),
   ("ApRuleStandDown_thm",ApRuleStandDown_thm,DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "conops0Solution",
    thydataty = "TypeGrammarDeltas",
    read = ThmBind.read,
    data =
        "NTY15.conops0Solution,8.commandsNTY15.conops0Solution,6.peopleNTY15.conops0Solution,5.rolesNTY15.conops0Solution,8.keyPrincNTY15.conops0Solution,10.principals"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "conops0Solution",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO12.commands2num4.%176OO12.num2commands4.%186OO2.go4.%180OO4.nogo4.%185OO6.launch4.%184OO5.abort4.%174OO8.activate4.%175OO10.stand_down4.%203OO13.commands_size4.%178OO13.commands_CASE4.%177OO4.case4.%177OO10.people2num4.%189OO10.num2people4.%187OO5.Alice4.%146OO3.Bob4.%152OO11.people_size4.%191OO11.people_CASE4.%190OO4.case4.%190OO9.roles2num4.%197OO9.num2roles4.%188OO9.Commander4.%157OO8.Operator4.%162OO2.CA4.%153OO10.roles_size4.%199OO10.roles_CASE4.%198OO4.case4.%198OO5.Staff4.%166OO4.Role4.%164OO2.Ap4.%147OO13.keyPrinc_CASE4.%182OO13.keyPrinc_size4.%183OO4.case4.%182OO2.PR4.%163OO3.Key4.%159OO15.principals_CASE4.%192OO15.principals_size4.%193OO4.case4.%192"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val conops0Solution_grammars = merge_grammars ["aclDrules"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="conops0Solution"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val conops0Solution_grammars = 
    Portable.## (addtyUDs,addtmUDs) conops0Solution_grammars
  val _ = Parse.grammarDB_insert("conops0Solution",conops0Solution_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG commands_Axiom,
           case_def=commands_case_def,
           case_cong=commands_case_cong,
           induction=ORIG commands_induction,
           nchotomy=commands_nchotomy,
           size=SOME(Parse.Term`(conops0Solution$commands_size) :conops0Solution$commands -> num$num`,
                     ORIG commands_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME commands_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2commands_thm commands2num_thm NONE tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG people_Axiom,
           case_def=people_case_def,
           case_cong=people_case_cong,
           induction=ORIG people_induction,
           nchotomy=people_nchotomy,
           size=SOME(Parse.Term`(conops0Solution$people_size) :conops0Solution$people -> num$num`,
                     ORIG people_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME people_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2people_thm people2num_thm NONE tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG roles_Axiom,
           case_def=roles_case_def,
           case_cong=roles_case_cong,
           induction=ORIG roles_induction,
           nchotomy=roles_nchotomy,
           size=SOME(Parse.Term`(conops0Solution$roles_size) :conops0Solution$roles -> num$num`,
                     ORIG roles_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME roles_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2roles_thm roles2num_thm NONE tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG keyPrinc_Axiom,
           case_def=keyPrinc_case_def,
           case_cong=keyPrinc_case_cong,
           induction=ORIG keyPrinc_induction,
           nchotomy=keyPrinc_nchotomy,
           size=SOME(Parse.Term`(conops0Solution$keyPrinc_size) :conops0Solution$keyPrinc -> num$num`,
                     ORIG keyPrinc_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME keyPrinc_11,
           distinct=SOME keyPrinc_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG principals_Axiom,
           case_def=principals_case_def,
           case_cong=principals_case_cong,
           induction=ORIG principals_induction,
           nchotomy=principals_nchotomy,
           size=SOME(Parse.Term`(conops0Solution$principals_size) :conops0Solution$principals -> num$num`,
                     ORIG principals_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME principals_11,
           distinct=SOME principals_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "conops0Solution"
end
