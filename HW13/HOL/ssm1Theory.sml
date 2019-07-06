structure ssm1Theory :> ssm1Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading ssm1Theory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open satListTheory
  in end;
  val _ = Theory.link_parents
          ("ssm1",
          Arbnum.fromString "1556067504",
          Arbnum.fromString "669018")
          [("satList",
           Arbnum.fromString "1556067497",
           Arbnum.fromString "862233")];
  val _ = Theory.incorporate_types "ssm1"
       [("trType", 1), ("inst", 1), ("configuration", 6)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("ssm1", "trType"), ID("num", "num"),
   ID("ssm1", "inst"), ID("ssm1", "configuration"), ID("list", "list"),
   ID("aclfoundation", "Form"), ID("min", "bool"), ID("pair", "prod"),
   ID("aclfoundation", "po"), ID("aclfoundation", "Kripke"),
   ID("ind_type", "recspace"), ID("aclfoundation", "Princ"),
   ID("bool", "!"), ID("arithmetic", "+"), ID("pair", ","),
   ID("bool", "/\\"), ID("num", "0"), ID("min", "="), ID("min", "==>"),
   ID("bool", "?"), ID("bool", "ARB"), ID("arithmetic", "BIT1"),
   ID("ind_type", "BOTTOM"), ID("ssm1", "CFG"), ID("ssm1", "CFGInterpret"),
   ID("list", "CONS"), ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"),
   ID("aclfoundation", "Form_size"), ID("list", "NIL"), ID("ssm1", "NONE"),
   ID("arithmetic", "NUMERAL"), ID("ssm1", "SOME"), ID("num", "SUC"),
   ID("ssm1", "TR"), ID("bool", "TYPE_DEFINITION"),
   ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("ssm1", "configuration_CASE"), ID("ssm1", "configuration_size"),
   ID("ssm1", "discard"), ID("ssm1", "exec"), ID("ssm1", "inst_CASE"),
   ID("ssm1", "inst_size"), ID("list", "list_size"),
   ID("aclfoundation", "prop"), ID("aclrules", "sat"),
   ID("satList", "satList"), ID("aclfoundation", "says"),
   ID("ssm1", "trType_CASE"), ID("ssm1", "trType_size"),
   ID("ssm1", "trap"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'command", TYOP [1, 0], TYOP [0, 0, 1], TYOP [2], TYOP [0, 1, 3],
   TYOP [0, 0, 3], TYOP [0, 5, 4], TYV "'a", TYOP [0, 0, 7],
   TYOP [0, 8, 7], TYOP [0, 8, 9], TYOP [0, 7, 10], TYOP [0, 1, 11],
   TYOP [3, 0], TYOP [0, 13, 3], TYOP [0, 5, 14], TYOP [0, 7, 7],
   TYOP [0, 8, 16], TYOP [0, 13, 17], TYV "'state", TYV "'principal",
   TYV "'output", TYV "'e", TYV "'d", TYOP [4, 0, 23, 22, 21, 20, 19],
   TYOP [0, 24, 3], TYOP [0, 19, 3], TYOP [0, 26, 25], TYOP [0, 20, 3],
   TYOP [0, 28, 27], TYOP [0, 21, 3], TYOP [0, 30, 29], TYOP [0, 22, 3],
   TYOP [0, 32, 31], TYOP [0, 23, 3], TYOP [0, 34, 33], TYOP [0, 5, 35],
   TYOP [5, 21], TYOP [0, 37, 7], TYOP [0, 19, 38],
   TYOP [6, 13, 20, 23, 22], TYOP [5, 40], TYOP [0, 41, 39],
   TYOP [0, 41, 42], TYOP [0, 19, 40], TYOP [0, 44, 43], TYOP [7],
   TYOP [0, 40, 46], TYOP [0, 47, 45], TYOP [0, 48, 7], TYOP [0, 24, 49],
   TYOP [0, 24, 46], TYOP [0, 24, 51], TYOP [0, 1, 52], TYOP [9, 22],
   TYOP [9, 23], TYOP [8, 55, 54], TYV "'b", TYOP [10, 13, 57, 20, 23, 22],
   TYOP [8, 58, 56], TYOP [0, 59, 53], TYOP [0, 0, 13], TYOP [0, 59, 51],
   TYOP [0, 37, 24], TYOP [0, 19, 63], TYOP [0, 41, 64], TYOP [0, 41, 65],
   TYOP [0, 44, 66], TYOP [0, 47, 67], TYOP [8, 19, 37], TYOP [8, 41, 69],
   TYOP [8, 41, 70], TYOP [8, 44, 71], TYOP [8, 47, 72], TYOP [11, 73],
   TYOP [0, 74, 46], TYOP [11, 0], TYOP [0, 76, 46], TYOP [0, 1, 19],
   TYOP [0, 19, 78], TYOP [0, 1, 21], TYOP [0, 19, 80], TYOP [12, 20],
   TYOP [0, 13, 46], TYOP [0, 1, 46], TYOP [0, 68, 46], TYOP [0, 24, 7],
   TYOP [0, 13, 7], TYOP [0, 1, 7], TYOP [0, 61, 83], TYOP [0, 24, 74],
   TYOP [0, 13, 76], TYOP [0, 1, 76], TYOP [0, 2, 46], TYOP [0, 2, 93],
   TYOP [0, 1, 94], TYOP [0, 7, 46], TYOP [0, 96, 46], TYOP [0, 0, 46],
   TYOP [0, 98, 46], TYOP [0, 19, 46], TYOP [0, 100, 46], TYOP [0, 47, 46],
   TYOP [0, 58, 46], TYOP [0, 103, 46], TYOP [0, 82, 46],
   TYOP [0, 105, 46], TYOP [0, 51, 46], TYOP [0, 8, 46], TYOP [0, 108, 46],
   TYOP [0, 5, 46], TYOP [0, 110, 46], TYOP [0, 34, 46], TYOP [0, 112, 46],
   TYOP [0, 32, 46], TYOP [0, 114, 46], TYOP [0, 30, 46],
   TYOP [0, 116, 46], TYOP [0, 28, 46], TYOP [0, 118, 46],
   TYOP [0, 44, 46], TYOP [0, 120, 46], TYOP [0, 81, 46],
   TYOP [0, 122, 46], TYOP [0, 79, 46], TYOP [0, 124, 46],
   TYOP [0, 26, 46], TYOP [0, 126, 46], TYOP [0, 102, 46],
   TYOP [0, 107, 46], TYOP [0, 48, 46], TYOP [0, 130, 46],
   TYOP [0, 83, 46], TYOP [0, 132, 46], TYOP [0, 62, 46],
   TYOP [0, 134, 46], TYOP [0, 60, 46], TYOP [0, 136, 46],
   TYOP [0, 77, 46], TYOP [0, 138, 46], TYOP [0, 75, 46],
   TYOP [0, 140, 46], TYOP [0, 84, 46], TYOP [0, 142, 46],
   TYOP [0, 37, 46], TYOP [0, 144, 46], TYOP [0, 41, 46],
   TYOP [0, 146, 46], TYOP [0, 55, 46], TYOP [0, 148, 46],
   TYOP [0, 54, 46], TYOP [0, 150, 46], TYOP [0, 59, 46],
   TYOP [0, 152, 46], TYOP [0, 3, 3], TYOP [0, 3, 154], TYOP [0, 37, 69],
   TYOP [0, 19, 156], TYOP [0, 56, 59], TYOP [0, 58, 158],
   TYOP [0, 71, 72], TYOP [0, 44, 160], TYOP [0, 72, 73],
   TYOP [0, 47, 162], TYOP [0, 69, 70], TYOP [0, 41, 164],
   TYOP [0, 70, 71], TYOP [0, 41, 166], TYOP [0, 54, 56],
   TYOP [0, 55, 168], TYOP [0, 46, 46], TYOP [0, 46, 170], TYOP [0, 7, 96],
   TYOP [0, 0, 98], TYOP [0, 19, 100], TYOP [0, 44, 120],
   TYOP [0, 47, 102], TYOP [0, 60, 136], TYOP [0, 13, 83],
   TYOP [0, 37, 144], TYOP [0, 41, 146], TYOP [0, 3, 46], TYOP [0, 3, 181],
   TYOP [0, 59, 152], TYOP [0, 76, 77], TYOP [0, 74, 75], TYOP [0, 1, 84],
   TYOP [0, 86, 46], TYOP [0, 187, 46], TYOP [0, 90, 46],
   TYOP [0, 189, 46], TYOP [0, 87, 46], TYOP [0, 191, 46],
   TYOP [0, 91, 46], TYOP [0, 193, 46], TYOP [0, 88, 46],
   TYOP [0, 195, 46], TYOP [0, 92, 46], TYOP [0, 197, 46],
   TYOP [0, 37, 37], TYOP [0, 21, 199], TYOP [0, 41, 41],
   TYOP [0, 40, 201], TYOP [0, 3, 76], TYOP [0, 203, 76], TYOP [0, 0, 204],
   TYOP [0, 3, 205], TYOP [0, 3, 74], TYOP [0, 207, 74], TYOP [0, 73, 208],
   TYOP [0, 3, 209], TYOP [0, 40, 3], TYOP [0, 32, 211], TYOP [0, 34, 212],
   TYOP [0, 28, 213], TYOP [0, 14, 214], TYOP [0, 77, 193],
   TYOP [0, 77, 197], TYOP [0, 75, 189], TYOP [0, 37, 3],
   TYOP [0, 30, 219], TYOP [0, 41, 3], TYOP [0, 211, 221],
   TYOP [0, 13, 40], TYOP [0, 59, 47], TYOP [0, 59, 146], TYOP [0, 40, 40],
   TYOP [0, 82, 226]]
  end
  val _ = Theory.incorporate_consts "ssm1" tyvector
     [("trap", 2), ("trType_size", 6), ("trType_CASE", 12),
      ("inst_size", 15), ("inst_CASE", 18), ("exec", 2), ("discard", 1),
      ("configuration_size", 36), ("configuration_CASE", 50), ("TR", 60),
      ("SOME", 61), ("NONE", 13), ("CFGInterpret", 62), ("CFG", 68)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'configuration'", 75), TMV("'inst'", 77), TMV("'trType'", 77),
   TMV("M", 58), TMV("M", 24), TMV("M", 13), TMV("M", 1), TMV("M'", 24),
   TMV("M'", 13), TMV("M'", 1), TMV("NS", 79), TMV("Oi", 55),
   TMV("Os", 54), TMV("Out", 81), TMV("P", 82), TMV("P", 51), TMV("P", 83),
   TMV("P", 62), TMV("P", 84), TMV("TR'", 60), TMV("a", 0), TMV("a'", 0),
   TMV("a0", 47), TMV("a0", 59), TMV("a0", 76), TMV("a0'", 47),
   TMV("a0'", 74), TMV("a1", 44), TMV("a1", 1), TMV("a1'", 44),
   TMV("a2", 24), TMV("a2", 41), TMV("a2'", 41), TMV("a3", 24),
   TMV("a3", 41), TMV("a3'", 41), TMV("a4", 19), TMV("a4'", 19),
   TMV("a5", 37), TMV("a5'", 37), TMV("c", 0), TMV("c", 24), TMV("cc", 24),
   TMV("certList", 41), TMV("cmd", 0), TMV("configuration", 85),
   TMV("context", 41), TMV("f", 8), TMV("f", 5), TMV("f", 47),
   TMV("f", 48), TMV("f'", 8), TMV("f'", 48), TMV("f0", 7), TMV("f0", 8),
   TMV("f0", 44), TMV("f1", 7), TMV("f1", 8), TMV("f1", 34), TMV("f1'", 8),
   TMV("f2", 8), TMV("f2", 32), TMV("f3", 30), TMV("f4", 28),
   TMV("f5", 26), TMV("fn", 86), TMV("fn", 87), TMV("fn", 88),
   TMV("i", 13), TMV("ii", 13), TMV("inputTest", 47), TMV("ins", 41),
   TMV("inst", 89), TMV("l", 41), TMV("l0", 41), TMV("l1", 37),
   TMV("n", 3), TMV("outStream", 37), TMV("outs", 37), TMV("rep", 90),
   TMV("rep", 91), TMV("rep", 92), TMV("s", 19), TMV("state", 19),
   TMV("stateInterp", 44), TMV("t", 1), TMV("trType", 95), TMV("tt", 1),
   TMV("v", 7), TMV("v", 58), TMV("v'", 7), TMV("v1", 55), TMV("v10", 47),
   TMV("v11", 44), TMV("v12", 41), TMV("v13", 19), TMV("v14", 37),
   TMV("v15", 59), TMV("v2", 54), TMV("v3", 24), TMV("x", 40), TMC(13, 97),
   TMC(13, 99), TMC(13, 101), TMC(13, 102), TMC(13, 104), TMC(13, 106),
   TMC(13, 107), TMC(13, 109), TMC(13, 111), TMC(13, 113), TMC(13, 115),
   TMC(13, 117), TMC(13, 119), TMC(13, 121), TMC(13, 123), TMC(13, 125),
   TMC(13, 127), TMC(13, 128), TMC(13, 129), TMC(13, 131), TMC(13, 133),
   TMC(13, 135), TMC(13, 137), TMC(13, 139), TMC(13, 141), TMC(13, 143),
   TMC(13, 132), TMC(13, 145), TMC(13, 147), TMC(13, 149), TMC(13, 151),
   TMC(13, 153), TMC(13, 138), TMC(13, 140), TMC(13, 142), TMC(14, 155),
   TMC(15, 157), TMC(15, 159), TMC(15, 161), TMC(15, 163), TMC(15, 165),
   TMC(15, 167), TMC(15, 169), TMC(16, 171), TMC(17, 3), TMC(18, 172),
   TMC(18, 173), TMC(18, 174), TMC(18, 171), TMC(18, 52), TMC(18, 175),
   TMC(18, 176), TMC(18, 177), TMC(18, 178), TMC(18, 179), TMC(18, 180),
   TMC(18, 182), TMC(18, 183), TMC(18, 184), TMC(18, 185), TMC(18, 186),
   TMC(19, 171), TMC(20, 99), TMC(20, 101), TMC(20, 102), TMC(20, 104),
   TMC(20, 106), TMC(20, 121), TMC(20, 123), TMC(20, 125), TMC(20, 128),
   TMC(20, 188), TMC(20, 190), TMC(20, 192), TMC(20, 194), TMC(20, 196),
   TMC(20, 198), TMC(20, 145), TMC(20, 147), TMC(20, 149), TMC(20, 151),
   TMC(21, 0), TMC(22, 154), TMC(23, 76), TMC(23, 74), TMC(24, 68),
   TMC(25, 62), TMC(26, 200), TMC(26, 202), TMC(27, 206), TMC(27, 210),
   TMC(28, 170), TMC(29, 215), TMC(30, 41), TMC(31, 13), TMC(32, 154),
   TMC(33, 61), TMC(34, 154), TMC(35, 60), TMC(36, 216), TMC(36, 217),
   TMC(36, 218), TMC(37, 3), TMC(38, 171), TMC(39, 50), TMC(40, 36),
   TMC(41, 1), TMC(42, 2), TMC(43, 18), TMC(44, 15), TMC(45, 220),
   TMC(45, 222), TMC(46, 223), TMC(47, 224), TMC(48, 225), TMC(49, 227),
   TMC(50, 12), TMC(51, 6), TMC(52, 2), TMC(53, 170)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op inst_TY_DEF x = x
    val op inst_TY_DEF =
    ThmBind.DT(((("ssm1",0),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%175%80%200%24%124%1%162%133%24%162%204%163%20%159$1@%20%190%145@$0@%76%184|@|$0@2|@2%159$0@%190%198%145@2%182@%76%184|@4$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op inst_case_def x = x
    val op inst_case_def =
    ThmBind.DT(((("ssm1",6),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("ssm1",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%144%102%20%108%47%101%88%146%209%197$2@2$1@$0@2$1$2@2|@|@|@2%108%47%101%88%146%209%195@$1@$0@2$0@|@|@2"])
  fun op inst_size_def x = x
    val op inst_size_def =
    ThmBind.DT(((("ssm1",7),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("ssm1",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%144%109%48%102%20%157%210$1@%197$0@3%136%196%183%203@3$1$0@3|@|@2%109%48%157%210$0@%195@2%145@|@2"])
  fun op trType_TY_DEF x = x
    val op trType_TY_DEF =
    ThmBind.DT(((("ssm1",17),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%177%81%201%24%124%2%162%133%24%162%204%159$0@%190%145@%182@%76%184|@3%204%163%20%159$1@%20%190%198%145@2$0@%76%184|@|$0@2|@2%163%20%159$1@%20%190%198%198%145@3$0@%76%184|@|$0@2|@4$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op trType_case_def x = x
    val op trType_case_def =
    ThmBind.DT(((("ssm1",25),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("ssm1",[18,19,20,21,22,23,24])]),["DISK_THM"]),
               [ThmBind.read"%144%101%88%108%47%108%57%146%217%207@$2@$1@$0@2$2@|@|@|@2%144%102%20%101%88%108%47%108%57%146%217%219$3@2$2@$1@$0@2$1$3@2|@|@|@|@2%102%20%101%88%108%47%108%57%146%217%208$3@2$2@$1@$0@2$0$3@2|@|@|@|@3"])
  fun op trType_size_def x = x
    val op trType_size_def =
    ThmBind.DT(((("ssm1",26),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("ssm1",[18,19,20,21,22,23,24])]),["DISK_THM"]),
               [ThmBind.read"%144%109%48%157%218$0@%207@2%145@|@2%144%109%48%102%20%157%218$1@%219$0@3%136%196%183%203@3$1$0@3|@|@2%109%48%102%20%157%218$1@%208$0@3%136%196%183%203@3$1$0@3|@|@3"])
  fun op configuration_TY_DEF x = x
    val op configuration_TY_DEF =
    ThmBind.DT(((("ssm1",36),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%173%79%202%26%125%0%162%134%26%162%171%22%168%27%179%31%179%34%164%36%178%38%160$6@%22%27%31%34%36%38%191%145@%140$5@%139$4@%142$3@%141$2@%137$1@$0@6%76%185|@||||||$5@$4@$3@$2@$1@$0@2|@|@|@|@|@|@2$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op configuration_case_def x = x
    val op configuration_case_def =
    ThmBind.DT(((("ssm1",40),
                [("bool",[26,180]),("ind_type",[33,34]),("pair",[8,9]),
                 ("ssm1",[37,38,39])]),["DISK_THM"]),
               [ThmBind.read"%118%22%114%27%129%31%129%34%103%36%128%38%120%50%146%205%186$6@$5@$4@$3@$2@$1@2$0@2$0$6@$5@$4@$3@$2@$1@2|@|@|@|@|@|@|@"])
  fun op configuration_size_def x = x
    val op configuration_size_def =
    ThmBind.DT(((("ssm1",41),
                [("bool",[26,180]),("ind_type",[33,34]),("pair",[8,9]),
                 ("ssm1",[37,38,39])]),["DISK_THM"]),
               [ThmBind.read"%109%48%110%58%111%61%112%62%113%63%117%64%118%22%114%27%129%31%129%34%103%36%128%38%157%206$11@$10@$9@$8@$7@$6@%186$5@$4@$3@$2@$1@$0@3%136%196%183%203@3%136%212%193%210$11@2$7@$10@$9@2$3@2%136%212%193%210$11@2$7@$10@$9@2$2@2%136$6$1@2%211$8@$0@6|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op TR_def x = x
    val op TR_def =
    ThmBind.DT(((("ssm1",53),[]),[]),
               [ThmBind.read"%153%199@%23%28%30%33%123%19%162%132%23%135%28%107%30%107%33%162%204%171%70%167%14%170%10%166%3%180%11%181%12%169%13%164%82%179%43%168%84%163%44%179%71%178%78%144%158$16@%138$9@%143$8@$7@4%144%161$15@%208$2@3%144%150$14@%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@3%144%150$13@%186$12@$3@$4@$1@$10$5@%208$2@3%188$6$5@%208$2@3$0@4%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@7|@|@|@|@|@|@|@|@|@|@|@|@|@2%204%171%70%167%14%170%10%166%3%180%11%181%12%169%13%164%82%179%43%168%84%163%44%179%71%178%78%144%158$16@%138$9@%143$8@$7@4%144%161$15@%219$2@3%144%150$14@%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@3%144%150$13@%186$12@$3@$4@$1@$10$5@%219$2@3%188$6$5@%219$2@3$0@4%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@7|@|@|@|@|@|@|@|@|@|@|@|@|@2%171%70%170%10%166%3%180%11%181%12%169%13%164%82%179%43%168%84%163%44%165%100%179%71%178%78%144%158$16@%138$10@%143$9@$8@4%144%161$15@%207@2%144%150$14@%186$12@$4@$5@%189$2@$1@2$6@$0@3%144%150$13@%186$12@$4@$5@$1@$11$6@%207@2%188$7$6@%207@2$0@4%220$12$2@6|@|@|@|@|@|@|@|@|@|@|@|@|@4$4$3@$2@$1@$0@2|@|@|@|@2$0$4@$3@$2@$1@2|@||||@"])
  fun op datatype_inst x = x
    val op datatype_inst =
    ThmBind.DT(((("ssm1",8),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%192%72%197@%195@2"])
  fun op inst_11 x = x
    val op inst_11 =
    ThmBind.DT(((("ssm1",9),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("ssm1",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%102%20%102%21%149%154%197$1@2%197$0@3%147$1@$0@2|@|@"])
  fun op inst_distinct x = x
    val op inst_distinct =
    ThmBind.DT(((("ssm1",10),
                [("bool",[25,26,46,53,62,180]),("ind_type",[33,34]),
                 ("ssm1",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%102%20%220%154%197$0@2%195@2|@"])
  fun op inst_case_cong x = x
    val op inst_case_cong =
    ThmBind.DT(((("ssm1",11),
                [("bool",[26,180]),("ssm1",[1,2,3,4,5,6])]),["DISK_THM"]),
               [ThmBind.read"%127%5%127%8%108%47%101%88%162%144%154$3@$2@2%144%102%20%162%154$3@%197$0@3%146$2$0@2%51$0@3|@2%162%154$2@%195@2%146$0@%90@5%146%209$3@$1@$0@2%209$2@%51@%90@3|@|@|@|@"])
  fun op inst_nchotomy x = x
    val op inst_nchotomy =
    ThmBind.DT(((("ssm1",12),
                [("bool",[26,180]),("ssm1",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%127%69%204%163%40%154$1@%197$0@2|@2%154$0@%195@2|@"])
  fun op inst_Axiom x = x
    val op inst_Axiom =
    ThmBind.DT(((("ssm1",13),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("ssm1",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%108%54%101%56%174%66%144%102%20%146$1%197$0@3$3$0@2|@2%146$0%195@2$1@2|@|@|@"])
  fun op inst_induction x = x
    val op inst_induction =
    ThmBind.DT(((("ssm1",14),
                [("bool",[26]),("ssm1",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%121%16%162%144%102%40$1%197$0@2|@2$0%195@3%127%68$1$0@|@2|@"])
  fun op inst_distinct_clauses x = x
    val op inst_distinct_clauses =
    ThmBind.DT(((("ssm1",15),
                [("bool",[25,26,46,53,62,180]),("ind_type",[33,34]),
                 ("ssm1",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%102%20%220%154%197$0@2%195@2|@"])
  fun op inst_one_one x = x
    val op inst_one_one =
    ThmBind.DT(((("ssm1",16),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("ssm1",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%102%20%102%21%149%154%197$1@2%197$0@3%147$1@$0@2|@|@"])
  fun op datatype_trType x = x
    val op datatype_trType =
    ThmBind.DT(((("ssm1",27),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%192%86%207@%219@%208@2"])
  fun op trType_11 x = x
    val op trType_11 =
    ThmBind.DT(((("ssm1",28),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("ssm1",[18,19,20,21,22,23,24])]),["DISK_THM"]),
               [ThmBind.read"%144%102%20%102%21%149%161%219$1@2%219$0@3%147$1@$0@2|@|@2%102%20%102%21%149%161%208$1@2%208$0@3%147$1@$0@2|@|@2"])
  fun op trType_distinct x = x
    val op trType_distinct =
    ThmBind.DT(((("ssm1",29),
                [("bool",[25,26,35,46,50,53,55,62,180]),
                 ("ind_type",[33,34]),
                 ("ssm1",[18,19,20,21,22,23,24])]),["DISK_THM"]),
               [ThmBind.read"%144%102%20%220%161%207@%219$0@3|@2%144%102%20%220%161%207@%208$0@3|@2%102%21%102%20%220%161%219$0@2%208$1@3|@|@3"])
  fun op trType_case_cong x = x
    val op trType_case_cong =
    ThmBind.DT(((("ssm1",30),
                [("bool",[26,180]),
                 ("ssm1",[18,19,20,21,22,23,24,25])]),["DISK_THM"]),
               [ThmBind.read"%135%6%135%9%101%88%108%47%108%57%162%144%161$4@$3@2%144%162%161$3@%207@2%146$2@%90@3%144%102%20%162%161$4@%219$0@3%146$2$0@2%51$0@3|@2%102%20%162%161$4@%208$0@3%146$1$0@2%59$0@3|@5%146%217$4@$2@$1@$0@2%217$3@%90@%51@%59@3|@|@|@|@|@"])
  fun op trType_nchotomy x = x
    val op trType_nchotomy =
    ThmBind.DT(((("ssm1",31),
                [("bool",[26,180]),
                 ("ssm1",[18,19,20,21,22,23,24])]),["DISK_THM"]),
               [ThmBind.read"%135%87%204%161$0@%207@2%204%163%40%161$1@%219$0@2|@2%163%40%161$1@%208$0@2|@3|@"])
  fun op trType_Axiom x = x
    val op trType_Axiom =
    ThmBind.DT(((("ssm1",32),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("ssm1",[18,19,20,21,22,23,24])]),["DISK_THM"]),
               [ThmBind.read"%101%53%108%57%108%60%176%67%144%146$0%207@2$3@2%144%102%20%146$1%219$0@3$3$0@2|@2%102%20%146$1%208$0@3$2$0@2|@3|@|@|@|@"])
  fun op trType_induction x = x
    val op trType_induction =
    ThmBind.DT(((("ssm1",33),
                [("bool",[26]),
                 ("ssm1",[18,19,20,21,22,23,24])]),["DISK_THM"]),
               [ThmBind.read"%126%18%162%144$0%207@2%144%102%40$1%219$0@2|@2%102%40$1%208$0@2|@4%135%85$1$0@|@2|@"])
  fun op trType_distinct_clauses x = x
    val op trType_distinct_clauses =
    ThmBind.DT(((("ssm1",34),
                [("bool",[25,26,35,46,50,53,55,62,180]),
                 ("ind_type",[33,34]),
                 ("ssm1",[18,19,20,21,22,23,24])]),["DISK_THM"]),
               [ThmBind.read"%144%102%20%220%161%207@%219$0@3|@2%144%102%20%220%161%207@%208$0@3|@2%102%21%102%20%220%161%219$0@2%208$1@3|@|@3"])
  fun op trType_one_one x = x
    val op trType_one_one =
    ThmBind.DT(((("ssm1",35),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("ssm1",[18,19,20,21,22,23,24])]),["DISK_THM"]),
               [ThmBind.read"%144%102%20%102%21%149%161%219$1@2%219$0@3%147$1@$0@2|@|@2%102%20%102%21%149%161%208$1@2%208$0@3%147$1@$0@2|@|@2"])
  fun op datatype_configuration x = x
    val op datatype_configuration =
    ThmBind.DT(((("ssm1",42),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%192%45%186@2"])
  fun op configuration_11 x = x
    val op configuration_11 =
    ThmBind.DT(((("ssm1",43),
                [("bool",[26,50,55,62,180]),("ind_type",[33,34]),
                 ("pair",[8,9]),("ssm1",[37,38,39])]),["DISK_THM"]),
               [ThmBind.read"%118%22%114%27%129%31%129%34%103%36%128%38%118%25%114%29%129%32%129%35%103%37%128%39%149%150%186$11@$10@$9@$8@$7@$6@2%186$5@$4@$3@$2@$1@$0@3%144%152$11@$5@2%144%151$10@$4@2%144%156$9@$3@2%144%156$8@$2@2%144%148$7@$1@2%155$6@$0@7|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op configuration_case_cong x = x
    val op configuration_case_cong =
    ThmBind.DT(((("ssm1",44),
                [("bool",[26,180]),("ssm1",[37,38,39,40])]),["DISK_THM"]),
               [ThmBind.read"%107%4%107%7%120%50%162%144%150$2@$1@2%118%22%114%27%129%31%129%34%103%36%128%38%162%150$7@%186$5@$4@$3@$2@$1@$0@3%146$6$5@$4@$3@$2@$1@$0@2%52$5@$4@$3@$2@$1@$0@3|@|@|@|@|@|@3%146%205$2@$0@2%205$1@%52@3|@|@|@"])
  fun op configuration_nchotomy x = x
    val op configuration_nchotomy =
    ThmBind.DT(((("ssm1",45),
                [("bool",[26,180]),("ssm1",[37,38,39])]),["DISK_THM"]),
               [ThmBind.read"%107%42%171%49%168%55%179%73%179%74%164%82%178%75%150$6@%186$5@$4@$3@$2@$1@$0@2|@|@|@|@|@|@|@"])
  fun op configuration_Axiom x = x
    val op configuration_Axiom =
    ThmBind.DT(((("ssm1",46),
                [("bool",[26,180]),("ind_type",[33,34]),("pair",[8,9]),
                 ("ssm1",[37,38,39])]),["DISK_THM"]),
               [ThmBind.read"%120%50%172%65%118%22%114%27%129%31%129%34%103%36%128%38%146$6%186$5@$4@$3@$2@$1@$0@3$7$5@$4@$3@$2@$1@$0@2|@|@|@|@|@|@|@|@"])
  fun op configuration_induction x = x
    val op configuration_induction =
    ThmBind.DT(((("ssm1",47),
                [("bool",[26]),("ssm1",[37,38,39])]),["DISK_THM"]),
               [ThmBind.read"%119%15%162%118%49%114%55%129%73%129%74%103%82%128%75$6%186$5@$4@$3@$2@$1@$0@2|@|@|@|@|@|@2%107%41$1$0@|@2|@"])
  fun op configuration_one_one x = x
    val op configuration_one_one =
    ThmBind.DT(((("ssm1",48),
                [("bool",[26,50,55,62,180]),("ind_type",[33,34]),
                 ("pair",[8,9]),("ssm1",[37,38,39])]),["DISK_THM"]),
               [ThmBind.read"%118%22%114%27%129%31%129%34%103%36%128%38%118%25%114%29%129%32%129%35%103%37%128%39%149%150%186$11@$10@$9@$8@$7@$6@2%186$5@$4@$3@$2@$1@$0@3%144%152$11@$5@2%144%151$10@$4@2%144%156$9@$3@2%144%156$8@$2@2%144%148$7@$1@2%155$6@$0@7|@|@|@|@|@|@|@|@|@|@|@|@"])
  fun op CFGInterpret_ind x = x
    val op CFGInterpret_ind =
    ThmBind.DT(((("ssm1",51),
                [("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79,180]),
                 ("list",[46]),("pair",[5,16]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[37,38,39])]),["DISK_THM"]),
               [ThmBind.read"%122%17%162%144%105%3%130%11%131%12%118%70%114%84%129%46%104%100%129%71%103%83%128%77$10%138$9@%143$8@$7@3%186$6@$5@$4@%189$3@$2@2$1@$0@2|@|@|@|@|@|@|@|@|@|@2%132%97%118%92%114%93%129%94%103%95%128%96$6$5@%186$4@$3@$2@%194@$1@$0@2|@|@|@|@|@|@3%105%89%130%91%131%98%107%99$4%138$3@%143$2@$1@3$0@|@|@|@|@2|@"])
  fun op CFGInterpret_def x = x
    val op CFGInterpret_def =
    ThmBind.DT(((("ssm1",52),
                [("bool",[15,57]),("combin",[19]),("list",[6]),
                 ("pair",[49]),("relation",[113,132]),
                 ("ssm1",[40,49,50])]),["DISK_THM"]),
               [ThmBind.read"%149%187%138%3@%143%11@%12@3%186%70@%84@%46@%189%100@%71@2%83@%77@3%144%215%138%3@%143%11@%12@3%46@2%144%214%138%3@%143%11@%12@3%100@2%214%138%3@%143%11@%12@3%84%83@5"])
  fun op TR_rules x = x
    val op TR_rules =
    ThmBind.DT(((("ssm1",54),[("bool",[26]),("ssm1",[53])]),["DISK_THM"]),
               [ThmBind.read"%144%118%70%106%14%116%10%105%3%130%11%131%12%115%13%103%82%129%43%114%84%102%44%129%71%128%78%162%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@4%199%138$9@%143$8@$7@3%208$2@2%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@2%186$12@$3@$4@$1@$10$5@%208$2@3%188$6$5@%208$2@3$0@4|@|@|@|@|@|@|@|@|@|@|@|@|@2%144%118%70%106%14%116%10%105%3%130%11%131%12%115%13%103%82%129%43%114%84%102%44%129%71%128%78%162%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@4%199%138$9@%143$8@$7@3%219$2@2%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@2%186$12@$3@$4@$1@$10$5@%219$2@3%188$6$5@%219$2@3$0@4|@|@|@|@|@|@|@|@|@|@|@|@|@2%118%70%116%10%105%3%130%11%131%12%115%13%103%82%129%43%114%84%102%44%104%100%129%71%128%78%162%220$12$2@3%199%138$10@%143$9@$8@3%207@%186$12@$4@$5@%189$2@$1@2$6@$0@2%186$12@$4@$5@$1@$11$6@%207@2%188$7$6@%207@2$0@4|@|@|@|@|@|@|@|@|@|@|@|@|@3"])
  fun op TR_ind x = x
    val op TR_ind =
    ThmBind.DT(((("ssm1",55),[("bool",[26]),("ssm1",[53])]),["DISK_THM"]),
               [ThmBind.read"%123%19%162%144%118%70%106%14%116%10%105%3%130%11%131%12%115%13%103%82%129%43%114%84%102%44%129%71%128%78%162%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@4$13%138$9@%143$8@$7@3%208$2@2%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@2%186$12@$3@$4@$1@$10$5@%208$2@3%188$6$5@%208$2@3$0@4|@|@|@|@|@|@|@|@|@|@|@|@|@2%144%118%70%106%14%116%10%105%3%130%11%131%12%115%13%103%82%129%43%114%84%102%44%129%71%128%78%162%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@4$13%138$9@%143$8@$7@3%219$2@2%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@2%186$12@$3@$4@$1@$10$5@%219$2@3%188$6$5@%219$2@3$0@4|@|@|@|@|@|@|@|@|@|@|@|@|@2%118%70%116%10%105%3%130%11%131%12%115%13%103%82%129%43%114%84%102%44%104%100%129%71%128%78%162%220$12$2@3$13%138$10@%143$9@$8@3%207@%186$12@$4@$5@%189$2@$1@2$6@$0@2%186$12@$4@$5@$1@$11$6@%207@2%188$7$6@%207@2$0@4|@|@|@|@|@|@|@|@|@|@|@|@|@4%132%23%135%28%107%30%107%33%162%199$3@$2@$1@$0@2$4$3@$2@$1@$0@2|@|@|@|@2|@"])
  fun op TR_strongind x = x
    val op TR_strongind =
    ThmBind.DT(((("ssm1",56),
                [("bool",[26,35]),("ssm1",[53])]),["DISK_THM"]),
               [ThmBind.read"%123%19%162%144%118%70%106%14%116%10%105%3%130%11%131%12%115%13%103%82%129%43%114%84%102%44%129%71%128%78%162%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@4$13%138$9@%143$8@$7@3%208$2@2%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@2%186$12@$3@$4@$1@$10$5@%208$2@3%188$6$5@%208$2@3$0@4|@|@|@|@|@|@|@|@|@|@|@|@|@2%144%118%70%106%14%116%10%105%3%130%11%131%12%115%13%103%82%129%43%114%84%102%44%129%71%128%78%162%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@4$13%138$9@%143$8@$7@3%219$2@2%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@2%186$12@$3@$4@$1@$10$5@%219$2@3%188$6$5@%219$2@3$0@4|@|@|@|@|@|@|@|@|@|@|@|@|@2%118%70%116%10%105%3%130%11%131%12%115%13%103%82%129%43%114%84%104%100%129%71%128%78%162%220$11$2@3$12%138$9@%143$8@$7@3%207@%186$11@$3@$4@%189$2@$1@2$5@$0@2%186$11@$3@$4@$1@$10$5@%207@2%188$6$5@%207@2$0@4|@|@|@|@|@|@|@|@|@|@|@|@4%132%23%135%28%107%30%107%33%162%199$3@$2@$1@$0@2$4$3@$2@$1@$0@2|@|@|@|@2|@"])
  fun op TR_cases x = x
    val op TR_cases =
    ThmBind.DT(((("ssm1",57),[("bool",[26]),("ssm1",[53])]),["DISK_THM"]),
               [ThmBind.read"%132%23%135%28%107%30%107%33%149%199$3@$2@$1@$0@2%204%171%70%167%14%170%10%166%3%180%11%181%12%169%13%164%82%179%43%168%84%163%44%179%71%178%78%144%158$16@%138$9@%143$8@$7@4%144%161$15@%208$2@3%144%150$14@%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@3%144%150$13@%186$12@$3@$4@$1@$10$5@%208$2@3%188$6$5@%208$2@3$0@4%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@7|@|@|@|@|@|@|@|@|@|@|@|@|@2%204%171%70%167%14%170%10%166%3%180%11%181%12%169%13%164%82%179%43%168%84%163%44%179%71%178%78%144%158$16@%138$9@%143$8@$7@4%144%161$15@%219$2@3%144%150$14@%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@3%144%150$13@%186$12@$3@$4@$1@$10$5@%219$2@3%188$6$5@%219$2@3$0@4%144$12%216$11@%213%197$2@5%187%138$9@%143$8@$7@3%186$12@$3@$4@%189%216$11@%213%197$2@4$1@2$5@$0@7|@|@|@|@|@|@|@|@|@|@|@|@|@2%171%70%170%10%166%3%180%11%181%12%169%13%164%82%179%43%168%84%163%44%165%100%179%71%178%78%144%158$16@%138$10@%143$9@$8@4%144%161$15@%207@2%144%150$14@%186$12@$4@$5@%189$2@$1@2$6@$0@3%144%150$13@%186$12@$4@$5@$1@$11$6@%207@2%188$7$6@%207@2$0@4%220$12$2@6|@|@|@|@|@|@|@|@|@|@|@|@|@4|@|@|@|@"])
  fun op TR_EQ_rules_thm x = x
    val op TR_EQ_rules_thm =
    ThmBind.DT(((("ssm1",58),
                [("bool",
                 [13,25,26,27,29,35,46,47,50,51,52,53,55,62,92,93,95,180]),
                 ("combin",[19]),("ind_type",[33,34]),("list",[9]),
                 ("pair",[8,9]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15,17,18,19,20,23]),
                 ("ssm1",
                 [18,19,20,21,22,23,24,37,38,39,53])]),["DISK_THM"]),
               [ThmBind.read"%144%149%199%138%3@%143%11@%12@3%208%44@2%186%70@%84@%43@%189%216%14@%213%197%44@4%71@2%82@%78@2%186%70@%84@%43@%71@%10%82@%208%44@3%188%13%82@%208%44@3%78@4%144%70%216%14@%213%197%44@5%187%138%3@%143%11@%12@3%186%70@%84@%43@%189%216%14@%213%197%44@4%71@2%82@%78@5%144%149%199%138%3@%143%11@%12@3%219%44@2%186%70@%84@%43@%189%216%14@%213%197%44@4%71@2%82@%78@2%186%70@%84@%43@%71@%10%82@%219%44@3%188%13%82@%219%44@3%78@4%144%70%216%14@%213%197%44@5%187%138%3@%143%11@%12@3%186%70@%84@%43@%189%216%14@%213%197%44@4%71@2%82@%78@5%149%199%138%3@%143%11@%12@3%207@%186%70@%84@%43@%189%100@%71@2%82@%78@2%186%70@%84@%43@%71@%10%82@%207@2%188%13%82@%207@2%78@4%220%70%100@5"])
  fun op TRrule0 x = x
    val op TRrule0 =
    ThmBind.DT(((("ssm1",59),
                [("bool",
                 [13,25,26,27,29,35,46,47,50,51,52,53,55,62,92,93,95,180]),
                 ("combin",[19]),("ind_type",[33,34]),("list",[9]),
                 ("pair",[8,9]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15,17,18,19,20,23]),
                 ("ssm1",
                 [18,19,20,21,22,23,24,37,38,39,53])]),["DISK_THM"]),
               [ThmBind.read"%149%199%138%3@%143%11@%12@3%208%44@2%186%70@%84@%43@%189%216%14@%213%197%44@4%71@2%82@%78@2%186%70@%84@%43@%71@%10%82@%208%44@3%188%13%82@%208%44@3%78@4%144%70%216%14@%213%197%44@5%187%138%3@%143%11@%12@3%186%70@%84@%43@%189%216%14@%213%197%44@4%71@2%82@%78@4"])
  fun op TRrule1 x = x
    val op TRrule1 =
    ThmBind.DT(((("ssm1",60),
                [("bool",
                 [13,25,26,27,29,35,46,47,50,51,52,53,55,62,92,93,95,180]),
                 ("combin",[19]),("ind_type",[33,34]),("list",[9]),
                 ("pair",[8,9]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15,17,18,19,20,23]),
                 ("ssm1",
                 [18,19,20,21,22,23,24,37,38,39,53])]),["DISK_THM"]),
               [ThmBind.read"%149%199%138%3@%143%11@%12@3%219%44@2%186%70@%84@%43@%189%216%14@%213%197%44@4%71@2%82@%78@2%186%70@%84@%43@%71@%10%82@%219%44@3%188%13%82@%219%44@3%78@4%144%70%216%14@%213%197%44@5%187%138%3@%143%11@%12@3%186%70@%84@%43@%189%216%14@%213%197%44@4%71@2%82@%78@4"])
  fun op TR_discard_cmd_rule x = x
    val op TR_discard_cmd_rule =
    ThmBind.DT(((("ssm1",61),
                [("bool",
                 [13,25,26,27,29,35,46,47,50,51,52,53,55,62,92,93,95,180]),
                 ("combin",[19]),("ind_type",[33,34]),("list",[9]),
                 ("pair",[8,9]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15,17,18,19,20,23]),
                 ("ssm1",
                 [18,19,20,21,22,23,24,37,38,39,53])]),["DISK_THM"]),
               [ThmBind.read"%149%199%138%3@%143%11@%12@3%207@%186%70@%84@%43@%189%100@%71@2%82@%78@2%186%70@%84@%43@%71@%10%82@%207@2%188%13%82@%207@2%78@4%220%70%100@3"])
  fun op TR_exec_cmd_rule x = x
    val op TR_exec_cmd_rule =
    ThmBind.DT(((("ssm1",62),
                [("bool",
                 [13,25,26,27,29,35,46,47,50,51,52,53,55,62,92,93,95,180]),
                 ("combin",[19]),("ind_type",[33,34]),("list",[9]),
                 ("pair",[8,9]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15,17,18,19,20,23]),
                 ("ssm1",
                 [18,19,20,21,22,23,24,37,38,39,53])]),["DISK_THM"]),
               [ThmBind.read"%118%70%129%43%114%84%106%14%102%44%129%71%103%82%128%78%162%105%3%130%11%131%12%162%187%138$2@%143$1@$0@3%186$10@$8@$9@%189%216$7@%213%197$6@4$5@2$4@$3@3%214%138$2@%143$1@$0@3%213%197$6@4|@|@|@2%116%10%115%13%105%3%130%11%131%12%149%199%138$2@%143$1@$0@3%208$8@2%186$12@$10@$11@%189%216$9@%213%197$8@4$7@2$6@$5@2%186$12@$10@$11@$7@$4$6@%208$8@3%188$3$6@%208$8@3$5@4%144$12%216$9@%213%197$8@5%144%187%138$2@%143$1@$0@3%186$12@$10@$11@%189%216$9@%213%197$8@4$7@2$6@$5@3%214%138$2@%143$1@$0@3%213%197$8@6|@|@|@|@|@2|@|@|@|@|@|@|@|@"])
  fun op TR_trap_cmd_rule x = x
    val op TR_trap_cmd_rule =
    ThmBind.DT(((("ssm1",63),
                [("bool",
                 [13,25,26,27,29,35,46,47,50,51,52,53,55,62,92,93,95,180]),
                 ("combin",[19]),("ind_type",[33,34]),("list",[9]),
                 ("pair",[8,9]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15,17,18,19,20,23]),
                 ("ssm1",
                 [18,19,20,21,22,23,24,37,38,39,53])]),["DISK_THM"]),
               [ThmBind.read"%118%70%114%84%129%43%106%14%102%44%129%71%103%82%128%78%162%105%3%130%11%131%12%162%187%138$2@%143$1@$0@3%186$10@$9@$8@%189%216$7@%213%197$6@4$5@2$4@$3@3%214%138$2@%143$1@$0@3%213%195@3|@|@|@2%116%10%115%13%105%3%130%11%131%12%149%199%138$2@%143$1@$0@3%219$8@2%186$12@$11@$10@%189%216$9@%213%197$8@4$7@2$6@$5@2%186$12@$11@$10@$7@$4$6@%219$8@3%188$3$6@%219$8@3$5@4%144$12%216$9@%213%197$8@5%144%187%138$2@%143$1@$0@3%186$12@$11@$10@%189%216$9@%213%197$8@4$7@2$6@$5@3%214%138$2@%143$1@$0@3%213%195@5|@|@|@|@|@2|@|@|@|@|@|@|@|@"])

  val _ = DB.bindl "ssm1"
  [("inst_TY_DEF",inst_TY_DEF,DB.Def),
   ("inst_case_def",inst_case_def,DB.Def),
   ("inst_size_def",inst_size_def,DB.Def),
   ("trType_TY_DEF",trType_TY_DEF,DB.Def),
   ("trType_case_def",trType_case_def,DB.Def),
   ("trType_size_def",trType_size_def,DB.Def),
   ("configuration_TY_DEF",configuration_TY_DEF,DB.Def),
   ("configuration_case_def",configuration_case_def,DB.Def),
   ("configuration_size_def",configuration_size_def,DB.Def),
   ("TR_def",TR_def,DB.Def), ("datatype_inst",datatype_inst,DB.Thm),
   ("inst_11",inst_11,DB.Thm), ("inst_distinct",inst_distinct,DB.Thm),
   ("inst_case_cong",inst_case_cong,DB.Thm),
   ("inst_nchotomy",inst_nchotomy,DB.Thm),
   ("inst_Axiom",inst_Axiom,DB.Thm),
   ("inst_induction",inst_induction,DB.Thm),
   ("inst_distinct_clauses",inst_distinct_clauses,DB.Thm),
   ("inst_one_one",inst_one_one,DB.Thm),
   ("datatype_trType",datatype_trType,DB.Thm),
   ("trType_11",trType_11,DB.Thm),
   ("trType_distinct",trType_distinct,DB.Thm),
   ("trType_case_cong",trType_case_cong,DB.Thm),
   ("trType_nchotomy",trType_nchotomy,DB.Thm),
   ("trType_Axiom",trType_Axiom,DB.Thm),
   ("trType_induction",trType_induction,DB.Thm),
   ("trType_distinct_clauses",trType_distinct_clauses,DB.Thm),
   ("trType_one_one",trType_one_one,DB.Thm),
   ("datatype_configuration",datatype_configuration,DB.Thm),
   ("configuration_11",configuration_11,DB.Thm),
   ("configuration_case_cong",configuration_case_cong,DB.Thm),
   ("configuration_nchotomy",configuration_nchotomy,DB.Thm),
   ("configuration_Axiom",configuration_Axiom,DB.Thm),
   ("configuration_induction",configuration_induction,DB.Thm),
   ("configuration_one_one",configuration_one_one,DB.Thm),
   ("CFGInterpret_ind",CFGInterpret_ind,DB.Thm),
   ("CFGInterpret_def",CFGInterpret_def,DB.Thm),
   ("TR_rules",TR_rules,DB.Thm), ("TR_ind",TR_ind,DB.Thm),
   ("TR_strongind",TR_strongind,DB.Thm), ("TR_cases",TR_cases,DB.Thm),
   ("TR_EQ_rules_thm",TR_EQ_rules_thm,DB.Thm), ("TRrule0",TRrule0,DB.Thm),
   ("TRrule1",TRrule1,DB.Thm),
   ("TR_discard_cmd_rule",TR_discard_cmd_rule,DB.Thm),
   ("TR_exec_cmd_rule",TR_exec_cmd_rule,DB.Thm),
   ("TR_trap_cmd_rule",TR_trap_cmd_rule,DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "ssm1",
    thydataty = "rule_induction",
    read = ThmBind.read,
    data = "ssm1.TR_strongind"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "ssm1",
    thydataty = "compute",
    read = ThmBind.read,
    data = "ssm1.CFGInterpret_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "ssm1",
    thydataty = "TypeGrammarDeltas",
    read = ThmBind.read,
    data = "NTY4.ssm1,4.instNTY4.ssm1,6.trTypeNTY4.ssm1,13.configuration"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "ssm1",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO4.SOME4.%197OO4.NONE4.%195OO9.inst_CASE4.%209OO9.inst_size4.%210OO4.case4.%209OO7.discard4.%207OO4.trap4.%219OO4.exec4.%208OO11.trType_CASE4.%217OO11.trType_size4.%218OO4.case4.%217OO3.CFG4.%186OO18.configuration_CASE4.%205OO18.configuration_size4.%206OO4.case4.%205OO12.CFGInterpret4.%187OO2.TR4.%199"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val ssm1_grammars = merge_grammars ["satList"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="ssm1"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val ssm1_grammars = 
    Portable.## (addtyUDs,addtmUDs) ssm1_grammars
  val _ = Parse.grammarDB_insert("ssm1",ssm1_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG inst_Axiom,
           case_def=inst_case_def,
           case_cong=inst_case_cong,
           induction=ORIG inst_induction,
           nchotomy=inst_nchotomy,
           size=SOME(Parse.Term`(ssm1$inst_size) :('command -> num$num) -> 'command ssm1$inst -> num$num`,
                     ORIG inst_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME inst_11,
           distinct=SOME inst_distinct,
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
          {ax=ORIG trType_Axiom,
           case_def=trType_case_def,
           case_cong=trType_case_cong,
           induction=ORIG trType_induction,
           nchotomy=trType_nchotomy,
           size=SOME(Parse.Term`(ssm1$trType_size) :('command -> num$num) -> 'command ssm1$trType -> num$num`,
                     ORIG trType_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME trType_11,
           distinct=SOME trType_distinct,
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
          {ax=ORIG configuration_Axiom,
           case_def=configuration_case_def,
           case_cong=configuration_case_cong,
           induction=ORIG configuration_induction,
           nchotomy=configuration_nchotomy,
           size=SOME(Parse.Term`(ssm1$configuration_size) :('command -> num$num) ->
('d -> num$num) ->
('e -> num$num) ->
('output -> num$num) ->
('principal -> num$num) ->
('state -> num$num) ->
('command, 'd, 'e, 'output, 'principal, 'state) ssm1$configuration ->
num$num`,
                     ORIG configuration_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME configuration_11,
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

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "ssm1"
end
