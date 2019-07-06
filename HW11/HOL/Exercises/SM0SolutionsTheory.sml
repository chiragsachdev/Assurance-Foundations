structure SM0SolutionsTheory :> SM0SolutionsTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading SM0SolutionsTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open SM0Theory
  in end;
  val _ = Theory.link_parents
          ("SM0Solutions",
          Arbnum.fromString "1554848314",
          Arbnum.fromString "245219")
          [("SM0",
           Arbnum.fromString "1554848301",
           Arbnum.fromString "853875")];
  val _ = Theory.incorporate_types "SM0Solutions" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("aclfoundation", "Form"),
   ID("SM0", "staff"), ID("ssm1", "inst"), ID("SM0", "command"),
   ID("list", "list"), ID("SM0", "privcmd"), ID("SM0", "npriv"),
   ID("aclfoundation", "Kripke"), ID("SM0", "state"), ID("ssm1", "trType"),
   ID("aclfoundation", "po"), ID("SM0", "output"),
   ID("aclfoundation", "Princ"), ID("aclfoundation", "IntLevel"),
   ID("aclfoundation", "SecLevel"), ID("num", "num"), ID("bool", "!"),
   ID("pair", ","), ID("pair", "prod"), ID("bool", "/\\"), ID("min", "="),
   ID("min", "==>"), ID("min", "@"), ID("SM0", "Alice"), ID("SM0", "Bob"),
   ID("ssm1", "CFG"), ID("ssm1", "configuration"),
   ID("ssm1", "CFGInterpret"), ID("list", "CONS"), ID("SM0", "Carol"),
   ID("bool", "F"), ID("aclfoundation", "FF"),
   ID("aclfoundation", "Form_CASE"), ID("combin", "I"), ID("list", "NIL"),
   ID("ssm1", "NONE"), ID("SM0", "NP"), ID("aclfoundation", "Name"),
   ID("SM0", "PR"), ID("aclfoundation", "Princ_CASE"),
   ID("SM0", "SM0StateInterp"), ID("ssm1", "SOME"), ID("bool", "T"),
   ID("ssm1", "TR"), ID("aclfoundation", "TT"), ID("relation", "WF"),
   ID("relation", "WFREC"), ID("aclfoundation", "andf"),
   ID("SM0", "certs"), ID("SM0Solutions", "certs2"),
   ID("aclfoundation", "controls"), ID("aclfoundation", "domi"),
   ID("aclfoundation", "doms"), ID("aclfoundation", "eqf"),
   ID("aclfoundation", "eqi"), ID("aclfoundation", "eqn"),
   ID("aclfoundation", "eqs"), ID("ssm1", "exec"),
   ID("aclfoundation", "impf"), ID("SM0", "inputOK"),
   ID("SM0Solutions", "inputOK2"), ID("ssm1", "inst_CASE"),
   ID("aclfoundation", "lt"), ID("aclfoundation", "lte"),
   ID("aclfoundation", "meet"), ID("aclfoundation", "notf"),
   ID("aclfoundation", "orf"), ID("aclfoundation", "prop"),
   ID("aclfoundation", "quoting"), ID("aclfoundation", "reps"),
   ID("aclrules", "sat"), ID("aclfoundation", "says"),
   ID("aclfoundation", "speaks_for"), ID("SM0", "staff_CASE"),
   ID("ssm1", "trap")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYV "'e", TYV "'d", TYOP [3], TYOP [5], TYOP [4, 4],
   TYOP [2, 5, 3, 2, 1], TYOP [0, 6, 0], TYOP [6, 6], TYOP [7],
   TYOP [0, 9, 8], TYOP [8], TYOP [0, 11, 10], TYOP [0, 4, 12], TYV "'b",
   TYOP [9, 5, 14, 3, 2, 1], TYOP [10], TYOP [11, 4], TYOP [0, 17, 16],
   TYOP [0, 16, 18], TYOP [12, 2], TYOP [12, 1], TYOP [13],
   TYOP [0, 17, 22], TYOP [0, 16, 23], TYOP [0, 6, 7], TYOP [6, 22],
   TYOP [14, 3], TYOP [15, 3, 2], TYOP [16, 3, 1], TYOP [17],
   TYOP [0, 7, 0], TYOP [0, 28, 0], TYOP [0, 32, 0], TYOP [0, 15, 0],
   TYOP [0, 34, 0], TYOP [0, 27, 0], TYOP [0, 36, 0], TYOP [0, 29, 0],
   TYOP [0, 38, 0], TYOP [0, 4, 0], TYOP [0, 40, 0], TYOP [0, 31, 0],
   TYOP [0, 24, 0], TYOP [0, 43, 0], TYOP [0, 19, 0], TYOP [0, 45, 0],
   TYOP [0, 5, 0], TYOP [0, 47, 0], TYOP [0, 8, 0], TYOP [0, 49, 0],
   TYOP [0, 26, 0], TYOP [0, 51, 0], TYOP [0, 11, 0], TYOP [0, 53, 0],
   TYOP [0, 30, 0], TYOP [0, 55, 0], TYOP [0, 20, 0], TYOP [0, 57, 0],
   TYOP [0, 21, 0], TYOP [0, 59, 0], TYOP [0, 9, 0], TYOP [0, 61, 0],
   TYOP [0, 3, 0], TYOP [0, 63, 0], TYOP [0, 16, 0], TYOP [0, 65, 0],
   TYOP [20, 20, 21], TYOP [20, 15, 67], TYOP [0, 67, 68],
   TYOP [0, 15, 69], TYOP [0, 21, 67], TYOP [0, 20, 71], TYOP [0, 0, 0],
   TYOP [0, 0, 73], TYOP [0, 7, 31], TYOP [0, 8, 49], TYOP [0, 25, 0],
   TYOP [0, 77, 25], TYOP [28, 4, 2, 1, 22, 3, 16], TYOP [0, 26, 79],
   TYOP [0, 16, 80], TYOP [0, 8, 81], TYOP [0, 8, 82], TYOP [0, 16, 6],
   TYOP [0, 84, 83], TYOP [0, 7, 85], TYOP [0, 79, 0], TYOP [0, 68, 87],
   TYOP [0, 8, 8], TYOP [0, 6, 89], TYOP [0, 26, 26], TYOP [0, 22, 91],
   TYOP [0, 30, 55], TYOP [0, 93, 0], TYOP [0, 93, 94], TYOP [0, 93, 95],
   TYOP [0, 29, 38], TYOP [0, 97, 96], TYOP [0, 97, 98], TYOP [0, 28, 32],
   TYOP [0, 100, 99], TYOP [0, 100, 101], TYOP [0, 27, 7],
   TYOP [0, 27, 103], TYOP [0, 104, 102], TYOP [0, 103, 105],
   TYOP [0, 27, 36], TYOP [0, 107, 106], TYOP [0, 103, 108],
   TYOP [0, 25, 109], TYOP [0, 25, 110], TYOP [0, 25, 111],
   TYOP [0, 25, 112], TYOP [0, 7, 113], TYOP [0, 47, 114],
   TYOP [0, 0, 115], TYOP [0, 0, 116], TYOP [0, 6, 117], TYOP [0, 11, 4],
   TYOP [0, 3, 27], TYOP [0, 9, 4], TYOP [0, 107, 0], TYOP [0, 107, 122],
   TYOP [0, 63, 123], TYOP [0, 27, 124], TYOP [0, 4, 5], TYOP [0, 79, 87],
   TYOP [0, 17, 127], TYOP [0, 68, 128], TYOP [0, 7, 7], TYOP [0, 130, 7],
   TYOP [0, 25, 131], TYOP [0, 6, 6], TYOP [0, 6, 133], TYOP [0, 27, 133],
   TYOP [0, 28, 6], TYOP [0, 28, 136], TYOP [0, 29, 6], TYOP [0, 29, 138],
   TYOP [0, 30, 6], TYOP [0, 30, 140], TYOP [0, 4, 17], TYOP [0, 40, 73],
   TYOP [0, 5, 143], TYOP [0, 27, 27], TYOP [0, 27, 145], TYOP [0, 5, 6],
   TYOP [0, 27, 135], TYOP [0, 68, 7], TYOP [0, 27, 6], TYOP [0, 27, 150],
   TYOP [0, 0, 74], TYOP [0, 3, 152]]
  end
  val _ = Theory.incorporate_consts "SM0Solutions" tyvector
     [("inputOK2", 7), ("certs2", 13)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 15), TMV("NS", 19), TMV("Oi", 20), TMV("Os", 21),
   TMV("Out", 24), TMV("P", 7), TMV("R", 25), TMV("a", 6), TMV("cmd", 4),
   TMV("inputOK2", 7), TMV("ins", 8), TMV("npriv", 11), TMV("outs", 26),
   TMV("privcmd", 9), TMV("s", 16), TMV("v", 6), TMV("v", 5), TMV("v1", 6),
   TMV("v10", 27), TMV("v100", 6), TMV("v101", 6), TMV("v102", 6),
   TMV("v103", 6), TMV("v104", 6), TMV("v105", 6), TMV("v106", 6),
   TMV("v107", 6), TMV("v108", 6), TMV("v109", 27), TMV("v110", 6),
   TMV("v111", 27), TMV("v112", 27), TMV("v113", 27), TMV("v114", 6),
   TMV("v115", 27), TMV("v116", 27), TMV("v117", 6), TMV("v118", 28),
   TMV("v119", 28), TMV("v12", 27), TMV("v120", 28), TMV("v121", 28),
   TMV("v122", 29), TMV("v123", 29), TMV("v124", 29), TMV("v125", 29),
   TMV("v126", 30), TMV("v127", 30), TMV("v128", 30), TMV("v129", 30),
   TMV("v13", 27), TMV("v130", 30), TMV("v131", 30), TMV("v132", 3),
   TMV("v133", 27), TMV("v134", 27), TMV("v135", 27), TMV("v136", 27),
   TMV("v137", 3), TMV("v138", 27), TMV("v139", 27), TMV("v14", 27),
   TMV("v140", 27), TMV("v141", 27), TMV("v142", 4), TMV("v15", 6),
   TMV("v16", 27), TMV("v17", 27), TMV("v18", 6), TMV("v19", 28),
   TMV("v2", 6), TMV("v20", 28), TMV("v21", 28), TMV("v22", 28),
   TMV("v23", 29), TMV("v24", 29), TMV("v25", 29), TMV("v26", 29),
   TMV("v27", 30), TMV("v28", 30), TMV("v29", 30), TMV("v3", 6),
   TMV("v30", 30), TMV("v31", 30), TMV("v32", 30), TMV("v33", 5),
   TMV("v34", 6), TMV("v35", 6), TMV("v36", 6), TMV("v37", 6),
   TMV("v38", 6), TMV("v39", 6), TMV("v4", 6), TMV("v40", 6),
   TMV("v41", 6), TMV("v42", 6), TMV("v43", 27), TMV("v44", 6),
   TMV("v45", 27), TMV("v46", 27), TMV("v47", 27), TMV("v48", 6),
   TMV("v49", 27), TMV("v5", 6), TMV("v50", 27), TMV("v51", 6),
   TMV("v52", 28), TMV("v53", 28), TMV("v54", 28), TMV("v55", 28),
   TMV("v56", 29), TMV("v57", 29), TMV("v58", 29), TMV("v59", 29),
   TMV("v6", 6), TMV("v60", 30), TMV("v61", 30), TMV("v62", 30),
   TMV("v63", 30), TMV("v64", 30), TMV("v65", 30), TMV("v66", 5),
   TMV("v67", 6), TMV("v68", 6), TMV("v69", 6), TMV("v7", 6),
   TMV("v70", 6), TMV("v71", 6), TMV("v72", 6), TMV("v73", 6),
   TMV("v74", 6), TMV("v75", 6), TMV("v76", 27), TMV("v77", 6),
   TMV("v78", 27), TMV("v79", 27), TMV("v8", 6), TMV("v80", 27),
   TMV("v81", 6), TMV("v82", 27), TMV("v83", 27), TMV("v84", 6),
   TMV("v85", 28), TMV("v86", 28), TMV("v87", 28), TMV("v88", 28),
   TMV("v89", 29), TMV("v9", 6), TMV("v90", 29), TMV("v91", 29),
   TMV("v92", 29), TMV("v93", 30), TMV("v94", 30), TMV("v95", 30),
   TMV("v96", 30), TMV("v97", 30), TMV("v98", 30), TMV("v99", 5),
   TMC(18, 31), TMC(18, 33), TMC(18, 35), TMC(18, 37), TMC(18, 39),
   TMC(18, 41), TMC(18, 42), TMC(18, 44), TMC(18, 46), TMC(18, 48),
   TMC(18, 50), TMC(18, 52), TMC(18, 54), TMC(18, 56), TMC(18, 58),
   TMC(18, 60), TMC(18, 62), TMC(18, 64), TMC(18, 66), TMC(19, 70),
   TMC(19, 72), TMC(21, 74), TMC(22, 74), TMC(22, 75), TMC(22, 76),
   TMC(23, 74), TMC(24, 78), TMC(25, 3), TMC(26, 3), TMC(27, 86),
   TMC(29, 88), TMC(30, 90), TMC(30, 92), TMC(31, 3), TMC(32, 0),
   TMC(33, 6), TMC(34, 118), TMC(35, 73), TMC(36, 8), TMC(37, 5),
   TMC(38, 119), TMC(39, 120), TMC(40, 121), TMC(41, 125), TMC(42, 84),
   TMC(43, 126), TMC(44, 0), TMC(45, 129), TMC(46, 6), TMC(47, 77),
   TMC(48, 132), TMC(49, 134), TMC(50, 13), TMC(51, 13), TMC(52, 135),
   TMC(53, 137), TMC(54, 139), TMC(55, 134), TMC(56, 137), TMC(57, 141),
   TMC(58, 139), TMC(59, 142), TMC(60, 134), TMC(61, 7), TMC(62, 7),
   TMC(63, 144), TMC(64, 141), TMC(65, 141), TMC(66, 146), TMC(67, 133),
   TMC(68, 134), TMC(69, 147), TMC(70, 146), TMC(71, 148), TMC(72, 149),
   TMC(73, 135), TMC(74, 151), TMC(75, 153), TMC(76, 142)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op inputOK2_primitive_def x = x
    val op inputOK2_primitive_def =
    ThmBind.DT(((("SM0Solutions",5),[]),[]),
               [ThmBind.read"%181%222@%208%184%6%207$0@|@2%9%7%194$0@%195%192@2%195%192@2%85%195%192@|@%86%195%192@|@%87%88%195%192@||@%89%90%195%192@||@%91%93%195%192@||@%94%95%195%192@||@%96%97%194$0@%195%192@2%195%192@2%157%201$2@%58%223$1@%8%235$1@%195%192@2%195%192@2%195%204@2|@%195%192@2|@%59%60%195%192@||@%62%63%195%192@||@|@%19%195%192@|@%20%21%195%192@||@%22%23%195%192@||@%24%25%195%192@||@%26%27%195%192@||@%28%29%195%192@||@%30%31%195%192@||@%32%33%195%192@||@%34%35%36%195%192@|||@%37%38%195%192@||@%40%41%195%192@||@%42%43%195%192@||@%44%45%195%192@||@%46%47%195%192@||@%48%49%195%192@||@%51%52%195%192@||@||@%98%99%195%192@||@%100%101%195%192@||@%102%104%105%195%192@|||@%106%107%195%192@||@%108%109%195%192@||@%110%111%195%192@||@%112%113%195%192@||@%115%116%195%192@||@%117%118%195%192@||@%119%120%195%192@||@||@2"])
  fun op certs2_def x = x
    val op certs2_def =
    ThmBind.DT(((("SM0Solutions",8),[]),[]),
               [ThmBind.read"%163%8%170%11%174%13%182%211$2@$1@$0@2%189%212%199%191@2%229%203%198$1@5%189%220%233%199%191@2%229%203%200$0@5%229%197@3%196@3|@|@|@"])
  fun op Alice_npriv_lemma x = x
    val op Alice_npriv_lemma =
    ThmBind.DT(((("SM0Solutions",0),
                [("SM0",[141,142]),("aclDrules",[3]),("aclrules",[63]),
                 ("bool",[25,26,46,47,50,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,3]),
                 ("ssm1",[52])]),["DISK_THM"]),
               [ThmBind.read"%183%188%177%0@%178%2@%3@3%187%221@%202@%210%8@%11@%13@2%189%233%199%185@2%229%203%198%11@5%10@2%14@%12@3%232%177%0@%178%2@%3@3%229%203%198%11@5"])
  fun op Alice_exec_npriv_justified_thm x = x
    val op Alice_exec_npriv_justified_thm =
    ThmBind.DT(((("SM0Solutions",1),
                [("SM0",[141,142]),("aclDrules",[3]),("aclrules",[63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,62])]),["DISK_THM"]),
               [ThmBind.read"%166%1%165%4%160%0%172%2%173%3%180%205%177$2@%178$1@$0@3%219%198%11@3%187%221@%202@%210%8@%11@%13@2%189%233%199%185@2%229%203%198%11@5%10@2%14@%12@2%187%221@%202@%210%8@%11@%13@2%10@$4%14@%219%198%11@4%190$3%14@%219%198%11@4%12@4%179%221%233%199%185@2%229%203%198%11@6%179%188%177$2@%178$1@$0@3%187%221@%202@%210%8@%11@%13@2%189%233%199%185@2%229%203%198%11@5%10@2%14@%12@3%232%177$2@%178$1@$0@3%229%203%198%11@7|@|@|@|@|@"])
  fun op Alice_npriv_verified_thm x = x
    val op Alice_npriv_verified_thm =
    ThmBind.DT(((("SM0Solutions",3),
                [("SM0",[141,142]),("aclDrules",[3]),("aclrules",[63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,62])]),["DISK_THM"]),
               [ThmBind.read"%166%1%165%4%160%0%172%2%173%3%183%205%177$2@%178$1@$0@3%219%198%11@3%187%221@%202@%210%8@%11@%13@2%189%233%199%185@2%229%203%198%11@5%10@2%14@%12@2%187%221@%202@%210%8@%11@%13@2%10@$4%14@%219%198%11@4%190$3%14@%219%198%11@4%12@4%232%177$2@%178$1@$0@3%229%203%198%11@5|@|@|@|@|@"])
  fun op Alice_justified_npriv_exec_thm x = x
    val op Alice_justified_npriv_exec_thm =
    ThmBind.DT(((("SM0Solutions",4),
                [("SM0",[140,141,142]),("aclDrules",[3]),("aclrules",[63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,72,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,62])]),["DISK_THM"]),
               [ThmBind.read"%166%1%165%4%160%0%172%2%173%3%163%8%170%11%174%13%168%10%176%14%169%12%183%179%221%233%199%185@2%229%203%198$4@6%188%177$8@%178$7@$6@3%187%221@%202@%210$5@$4@$3@2%189%233%199%185@2%229%203%198$4@5$2@2$1@$0@4%205%177$8@%178$7@$6@3%219%198$4@3%187%221@%202@%210$5@$4@$3@2%189%233%199%185@2%229%203%198$4@5$2@2$1@$0@2%187%221@%202@%210$5@$4@$3@2$2@$10$1@%219%198$4@4%190$9$1@%219%198$4@4$0@4|@|@|@|@|@|@|@|@|@|@|@"])
  fun op inputOK2_ind x = x
    val op inputOK2_ind =
    ThmBind.DT(((("SM0Solutions",6),
                [("SM0",[134]),("aclfoundation",[55,116]),
                 ("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79]),
                 ("relation",[107,113]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[12])]),["DISK_THM"]),
               [ThmBind.read"%164%5%183%179%163%8$1%233%199%191@2%229%203$0@4|@2%179$0%206@2%179$0%193@2%179%167%16$1%229$0@2|@2%179%158%17$1%227$0@2|@2%179%158%70%158%81$2%209$1@$0@2|@|@2%179%158%92%158%103$2%228$1@$0@2|@|@2%179%158%114%158%125$2%220$1@$0@2|@|@2%179%158%136%158%147$2%215$1@$0@2|@|@2%179%161%18$1%233$0@%206@2|@2%179%161%18$1%233$0@%193@2|@2%179%163%64$1%233%199%185@2%229%203$0@4|@2%179%163%64$1%233%199%186@2%229%203$0@4|@2%179%175%53$1%233%199$0@2%229%197@3|@2%179%161%54%161%55%167%121$3%233%226$2@$1@2%229$0@3|@|@|@2%179%161%56%161%57%167%121$3%233%230$2@$1@2%229$0@3|@|@|@2%179%161%18%158%122$2%233$1@%227$0@3|@|@2%179%161%18%158%123%158%124$3%233$2@%209$1@$0@3|@|@|@2%179%161%18%158%126%158%127$3%233$2@%228$1@$0@3|@|@|@2%179%161%18%158%128%158%129$3%233$2@%220$1@$0@3|@|@|@2%179%161%18%158%130%158%131$3%233$2@%215$1@$0@3|@|@|@2%179%161%18%161%132%158%133$3%233$2@%233$1@$0@3|@|@|@2%179%161%18%161%134%161%135$3%233$2@%234$1@$0@3|@|@|@2%179%161%18%161%137%158%138$3%233$2@%212$1@$0@3|@|@|@2%179%161%18%161%139%161%140%158%141$4%233$3@%231$2@$1@$0@3|@|@|@|@2%179%161%18%159%142%159%143$3%233$2@%213$1@$0@3|@|@|@2%179%161%18%159%144%159%145$3%233$2@%216$1@$0@3|@|@|@2%179%161%18%162%146%162%148$3%233$2@%214$1@$0@3|@|@|@2%179%161%18%162%149%162%150$3%233$2@%218$1@$0@3|@|@|@2%179%161%18%171%151%171%152$3%233$2@%217$1@$0@3|@|@|@2%179%161%18%171%153%171%154$3%233$2@%225$1@$0@3|@|@|@2%179%161%18%171%155%171%156$3%233$2@%224$1@$0@3|@|@|@2%179%161%39%161%50$2%234$1@$0@2|@|@2%179%161%61%158%65$2%212$1@$0@2|@|@2%179%161%66%161%67%158%68$3%231$2@$1@$0@2|@|@|@2%179%159%69%159%71$2%213$1@$0@2|@|@2%179%159%72%159%73$2%216$1@$0@2|@|@2%179%162%74%162%75$2%214$1@$0@2|@|@2%179%162%76%162%77$2%218$1@$0@2|@|@2%179%171%78%171%79$2%217$1@$0@2|@|@2%179%171%80%171%82$2%225$1@$0@2|@|@2%171%83%171%84$2%224$1@$0@2|@|@43%158%15$1$0@|@2|@"])
  fun op inputOK2_def x = x
    val op inputOK2_def =
    ThmBind.DT(((("SM0Solutions",7),
                [("SM0",[130]),("SM0Solutions",[5]),
                 ("aclfoundation",[33,110]),("bool",[15]),("combin",[19]),
                 ("relation",[113,132]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%179%180%222%233%199%191@2%229%203%8@5%204@2%179%180%222%206@2%192@2%179%180%222%193@2%192@2%179%180%222%229%16@3%192@2%179%180%222%227%17@3%192@2%179%180%222%209%70@%81@3%192@2%179%180%222%228%92@%103@3%192@2%179%180%222%220%114@%125@3%192@2%179%180%222%215%136@%147@3%192@2%179%180%222%233%18@%206@3%192@2%179%180%222%233%18@%193@3%192@2%179%180%222%233%199%185@2%229%203%64@5%192@2%179%180%222%233%199%186@2%229%203%64@5%192@2%179%180%222%233%199%53@2%229%197@4%192@2%179%180%222%233%226%54@%55@2%229%121@4%192@2%179%180%222%233%230%56@%57@2%229%121@4%192@2%179%180%222%233%18@%227%122@4%192@2%179%180%222%233%18@%209%123@%124@4%192@2%179%180%222%233%18@%228%126@%127@4%192@2%179%180%222%233%18@%220%128@%129@4%192@2%179%180%222%233%18@%215%130@%131@4%192@2%179%180%222%233%18@%233%132@%133@4%192@2%179%180%222%233%18@%234%134@%135@4%192@2%179%180%222%233%18@%212%137@%138@4%192@2%179%180%222%233%18@%231%139@%140@%141@4%192@2%179%180%222%233%18@%213%142@%143@4%192@2%179%180%222%233%18@%216%144@%145@4%192@2%179%180%222%233%18@%214%146@%148@4%192@2%179%180%222%233%18@%218%149@%150@4%192@2%179%180%222%233%18@%217%151@%152@4%192@2%179%180%222%233%18@%225%153@%154@4%192@2%179%180%222%233%18@%224%155@%156@4%192@2%179%180%222%234%39@%50@3%192@2%179%180%222%212%61@%65@3%192@2%179%180%222%231%66@%67@%68@3%192@2%179%180%222%213%69@%71@3%192@2%179%180%222%216%72@%73@3%192@2%179%180%222%214%74@%75@3%192@2%179%180%222%218%76@%77@3%192@2%179%180%222%217%78@%79@3%192@2%179%180%222%225%80@%82@3%192@2%180%222%224%83@%84@3%192@42"])
  fun op Carol_npriv_lemma x = x
    val op Carol_npriv_lemma =
    ThmBind.DT(((("SM0Solutions",9),
                [("SM0",[141]),("SM0Solutions",[8]),("aclDrules",[3]),
                 ("aclrules",[63]),
                 ("bool",[25,26,46,47,50,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,3]),
                 ("ssm1",[52])]),["DISK_THM"]),
               [ThmBind.read"%183%188%177%0@%178%2@%3@3%187%222@%202@%211%8@%11@%13@2%189%233%199%191@2%229%203%198%11@5%10@2%14@%12@3%232%177%0@%178%2@%3@3%229%203%198%11@5"])
  fun op Carol_exec_npriv_justified_thm x = x
    val op Carol_exec_npriv_justified_thm =
    ThmBind.DT(((("SM0Solutions",10),
                [("SM0",[141]),("SM0Solutions",[8]),("aclDrules",[3]),
                 ("aclrules",[63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,62])]),["DISK_THM"]),
               [ThmBind.read"%166%1%165%4%160%0%172%2%173%3%180%205%177$2@%178$1@$0@3%219%198%11@3%187%222@%202@%211%8@%11@%13@2%189%233%199%191@2%229%203%198%11@5%10@2%14@%12@2%187%222@%202@%211%8@%11@%13@2%10@$4%14@%219%198%11@4%190$3%14@%219%198%11@4%12@4%179%222%233%199%191@2%229%203%198%11@6%179%188%177$2@%178$1@$0@3%187%222@%202@%211%8@%11@%13@2%189%233%199%191@2%229%203%198%11@5%10@2%14@%12@3%232%177$2@%178$1@$0@3%229%203%198%11@7|@|@|@|@|@"])
  fun op Carol_npriv_verified_thm x = x
    val op Carol_npriv_verified_thm =
    ThmBind.DT(((("SM0Solutions",11),
                [("SM0",[141]),("SM0Solutions",[8]),("aclDrules",[3]),
                 ("aclrules",[63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,62])]),["DISK_THM"]),
               [ThmBind.read"%166%1%165%4%160%0%172%2%173%3%183%205%177$2@%178$1@$0@3%219%198%11@3%187%222@%202@%211%8@%11@%13@2%189%233%199%191@2%229%203%198%11@5%10@2%14@%12@2%187%222@%202@%211%8@%11@%13@2%10@$4%14@%219%198%11@4%190$3%14@%219%198%11@4%12@4%232%177$2@%178$1@$0@3%229%203%198%11@5|@|@|@|@|@"])
  fun op Carol_justified_npriv_exec_thm x = x
    val op Carol_justified_npriv_exec_thm =
    ThmBind.DT(((("SM0Solutions",12),
                [("SM0",[130,141]),("SM0Solutions",[5,8]),
                 ("aclDrules",[3]),("aclfoundation",[33,110]),
                 ("aclrules",[63]),
                 ("bool",
                 [15,25,26,35,42,46,47,50,52,53,55,57,62,70,72,76,83,92,93,
                  95,145]),("combin",[19]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,3]),
                 ("ssm1",[6,52,62])]),["DISK_THM"]),
               [ThmBind.read"%166%1%165%4%160%0%172%2%173%3%163%8%170%11%174%13%168%10%176%14%169%12%183%179%222%233%199%191@2%229%203%198$4@6%188%177$8@%178$7@$6@3%187%222@%202@%211$5@$4@$3@2%189%233%199%191@2%229%203%198$4@5$2@2$1@$0@4%205%177$8@%178$7@$6@3%219%198$4@3%187%222@%202@%211$5@$4@$3@2%189%233%199%191@2%229%203%198$4@5$2@2$1@$0@2%187%222@%202@%211$5@$4@$3@2$2@$10$1@%219%198$4@4%190$9$1@%219%198$4@4$0@4|@|@|@|@|@|@|@|@|@|@|@"])
  fun op Carol_privcmd_trap_lemma x = x
    val op Carol_privcmd_trap_lemma =
    ThmBind.DT(((("SM0Solutions",13),
                [("SM0",[141]),("SM0Solutions",[8]),("aclDrules",[3]),
                 ("aclrules",[23,63]),
                 ("bool",[25,26,46,47,50,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,3]),
                 ("ssm1",[52])]),["DISK_THM"]),
               [ThmBind.read"%183%188%177%0@%178%2@%3@3%187%222@%202@%211%8@%11@%13@2%189%233%199%191@2%229%203%200%13@5%10@2%14@%12@3%232%177%0@%178%2@%3@3%229%197@3"])
  fun op Carol_trap_privcmd_justified_thm x = x
    val op Carol_trap_privcmd_justified_thm =
    ThmBind.DT(((("SM0Solutions",14),
                [("SM0",[141]),("SM0Solutions",[8]),("aclDrules",[3]),
                 ("aclrules",[23,63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,63])]),["DISK_THM"]),
               [ThmBind.read"%166%1%165%4%160%0%172%2%173%3%180%205%177$2@%178$1@$0@3%236%200%13@3%187%222@%202@%211%8@%11@%13@2%189%233%199%191@2%229%203%200%13@5%10@2%14@%12@2%187%222@%202@%211%8@%11@%13@2%10@$4%14@%236%200%13@4%190$3%14@%236%200%13@4%12@4%179%222%233%199%191@2%229%203%200%13@6%179%188%177$2@%178$1@$0@3%187%222@%202@%211%8@%11@%13@2%189%233%199%191@2%229%203%200%13@5%10@2%14@%12@3%232%177$2@%178$1@$0@3%229%197@5|@|@|@|@|@"])
  fun op Carol_privcmd_trapped_thm x = x
    val op Carol_privcmd_trapped_thm =
    ThmBind.DT(((("SM0Solutions",15),
                [("SM0",[141]),("SM0Solutions",[8]),("aclDrules",[3]),
                 ("aclrules",[23,63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,63])]),["DISK_THM"]),
               [ThmBind.read"%166%1%165%4%160%0%172%2%173%3%183%205%177$2@%178$1@$0@3%236%200%13@3%187%222@%202@%211%8@%11@%13@2%189%233%199%191@2%229%203%200%13@5%10@2%14@%12@2%187%222@%202@%211%8@%11@%13@2%10@$4%14@%236%200%13@4%190$3%14@%236%200%13@4%12@4%232%177$2@%178$1@$0@3%229%197@3|@|@|@|@|@"])
  fun op Carol_justified_privcmd_trap_thm x = x
    val op Carol_justified_privcmd_trap_thm =
    ThmBind.DT(((("SM0Solutions",16),
                [("SM0",[130,141]),("SM0Solutions",[5,8]),
                 ("aclDrules",[3]),("aclfoundation",[33,110]),
                 ("aclrules",[23,63]),
                 ("bool",
                 [15,25,26,35,42,46,47,50,52,53,55,57,62,70,72,76,83,92,93,
                  95,145]),("combin",[19]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,3]),
                 ("ssm1",[6,52,63])]),["DISK_THM"]),
               [ThmBind.read"%166%1%165%4%160%0%172%2%173%3%163%8%170%11%174%13%168%10%176%14%169%12%183%179%222%233%199%191@2%229%203%200$3@6%188%177$8@%178$7@$6@3%187%222@%202@%211$5@$4@$3@2%189%233%199%191@2%229%203%200$3@5$2@2$1@$0@4%205%177$8@%178$7@$6@3%236%200$3@3%187%222@%202@%211$5@$4@$3@2%189%233%199%191@2%229%203%200$3@5$2@2$1@$0@2%187%222@%202@%211$5@$4@$3@2$2@$10$1@%236%200$3@4%190$9$1@%236%200$3@4$0@4|@|@|@|@|@|@|@|@|@|@|@"])

  val _ = DB.bindl "SM0Solutions"
  [("inputOK2_primitive_def",inputOK2_primitive_def,DB.Def),
   ("certs2_def",certs2_def,DB.Def),
   ("Alice_npriv_lemma",Alice_npriv_lemma,DB.Thm),
   ("Alice_exec_npriv_justified_thm",
    Alice_exec_npriv_justified_thm,
    DB.Thm), ("Alice_npriv_verified_thm",Alice_npriv_verified_thm,DB.Thm),
   ("Alice_justified_npriv_exec_thm",
    Alice_justified_npriv_exec_thm,
    DB.Thm), ("inputOK2_ind",inputOK2_ind,DB.Thm),
   ("inputOK2_def",inputOK2_def,DB.Thm),
   ("Carol_npriv_lemma",Carol_npriv_lemma,DB.Thm),
   ("Carol_exec_npriv_justified_thm",
    Carol_exec_npriv_justified_thm,
    DB.Thm), ("Carol_npriv_verified_thm",Carol_npriv_verified_thm,DB.Thm),
   ("Carol_justified_npriv_exec_thm",
    Carol_justified_npriv_exec_thm,
    DB.Thm), ("Carol_privcmd_trap_lemma",Carol_privcmd_trap_lemma,DB.Thm),
   ("Carol_trap_privcmd_justified_thm",
    Carol_trap_privcmd_justified_thm,
    DB.Thm),
   ("Carol_privcmd_trapped_thm",Carol_privcmd_trapped_thm,DB.Thm),
   ("Carol_justified_privcmd_trap_thm",
    Carol_justified_privcmd_trap_thm,
    DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0Solutions",
    thydataty = "compute",
    read = ThmBind.read,
    data = "SM0Solutions.inputOK2_def SM0Solutions.certs2_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0Solutions",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data = "OO8.inputOK24.%222OO6.certs24.%211"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val SM0Solutions_grammars = merge_grammars ["SM0"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="SM0Solutions"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val SM0Solutions_grammars = 
    Portable.## (addtyUDs,addtmUDs) SM0Solutions_grammars
  val _ = Parse.grammarDB_insert("SM0Solutions",SM0Solutions_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "SM0Solutions"
end
