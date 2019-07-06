structure principalTheory :> principalTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading principalTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open cipherTheory
  in end;
  val _ = Theory.link_parents
          ("principal",
          Arbnum.fromString "1555472138",
          Arbnum.fromString "337809")
          [("cipher",
           Arbnum.fromString "1555472117",
           Arbnum.fromString "400160")];
  val _ = Theory.incorporate_types "principal"
       [("staff", 0), ("role", 0), ("principal", 0), ("authority", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("num", "num"), ID("principal", "staff"),
   ID("principal", "role"), ID("principal", "principal"),
   ID("cipher", "pKey"), ID("principal", "authority"), ID("min", "bool"),
   ID("ind_type", "recspace"), ID("pair", "prod"), ID("bool", "!"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("min", "="), ID("min", "==>"),
   ID("bool", "?"), ID("bool", "ARB"), ID("principal", "Alice"),
   ID("principal", "Authority"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("ind_type", "BOTTOM"),
   ID("principal", "Bob"), ID("bool", "COND"), ID("ind_type", "CONSTR"),
   ID("principal", "Carol"), ID("principal", "Commander"),
   ID("bool", "DATATYPE"), ID("principal", "KeyA"),
   ID("principal", "KeyS"), ID("principal", "Machine"),
   ID("arithmetic", "NUMERAL"), ID("principal", "Operator"),
   ID("principal", "Role"), ID("num", "SUC"), ID("principal", "Staff"),
   ID("bool", "TYPE_DEFINITION"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("principal", "authority_CASE"),
   ID("principal", "authority_size"), ID("principal", "ca"),
   ID("principal", "num2role"), ID("principal", "num2staff"),
   ID("cipher", "pKey_size"), ID("principal", "principal_CASE"),
   ID("principal", "principal_size"), ID("principal", "role2num"),
   ID("principal", "role_CASE"), ID("principal", "role_size"),
   ID("principal", "staff2num"), ID("principal", "staff_CASE"),
   ID("principal", "staff_size"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYV "'a", TYOP [0, 3, 3],
   TYOP [0, 3, 4], TYOP [0, 3, 5], TYOP [0, 1, 6], TYOP [3],
   TYOP [0, 8, 0], TYOP [0, 8, 5], TYOP [4], TYOP [0, 11, 0],
   TYOP [0, 0, 3], TYOP [0, 13, 3], TYOP [6], TYOP [5, 15],
   TYOP [0, 16, 3], TYOP [0, 17, 14], TYOP [5, 1], TYOP [0, 19, 3],
   TYOP [0, 20, 18], TYOP [0, 8, 3], TYOP [0, 22, 21], TYOP [0, 15, 3],
   TYOP [0, 24, 23], TYOP [0, 1, 3], TYOP [0, 26, 25], TYOP [0, 11, 27],
   TYOP [0, 0, 1], TYOP [0, 0, 8], TYOP [0, 0, 15], TYOP [0, 15, 0],
   TYOP [0, 15, 14], TYOP [0, 1, 11], TYOP [0, 8, 11], TYOP [0, 0, 11],
   TYOP [0, 19, 11], TYOP [0, 16, 11], TYOP [0, 15, 11], TYOP [7],
   TYOP [8, 0], TYOP [0, 41, 40], TYOP [9, 16, 0], TYOP [9, 19, 43],
   TYOP [9, 8, 44], TYOP [9, 15, 45], TYOP [9, 1, 46], TYOP [8, 47],
   TYOP [0, 48, 40], TYOP [0, 15, 40], TYOP [0, 11, 40], TYOP [0, 8, 40],
   TYOP [0, 1, 40], TYOP [0, 31, 40], TYOP [0, 11, 3], TYOP [0, 36, 40],
   TYOP [0, 38, 56], TYOP [0, 37, 57], TYOP [0, 35, 58], TYOP [0, 39, 59],
   TYOP [0, 34, 60], TYOP [0, 15, 41], TYOP [0, 11, 48], TYOP [0, 8, 52],
   TYOP [0, 1, 53], TYOP [0, 1, 65], TYOP [0, 3, 40], TYOP [0, 67, 40],
   TYOP [0, 50, 40], TYOP [0, 24, 40], TYOP [0, 70, 40], TYOP [0, 69, 40],
   TYOP [0, 13, 40], TYOP [0, 73, 40], TYOP [0, 17, 40], TYOP [0, 75, 40],
   TYOP [0, 20, 40], TYOP [0, 77, 40], TYOP [0, 51, 40], TYOP [0, 79, 40],
   TYOP [0, 42, 40], TYOP [0, 81, 40], TYOP [0, 49, 40], TYOP [0, 83, 40],
   TYOP [0, 22, 40], TYOP [0, 85, 40], TYOP [0, 52, 40], TYOP [0, 87, 40],
   TYOP [0, 26, 40], TYOP [0, 89, 40], TYOP [0, 53, 40], TYOP [0, 91, 40],
   TYOP [0, 0, 40], TYOP [0, 93, 40], TYOP [0, 16, 40], TYOP [0, 95, 40],
   TYOP [0, 19, 40], TYOP [0, 97, 40], TYOP [0, 0, 0], TYOP [0, 0, 99],
   TYOP [0, 45, 46], TYOP [0, 15, 101], TYOP [0, 0, 43], TYOP [0, 16, 103],
   TYOP [0, 43, 44], TYOP [0, 19, 105], TYOP [0, 44, 45], TYOP [0, 8, 107],
   TYOP [0, 46, 47], TYOP [0, 1, 109], TYOP [0, 40, 40], TYOP [0, 40, 111],
   TYOP [0, 0, 93], TYOP [0, 3, 67], TYOP [0, 15, 50], TYOP [0, 16, 95],
   TYOP [0, 19, 97], TYOP [0, 11, 51], TYOP [0, 41, 42], TYOP [0, 48, 49],
   TYOP [0, 62, 40], TYOP [0, 121, 40], TYOP [0, 55, 40],
   TYOP [0, 123, 40], TYOP [0, 63, 40], TYOP [0, 125, 40], TYOP [0, 9, 40],
   TYOP [0, 127, 40], TYOP [0, 2, 40], TYOP [0, 129, 40], TYOP [0, 40, 5],
   TYOP [0, 0, 41], TYOP [0, 132, 41], TYOP [0, 0, 133], TYOP [0, 0, 134],
   TYOP [0, 0, 48], TYOP [0, 136, 48], TYOP [0, 47, 137], TYOP [0, 0, 138],
   TYOP [0, 93, 127], TYOP [0, 93, 129], TYOP [0, 42, 121],
   TYOP [0, 49, 125], TYOP [0, 16, 0], TYOP [0, 32, 144], TYOP [0, 19, 0],
   TYOP [0, 2, 146]]
  end
  val _ = Theory.incorporate_consts "principal" tyvector
     [("staff_size", 2), ("staff_CASE", 7), ("staff2num", 2),
      ("role_size", 9), ("role_CASE", 10), ("role2num", 9),
      ("principal_size", 12), ("principal_CASE", 28), ("num2staff", 29),
      ("num2role", 30), ("ca", 31), ("authority_size", 32),
      ("authority_CASE", 33), ("Staff", 34), ("Role", 35), ("Operator", 8),
      ("Machine", 36), ("KeyS", 37), ("KeyA", 38), ("Commander", 8),
      ("Carol", 1), ("Bob", 1), ("Authority", 39), ("Alice", 1)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'authority'", 42), TMV("'principal'", 49), TMV("M", 15),
   TMV("M", 11), TMV("M", 8), TMV("M", 1), TMV("M'", 15), TMV("M'", 11),
   TMV("M'", 8), TMV("M'", 1), TMV("P", 50), TMV("P", 51), TMV("P", 52),
   TMV("P", 53), TMV("a", 15), TMV("a", 0), TMV("a", 16), TMV("a", 19),
   TMV("a", 8), TMV("a", 1), TMV("a'", 15), TMV("a'", 0), TMV("a'", 16),
   TMV("a'", 19), TMV("a'", 8), TMV("a'", 1), TMV("a0", 41), TMV("a0", 48),
   TMV("aa", 15), TMV("authority", 54), TMV("f", 13), TMV("f", 22),
   TMV("f", 26), TMV("f'", 13), TMV("f'", 26), TMV("f0", 26),
   TMV("f1", 24), TMV("f1'", 24), TMV("f2", 22), TMV("f2'", 22),
   TMV("f3", 20), TMV("f3'", 20), TMV("f4", 17), TMV("f4'", 17),
   TMV("f5", 13), TMV("f5'", 13), TMV("fn", 24), TMV("fn", 55),
   TMV("m", 0), TMV("n", 0), TMV("p", 16), TMV("p", 19), TMV("p", 11),
   TMV("pp", 11), TMV("principal", 61), TMV("r", 0), TMV("r", 8),
   TMV("r'", 0), TMV("rep", 62), TMV("rep", 63), TMV("rep", 9),
   TMV("rep", 2), TMV("role", 64), TMV("s", 1), TMV("staff", 66),
   TMV("v0", 3), TMV("v0'", 3), TMV("v1", 3), TMV("v1'", 3), TMV("v2", 3),
   TMV("v2'", 3), TMV("x", 8), TMV("x", 1), TMV("x0", 3), TMV("x1", 3),
   TMV("x2", 3), TMC(10, 68), TMC(10, 69), TMC(10, 71), TMC(10, 72),
   TMC(10, 74), TMC(10, 76), TMC(10, 78), TMC(10, 80), TMC(10, 82),
   TMC(10, 84), TMC(10, 86), TMC(10, 88), TMC(10, 90), TMC(10, 92),
   TMC(10, 94), TMC(10, 96), TMC(10, 98), TMC(10, 79), TMC(10, 81),
   TMC(10, 83), TMC(10, 87), TMC(10, 91), TMC(11, 100), TMC(12, 102),
   TMC(12, 104), TMC(12, 106), TMC(12, 108), TMC(12, 110), TMC(13, 112),
   TMC(14, 0), TMC(15, 113), TMC(16, 114), TMC(16, 115), TMC(16, 112),
   TMC(16, 113), TMC(16, 116), TMC(16, 117), TMC(16, 118), TMC(16, 119),
   TMC(16, 120), TMC(16, 64), TMC(16, 65), TMC(17, 112), TMC(18, 69),
   TMC(18, 71), TMC(18, 122), TMC(18, 124), TMC(18, 126), TMC(18, 86),
   TMC(18, 128), TMC(18, 90), TMC(18, 130), TMC(18, 94), TMC(18, 96),
   TMC(18, 98), TMC(18, 87), TMC(18, 91), TMC(19, 15), TMC(19, 0),
   TMC(19, 16), TMC(19, 19), TMC(19, 8), TMC(19, 1), TMC(20, 1),
   TMC(21, 39), TMC(22, 99), TMC(23, 99), TMC(24, 41), TMC(24, 48),
   TMC(25, 1), TMC(26, 131), TMC(27, 135), TMC(27, 139), TMC(28, 1),
   TMC(29, 8), TMC(30, 111), TMC(31, 38), TMC(32, 37), TMC(33, 36),
   TMC(34, 99), TMC(35, 8), TMC(36, 35), TMC(37, 99), TMC(38, 34),
   TMC(39, 140), TMC(39, 141), TMC(39, 142), TMC(39, 143), TMC(40, 0),
   TMC(41, 112), TMC(42, 33), TMC(43, 32), TMC(44, 31), TMC(45, 30),
   TMC(46, 29), TMC(47, 145), TMC(47, 147), TMC(48, 28), TMC(49, 12),
   TMC(50, 9), TMC(51, 10), TMC(52, 9), TMC(53, 2), TMC(54, 7), TMC(55, 2),
   TMC(56, 111)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op authority_TY_DEF x = x
    val op authority_TY_DEF =
    ThmBind.DT(((("principal",0),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%121%58%162%26%84%0%118%94%26%118%128%15%114$1@%15%147%105@$0@%49%143|@|$0@2|@2$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op authority_case_def x = x
    val op authority_case_def =
    ThmBind.DT(((("principal",4),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("principal",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%90%15%80%30%107%166%168$1@2$0@2$0$1@2|@|@"])
  fun op authority_size_def x = x
    val op authority_size_def =
    ThmBind.DT(((("principal",5),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("principal",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%90%15%110%167%168$0@3%98%155%141%164@3$0@2|@"])
  fun op role_TY_DEF x = x
    val op role_TY_DEF =
    ThmBind.DT(((("principal",13),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%125%60%160%49%106$0@%155%142%164@3|@$0@|@"])
  fun op role_BIJ x = x
    val op role_BIJ =
    ThmBind.DT(((("principal",14),
                [("bool",[116]),("principal",[13])]),["DISK_THM"]),
               [ThmBind.read"%104%96%18%116%169%175$0@3$0@|@2%90%55%109%49%106$0@%155%142%164@3|$0@2%110%175%169$0@3$0@2|@2"])


  fun op role_size_def x = x
    val op role_size_def =
    ThmBind.DT(((("principal",26),[]),[]),
               [ThmBind.read"%96%71%110%177$0@2%105@|@"])
  fun op role_CASE x = x
    val op role_CASE =
    ThmBind.DT(((("principal",27),[]),[]),
               [ThmBind.read"%96%71%76%65%76%67%107%176$2@$1@$0@2%48%146%110$0@%105@2$2@$1@|%175$2@3|@|@|@"])
  fun op staff_TY_DEF x = x
    val op staff_TY_DEF =
    ThmBind.DT(((("principal",36),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%127%61%161%49%106$0@%155%141%141%164@4|@$0@|@"])
  fun op staff_BIJ x = x
    val op staff_BIJ =
    ThmBind.DT(((("principal",37),
                [("bool",[116]),("principal",[36])]),["DISK_THM"]),
               [ThmBind.read"%104%97%19%117%170%178$0@3$0@|@2%90%55%109%49%106$0@%155%141%141%164@4|$0@2%110%178%170$0@3$0@2|@2"])



  fun op staff_size_def x = x
    val op staff_size_def =
    ThmBind.DT(((("principal",50),[]),[]),
               [ThmBind.read"%97%72%110%180$0@2%105@|@"])
  fun op staff_CASE x = x
    val op staff_CASE =
    ThmBind.DT(((("principal",51),[]),[]),
               [ThmBind.read"%97%72%76%65%76%67%76%69%107%179$3@$2@$1@$0@2%48%146%106$0@%155%141%164@4$3@%146%110$0@%155%141%164@4$2@$1@2|%178$3@3|@|@|@|@"])
  fun op principal_TY_DEF x = x
    val op principal_TY_DEF =
    ThmBind.DT(((("principal",60),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%123%59%163%27%85%1%118%95%27%118%165%132%19%115$1@%19%148%105@%103$0@%99%133@%102%137@%101%136@%100%135@%134@6%49%144|@|$0@2|@2%165%119%14%115$1@%14%148%158%105@2%103%138@%99$0@%102%137@%101%136@%100%135@%134@6%49%144|@|$0@2|@2%165%131%18%115$1@%18%148%158%158%105@3%103%138@%99%133@%102$0@%101%136@%100%135@%134@6%49%144|@|$0@2|@2%165%130%17%115$1@%17%148%158%158%158%105@4%103%138@%99%133@%102%137@%101$0@%100%135@%134@6%49%144|@|$0@2|@2%165%129%16%115$1@%16%148%158%158%158%158%105@5%103%138@%99%133@%102%137@%101%136@%100$0@%134@6%49%144|@|$0@2|@2%128%15%115$1@%15%148%158%158%158%158%158%105@6%103%138@%99%133@%102%137@%101%136@%100%135@$0@6%49%144|@|$0@2|@7$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op principal_case_def x = x
    val op principal_case_def =
    ThmBind.DT(((("principal",74),
                [("bool",[26,180]),("ind_type",[33,34]),("pair",[8,9]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73])]),["DISK_THM"]),
               [ThmBind.read"%104%97%19%88%32%78%36%86%38%82%40%81%42%80%44%107%173%159$6@2$5@$4@$3@$2@$1@$0@2$5$6@2|@|@|@|@|@|@|@2%104%77%14%88%32%78%36%86%38%82%40%81%42%80%44%107%173%140$6@2$5@$4@$3@$2@$1@$0@2$4$6@2|@|@|@|@|@|@|@2%104%96%18%88%32%78%36%86%38%82%40%81%42%80%44%107%173%157$6@2$5@$4@$3@$2@$1@$0@2$3$6@2|@|@|@|@|@|@|@2%104%92%17%88%32%78%36%86%38%82%40%81%42%80%44%107%173%153$6@2$5@$4@$3@$2@$1@$0@2$2$6@2|@|@|@|@|@|@|@2%104%91%16%88%32%78%36%86%38%82%40%81%42%80%44%107%173%152$6@2$5@$4@$3@$2@$1@$0@2$1$6@2|@|@|@|@|@|@|@2%90%15%88%32%78%36%86%38%82%40%81%42%80%44%107%173%154$6@2$5@$4@$3@$2@$1@$0@2$0$6@2|@|@|@|@|@|@|@6"])
  fun op principal_size_def x = x
    val op principal_size_def =
    ThmBind.DT(((("principal",75),
                [("bool",[26,180]),("ind_type",[33,34]),("pair",[8,9]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73])]),["DISK_THM"]),
               [ThmBind.read"%104%97%19%110%174%159$0@3%98%155%141%164@3%180$0@3|@2%104%77%14%110%174%140$0@3%98%155%141%164@3%167$0@3|@2%104%96%18%110%174%157$0@3%98%155%141%164@3%177$0@3|@2%104%92%17%110%174%153$0@3%98%155%141%164@3%172%180@$0@3|@2%104%91%16%110%174%152$0@3%98%155%141%164@3%171%167@$0@3|@2%90%15%110%174%154$0@3%98%155%141%164@3$0@2|@6"])
  fun op datatype_authority x = x
    val op datatype_authority =
    ThmBind.DT(((("principal",6),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%151%29%168@2"])
  fun op authority_11 x = x
    val op authority_11 =
    ThmBind.DT(((("principal",7),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("principal",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%90%15%90%21%109%108%168$1@2%168$0@3%110$1@$0@2|@|@"])
  fun op authority_case_cong x = x
    val op authority_case_cong =
    ThmBind.DT(((("principal",8),
                [("bool",[26,180]),("principal",[1,2,3,4])]),["DISK_THM"]),
               [ThmBind.read"%77%2%77%6%80%30%118%104%108$2@$1@2%90%15%118%108$2@%168$0@3%107$1$0@2%33$0@3|@3%107%166$2@$0@2%166$1@%33@3|@|@|@"])
  fun op authority_nchotomy x = x
    val op authority_nchotomy =
    ThmBind.DT(((("principal",9),
                [("bool",[26,180]),("principal",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%77%28%128%49%108$1@%168$0@2|@|@"])
  fun op authority_Axiom x = x
    val op authority_Axiom =
    ThmBind.DT(((("principal",10),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("principal",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%80%30%120%46%90%15%107$1%168$0@3$2$0@2|@|@|@"])
  fun op authority_induction x = x
    val op authority_induction =
    ThmBind.DT(((("principal",11),
                [("bool",[26]),("principal",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%79%10%118%90%49$1%168$0@2|@2%77%14$1$0@|@2|@"])
  fun op authority_one_one x = x
    val op authority_one_one =
    ThmBind.DT(((("principal",12),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("principal",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%90%15%90%21%109%108%168$1@2%168$0@3%110$1@$0@2|@|@"])
  fun op num2role_role2num x = x
    val op num2role_role2num =
    ThmBind.DT(((("principal",15),[("principal",[14])]),["DISK_THM"]),
               [ThmBind.read"%96%18%116%169%175$0@3$0@|@"])
  fun op role2num_num2role x = x
    val op role2num_num2role =
    ThmBind.DT(((("principal",16),[("principal",[14])]),["DISK_THM"]),
               [ThmBind.read"%90%55%109%106$0@%155%142%164@4%110%175%169$0@3$0@2|@"])
  fun op num2role_11 x = x
    val op num2role_11 =
    ThmBind.DT(((("principal",17),
                [("bool",[26]),("principal",[14])]),["DISK_THM"]),
               [ThmBind.read"%90%55%90%57%118%106$1@%155%142%164@4%118%106$0@%155%142%164@4%109%116%169$1@2%169$0@3%110$1@$0@4|@|@"])
  fun op role2num_11 x = x
    val op role2num_11 =
    ThmBind.DT(((("principal",18),
                [("bool",[26]),("principal",[14])]),["DISK_THM"]),
               [ThmBind.read"%96%18%96%24%109%110%175$1@2%175$0@3%116$1@$0@2|@|@"])
  fun op num2role_ONTO x = x
    val op num2role_ONTO =
    ThmBind.DT(((("principal",19),
                [("bool",[25,62]),("principal",[14])]),["DISK_THM"]),
               [ThmBind.read"%96%18%128%55%104%116$1@%169$0@3%106$0@%155%142%164@4|@|@"])
  fun op role2num_ONTO x = x
    val op role2num_ONTO =
    ThmBind.DT(((("principal",20),
                [("bool",[26]),("principal",[14])]),["DISK_THM"]),
               [ThmBind.read"%90%55%109%106$0@%155%142%164@4%131%18%110$1@%175$0@2|@2|@"])
  fun op num2role_thm x = x
    val op num2role_thm =
    ThmBind.DT(((("principal",23),[("principal",[21,22])]),[]),
               [ThmBind.read"%104%116%169%105@2%150@2%116%169%155%141%164@4%156@2"])
  fun op role2num_thm x = x
    val op role2num_thm =
    ThmBind.DT(((("principal",24),
                [("bool",[25,53]),("numeral",[3,7]),
                 ("principal",[16,21,22])]),["DISK_THM"]),
               [ThmBind.read"%104%110%175%150@2%105@2%110%175%156@2%155%141%164@4"])
  fun op role_EQ_role x = x
    val op role_EQ_role =
    ThmBind.DT(((("principal",25),
                [("bool",[57]),("principal",[18])]),["DISK_THM"]),
               [ThmBind.read"%96%18%96%24%109%116$1@$0@2%110%175$1@2%175$0@3|@|@"])
  fun op role_case_def x = x
    val op role_case_def =
    ThmBind.DT(((("principal",28),
                [("bool",[55,63]),("numeral",[3,6]),
                 ("principal",[24,27])]),["DISK_THM"]),
               [ThmBind.read"%104%76%65%76%67%107%176%150@$1@$0@2$1@|@|@2%76%65%76%67%107%176%156@$1@$0@2$0@|@|@2"])
  fun op datatype_role x = x
    val op datatype_role =
    ThmBind.DT(((("principal",29),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%151%62%150@%156@2"])
  fun op role_distinct x = x
    val op role_distinct =
    ThmBind.DT(((("principal",30),
                [("numeral",[3,6]),("principal",[24,25])]),["DISK_THM"]),
               [ThmBind.read"%181%116%150@%156@2"])
  fun op role_case_cong x = x
    val op role_case_cong =
    ThmBind.DT(((("principal",31),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("numeral",[3,5,6,7,8,15,16]),
                 ("principal",[19,21,22,28]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%96%4%96%8%76%65%76%67%118%104%116$3@$2@2%104%118%116$2@%150@2%107$1@%66@3%118%116$2@%156@2%107$0@%68@5%107%176$3@$1@$0@2%176$2@%66@%68@3|@|@|@|@"])
  fun op role_nchotomy x = x
    val op role_nchotomy =
    ThmBind.DT(((("principal",32),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("numeral",[3,5,6,7,8,15,16]),
                 ("principal",[19,21,22]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%96%18%165%116$0@%150@2%116$0@%156@2|@"])
  fun op role_Axiom x = x
    val op role_Axiom =
    ThmBind.DT(((("principal",33),
                [("bool",[8,14,25,55,63]),("numeral",[3,8]),
                 ("principal",[24])]),["DISK_THM"]),
               [ThmBind.read"%76%73%76%74%124%31%104%107$0%150@2$2@2%107$0%156@2$1@2|@|@|@"])
  fun op role_induction x = x
    val op role_induction =
    ThmBind.DT(((("principal",34),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("numeral",[3,5,6,7,8,15,16]),
                 ("principal",[19,21,22]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%87%12%118%104$0%150@2$0%156@3%96%18$1$0@|@2|@"])
  fun op role_distinct_clauses x = x
    val op role_distinct_clauses =
    ThmBind.DT(((("principal",35),
                [("numeral",[3,6]),("principal",[24,25])]),["DISK_THM"]),
               [ThmBind.read"%181%116%150@%156@2"])
  fun op num2staff_staff2num x = x
    val op num2staff_staff2num =
    ThmBind.DT(((("principal",38),[("principal",[37])]),["DISK_THM"]),
               [ThmBind.read"%97%19%117%170%178$0@3$0@|@"])
  fun op staff2num_num2staff x = x
    val op staff2num_num2staff =
    ThmBind.DT(((("principal",39),[("principal",[37])]),["DISK_THM"]),
               [ThmBind.read"%90%55%109%106$0@%155%141%141%164@5%110%178%170$0@3$0@2|@"])
  fun op num2staff_11 x = x
    val op num2staff_11 =
    ThmBind.DT(((("principal",40),
                [("bool",[26]),("principal",[37])]),["DISK_THM"]),
               [ThmBind.read"%90%55%90%57%118%106$1@%155%141%141%164@5%118%106$0@%155%141%141%164@5%109%117%170$1@2%170$0@3%110$1@$0@4|@|@"])
  fun op staff2num_11 x = x
    val op staff2num_11 =
    ThmBind.DT(((("principal",41),
                [("bool",[26]),("principal",[37])]),["DISK_THM"]),
               [ThmBind.read"%97%19%97%25%109%110%178$1@2%178$0@3%117$1@$0@2|@|@"])
  fun op num2staff_ONTO x = x
    val op num2staff_ONTO =
    ThmBind.DT(((("principal",42),
                [("bool",[25,62]),("principal",[37])]),["DISK_THM"]),
               [ThmBind.read"%97%19%128%55%104%117$1@%170$0@3%106$0@%155%141%141%164@5|@|@"])
  fun op staff2num_ONTO x = x
    val op staff2num_ONTO =
    ThmBind.DT(((("principal",43),
                [("bool",[26]),("principal",[37])]),["DISK_THM"]),
               [ThmBind.read"%90%55%109%106$0@%155%141%141%164@5%132%19%110$1@%178$0@2|@2|@"])
  fun op num2staff_thm x = x
    val op num2staff_thm =
    ThmBind.DT(((("principal",47),[("principal",[44,45,46])]),[]),
               [ThmBind.read"%104%117%170%105@2%139@2%104%117%170%155%141%164@4%145@2%117%170%155%142%164@4%149@3"])
  fun op staff2num_thm x = x
    val op staff2num_thm =
    ThmBind.DT(((("principal",48),
                [("bool",[25]),("numeral",[3,7]),
                 ("principal",[39,44,45,46])]),["DISK_THM"]),
               [ThmBind.read"%104%110%178%139@2%105@2%104%110%178%145@2%155%141%164@4%110%178%149@2%155%142%164@5"])
  fun op staff_EQ_staff x = x
    val op staff_EQ_staff =
    ThmBind.DT(((("principal",49),
                [("bool",[57]),("principal",[41])]),["DISK_THM"]),
               [ThmBind.read"%97%19%97%25%109%117$1@$0@2%110%178$1@2%178$0@3|@|@"])
  fun op staff_case_def x = x
    val op staff_case_def =
    ThmBind.DT(((("principal",52),
                [("bool",[55,63]),("numeral",[3,6,7]),
                 ("principal",[48,51])]),["DISK_THM"]),
               [ThmBind.read"%104%76%65%76%67%76%69%107%179%139@$2@$1@$0@2$2@|@|@|@2%104%76%65%76%67%76%69%107%179%145@$2@$1@$0@2$1@|@|@|@2%76%65%76%67%76%69%107%179%149@$2@$1@$0@2$0@|@|@|@3"])
  fun op datatype_staff x = x
    val op datatype_staff =
    ThmBind.DT(((("principal",53),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%151%64%139@%145@%149@2"])
  fun op staff_distinct x = x
    val op staff_distinct =
    ThmBind.DT(((("principal",54),
                [("numeral",[3,6]),("principal",[48,49])]),["DISK_THM"]),
               [ThmBind.read"%104%181%117%139@%145@3%104%181%117%139@%149@3%181%117%145@%149@4"])
  fun op staff_case_cong x = x
    val op staff_case_cong =
    ThmBind.DT(((("principal",55),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("numeral",[3,5,6,7,8,15,16,17]),
                 ("principal",[42,44,45,46,52]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%97%5%97%9%76%65%76%67%76%69%118%104%117$4@$3@2%104%118%117$3@%139@2%107$2@%66@3%104%118%117$3@%145@2%107$1@%68@3%118%117$3@%149@2%107$0@%70@6%107%179$4@$2@$1@$0@2%179$3@%66@%68@%70@3|@|@|@|@|@"])
  fun op staff_nchotomy x = x
    val op staff_nchotomy =
    ThmBind.DT(((("principal",56),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("numeral",[3,5,6,7,8,15,16,17]),
                 ("principal",[42,44,45,46]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%97%19%165%117$0@%139@2%165%117$0@%145@2%117$0@%149@3|@"])
  fun op staff_Axiom x = x
    val op staff_Axiom =
    ThmBind.DT(((("principal",57),
                [("bool",[8,14,25,53,55,63]),("numeral",[3,8]),
                 ("principal",[48])]),["DISK_THM"]),
               [ThmBind.read"%76%73%76%74%76%75%126%32%104%107$0%139@2$3@2%104%107$0%145@2$2@2%107$0%149@2$1@3|@|@|@|@"])
  fun op staff_induction x = x
    val op staff_induction =
    ThmBind.DT(((("principal",58),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("numeral",[3,5,6,7,8,15,16,17]),
                 ("principal",[42,44,45,46]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%89%13%118%104$0%139@2%104$0%145@2$0%149@4%97%19$1$0@|@2|@"])
  fun op staff_distinct_clauses x = x
    val op staff_distinct_clauses =
    ThmBind.DT(((("principal",59),
                [("numeral",[3,6]),("principal",[48,49])]),["DISK_THM"]),
               [ThmBind.read"%104%181%117%139@%145@3%104%181%117%139@%149@3%181%117%145@%149@4"])
  fun op datatype_principal x = x
    val op datatype_principal =
    ThmBind.DT(((("principal",76),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%151%54%159@%140@%157@%153@%152@%154@2"])
  fun op principal_11 x = x
    val op principal_11 =
    ThmBind.DT(((("principal",77),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("pair",[8,9]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73])]),["DISK_THM"]),
               [ThmBind.read"%104%97%19%97%25%109%113%159$1@2%159$0@3%117$1@$0@2|@|@2%104%77%14%77%20%109%113%140$1@2%140$0@3%108$1@$0@2|@|@2%104%96%18%96%24%109%113%157$1@2%157$0@3%116$1@$0@2|@|@2%104%92%17%92%23%109%113%153$1@2%153$0@3%112$1@$0@2|@|@2%104%91%16%91%22%109%113%152$1@2%152$0@3%111$1@$0@2|@|@2%90%15%90%21%109%113%154$1@2%154$0@3%110$1@$0@2|@|@6"])
  fun op principal_distinct x = x
    val op principal_distinct =
    ThmBind.DT(((("principal",78),
                [("bool",[25,26,35,46,50,53,55,62,180]),
                 ("ind_type",[33,34]),("pair",[8,9]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73])]),["DISK_THM"]),
               [ThmBind.read"%104%77%20%97%19%181%113%159$0@2%140$1@3|@|@2%104%96%24%97%19%181%113%159$0@2%157$1@3|@|@2%104%92%23%97%19%181%113%159$0@2%153$1@3|@|@2%104%91%22%97%19%181%113%159$0@2%152$1@3|@|@2%104%90%21%97%19%181%113%159$0@2%154$1@3|@|@2%104%96%24%77%14%181%113%140$0@2%157$1@3|@|@2%104%92%23%77%14%181%113%140$0@2%153$1@3|@|@2%104%91%22%77%14%181%113%140$0@2%152$1@3|@|@2%104%90%21%77%14%181%113%140$0@2%154$1@3|@|@2%104%92%23%96%18%181%113%157$0@2%153$1@3|@|@2%104%91%22%96%18%181%113%157$0@2%152$1@3|@|@2%104%90%21%96%18%181%113%157$0@2%154$1@3|@|@2%104%91%22%92%17%181%113%153$0@2%152$1@3|@|@2%104%90%21%92%17%181%113%153$0@2%154$1@3|@|@2%90%21%91%16%181%113%152$0@2%154$1@3|@|@15"])
  fun op principal_case_cong x = x
    val op principal_case_cong =
    ThmBind.DT(((("principal",79),
                [("bool",[26,180]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73,
                  74])]),["DISK_THM"]),
               [ThmBind.read"%93%3%93%7%88%32%78%36%86%38%82%40%81%42%80%44%118%104%113$7@$6@2%104%97%19%118%113$7@%159$0@3%107$6$0@2%34$0@3|@2%104%77%14%118%113$7@%140$0@3%107$5$0@2%37$0@3|@2%104%96%18%118%113$7@%157$0@3%107$4$0@2%39$0@3|@2%104%92%17%118%113$7@%153$0@3%107$3$0@2%41$0@3|@2%104%91%16%118%113$7@%152$0@3%107$2$0@2%43$0@3|@2%90%15%118%113$7@%154$0@3%107$1$0@2%45$0@3|@8%107%173$7@$5@$4@$3@$2@$1@$0@2%173$6@%34@%37@%39@%41@%43@%45@3|@|@|@|@|@|@|@|@"])
  fun op principal_nchotomy x = x
    val op principal_nchotomy =
    ThmBind.DT(((("principal",80),
                [("bool",[26,180]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73])]),["DISK_THM"]),
               [ThmBind.read"%93%53%165%132%63%113$1@%159$0@2|@2%165%119%14%113$1@%140$0@2|@2%165%131%56%113$1@%157$0@2|@2%165%130%51%113$1@%153$0@2|@2%165%129%50%113$1@%152$0@2|@2%128%49%113$1@%154$0@2|@6|@"])
  fun op principal_Axiom x = x
    val op principal_Axiom =
    ThmBind.DT(((("principal",81),
                [("bool",[26,180]),("ind_type",[33,34]),("pair",[8,9]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73])]),["DISK_THM"]),
               [ThmBind.read"%88%35%78%36%86%38%82%40%81%42%80%44%122%47%104%97%19%107$1%159$0@3$7$0@2|@2%104%77%14%107$1%140$0@3$6$0@2|@2%104%96%18%107$1%157$0@3$5$0@2|@2%104%92%17%107$1%153$0@3$4$0@2|@2%104%91%16%107$1%152$0@3$3$0@2|@2%90%15%107$1%154$0@3$2$0@2|@6|@|@|@|@|@|@|@"])
  fun op principal_induction x = x
    val op principal_induction =
    ThmBind.DT(((("principal",82),
                [("bool",[26]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73])]),["DISK_THM"]),
               [ThmBind.read"%83%11%118%104%97%63$1%159$0@2|@2%104%77%14$1%140$0@2|@2%104%96%56$1%157$0@2|@2%104%92%51$1%153$0@2|@2%104%91%50$1%152$0@2|@2%90%49$1%154$0@2|@7%93%52$1$0@|@2|@"])
  fun op principal_distinct_clauses x = x
    val op principal_distinct_clauses =
    ThmBind.DT(((("principal",83),
                [("bool",[25,26,35,46,50,53,55,62,180]),
                 ("ind_type",[33,34]),("pair",[8,9]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73])]),["DISK_THM"]),
               [ThmBind.read"%104%77%20%97%19%181%113%159$0@2%140$1@3|@|@2%104%96%24%97%19%181%113%159$0@2%157$1@3|@|@2%104%92%23%97%19%181%113%159$0@2%153$1@3|@|@2%104%91%22%97%19%181%113%159$0@2%152$1@3|@|@2%104%90%21%97%19%181%113%159$0@2%154$1@3|@|@2%104%96%24%77%14%181%113%140$0@2%157$1@3|@|@2%104%92%23%77%14%181%113%140$0@2%153$1@3|@|@2%104%91%22%77%14%181%113%140$0@2%152$1@3|@|@2%104%90%21%77%14%181%113%140$0@2%154$1@3|@|@2%104%92%23%96%18%181%113%157$0@2%153$1@3|@|@2%104%91%22%96%18%181%113%157$0@2%152$1@3|@|@2%104%90%21%96%18%181%113%157$0@2%154$1@3|@|@2%104%91%22%92%17%181%113%153$0@2%152$1@3|@|@2%104%90%21%92%17%181%113%153$0@2%154$1@3|@|@2%90%21%91%16%181%113%152$0@2%154$1@3|@|@15"])
  fun op principal_one_one x = x
    val op principal_one_one =
    ThmBind.DT(((("principal",84),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("pair",[8,9]),
                 ("principal",
                 [61,62,63,64,65,66,67,68,69,70,71,72,73])]),["DISK_THM"]),
               [ThmBind.read"%104%97%19%97%25%109%113%159$1@2%159$0@3%117$1@$0@2|@|@2%104%77%14%77%20%109%113%140$1@2%140$0@3%108$1@$0@2|@|@2%104%96%18%96%24%109%113%157$1@2%157$0@3%116$1@$0@2|@|@2%104%92%17%92%23%109%113%153$1@2%153$0@3%112$1@$0@2|@|@2%104%91%16%91%22%109%113%152$1@2%152$0@3%111$1@$0@2|@|@2%90%15%90%21%109%113%154$1@2%154$0@3%110$1@$0@2|@|@6"])

  val _ = DB.bindl "principal"
  [("authority_TY_DEF",authority_TY_DEF,DB.Def),
   ("authority_case_def",authority_case_def,DB.Def),
   ("authority_size_def",authority_size_def,DB.Def),
   ("role_TY_DEF",role_TY_DEF,DB.Def), ("role_BIJ",role_BIJ,DB.Def),
   ("role_size_def",role_size_def,DB.Def), ("role_CASE",role_CASE,DB.Def),
   ("staff_TY_DEF",staff_TY_DEF,DB.Def), ("staff_BIJ",staff_BIJ,DB.Def),
   ("staff_size_def",staff_size_def,DB.Def),
   ("staff_CASE",staff_CASE,DB.Def),
   ("principal_TY_DEF",principal_TY_DEF,DB.Def),
   ("principal_case_def",principal_case_def,DB.Def),
   ("principal_size_def",principal_size_def,DB.Def),
   ("datatype_authority",datatype_authority,DB.Thm),
   ("authority_11",authority_11,DB.Thm),
   ("authority_case_cong",authority_case_cong,DB.Thm),
   ("authority_nchotomy",authority_nchotomy,DB.Thm),
   ("authority_Axiom",authority_Axiom,DB.Thm),
   ("authority_induction",authority_induction,DB.Thm),
   ("authority_one_one",authority_one_one,DB.Thm),
   ("num2role_role2num",num2role_role2num,DB.Thm),
   ("role2num_num2role",role2num_num2role,DB.Thm),
   ("num2role_11",num2role_11,DB.Thm), ("role2num_11",role2num_11,DB.Thm),
   ("num2role_ONTO",num2role_ONTO,DB.Thm),
   ("role2num_ONTO",role2num_ONTO,DB.Thm),
   ("num2role_thm",num2role_thm,DB.Thm),
   ("role2num_thm",role2num_thm,DB.Thm),
   ("role_EQ_role",role_EQ_role,DB.Thm),
   ("role_case_def",role_case_def,DB.Thm),
   ("datatype_role",datatype_role,DB.Thm),
   ("role_distinct",role_distinct,DB.Thm),
   ("role_case_cong",role_case_cong,DB.Thm),
   ("role_nchotomy",role_nchotomy,DB.Thm),
   ("role_Axiom",role_Axiom,DB.Thm),
   ("role_induction",role_induction,DB.Thm),
   ("role_distinct_clauses",role_distinct_clauses,DB.Thm),
   ("num2staff_staff2num",num2staff_staff2num,DB.Thm),
   ("staff2num_num2staff",staff2num_num2staff,DB.Thm),
   ("num2staff_11",num2staff_11,DB.Thm),
   ("staff2num_11",staff2num_11,DB.Thm),
   ("num2staff_ONTO",num2staff_ONTO,DB.Thm),
   ("staff2num_ONTO",staff2num_ONTO,DB.Thm),
   ("num2staff_thm",num2staff_thm,DB.Thm),
   ("staff2num_thm",staff2num_thm,DB.Thm),
   ("staff_EQ_staff",staff_EQ_staff,DB.Thm),
   ("staff_case_def",staff_case_def,DB.Thm),
   ("datatype_staff",datatype_staff,DB.Thm),
   ("staff_distinct",staff_distinct,DB.Thm),
   ("staff_case_cong",staff_case_cong,DB.Thm),
   ("staff_nchotomy",staff_nchotomy,DB.Thm),
   ("staff_Axiom",staff_Axiom,DB.Thm),
   ("staff_induction",staff_induction,DB.Thm),
   ("staff_distinct_clauses",staff_distinct_clauses,DB.Thm),
   ("datatype_principal",datatype_principal,DB.Thm),
   ("principal_11",principal_11,DB.Thm),
   ("principal_distinct",principal_distinct,DB.Thm),
   ("principal_case_cong",principal_case_cong,DB.Thm),
   ("principal_nchotomy",principal_nchotomy,DB.Thm),
   ("principal_Axiom",principal_Axiom,DB.Thm),
   ("principal_induction",principal_induction,DB.Thm),
   ("principal_distinct_clauses",principal_distinct_clauses,DB.Thm),
   ("principal_one_one",principal_one_one,DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "principal",
    thydataty = "TypeGrammarDeltas",
    read = ThmBind.read,
    data =
        "NTY9.principal,9.authorityNTY9.principal,4.roleNTY9.principal,5.staffNTY9.principal,9.principal"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "principal",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO2.ca4.%168OO14.authority_CASE4.%166OO14.authority_size4.%167OO4.case4.%166OO8.role2num4.%175OO8.num2role4.%169OO9.Commander4.%150OO8.Operator4.%156OO9.role_size4.%177OO9.role_CASE4.%176OO4.case4.%176OO9.staff2num4.%178OO9.num2staff4.%170OO5.Alice4.%139OO3.Bob4.%145OO5.Carol4.%149OO10.staff_size4.%180OO10.staff_CASE4.%179OO4.case4.%179OO5.Staff4.%159OO9.Authority4.%140OO4.Role4.%157OO4.KeyS4.%153OO4.KeyA4.%152OO7.Machine4.%154OO14.principal_CASE4.%173OO14.principal_size4.%174OO4.case4.%173"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val principal_grammars = merge_grammars ["cipher"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="principal"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val principal_grammars = 
    Portable.## (addtyUDs,addtmUDs) principal_grammars
  val _ = Parse.grammarDB_insert("principal",principal_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG authority_Axiom,
           case_def=authority_case_def,
           case_cong=authority_case_cong,
           induction=ORIG authority_induction,
           nchotomy=authority_nchotomy,
           size=SOME(Parse.Term`(principal$authority_size) :principal$authority -> num$num`,
                     ORIG authority_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME authority_11,
           distinct=NONE,
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
          {ax=ORIG role_Axiom,
           case_def=role_case_def,
           case_cong=role_case_cong,
           induction=ORIG role_induction,
           nchotomy=role_nchotomy,
           size=SOME(Parse.Term`(principal$role_size) :principal$role -> num$num`,
                     ORIG role_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME role_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2role_thm role2num_thm NONE tyinfo0
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
          {ax=ORIG staff_Axiom,
           case_def=staff_case_def,
           case_cong=staff_case_cong,
           induction=ORIG staff_induction,
           nchotomy=staff_nchotomy,
           size=SOME(Parse.Term`(principal$staff_size) :principal$staff -> num$num`,
                     ORIG staff_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME staff_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2staff_thm staff2num_thm NONE tyinfo0
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
          {ax=ORIG principal_Axiom,
           case_def=principal_case_def,
           case_cong=principal_case_cong,
           induction=ORIG principal_induction,
           nchotomy=principal_nchotomy,
           size=SOME(Parse.Term`(principal$principal_size) :principal$principal -> num$num`,
                     ORIG principal_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME principal_11,
           distinct=SOME principal_distinct,
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
val _ = Theory.load_complete "principal"
end
