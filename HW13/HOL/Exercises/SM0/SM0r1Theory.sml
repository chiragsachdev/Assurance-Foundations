structure SM0r1Theory :> SM0r1Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading SM0r1Theory ... " else ()
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
          ("SM0r1",
          Arbnum.fromString "1556067565",
          Arbnum.fromString "679128")
          [("SM0",
           Arbnum.fromString "1556067545",
           Arbnum.fromString "531015")];
  val _ = Theory.incorporate_types "SM0r1" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("aclfoundation", "Form"),
   ID("principal", "principal"), ID("ssm1", "inst"),
   ID("m0Types", "command"), ID("min", "bool"), ID("list", "list"),
   ID("m0Types", "privcmd"), ID("m0Types", "npriv"),
   ID("aclfoundation", "Kripke"), ID("m0Types", "state"),
   ID("ssm1", "trType"), ID("aclfoundation", "po"),
   ID("m0Types", "output"), ID("principal", "staff"),
   ID("principal", "role"), ID("aclfoundation", "Princ"),
   ID("aclfoundation", "IntLevel"), ID("aclfoundation", "SecLevel"),
   ID("num", "num"), ID("principal", "authority"), ID("cipher", "pKey"),
   ID("bool", "!"), ID("pair", ","), ID("pair", "prod"), ID("bool", "/\\"),
   ID("min", "="), ID("min", "==>"), ID("min", "@"), ID("list", "APPEND"),
   ID("principal", "Alice"), ID("principal", "Authority"),
   ID("principal", "Bob"), ID("ssm1", "CFG"), ID("ssm1", "configuration"),
   ID("ssm1", "CFGInterpret"), ID("list", "CONS"),
   ID("principal", "Carol"), ID("principal", "Commander"), ID("bool", "F"),
   ID("aclfoundation", "FF"), ID("aclfoundation", "Form_CASE"),
   ID("combin", "I"), ID("principal", "KeyA"), ID("principal", "KeyS"),
   ID("principal", "Machine"), ID("list", "NIL"), ID("ssm1", "NONE"),
   ID("m0Types", "NP"), ID("aclfoundation", "Name"),
   ID("principal", "Operator"), ID("m0Types", "PR"),
   ID("aclfoundation", "Princ_CASE"), ID("principal", "Role"),
   ID("SM0", "SM0StateInterp"), ID("ssm1", "SOME"),
   ID("principal", "Staff"), ID("bool", "T"), ID("ssm1", "TR"),
   ID("aclfoundation", "TT"), ID("relation", "WF"),
   ID("relation", "WFREC"), ID("aclfoundation", "andf"),
   ID("SM0", "certs"), ID("SM0r1", "certsr1"),
   ID("aclfoundation", "controls"), ID("aclfoundation", "domi"),
   ID("aclfoundation", "doms"), ID("aclfoundation", "eqf"),
   ID("aclfoundation", "eqi"), ID("aclfoundation", "eqn"),
   ID("aclfoundation", "eqs"), ID("ssm1", "exec"),
   ID("aclfoundation", "impf"), ID("SM0r1", "inputOKr1"),
   ID("ssm1", "inst_CASE"), ID("aclfoundation", "lt"),
   ID("aclfoundation", "lte"), ID("SM0r1", "mapSM0inputOperatorBob"),
   ID("aclfoundation", "meet"), ID("aclfoundation", "notf"),
   ID("aclfoundation", "orf"), ID("principal", "principal_CASE"),
   ID("aclfoundation", "prop"), ID("aclfoundation", "quoting"),
   ID("aclfoundation", "reps"), ID("principal", "role_CASE"),
   ID("aclrules", "sat"), ID("aclfoundation", "says"),
   ID("aclfoundation", "speaks_for"), ID("principal", "staff_CASE"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'e", TYV "'d", TYOP [2], TYOP [4], TYOP [3, 3],
   TYOP [1, 4, 2, 1, 0], TYOP [0, 5, 5], TYOP [5], TYOP [0, 5, 7],
   TYOP [6, 5], TYOP [7], TYOP [0, 10, 9], TYOP [8], TYOP [0, 12, 11],
   TYV "'b", TYOP [9, 4, 14, 2, 1, 0], TYOP [10], TYOP [11, 3],
   TYOP [0, 17, 16], TYOP [0, 16, 18], TYOP [12, 1], TYOP [12, 0],
   TYOP [13], TYOP [0, 17, 22], TYOP [0, 16, 23], TYOP [14],
   TYOP [0, 5, 8], TYOP [6, 22], TYOP [15], TYOP [16, 2], TYOP [17, 2, 1],
   TYOP [18, 2, 0], TYOP [19], TYOP [20], TYOP [21, 25], TYOP [21, 33],
   TYOP [0, 8, 7], TYOP [0, 30, 7], TYOP [0, 37, 7], TYOP [0, 15, 7],
   TYOP [0, 39, 7], TYOP [0, 29, 7], TYOP [0, 41, 7], TYOP [0, 31, 7],
   TYOP [0, 43, 7], TYOP [0, 33, 7], TYOP [0, 45, 7], TYOP [0, 3, 7],
   TYOP [0, 47, 7], TYOP [0, 36, 7], TYOP [0, 24, 7], TYOP [0, 50, 7],
   TYOP [0, 19, 7], TYOP [0, 52, 7], TYOP [0, 4, 7], TYOP [0, 54, 7],
   TYOP [0, 9, 7], TYOP [0, 56, 7], TYOP [0, 27, 7], TYOP [0, 58, 7],
   TYOP [0, 12, 7], TYOP [0, 60, 7], TYOP [0, 32, 7], TYOP [0, 62, 7],
   TYOP [0, 35, 7], TYOP [0, 64, 7], TYOP [0, 34, 7], TYOP [0, 66, 7],
   TYOP [0, 20, 7], TYOP [0, 68, 7], TYOP [0, 21, 7], TYOP [0, 70, 7],
   TYOP [0, 2, 7], TYOP [0, 72, 7], TYOP [0, 10, 7], TYOP [0, 74, 7],
   TYOP [0, 28, 7], TYOP [0, 76, 7], TYOP [0, 25, 7], TYOP [0, 78, 7],
   TYOP [0, 16, 7], TYOP [0, 80, 7], TYOP [24, 20, 21], TYOP [24, 15, 82],
   TYOP [0, 82, 83], TYOP [0, 15, 84], TYOP [0, 21, 82], TYOP [0, 20, 86],
   TYOP [0, 7, 7], TYOP [0, 7, 88], TYOP [0, 6, 7], TYOP [0, 6, 90],
   TYOP [0, 8, 36], TYOP [0, 9, 56], TYOP [0, 26, 7], TYOP [0, 94, 26],
   TYOP [0, 9, 9], TYOP [0, 9, 96], TYOP [0, 33, 2],
   TYOP [34, 3, 1, 0, 22, 2, 16], TYOP [0, 27, 99], TYOP [0, 16, 100],
   TYOP [0, 9, 101], TYOP [0, 9, 102], TYOP [0, 16, 5], TYOP [0, 104, 103],
   TYOP [0, 8, 105], TYOP [0, 99, 7], TYOP [0, 83, 107], TYOP [0, 5, 96],
   TYOP [0, 27, 27], TYOP [0, 22, 110], TYOP [0, 32, 5], TYOP [0, 32, 112],
   TYOP [0, 113, 5], TYOP [0, 113, 114], TYOP [0, 113, 115],
   TYOP [0, 31, 5], TYOP [0, 31, 117], TYOP [0, 118, 116],
   TYOP [0, 118, 119], TYOP [0, 30, 5], TYOP [0, 30, 121],
   TYOP [0, 122, 120], TYOP [0, 122, 123], TYOP [0, 29, 6],
   TYOP [0, 29, 125], TYOP [0, 126, 124], TYOP [0, 125, 127],
   TYOP [0, 29, 5], TYOP [0, 29, 129], TYOP [0, 130, 128],
   TYOP [0, 125, 131], TYOP [0, 5, 6], TYOP [0, 133, 132],
   TYOP [0, 133, 134], TYOP [0, 133, 135], TYOP [0, 133, 136],
   TYOP [0, 6, 137], TYOP [0, 4, 5], TYOP [0, 139, 138], TYOP [0, 5, 140],
   TYOP [0, 5, 141], TYOP [0, 5, 142], TYOP [0, 32, 62], TYOP [0, 144, 7],
   TYOP [0, 144, 145], TYOP [0, 144, 146], TYOP [0, 31, 43],
   TYOP [0, 148, 147], TYOP [0, 148, 149], TYOP [0, 30, 37],
   TYOP [0, 151, 150], TYOP [0, 151, 152], TYOP [0, 29, 8],
   TYOP [0, 29, 154], TYOP [0, 155, 153], TYOP [0, 154, 156],
   TYOP [0, 29, 41], TYOP [0, 158, 157], TYOP [0, 154, 159],
   TYOP [0, 26, 160], TYOP [0, 26, 161], TYOP [0, 26, 162],
   TYOP [0, 26, 163], TYOP [0, 8, 164], TYOP [0, 54, 165],
   TYOP [0, 7, 166], TYOP [0, 7, 167], TYOP [0, 5, 168], TYOP [0, 35, 2],
   TYOP [0, 34, 2], TYOP [0, 32, 2], TYOP [0, 12, 3], TYOP [0, 2, 29],
   TYOP [0, 10, 3], TYOP [0, 130, 5], TYOP [0, 130, 176], TYOP [0, 2, 5],
   TYOP [0, 178, 177], TYOP [0, 29, 179], TYOP [0, 158, 7],
   TYOP [0, 158, 181], TYOP [0, 72, 182], TYOP [0, 29, 183],
   TYOP [0, 28, 2], TYOP [0, 3, 4], TYOP [0, 25, 2], TYOP [0, 99, 107],
   TYOP [0, 17, 188], TYOP [0, 83, 189], TYOP [0, 6, 6], TYOP [0, 191, 6],
   TYOP [0, 26, 192], TYOP [0, 8, 8], TYOP [0, 194, 8], TYOP [0, 26, 195],
   TYOP [0, 3, 17], TYOP [0, 3, 5], TYOP [0, 198, 6], TYOP [0, 4, 199],
   TYOP [0, 47, 88], TYOP [0, 4, 201], TYOP [0, 29, 29], TYOP [0, 29, 203],
   TYOP [0, 112, 5], TYOP [0, 35, 5], TYOP [0, 206, 205], TYOP [0, 34, 5],
   TYOP [0, 208, 207], TYOP [0, 28, 5], TYOP [0, 210, 209],
   TYOP [0, 33, 5], TYOP [0, 212, 211], TYOP [0, 25, 5],
   TYOP [0, 214, 213], TYOP [0, 2, 215], TYOP [0, 64, 63],
   TYOP [0, 66, 217], TYOP [0, 76, 218], TYOP [0, 45, 219],
   TYOP [0, 78, 220], TYOP [0, 2, 221], TYOP [0, 28, 133],
   TYOP [0, 28, 89], TYOP [0, 83, 8], TYOP [0, 7, 89], TYOP [0, 25, 226]]
  end
  val _ = Theory.incorporate_consts "SM0r1" tyvector
     [("mapSM0inputOperatorBob", 6), ("inputOKr1", 8), ("certsr1", 13)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 15), TMV("NS", 19), TMV("Oi", 20), TMV("Os", 21),
   TMV("Out", 24), TMV("P", 8), TMV("P", 25), TMV("R", 26), TMV("a", 5),
   TMV("cmd", 3), TMV("inputOKr1", 8), TMV("ins", 9),
   TMV("mapSM0inputOperatorBob", 6), TMV("npriv", 12), TMV("outs", 27),
   TMV("privcmd", 10), TMV("role", 28), TMV("s", 16), TMV("v", 5),
   TMV("v", 4), TMV("v1", 5), TMV("v10", 29), TMV("v100", 5),
   TMV("v101", 5), TMV("v102", 5), TMV("v103", 5), TMV("v104", 5),
   TMV("v105", 5), TMV("v106", 5), TMV("v107", 5), TMV("v108", 5),
   TMV("v109", 29), TMV("v110", 5), TMV("v111", 29), TMV("v112", 29),
   TMV("v113", 29), TMV("v114", 5), TMV("v115", 29), TMV("v116", 29),
   TMV("v117", 5), TMV("v118", 30), TMV("v119", 30), TMV("v12", 29),
   TMV("v120", 30), TMV("v121", 30), TMV("v122", 31), TMV("v123", 31),
   TMV("v124", 31), TMV("v125", 31), TMV("v126", 32), TMV("v127", 32),
   TMV("v128", 32), TMV("v129", 32), TMV("v13", 29), TMV("v130", 32),
   TMV("v131", 32), TMV("v132", 2), TMV("v133", 29), TMV("v134", 29),
   TMV("v135", 29), TMV("v136", 29), TMV("v137", 2), TMV("v138", 29),
   TMV("v139", 29), TMV("v14", 29), TMV("v140", 29), TMV("v141", 29),
   TMV("v142", 3), TMV("v144", 2), TMV("v144", 25), TMV("v145", 29),
   TMV("v145", 33), TMV("v146", 29), TMV("v147", 29), TMV("v147", 34),
   TMV("v148", 29), TMV("v148", 35), TMV("v149", 32), TMV("v149", 2),
   TMV("v15", 5), TMV("v150", 29), TMV("v150", 25), TMV("v151", 29),
   TMV("v151", 33), TMV("v152", 29), TMV("v152", 28), TMV("v153", 29),
   TMV("v153", 34), TMV("v154", 35), TMV("v154", 2), TMV("v155", 29),
   TMV("v155", 32), TMV("v156", 29), TMV("v157", 29), TMV("v158", 29),
   TMV("v159", 2), TMV("v16", 29), TMV("v160", 29), TMV("v161", 29),
   TMV("v162", 29), TMV("v163", 29), TMV("v164", 25), TMV("v165", 33),
   TMV("v166", 28), TMV("v167", 34), TMV("v168", 35), TMV("v169", 32),
   TMV("v17", 29), TMV("v170", 25), TMV("v171", 33), TMV("v172", 28),
   TMV("v173", 34), TMV("v174", 35), TMV("v175", 32), TMV("v177", 33),
   TMV("v178", 28), TMV("v179", 34), TMV("v18", 5), TMV("v180", 35),
   TMV("v181", 32), TMV("v182", 25), TMV("v183", 33), TMV("v184", 28),
   TMV("v185", 34), TMV("v186", 35), TMV("v187", 32), TMV("v19", 30),
   TMV("v2", 5), TMV("v20", 30), TMV("v21", 30), TMV("v22", 30),
   TMV("v23", 31), TMV("v24", 31), TMV("v25", 31), TMV("v26", 31),
   TMV("v27", 32), TMV("v28", 32), TMV("v29", 32), TMV("v3", 5),
   TMV("v30", 32), TMV("v31", 32), TMV("v32", 32), TMV("v33", 4),
   TMV("v34", 5), TMV("v35", 5), TMV("v36", 5), TMV("v37", 5),
   TMV("v38", 5), TMV("v39", 5), TMV("v4", 5), TMV("v40", 5),
   TMV("v41", 5), TMV("v42", 5), TMV("v43", 29), TMV("v44", 5),
   TMV("v45", 29), TMV("v46", 29), TMV("v47", 29), TMV("v48", 5),
   TMV("v49", 29), TMV("v5", 5), TMV("v50", 29), TMV("v51", 5),
   TMV("v52", 30), TMV("v53", 30), TMV("v54", 30), TMV("v55", 30),
   TMV("v56", 31), TMV("v57", 31), TMV("v58", 31), TMV("v59", 31),
   TMV("v6", 5), TMV("v60", 32), TMV("v61", 32), TMV("v62", 32),
   TMV("v63", 32), TMV("v64", 32), TMV("v65", 32), TMV("v66", 4),
   TMV("v67", 5), TMV("v68", 5), TMV("v69", 5), TMV("v7", 5),
   TMV("v70", 5), TMV("v71", 5), TMV("v72", 5), TMV("v73", 5),
   TMV("v74", 5), TMV("v75", 5), TMV("v76", 29), TMV("v77", 5),
   TMV("v78", 29), TMV("v79", 29), TMV("v8", 5), TMV("v80", 29),
   TMV("v81", 5), TMV("v82", 29), TMV("v83", 29), TMV("v84", 5),
   TMV("v85", 30), TMV("v86", 30), TMV("v87", 30), TMV("v88", 30),
   TMV("v89", 31), TMV("v9", 5), TMV("v90", 31), TMV("v91", 31),
   TMV("v92", 31), TMV("v93", 32), TMV("v94", 32), TMV("v95", 32),
   TMV("v96", 32), TMV("v97", 32), TMV("v98", 32), TMV("v99", 4),
   TMC(22, 36), TMC(22, 38), TMC(22, 40), TMC(22, 42), TMC(22, 44),
   TMC(22, 46), TMC(22, 48), TMC(22, 49), TMC(22, 51), TMC(22, 53),
   TMC(22, 55), TMC(22, 57), TMC(22, 59), TMC(22, 61), TMC(22, 63),
   TMC(22, 65), TMC(22, 67), TMC(22, 69), TMC(22, 71), TMC(22, 73),
   TMC(22, 75), TMC(22, 77), TMC(22, 79), TMC(22, 81), TMC(23, 85),
   TMC(23, 87), TMC(25, 89), TMC(26, 26), TMC(26, 89), TMC(26, 91),
   TMC(26, 92), TMC(26, 93), TMC(27, 89), TMC(28, 95), TMC(29, 97),
   TMC(30, 25), TMC(31, 98), TMC(32, 25), TMC(33, 106), TMC(35, 108),
   TMC(36, 109), TMC(36, 111), TMC(37, 25), TMC(38, 28), TMC(39, 7),
   TMC(40, 5), TMC(41, 143), TMC(41, 169), TMC(42, 6), TMC(42, 88),
   TMC(43, 170), TMC(44, 171), TMC(45, 172), TMC(46, 9), TMC(47, 4),
   TMC(48, 173), TMC(49, 174), TMC(50, 28), TMC(51, 175), TMC(52, 180),
   TMC(52, 184), TMC(53, 185), TMC(54, 104), TMC(55, 186), TMC(56, 187),
   TMC(57, 7), TMC(58, 190), TMC(59, 5), TMC(60, 94), TMC(61, 193),
   TMC(61, 196), TMC(62, 133), TMC(63, 13), TMC(64, 13), TMC(65, 125),
   TMC(66, 122), TMC(67, 118), TMC(68, 133), TMC(69, 122), TMC(70, 113),
   TMC(71, 118), TMC(72, 197), TMC(73, 133), TMC(74, 8), TMC(75, 200),
   TMC(75, 202), TMC(76, 113), TMC(77, 113), TMC(78, 6), TMC(79, 204),
   TMC(80, 6), TMC(81, 133), TMC(82, 216), TMC(82, 222), TMC(83, 139),
   TMC(84, 204), TMC(85, 126), TMC(86, 223), TMC(86, 224), TMC(87, 225),
   TMC(88, 125), TMC(89, 130), TMC(90, 227), TMC(91, 88)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op inputOKr1_primitive_def x = x
    val op inputOKr1_primitive_def =
    ThmBind.DT(((("SM0r1",0),[]),[]),
               [ThmBind.read"%245%298@%285%248%7%283$0@|@2%10%8%262$0@%264%259@2%264%259@2%142%264%259@|@%143%264%259@|@%144%145%264%259@||@%146%147%264%259@||@%148%150%264%259@||@%151%152%264%259@||@%153%154%262$0@%264%259@2%264%259@2%214%275$2@%61%264%259@|@%62%63%264%259@||@%65%66%300$2@%9%275$1@%78%275$3@%95%308$1@%108%264%259@|@%109%264%259@|@%110%308$1@%120%313$1@%317$0@%264%280@2%264%259@2%264%259@3%317$0@%264%259@2%264%280@2%264%259@3|@%121%264%259@|@%122%264%259@|@%123%264%259@|@%124%264%259@|@%125%264%259@|@|@%111%264%259@|@%112%264%259@|@%113%264%259@|@|@%97%98%264%259@||@%99%100%264%259@||@|@%80%82%264%259@||@%84%86%264%259@||@|@%264%259@2||@|@%22%264%259@|@%23%24%264%259@||@%25%26%264%259@||@%27%28%264%259@||@%29%30%264%259@||@%31%32%264%259@||@%33%34%264%259@||@%35%36%264%259@||@%37%38%39%264%259@|||@%40%41%264%259@||@%43%44%264%259@||@%45%46%264%259@||@%47%48%264%259@||@%49%50%264%259@||@%51%52%264%259@||@%54%55%264%259@||@||@%155%156%264%259@||@%157%158%264%259@||@%159%161%162%264%259@|||@%163%164%264%259@||@%165%166%264%259@||@%167%168%264%259@||@%169%170%264%259@||@%172%173%264%259@||@%174%175%264%259@||@%176%177%264%259@||@||@2"])
  fun op certsr1_def x = x
    val op certsr1_def =
    ThmBind.DT(((("SM0r1",9),[]),[]),
               [ThmBind.read"%228%13%235%15%246%288$1@$0@2%249%287$1@$0@2%255%311%271%279%250@3%271%276%258@3%309%278%270$1@5%255%311%271%279%252@3%271%276%272@3%309%278%273$0@5%255%311%271%279%252@3%271%276%272@3%309%278%270$1@5%268@5|@|@"])
  fun op mapSM0inputOperatorBob_primitive_def x = x
    val op mapSM0inputOperatorBob_primitive_def =
    ThmBind.DT(((("SM0r1",10),[]),[]),
               [ThmBind.read"%244%303@%284%248%7%283$0@|@2%12%8%261$0@%263%282@2%263%282@2%142%263%282@|@%143%263%282@|@%144%145%263%282@||@%146%147%263%282@||@%148%150%263%282@||@%151%152%263%282@||@%153%154%261$0@%263%282@2%263%282@2%214%274$2@%61%299$1@%9%307$1@%81%263%282@|@%83%263%282@|@%85%312$0@%263%315%310%271%279%250@3%271%276%258@4%309%278$1@5%263%315%310%271%279%252@3%271%276%272@4%309%278$1@5|@%87%263%282@|@%88%263%282@|@%91%263%282@|@|@%263%282@2|@%62%63%263%282@||@%65%66%263%282@||@|@%22%263%282@|@%23%24%263%282@||@%25%26%263%282@||@%27%28%263%282@||@%29%30%263%282@||@%31%32%263%282@||@%33%34%263%282@||@%35%36%263%282@||@%37%38%39%263%282@|||@%40%41%263%282@||@%43%44%263%282@||@%45%46%263%282@||@%47%48%263%282@||@%49%50%263%282@||@%51%52%263%282@||@%54%55%263%282@||@||@%155%156%263%282@||@%157%158%263%282@||@%159%161%162%263%282@|||@%163%164%263%282@||@%165%166%263%282@||@%167%168%263%282@||@%169%170%263%282@||@%172%173%263%282@||@%174%175%263%282@||@%176%177%263%282@||@||@2"])
  fun op inputOKr1_ind x = x
    val op inputOKr1_ind =
    ThmBind.DT(((("SM0r1",1),
                [("aclfoundation",[55,116]),
                 ("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79]),
                 ("principal",[32,56,80]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[12])]),["DISK_THM"]),
               [ThmBind.read"%222%5%247%241%221%9$1%315%310%271%279%252@3%271%276%272@4%309%278$0@4|@2%241%221%9$1%315%310%271%279%250@3%271%276%258@4%309%278$0@4|@2%241$0%282@2%241$0%260@2%241%225%19$1%309$0@2|@2%241%215%20$1%305$0@2|@2%241%215%127%215%138$2%286$1@$0@2|@|@2%241%215%149%215%160$2%306$1@$0@2|@|@2%241%215%171%215%182$2%297$1@$0@2|@|@2%241%215%193%215%204$2%292$1@$0@2|@|@2%241%218%21$1%315$0@%282@2|@2%241%218%21$1%315$0@%260@2|@2%241%234%56%225%178$2%315%271$1@2%309$0@3|@|@2%241%218%57%218%58%225%178$3%315%304$2@$1@2%309$0@3|@|@|@2%241%234%89%237%101%221%67$3%315%310%271$2@2%271%279$1@4%309%278$0@4|@|@|@2%241%234%89%220%102%221%67$3%315%310%271$2@2%271%251$1@4%309%278$0@4|@|@|@2%241%221%67$1%315%310%271%279%252@3%271%276%258@4%309%278$0@4|@2%241%221%67$1%315%310%271%279%257@3%271%276%258@4%309%278$0@4|@2%241%221%67$1%315%310%271%279%250@3%271%276%272@4%309%278$0@4|@2%241%221%67$1%315%310%271%279%257@3%271%276%272@4%309%278$0@4|@2%241%220%114%236%103%221%67$3%315%310%271%251$2@3%271%276$1@4%309%278$0@4|@|@|@2%241%236%115%236%103%221%67$3%315%310%271%276$2@3%271%276$1@4%309%278$0@4|@|@|@2%241%231%116%236%103%221%67$3%315%310%271%266$2@3%271%276$1@4%309%278$0@4|@|@|@2%241%230%118%236%103%221%67$3%315%310%271%265$2@3%271%276$1@4%309%278$0@4|@|@|@2%241%229%119%236%103%221%67$3%315%310%271%267$2@3%271%276$1@4%309%278$0@4|@|@|@2%241%234%89%231%104%221%67$3%315%310%271$2@2%271%266$1@4%309%278$0@4|@|@|@2%241%234%89%230%105%221%67$3%315%310%271$2@2%271%265$1@4%309%278$0@4|@|@|@2%241%234%89%229%106%221%67$3%315%310%271$2@2%271%267$1@4%309%278$0@4|@|@|@2%241%218%90%218%92%234%68%221%67$4%315%310%304$3@$2@2%271$1@3%309%278$0@4|@|@|@|@2%241%218%93%218%94%234%68%221%67$4%315%310%310$3@$2@2%271$1@3%309%278$0@4|@|@|@|@2%241%218%59%218%70%218%72%221%67$4%315%310$3@%304$2@$1@3%309%278$0@4|@|@|@|@2%241%218%59%218%73%218%75%221%67$4%315%310$3@%310$2@$1@3%309%278$0@4|@|@|@|@2%241%218%59%218%60$2%315%310$1@$0@2%309%269@3|@|@2%241%218%21%215%179$2%315$1@%305$0@3|@|@2%241%218%21%215%180%215%181$3%315$2@%286$1@$0@3|@|@|@2%241%218%21%215%183%215%184$3%315$2@%306$1@$0@3|@|@|@2%241%218%21%215%185%215%186$3%315$2@%297$1@$0@3|@|@|@2%241%218%21%215%187%215%188$3%315$2@%292$1@$0@3|@|@|@2%241%218%21%218%189%215%190$3%315$2@%315$1@$0@3|@|@|@2%241%218%21%218%191%218%192$3%315$2@%316$1@$0@3|@|@|@2%241%218%21%218%194%215%195$3%315$2@%289$1@$0@3|@|@|@2%241%218%21%218%196%218%197%215%198$4%315$3@%311$2@$1@$0@3|@|@|@|@2%241%218%21%216%199%216%200$3%315$2@%290$1@$0@3|@|@|@2%241%218%21%216%201%216%202$3%315$2@%293$1@$0@3|@|@|@2%241%218%21%219%203%219%205$3%315$2@%291$1@$0@3|@|@|@2%241%218%21%219%206%219%207$3%315$2@%295$1@$0@3|@|@|@2%241%218%21%229%208%229%209$3%315$2@%294$1@$0@3|@|@|@2%241%218%21%229%210%229%211$3%315$2@%302$1@$0@3|@|@|@2%241%218%21%229%212%229%213$3%315$2@%301$1@$0@3|@|@|@2%241%218%42%218%53$2%316$1@$0@2|@|@2%241%218%64%215%79$2%289$1@$0@2|@|@2%241%218%96%218%107%215%117$3%311$2@$1@$0@2|@|@|@2%241%216%126%216%128$2%290$1@$0@2|@|@2%241%216%129%216%130$2%293$1@$0@2|@|@2%241%219%131%219%132$2%291$1@$0@2|@|@2%241%219%133%219%134$2%295$1@$0@2|@|@2%241%229%135%229%136$2%294$1@$0@2|@|@2%241%229%137%229%139$2%302$1@$0@2|@|@2%229%140%229%141$2%301$1@$0@2|@|@60%215%18$1$0@|@2|@"])
  fun op inputOKr1_def x = x
    val op inputOKr1_def =
    ThmBind.DT(((("SM0r1",2),
                [("SM0r1",[0]),("aclfoundation",[33,110]),("bool",[15]),
                 ("combin",[19]),("principal",[28,52,74]),
                 ("relation",[113,132]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%241%243%298%315%310%271%279%252@3%271%276%272@4%309%278%9@5%280@2%241%243%298%315%310%271%279%250@3%271%276%258@4%309%278%9@5%280@2%241%243%298%282@2%259@2%241%243%298%260@2%259@2%241%243%298%309%19@3%259@2%241%243%298%305%20@3%259@2%241%243%298%286%127@%138@3%259@2%241%243%298%306%149@%160@3%259@2%241%243%298%297%171@%182@3%259@2%241%243%298%292%193@%204@3%259@2%241%243%298%315%21@%282@3%259@2%241%243%298%315%21@%260@3%259@2%241%243%298%315%271%56@2%309%178@4%259@2%241%243%298%315%304%57@%58@2%309%178@4%259@2%241%243%298%315%310%271%89@2%271%279%101@4%309%278%67@5%259@2%241%243%298%315%310%271%89@2%271%251%102@4%309%278%67@5%259@2%241%243%298%315%310%271%279%252@3%271%276%258@4%309%278%67@5%259@2%241%243%298%315%310%271%279%257@3%271%276%258@4%309%278%67@5%259@2%241%243%298%315%310%271%279%250@3%271%276%272@4%309%278%67@5%259@2%241%243%298%315%310%271%279%257@3%271%276%272@4%309%278%67@5%259@2%241%243%298%315%310%271%251%114@3%271%276%103@4%309%278%67@5%259@2%241%243%298%315%310%271%276%115@3%271%276%103@4%309%278%67@5%259@2%241%243%298%315%310%271%266%116@3%271%276%103@4%309%278%67@5%259@2%241%243%298%315%310%271%265%118@3%271%276%103@4%309%278%67@5%259@2%241%243%298%315%310%271%267%119@3%271%276%103@4%309%278%67@5%259@2%241%243%298%315%310%271%89@2%271%266%104@4%309%278%67@5%259@2%241%243%298%315%310%271%89@2%271%265%105@4%309%278%67@5%259@2%241%243%298%315%310%271%89@2%271%267%106@4%309%278%67@5%259@2%241%243%298%315%310%304%90@%92@2%271%68@3%309%278%67@5%259@2%241%243%298%315%310%310%93@%94@2%271%68@3%309%278%67@5%259@2%241%243%298%315%310%59@%304%70@%72@3%309%278%67@5%259@2%241%243%298%315%310%59@%310%73@%75@3%309%278%67@5%259@2%241%243%298%315%310%59@%60@2%309%269@4%259@2%241%243%298%315%21@%305%179@4%259@2%241%243%298%315%21@%286%180@%181@4%259@2%241%243%298%315%21@%306%183@%184@4%259@2%241%243%298%315%21@%297%185@%186@4%259@2%241%243%298%315%21@%292%187@%188@4%259@2%241%243%298%315%21@%315%189@%190@4%259@2%241%243%298%315%21@%316%191@%192@4%259@2%241%243%298%315%21@%289%194@%195@4%259@2%241%243%298%315%21@%311%196@%197@%198@4%259@2%241%243%298%315%21@%290%199@%200@4%259@2%241%243%298%315%21@%293%201@%202@4%259@2%241%243%298%315%21@%291%203@%205@4%259@2%241%243%298%315%21@%295%206@%207@4%259@2%241%243%298%315%21@%294%208@%209@4%259@2%241%243%298%315%21@%302%210@%211@4%259@2%241%243%298%315%21@%301%212@%213@4%259@2%241%243%298%316%42@%53@3%259@2%241%243%298%289%64@%79@3%259@2%241%243%298%311%96@%107@%117@3%259@2%241%243%298%290%126@%128@3%259@2%241%243%298%293%129@%130@3%259@2%241%243%298%291%131@%132@3%259@2%241%243%298%295%133@%134@3%259@2%241%243%298%294%135@%136@3%259@2%241%243%298%302%137@%139@3%259@2%243%298%301%140@%141@3%259@59"])
  fun op inputOKr1_staff_rejected_lemma x = x
    val op inputOKr1_staff_rejected_lemma =
    ThmBind.DT(((("SM0r1",3),
                [("SM0r1",[0]),("aclfoundation",[33,110]),
                 ("bool",[15,25,26,46,47,52,53,62,70,72]),("combin",[19]),
                 ("principal",[28,52,74]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,14,15]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%237%6%221%9%318%298%315%271%279$1@3%309%278$0@5|@|@"])
  fun op inputOKr1_cmd_reject_lemma x = x
    val op inputOKr1_cmd_reject_lemma =
    ThmBind.DT(((("SM0r1",4),
                [("SM0r1",[0]),("aclfoundation",[33,110]),
                 ("bool",[15,25,26,46,47,52,53,62,70,72]),("combin",[19]),
                 ("principal",[28,52,74]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,14,15]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%221%9%318%298%309%278$0@4|@"])
  fun op inputOKr1_TT_reject_lemma x = x
    val op inputOKr1_TT_reject_lemma =
    ThmBind.DT(((("SM0r1",5),
                [("SM0r1",[0]),("aclfoundation",[33,110]),
                 ("bool",[15,25,26,46,47,52,53,62,72]),("combin",[19]),
                 ("principal",[28,52,74]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,14,15]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%318%298%282@2"])
  fun op Alice_Operator_rejected_lemma x = x
    val op Alice_Operator_rejected_lemma =
    ThmBind.DT(((("SM0r1",6),
                [("SM0r1",[0]),("aclfoundation",[33,110]),
                 ("bool",[15,25,53]),("combin",[19]),
                 ("principal",[28,52,74]),("relation",[113,132]),
                 ("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%318%298%315%310%271%279%250@3%271%276%272@4%309%278%9@5"])
  fun op Bob_Commander_rejected_lemma x = x
    val op Bob_Commander_rejected_lemma =
    ThmBind.DT(((("SM0r1",7),
                [("SM0r1",[0]),("aclfoundation",[33,110]),
                 ("bool",[15,25,53]),("combin",[19]),
                 ("principal",[28,52,74]),("relation",[113,132]),
                 ("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%318%298%315%310%271%279%252@3%271%276%258@4%309%278%9@5"])
  fun op Carol_all_roles_rejected_lemma x = x
    val op Carol_all_roles_rejected_lemma =
    ThmBind.DT(((("SM0r1",8),
                [("SM0r1",[0]),("aclfoundation",[33,110]),
                 ("bool",[15,25,53]),("combin",[19]),
                 ("principal",[28,32,52,74]),("relation",[113,132]),
                 ("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%318%298%315%310%271%279%257@3%271%276%16@4%309%278%9@5"])
  fun op mapSM0inputOperatorBob_ind x = x
    val op mapSM0inputOperatorBob_ind =
    ThmBind.DT(((("SM0r1",11),
                [("aclfoundation",[55,116]),
                 ("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79]),
                 ("principal",[32,80]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[12])]),["DISK_THM"]),
               [ThmBind.read"%222%5%247%241%221%9$1%315%271%276%272@3%309%278$0@4|@2%241%221%9$1%315%271%276%258@3%309%278$0@4|@2%241$0%282@2%241$0%260@2%241%225%19$1%309$0@2|@2%241%215%20$1%305$0@2|@2%241%215%127%215%138$2%286$1@$0@2|@|@2%241%215%149%215%160$2%306$1@$0@2|@|@2%241%215%171%215%182$2%297$1@$0@2|@|@2%241%215%193%215%204$2%292$1@$0@2|@|@2%241%218%21$1%315$0@%282@2|@2%241%218%21$1%315$0@%260@2|@2%241%237%69%221%67$2%315%271%279$1@3%309%278$0@4|@|@2%241%220%71%221%67$2%315%271%251$1@3%309%278$0@4|@|@2%241%231%74%221%67$2%315%271%266$1@3%309%278$0@4|@|@2%241%230%76%221%67$2%315%271%265$1@3%309%278$0@4|@|@2%241%229%77%221%67$2%315%271%267$1@3%309%278$0@4|@|@2%241%234%56$1%315%271$0@2%309%269@3|@2%241%218%57%218%58%225%178$3%315%304$2@$1@2%309$0@3|@|@|@2%241%218%59%218%60%225%178$3%315%310$2@$1@2%309$0@3|@|@|@2%241%218%21%215%179$2%315$1@%305$0@3|@|@2%241%218%21%215%180%215%181$3%315$2@%286$1@$0@3|@|@|@2%241%218%21%215%183%215%184$3%315$2@%306$1@$0@3|@|@|@2%241%218%21%215%185%215%186$3%315$2@%297$1@$0@3|@|@|@2%241%218%21%215%187%215%188$3%315$2@%292$1@$0@3|@|@|@2%241%218%21%218%189%215%190$3%315$2@%315$1@$0@3|@|@|@2%241%218%21%218%191%218%192$3%315$2@%316$1@$0@3|@|@|@2%241%218%21%218%194%215%195$3%315$2@%289$1@$0@3|@|@|@2%241%218%21%218%196%218%197%215%198$4%315$3@%311$2@$1@$0@3|@|@|@|@2%241%218%21%216%199%216%200$3%315$2@%290$1@$0@3|@|@|@2%241%218%21%216%201%216%202$3%315$2@%293$1@$0@3|@|@|@2%241%218%21%219%203%219%205$3%315$2@%291$1@$0@3|@|@|@2%241%218%21%219%206%219%207$3%315$2@%295$1@$0@3|@|@|@2%241%218%21%229%208%229%209$3%315$2@%294$1@$0@3|@|@|@2%241%218%21%229%210%229%211$3%315$2@%302$1@$0@3|@|@|@2%241%218%21%229%212%229%213$3%315$2@%301$1@$0@3|@|@|@2%241%218%42%218%53$2%316$1@$0@2|@|@2%241%218%64%215%79$2%289$1@$0@2|@|@2%241%218%96%218%107%215%117$3%311$2@$1@$0@2|@|@|@2%241%216%126%216%128$2%290$1@$0@2|@|@2%241%216%129%216%130$2%293$1@$0@2|@|@2%241%219%131%219%132$2%291$1@$0@2|@|@2%241%219%133%219%134$2%295$1@$0@2|@|@2%241%229%135%229%136$2%294$1@$0@2|@|@2%241%229%137%229%139$2%302$1@$0@2|@|@2%229%140%229%141$2%301$1@$0@2|@|@47%215%18$1$0@|@2|@"])
  fun op mapSM0inputOperatorBob_def x = x
    val op mapSM0inputOperatorBob_def =
    ThmBind.DT(((("SM0r1",12),
                [("SM0r1",[10]),("aclfoundation",[33,110]),("bool",[15]),
                 ("combin",[19]),("principal",[28,74]),
                 ("relation",[113,132]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%241%242%303%315%271%276%272@3%309%278%9@5%315%310%271%279%252@3%271%276%272@4%309%278%9@5%241%242%303%315%271%276%258@3%309%278%9@5%315%310%271%279%250@3%271%276%258@4%309%278%9@5%241%242%303%282@2%282@2%241%242%303%260@2%282@2%241%242%303%309%19@3%282@2%241%242%303%305%20@3%282@2%241%242%303%286%127@%138@3%282@2%241%242%303%306%149@%160@3%282@2%241%242%303%297%171@%182@3%282@2%241%242%303%292%193@%204@3%282@2%241%242%303%315%21@%282@3%282@2%241%242%303%315%21@%260@3%282@2%241%242%303%315%271%279%69@3%309%278%67@5%282@2%241%242%303%315%271%251%71@3%309%278%67@5%282@2%241%242%303%315%271%266%74@3%309%278%67@5%282@2%241%242%303%315%271%265%76@3%309%278%67@5%282@2%241%242%303%315%271%267%77@3%309%278%67@5%282@2%241%242%303%315%271%56@2%309%269@4%282@2%241%242%303%315%304%57@%58@2%309%178@4%282@2%241%242%303%315%310%59@%60@2%309%178@4%282@2%241%242%303%315%21@%305%179@4%282@2%241%242%303%315%21@%286%180@%181@4%282@2%241%242%303%315%21@%306%183@%184@4%282@2%241%242%303%315%21@%297%185@%186@4%282@2%241%242%303%315%21@%292%187@%188@4%282@2%241%242%303%315%21@%315%189@%190@4%282@2%241%242%303%315%21@%316%191@%192@4%282@2%241%242%303%315%21@%289%194@%195@4%282@2%241%242%303%315%21@%311%196@%197@%198@4%282@2%241%242%303%315%21@%290%199@%200@4%282@2%241%242%303%315%21@%293%201@%202@4%282@2%241%242%303%315%21@%291%203@%205@4%282@2%241%242%303%315%21@%295%206@%207@4%282@2%241%242%303%315%21@%294%208@%209@4%282@2%241%242%303%315%21@%302%210@%211@4%282@2%241%242%303%315%21@%301%212@%213@4%282@2%241%242%303%316%42@%53@3%282@2%241%242%303%289%64@%79@3%282@2%241%242%303%311%96@%107@%117@3%282@2%241%242%303%290%126@%128@3%282@2%241%242%303%293%129@%130@3%282@2%241%242%303%291%131@%132@3%282@2%241%242%303%295%133@%134@3%282@2%241%242%303%294%135@%136@3%282@2%241%242%303%302%137@%139@3%282@2%242%303%301%140@%141@3%282@46"])
  fun op mapSM0_Bob_Operator_privcmd_lemma x = x
    val op mapSM0_Bob_Operator_privcmd_lemma =
    ThmBind.DT(((("SM0r1",13),
                [("SM0",[15]),("SM0r1",[9,10]),("aclDrules",[4]),
                 ("aclfoundation",[33,110]),
                 ("bool",[15,25,26,46,47,50,52,53,57,62,92,93,95]),
                 ("combin",[19]),("principal",[28,74]),
                 ("relation",[113,132]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,2,3]),("ssm1",[6,52])]),["DISK_THM"]),
               [ThmBind.read"%247%254%239%0@%240%2@%3@3%253%298@%277@%288%13@%15@2%255%303%315%271%276%272@3%309%278%273%15@6%11@2%17@%14@3%314%239%0@%240%2@%3@3%309%278%273%15@5"])
  fun op Operator_Bob_exec_privcmd_justified_thm x = x
    val op Operator_Bob_exec_privcmd_justified_thm =
    ThmBind.DT(((("SM0r1",14),
                [("SM0",[15]),("SM0r1",[9,10]),("aclDrules",[4]),
                 ("aclfoundation",[33,110]),
                 ("bool",[15,25,26,35,46,47,50,52,53,57,62,92,93,95]),
                 ("combin",[19]),("principal",[28,74]),
                 ("relation",[113,132]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,2,3]),("ssm1",[6,52,62])]),["DISK_THM"]),
               [ThmBind.read"%224%1%223%4%217%0%232%2%233%3%243%281%239$2@%240$1@$0@3%296%273%15@3%253%298@%277@%288%13@%15@2%255%315%310%271%279%252@3%271%276%272@4%309%278%273%15@5%11@2%17@%14@2%253%298@%277@%288%13@%15@2%11@$4%17@%296%273%15@4%256$3%17@%296%273%15@4%14@4%241%298%315%310%271%279%252@3%271%276%272@4%309%278%273%15@6%241%254%239$2@%240$1@$0@3%253%298@%277@%288%13@%15@2%255%315%310%271%279%252@3%271%276%272@4%309%278%273%15@5%11@2%17@%14@3%314%239$2@%240$1@$0@3%309%278%273%15@7|@|@|@|@|@"])
  fun op Operator_mapSM0inputOperatorBob_exec_privcmd_justified_thm x = x
    val op Operator_mapSM0inputOperatorBob_exec_privcmd_justified_thm =
    ThmBind.DT(((("SM0r1",15),
                [("SM0",[15]),("SM0r1",[9,10]),("aclDrules",[4]),
                 ("aclfoundation",[33,110]),
                 ("bool",[15,25,26,35,46,47,50,52,53,55,57,62,92,93,95]),
                 ("combin",[19]),("principal",[28,74]),
                 ("relation",[113,132]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,2,3]),("ssm1",[6,52,62])]),["DISK_THM"]),
               [ThmBind.read"%238%17%235%15%227%14%228%13%226%11%224%1%223%4%217%0%232%2%233%3%243%281%239$2@%240$1@$0@3%296%273$8@3%253%298@%277@%288$6@$8@2%255%303%315%271%276%272@3%309%278%273$8@6$5@2$9@$7@2%253%298@%277@%288$6@$8@2$5@$4$9@%296%273$8@4%256$3$9@%296%273$8@4$7@4%241%298%303%315%271%276%272@3%309%278%273$8@7%241%254%239$2@%240$1@$0@3%253%298@%277@%288$6@$8@2%255%303%315%271%276%272@3%309%278%273$8@6$5@2$9@$7@3%314%239$2@%240$1@$0@3%309%278%273$8@7|@|@|@|@|@|@|@|@|@|@"])

  val _ = DB.bindl "SM0r1"
  [("inputOKr1_primitive_def",inputOKr1_primitive_def,DB.Def),
   ("certsr1_def",certsr1_def,DB.Def),
   ("mapSM0inputOperatorBob_primitive_def",
    mapSM0inputOperatorBob_primitive_def,
    DB.Def), ("inputOKr1_ind",inputOKr1_ind,DB.Thm),
   ("inputOKr1_def",inputOKr1_def,DB.Thm),
   ("inputOKr1_staff_rejected_lemma",
    inputOKr1_staff_rejected_lemma,
    DB.Thm),
   ("inputOKr1_cmd_reject_lemma",inputOKr1_cmd_reject_lemma,DB.Thm),
   ("inputOKr1_TT_reject_lemma",inputOKr1_TT_reject_lemma,DB.Thm),
   ("Alice_Operator_rejected_lemma",Alice_Operator_rejected_lemma,DB.Thm),
   ("Bob_Commander_rejected_lemma",Bob_Commander_rejected_lemma,DB.Thm),
   ("Carol_all_roles_rejected_lemma",
    Carol_all_roles_rejected_lemma,
    DB.Thm),
   ("mapSM0inputOperatorBob_ind",mapSM0inputOperatorBob_ind,DB.Thm),
   ("mapSM0inputOperatorBob_def",mapSM0inputOperatorBob_def,DB.Thm),
   ("mapSM0_Bob_Operator_privcmd_lemma",
    mapSM0_Bob_Operator_privcmd_lemma,
    DB.Thm),
   ("Operator_Bob_exec_privcmd_justified_thm",
    Operator_Bob_exec_privcmd_justified_thm,
    DB.Thm),
   ("Operator_mapSM0inputOperatorBob_exec_privcmd_justified_thm",
    Operator_mapSM0inputOperatorBob_exec_privcmd_justified_thm,
    DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0r1",
    thydataty = "compute",
    read = ThmBind.read,
    data =
        "SM0r1.inputOKr1_def SM0r1.mapSM0inputOperatorBob_def SM0r1.certsr1_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0r1",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO9.inputOKr14.%298OO7.certsr14.%288OO22.mapSM0inputOperatorBob4.%303"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val SM0r1_grammars = merge_grammars ["SM0"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="SM0r1"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val SM0r1_grammars = 
    Portable.## (addtyUDs,addtmUDs) SM0r1_grammars
  val _ = Parse.grammarDB_insert("SM0r1",SM0r1_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "SM0r1"
end
