structure SM0r2Theory :> SM0r2Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading SM0r2Theory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open SM0r1Theory
  in end;
  val _ = Theory.link_parents
          ("SM0r2",
          Arbnum.fromString "1556067583",
          Arbnum.fromString "532974")
          [("SM0r1",
           Arbnum.fromString "1556067565",
           Arbnum.fromString "679128")];
  val _ = Theory.incorporate_types "SM0r2" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("aclfoundation", "Form"),
   ID("principal", "principal"), ID("ssm1", "inst"),
   ID("m0Types", "command"), ID("min", "bool"), ID("list", "list"),
   ID("m0Types", "privcmd"), ID("m0Types", "npriv"),
   ID("aclfoundation", "Kripke"), ID("m0Types", "state"),
   ID("ssm1", "trType"), ID("aclfoundation", "po"),
   ID("m0Types", "output"), ID("aclfoundation", "Princ"),
   ID("principal", "staff"), ID("principal", "authority"),
   ID("principal", "role"), ID("cipher", "pKey"), ID("num", "num"),
   ID("aclfoundation", "IntLevel"), ID("aclfoundation", "SecLevel"),
   ID("bool", "!"), ID("pair", ","), ID("pair", "prod"), ID("bool", "/\\"),
   ID("num", "0"), ID("min", "="), ID("min", "==>"), ID("min", "@"),
   ID("list", "APPEND"), ID("principal", "Alice"),
   ID("principal", "Authority"), ID("principal", "Bob"), ID("ssm1", "CFG"),
   ID("ssm1", "configuration"), ID("ssm1", "CFGInterpret"),
   ID("list", "CONS"), ID("principal", "Carol"),
   ID("principal", "Commander"), ID("bool", "F"),
   ID("aclfoundation", "FF"), ID("aclfoundation", "Form_CASE"),
   ID("combin", "I"), ID("principal", "KeyA"), ID("principal", "KeyS"),
   ID("principal", "Machine"), ID("list", "NIL"), ID("ssm1", "NONE"),
   ID("aclfoundation", "Name"), ID("principal", "Operator"),
   ID("m0Types", "PR"), ID("aclfoundation", "Princ_CASE"),
   ID("principal", "Role"), ID("SM0", "SM0StateInterp"),
   ID("ssm1", "SOME"), ID("principal", "Staff"), ID("bool", "T"),
   ID("ssm1", "TR"), ID("aclfoundation", "TT"), ID("relation", "WF"),
   ID("relation", "WFREC"), ID("aclfoundation", "andf"),
   ID("principal", "ca"), ID("SM0r1", "certsr1"), ID("SM0r2", "certsr2"),
   ID("SM0r2", "certsr2root"), ID("SM0r2", "certsr2signed"),
   ID("aclfoundation", "controls"), ID("aclfoundation", "domi"),
   ID("aclfoundation", "doms"), ID("aclfoundation", "eqf"),
   ID("aclfoundation", "eqi"), ID("aclfoundation", "eqn"),
   ID("aclfoundation", "eqs"), ID("ssm1", "exec"),
   ID("aclfoundation", "impf"), ID("SM0r2", "inputOKr2"),
   ID("ssm1", "inst_CASE"), ID("aclfoundation", "lt"),
   ID("aclfoundation", "lte"), ID("SM0r1", "mapSM0inputOperatorBob"),
   ID("SM0r2", "mapSM0r1input"), ID("aclfoundation", "meet"),
   ID("aclfoundation", "notf"), ID("aclfoundation", "orf"),
   ID("cipher", "pKey_CASE"), ID("principal", "principal_CASE"),
   ID("cipher", "privK"), ID("aclfoundation", "prop"),
   ID("cipher", "pubK"), ID("aclfoundation", "quoting"),
   ID("aclfoundation", "reps"), ID("principal", "role_CASE"),
   ID("aclrules", "sat"), ID("aclfoundation", "says"),
   ID("aclfoundation", "speaks_for"), ID("principal", "staff_CASE")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'e", TYV "'d", TYOP [2], TYOP [4], TYOP [3, 3],
   TYOP [1, 4, 2, 1, 0], TYOP [0, 5, 5], TYOP [5], TYOP [0, 5, 7],
   TYOP [6, 5], TYOP [7], TYOP [0, 10, 9], TYOP [8], TYOP [0, 12, 11],
   TYV "'b", TYV "'a", TYOP [1, 4, 2, 15, 14], TYOP [6, 16],
   TYOP [0, 10, 17], TYOP [0, 12, 18], TYOP [9, 4, 14, 2, 1, 0], TYOP [10],
   TYOP [11, 3], TYOP [0, 22, 21], TYOP [0, 21, 23], TYOP [12, 1],
   TYOP [12, 0], TYOP [13], TYOP [0, 22, 27], TYOP [0, 21, 28],
   TYOP [0, 5, 8], TYOP [6, 27], TYOP [14, 2], TYOP [15], TYOP [16],
   TYOP [17], TYOP [18, 33], TYOP [18, 34], TYOP [19], TYOP [20, 2, 1],
   TYOP [21, 2, 0], TYOP [0, 8, 7], TYOP [0, 39, 7], TYOP [0, 42, 7],
   TYOP [0, 20, 7], TYOP [0, 44, 7], TYOP [0, 32, 7], TYOP [0, 46, 7],
   TYOP [0, 40, 7], TYOP [0, 48, 7], TYOP [0, 34, 7], TYOP [0, 50, 7],
   TYOP [0, 3, 7], TYOP [0, 52, 7], TYOP [0, 41, 7], TYOP [0, 29, 7],
   TYOP [0, 55, 7], TYOP [0, 24, 7], TYOP [0, 57, 7], TYOP [0, 4, 7],
   TYOP [0, 59, 7], TYOP [0, 12, 7], TYOP [0, 61, 7], TYOP [0, 38, 7],
   TYOP [0, 63, 7], TYOP [0, 37, 7], TYOP [0, 65, 7], TYOP [0, 36, 7],
   TYOP [0, 67, 7], TYOP [0, 25, 7], TYOP [0, 69, 7], TYOP [0, 26, 7],
   TYOP [0, 71, 7], TYOP [0, 2, 7], TYOP [0, 73, 7], TYOP [0, 10, 7],
   TYOP [0, 75, 7], TYOP [0, 35, 7], TYOP [0, 77, 7], TYOP [0, 33, 7],
   TYOP [0, 79, 7], TYOP [24, 25, 26], TYOP [24, 20, 81], TYOP [0, 81, 82],
   TYOP [0, 20, 83], TYOP [0, 26, 81], TYOP [0, 25, 85], TYOP [0, 7, 7],
   TYOP [0, 7, 87], TYOP [0, 6, 7], TYOP [0, 6, 89], TYOP [0, 8, 41],
   TYOP [0, 17, 7], TYOP [0, 17, 92], TYOP [0, 9, 7], TYOP [0, 9, 94],
   TYOP [0, 30, 7], TYOP [0, 96, 30], TYOP [0, 17, 17], TYOP [0, 17, 98],
   TYOP [0, 34, 2], TYOP [35, 3, 1, 0, 27, 2, 21], TYOP [0, 31, 101],
   TYOP [0, 21, 102], TYOP [0, 9, 103], TYOP [0, 9, 104], TYOP [0, 21, 5],
   TYOP [0, 106, 105], TYOP [0, 8, 107], TYOP [0, 101, 7],
   TYOP [0, 82, 109], TYOP [0, 9, 9], TYOP [0, 5, 111], TYOP [0, 31, 31],
   TYOP [0, 27, 113], TYOP [0, 38, 5], TYOP [0, 38, 115], TYOP [0, 116, 5],
   TYOP [0, 116, 117], TYOP [0, 116, 118], TYOP [0, 40, 5],
   TYOP [0, 40, 120], TYOP [0, 121, 119], TYOP [0, 121, 122],
   TYOP [0, 39, 5], TYOP [0, 39, 124], TYOP [0, 125, 123],
   TYOP [0, 125, 126], TYOP [0, 32, 6], TYOP [0, 32, 128],
   TYOP [0, 129, 127], TYOP [0, 128, 130], TYOP [0, 32, 5],
   TYOP [0, 32, 132], TYOP [0, 133, 131], TYOP [0, 128, 134],
   TYOP [0, 5, 6], TYOP [0, 136, 135], TYOP [0, 136, 137],
   TYOP [0, 136, 138], TYOP [0, 136, 139], TYOP [0, 6, 140],
   TYOP [0, 4, 5], TYOP [0, 142, 141], TYOP [0, 5, 143], TYOP [0, 5, 144],
   TYOP [0, 5, 145], TYOP [0, 38, 63], TYOP [0, 147, 7],
   TYOP [0, 147, 148], TYOP [0, 147, 149], TYOP [0, 40, 48],
   TYOP [0, 151, 150], TYOP [0, 151, 152], TYOP [0, 39, 42],
   TYOP [0, 154, 153], TYOP [0, 154, 155], TYOP [0, 32, 8],
   TYOP [0, 32, 157], TYOP [0, 158, 156], TYOP [0, 157, 159],
   TYOP [0, 32, 46], TYOP [0, 161, 160], TYOP [0, 157, 162],
   TYOP [0, 30, 163], TYOP [0, 30, 164], TYOP [0, 30, 165],
   TYOP [0, 30, 166], TYOP [0, 8, 167], TYOP [0, 59, 168],
   TYOP [0, 7, 169], TYOP [0, 7, 170], TYOP [0, 5, 171], TYOP [0, 37, 2],
   TYOP [0, 36, 2], TYOP [0, 38, 2], TYOP [0, 2, 32], TYOP [0, 10, 3],
   TYOP [0, 133, 5], TYOP [0, 133, 178], TYOP [0, 2, 5],
   TYOP [0, 180, 179], TYOP [0, 32, 181], TYOP [0, 161, 7],
   TYOP [0, 161, 183], TYOP [0, 73, 184], TYOP [0, 32, 185],
   TYOP [0, 35, 2], TYOP [0, 3, 4], TYOP [0, 33, 2], TYOP [0, 101, 109],
   TYOP [0, 22, 190], TYOP [0, 82, 191], TYOP [0, 6, 6], TYOP [0, 193, 6],
   TYOP [0, 30, 194], TYOP [0, 8, 8], TYOP [0, 196, 8], TYOP [0, 30, 197],
   TYOP [0, 38, 34], TYOP [0, 3, 22], TYOP [0, 3, 5], TYOP [0, 201, 6],
   TYOP [0, 4, 202], TYOP [0, 52, 87], TYOP [0, 4, 204], TYOP [0, 32, 32],
   TYOP [0, 32, 206], TYOP [0, 79, 80], TYOP [0, 36, 208],
   TYOP [0, 115, 5], TYOP [0, 37, 5], TYOP [0, 211, 210], TYOP [0, 36, 5],
   TYOP [0, 213, 212], TYOP [0, 35, 5], TYOP [0, 215, 214],
   TYOP [0, 34, 5], TYOP [0, 217, 216], TYOP [0, 33, 5],
   TYOP [0, 219, 218], TYOP [0, 2, 220], TYOP [0, 65, 64],
   TYOP [0, 67, 222], TYOP [0, 77, 223], TYOP [0, 50, 224],
   TYOP [0, 79, 225], TYOP [0, 2, 226], TYOP [0, 33, 36], TYOP [0, 34, 37],
   TYOP [0, 35, 136], TYOP [0, 35, 88], TYOP [0, 82, 8], TYOP [0, 5, 136],
   TYOP [0, 33, 233], TYOP [0, 7, 88], TYOP [0, 33, 235]]
  end
  val _ = Theory.incorporate_consts "SM0r2" tyvector
     [("mapSM0r1input", 6), ("inputOKr2", 8), ("certsr2signed", 13),
      ("certsr2root", 13), ("certsr2", 19)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 20), TMV("NS", 24), TMV("Oi", 25), TMV("Os", 26),
   TMV("Out", 29), TMV("P", 8), TMV("R", 30), TMV("a", 5), TMV("cmd", 3),
   TMV("inputOKr2", 8), TMV("ins", 9), TMV("mapSM0r1input", 6),
   TMV("npriv", 12), TMV("outs", 31), TMV("privcmd", 10), TMV("s", 21),
   TMV("v", 5), TMV("v", 4), TMV("v1", 5), TMV("v10", 32), TMV("v100", 5),
   TMV("v100", 33), TMV("v101", 5), TMV("v101", 33), TMV("v102", 5),
   TMV("v103", 5), TMV("v103", 32), TMV("v104", 5), TMV("v104", 32),
   TMV("v105", 5), TMV("v105", 32), TMV("v106", 5), TMV("v106", 32),
   TMV("v107", 5), TMV("v107", 2), TMV("v108", 5), TMV("v108", 32),
   TMV("v109", 32), TMV("v11", 5), TMV("v110", 5), TMV("v110", 32),
   TMV("v111", 32), TMV("v112", 32), TMV("v112", 33), TMV("v113", 32),
   TMV("v113", 34), TMV("v114", 5), TMV("v114", 35), TMV("v115", 32),
   TMV("v115", 36), TMV("v116", 32), TMV("v116", 37), TMV("v117", 5),
   TMV("v117", 38), TMV("v118", 39), TMV("v118", 33), TMV("v119", 39),
   TMV("v119", 34), TMV("v12", 32), TMV("v120", 39), TMV("v120", 35),
   TMV("v121", 39), TMV("v121", 36), TMV("v122", 40), TMV("v122", 37),
   TMV("v123", 40), TMV("v123", 38), TMV("v124", 40), TMV("v125", 5),
   TMV("v125", 40), TMV("v126", 5), TMV("v126", 38), TMV("v127", 5),
   TMV("v127", 38), TMV("v128", 5), TMV("v128", 38), TMV("v129", 5),
   TMV("v129", 38), TMV("v13", 32), TMV("v130", 5), TMV("v130", 38),
   TMV("v131", 5), TMV("v131", 38), TMV("v132", 5), TMV("v132", 2),
   TMV("v133", 5), TMV("v133", 32), TMV("v134", 32), TMV("v135", 5),
   TMV("v135", 32), TMV("v136", 32), TMV("v137", 32), TMV("v137", 2),
   TMV("v138", 32), TMV("v139", 5), TMV("v139", 32), TMV("v14", 32),
   TMV("v140", 32), TMV("v141", 32), TMV("v142", 5), TMV("v142", 3),
   TMV("v143", 39), TMV("v144", 39), TMV("v144", 2), TMV("v145", 39),
   TMV("v145", 32), TMV("v146", 39), TMV("v146", 32), TMV("v147", 32),
   TMV("v147", 40), TMV("v148", 32), TMV("v148", 40), TMV("v149", 40),
   TMV("v149", 2), TMV("v15", 5), TMV("v150", 32), TMV("v150", 40),
   TMV("v151", 32), TMV("v151", 38), TMV("v152", 32), TMV("v152", 38),
   TMV("v153", 32), TMV("v153", 38), TMV("v154", 38), TMV("v154", 2),
   TMV("v155", 32), TMV("v155", 38), TMV("v156", 32), TMV("v156", 38),
   TMV("v157", 32), TMV("v157", 4), TMV("v158", 5), TMV("v158", 32),
   TMV("v159", 5), TMV("v159", 2), TMV("v16", 32), TMV("v160", 5),
   TMV("v160", 32), TMV("v161", 5), TMV("v161", 32), TMV("v162", 5),
   TMV("v162", 32), TMV("v163", 5), TMV("v163", 32), TMV("v164", 5),
   TMV("v164", 33), TMV("v165", 5), TMV("v165", 34), TMV("v166", 5),
   TMV("v166", 35), TMV("v167", 32), TMV("v167", 36), TMV("v168", 5),
   TMV("v168", 37), TMV("v169", 32), TMV("v169", 38), TMV("v17", 32),
   TMV("v170", 32), TMV("v170", 33), TMV("v171", 32), TMV("v171", 34),
   TMV("v172", 5), TMV("v172", 35), TMV("v173", 32), TMV("v173", 36),
   TMV("v174", 32), TMV("v174", 37), TMV("v175", 5), TMV("v175", 38),
   TMV("v176", 39), TMV("v177", 39), TMV("v177", 34), TMV("v178", 39),
   TMV("v178", 35), TMV("v179", 39), TMV("v179", 36), TMV("v18", 5),
   TMV("v180", 40), TMV("v180", 37), TMV("v181", 40), TMV("v181", 38),
   TMV("v182", 40), TMV("v182", 33), TMV("v183", 40), TMV("v183", 34),
   TMV("v184", 38), TMV("v184", 35), TMV("v185", 38), TMV("v185", 36),
   TMV("v186", 38), TMV("v186", 37), TMV("v187", 38), TMV("v188", 38),
   TMV("v189", 38), TMV("v19", 39), TMV("v190", 3), TMV("v2", 5),
   TMV("v20", 39), TMV("v21", 39), TMV("v22", 39), TMV("v23", 40),
   TMV("v24", 40), TMV("v25", 40), TMV("v26", 40), TMV("v27", 38),
   TMV("v28", 38), TMV("v29", 38), TMV("v3", 5), TMV("v30", 38),
   TMV("v31", 38), TMV("v32", 38), TMV("v33", 4), TMV("v34", 5),
   TMV("v35", 5), TMV("v36", 5), TMV("v37", 5), TMV("v38", 5),
   TMV("v39", 5), TMV("v4", 5), TMV("v40", 5), TMV("v41", 5),
   TMV("v42", 5), TMV("v43", 32), TMV("v44", 5), TMV("v45", 32),
   TMV("v46", 32), TMV("v47", 32), TMV("v48", 5), TMV("v49", 32),
   TMV("v5", 5), TMV("v50", 32), TMV("v51", 5), TMV("v52", 39),
   TMV("v53", 39), TMV("v54", 39), TMV("v55", 39), TMV("v56", 40),
   TMV("v57", 40), TMV("v58", 40), TMV("v59", 40), TMV("v6", 5),
   TMV("v60", 38), TMV("v61", 38), TMV("v62", 38), TMV("v63", 38),
   TMV("v64", 38), TMV("v65", 38), TMV("v66", 4), TMV("v66", 2),
   TMV("v67", 5), TMV("v67", 32), TMV("v68", 5), TMV("v68", 32),
   TMV("v69", 5), TMV("v7", 5), TMV("v70", 5), TMV("v70", 32),
   TMV("v71", 5), TMV("v71", 2), TMV("v72", 5), TMV("v72", 32),
   TMV("v73", 5), TMV("v73", 32), TMV("v74", 5), TMV("v74", 32),
   TMV("v75", 5), TMV("v75", 32), TMV("v76", 32), TMV("v77", 5),
   TMV("v77", 32), TMV("v78", 32), TMV("v79", 32), TMV("v8", 5),
   TMV("v80", 32), TMV("v81", 5), TMV("v81", 2), TMV("v82", 32),
   TMV("v83", 32), TMV("v84", 5), TMV("v84", 32), TMV("v85", 39),
   TMV("v85", 32), TMV("v86", 39), TMV("v86", 33), TMV("v87", 39),
   TMV("v87", 34), TMV("v88", 39), TMV("v88", 35), TMV("v89", 40),
   TMV("v9", 5), TMV("v90", 40), TMV("v90", 37), TMV("v91", 40),
   TMV("v91", 38), TMV("v92", 40), TMV("v92", 33), TMV("v93", 34),
   TMV("v93", 38), TMV("v94", 38), TMV("v94", 35), TMV("v95", 38),
   TMV("v95", 36), TMV("v96", 38), TMV("v96", 37), TMV("v97", 38),
   TMV("v98", 38), TMV("v98", 33), TMV("v99", 4), TMV("v99", 33),
   TMC(22, 41), TMC(22, 43), TMC(22, 45), TMC(22, 47), TMC(22, 49),
   TMC(22, 51), TMC(22, 53), TMC(22, 54), TMC(22, 56), TMC(22, 58),
   TMC(22, 60), TMC(22, 62), TMC(22, 64), TMC(22, 66), TMC(22, 68),
   TMC(22, 70), TMC(22, 72), TMC(22, 74), TMC(22, 76), TMC(22, 78),
   TMC(22, 80), TMC(23, 84), TMC(23, 86), TMC(25, 88), TMC(26, 38),
   TMC(27, 30), TMC(27, 88), TMC(27, 90), TMC(27, 91), TMC(27, 93),
   TMC(27, 95), TMC(28, 88), TMC(29, 97), TMC(30, 99), TMC(31, 33),
   TMC(32, 100), TMC(33, 33), TMC(34, 108), TMC(36, 110), TMC(37, 112),
   TMC(37, 114), TMC(38, 33), TMC(39, 35), TMC(40, 7), TMC(41, 5),
   TMC(42, 146), TMC(42, 172), TMC(43, 6), TMC(43, 87), TMC(44, 173),
   TMC(45, 174), TMC(46, 175), TMC(47, 9), TMC(48, 4), TMC(49, 176),
   TMC(50, 35), TMC(51, 177), TMC(52, 182), TMC(52, 186), TMC(53, 187),
   TMC(54, 106), TMC(55, 188), TMC(56, 189), TMC(57, 7), TMC(58, 192),
   TMC(59, 5), TMC(60, 96), TMC(61, 195), TMC(61, 198), TMC(62, 136),
   TMC(63, 199), TMC(64, 19), TMC(65, 19), TMC(65, 13), TMC(66, 19),
   TMC(66, 13), TMC(67, 19), TMC(67, 13), TMC(68, 128), TMC(69, 125),
   TMC(70, 121), TMC(71, 136), TMC(72, 125), TMC(73, 116), TMC(74, 121),
   TMC(75, 200), TMC(76, 136), TMC(77, 8), TMC(78, 203), TMC(78, 205),
   TMC(79, 116), TMC(80, 116), TMC(81, 6), TMC(82, 6), TMC(83, 207),
   TMC(84, 6), TMC(85, 136), TMC(86, 209), TMC(87, 221), TMC(87, 227),
   TMC(88, 228), TMC(89, 142), TMC(90, 229), TMC(90, 228), TMC(91, 207),
   TMC(92, 129), TMC(93, 230), TMC(93, 231), TMC(94, 232), TMC(95, 128),
   TMC(96, 133), TMC(97, 234), TMC(97, 236)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op inputOKr2_primitive_def x = x
    val op inputOKr2_primitive_def =
    ThmBind.DT(((("SM0r2",0),[]),[]),
               [ThmBind.read"%337%396@%377%341%6%375$0@|@2%9%7%355$0@%357%352@2%357%352@2%211%357%352@|@%212%357%352@|@%213%214%357%352@||@%215%216%357%352@||@%217%219%357%352@||@%220%221%357%352@||@%222%223%367$1@%258%357%352@|@%260%262%357%352@||@%264%266%367$1@%275%408$0@%295%357%352@|@%296%357%352@|@%299%357%352@|@%301%406$0@%21%367$3@%34%408$0@%55%357%352@|@%57%357%352@|@%60%355$7@%357%352@2%357%352@2%130%398$0@%8%416$2@%421$4@%357%372@2%357%352@2%357%352@3%421$4@%357%352@2%357%372@2%357%352@3|@%357%352@2|@%131%357%352@|@%133%136%357%352@||@%138%140%357%352@||@%142%144%357%352@||@%146%148%357%352@||@%150%152%357%352@||@%154%157%357%352@||@%159%161%357%352@||@%163%165%167%357%352@|||@%169%170%357%352@||@%172%174%357%352@||@%177%179%357%352@||@%181%183%357%352@||@%185%187%357%352@||@%189%191%357%352@||@%192%193%357%352@||@|@%62%357%352@|@%64%357%352@|@%66%357%352@|@|@%36%37%357%352@||@%40%41%357%352@||@|@%23%357%352@|@|@%303%357%352@|@%304%357%352@|@|@%276%277%357%352@||@%279%281%357%352@||@||@||@%224%225%357%352@||@%226%227%357%352@||@%228%230%231%357%352@|||@%232%233%357%352@||@%234%235%357%352@||@%236%237%357%352@||@%238%239%357%352@||@%241%242%357%352@||@%243%244%357%352@||@%245%246%357%352@||@||@2"])
  fun op certsr2root_def x = x
    val op certsr2root_def =
    ThmBind.DT(((("SM0r2",3),[]),[]),
               [ThmBind.read"%320%12%327%14%339%384$1@$0@2%348%419%363%358%411%379%333@5%363%344%379%333@5%348%387%363%344%379%333@4%419%363%359%412%345@4%363%371%345@5%348%387%363%344%379%333@4%419%363%359%412%343@4%363%371%343@5%361@4|@|@"])
  fun op certsr2signed_def x = x
    val op certsr2signed_def =
    ThmBind.DT(((("SM0r2",4),[]),[]),
               [ThmBind.read"%320%12%327%14%339%386$1@$0@2%348%418%363%358%411%379%333@5%419%363%359%412%345@4%363%371%345@5%348%418%363%358%411%379%333@5%419%363%359%412%343@4%363%371%343@5%361@3|@|@"])
  fun op certsr2_def x = x
    val op certsr2_def =
    ThmBind.DT(((("SM0r2",5),[]),[]),
               [ThmBind.read"%320%12%327%14%338%381$1@$0@2%342%342%380$1@$0@2%383$1@$0@3%385$1@$0@3|@|@"])
  fun op mapSM0r1input_primitive_def x = x
    val op mapSM0r1input_primitive_def =
    ThmBind.DT(((("SM0r2",6),[]),[]),
               [ThmBind.read"%336%402@%376%341%6%375$0@|@2%11%7%354$0@%356%374@2%356%374@2%211%356%374@|@%212%356%374@|@%213%214%356%374@||@%215%216%356%374@||@%217%219%356%374@||@%220%221%356%374@||@%222%223%354$0@%356%374@2%356%374@2%307%366$2@%92%356%374@|@%93%95%356%374@||@%97%98%397$2@%8%366$1@%113%366$3@%134%407$1@%158%356%374@|@%160%356%374@|@%162%407$1@%182%415$1@%420$0@%356%418%413%363%359%412%343@4%363%368%351@4%410%370$4@5%356%374@2%356%374@3%420$0@%356%374@2%356%418%413%363%359%412%345@4%363%368%364@4%410%370$4@5%356%374@3|@%184%356%374@|@%186%356%374@|@%188%356%374@|@%190%356%374@|@%191%356%374@|@|@%164%356%374@|@%166%356%374@|@%168%356%374@|@|@%137%139%356%374@||@%141%143%356%374@||@|@%115%117%356%374@||@%119%121%356%374@||@|@%356%374@2||@|@%20%356%374@|@%22%24%356%374@||@%25%27%356%374@||@%29%31%356%374@||@%33%35%356%374@||@%37%39%356%374@||@%41%42%356%374@||@%44%46%356%374@||@%48%50%52%356%374@|||@%54%56%356%374@||@%59%61%356%374@||@%63%65%356%374@||@%67%69%356%374@||@%71%73%356%374@||@%75%77%356%374@||@%80%82%356%374@||@||@%224%225%356%374@||@%226%227%356%374@||@%228%230%231%356%374@|||@%232%233%356%374@||@%234%235%356%374@||@%236%237%356%374@||@%238%239%356%374@||@%241%242%356%374@||@%243%244%356%374@||@%245%246%356%374@||@||@2"])
  fun op inputOKr2_ind x = x
    val op inputOKr2_ind =
    ThmBind.DT(((("SM0r2",1),
                [("aclfoundation",[55,116]),
                 ("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79]),
                 ("cipher",[42]),("principal",[32,56,80]),
                 ("relation",[107,113]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[12])]),["DISK_THM"]),
               [ThmBind.read"%316%5%340%332%315%8$1%418%413%363%359%412%345@4%363%368%364@4%410%370$0@4|@2%332%315%8$1%418%413%363%359%412%343@4%363%368%351@4%410%370$0@4|@2%332$0%374@2%332$0%353@2%332%319%17$1%410$0@2|@2%332%309%18$1%404$0@2|@2%332%309%196%309%207$2%378$1@$0@2|@|@2%332%309%218%309%229$2%405$1@$0@2|@|@2%332%309%240%309%254$2%395$1@$0@2|@|@2%332%309%272%309%289$2%390$1@$0@2|@|@2%332%326%248%309%38$2%418%363$1@2$0@2|@|@2%332%312%250%312%252%309%38$3%418%403$2@$1@2$0@2|@|@|@2%332%329%283%312%256%309%38$3%418%413%363%371$2@3$1@2$0@2|@|@|@2%332%314%285%312%256%309%38$3%418%413%363%344$2@3$1@2$0@2|@|@|@2%332%328%287%312%256%309%38$3%418%413%363%368$2@3$1@2$0@2|@|@|@2%332%329%306%329%43%309%38$3%418%413%363%359%412$2@4%363%371$1@4$0@2|@|@|@2%332%329%306%314%45%309%38$3%418%413%363%359%412$2@4%363%344$1@4$0@2|@|@|@2%332%329%306%328%47$2%418%413%363%359%412$1@4%363%368$0@4%374@2|@|@2%332%329%306%328%47$2%418%413%363%359%412$1@4%363%368$0@4%353@2|@|@2%332%315%195$1%418%413%363%359%412%345@4%363%368%351@4%410%370$0@4|@2%332%315%195$1%418%413%363%359%412%350@4%363%368%351@4%410%370$0@4|@2%332%315%195$1%418%413%363%359%412%343@4%363%368%364@4%410%370$0@4|@2%332%315%195$1%418%413%363%359%412%350@4%363%368%364@4%410%370$0@4|@2%332%329%306%328%47$2%418%413%363%359%412$1@4%363%368$0@4%410%362@3|@|@2%332%329%306%328%47%309%68$3%418%413%363%359%412$2@4%363%368$1@4%404$0@3|@|@|@2%332%329%306%328%47%309%70%309%72$4%418%413%363%359%412$3@4%363%368$2@4%378$1@$0@3|@|@|@|@2%332%329%306%328%47%309%74%309%76$4%418%413%363%359%412$3@4%363%368$2@4%405$1@$0@3|@|@|@|@2%332%329%306%328%47%309%79%309%81$4%418%413%363%359%412$3@4%363%368$2@4%395$1@$0@3|@|@|@|@2%332%329%306%328%47%309%83%309%85$4%418%413%363%359%412$3@4%363%368$2@4%390$1@$0@3|@|@|@|@2%332%329%306%328%47%312%87%309%88$4%418%413%363%359%412$3@4%363%368$2@4%418$1@$0@3|@|@|@|@2%332%329%306%328%47%312%90%312%91$4%418%413%363%359%412$3@4%363%368$2@4%419$1@$0@3|@|@|@|@2%332%329%306%328%47%312%93%309%94$4%418%413%363%359%412$3@4%363%368$2@4%387$1@$0@3|@|@|@|@2%332%329%306%328%47%312%97%312%98%309%99$5%418%413%363%359%412$4@4%363%368$3@4%414$2@$1@$0@3|@|@|@|@|@2%332%329%306%328%47%310%101%310%102$4%418%413%363%359%412$3@4%363%368$2@4%388$1@$0@3|@|@|@|@2%332%329%306%328%47%310%104%310%106$4%418%413%363%359%412$3@4%363%368$2@4%391$1@$0@3|@|@|@|@2%332%329%306%328%47%313%109%313%111$4%418%413%363%359%412$3@4%363%368$2@4%389$1@$0@3|@|@|@|@2%332%329%306%328%47%313%112%313%116$4%418%413%363%359%412$3@4%363%368$2@4%393$1@$0@3|@|@|@|@2%332%329%306%328%47%321%118%321%120$4%418%413%363%359%412$3@4%363%368$2@4%392$1@$0@3|@|@|@|@2%332%329%306%328%47%321%122%321%123$4%418%413%363%359%412$3@4%363%368$2@4%400$1@$0@3|@|@|@|@2%332%329%306%328%47%321%126%321%128$4%418%413%363%359%412$3@4%363%368$2@4%399$1@$0@3|@|@|@|@2%332%329%306%323%49%309%38$3%418%413%363%359%412$2@4%363%359$1@4$0@2|@|@|@2%332%329%306%322%51%309%38$3%418%413%363%359%412$2@4%363%358$1@4$0@2|@|@|@2%332%329%306%321%53%309%38$3%418%413%363%359%412$2@4%363%360$1@4$0@2|@|@|@2%332%329%306%312%26%312%28%309%38$4%418%413%363%359%412$3@4%403$2@$1@3$0@2|@|@|@|@2%332%329%306%312%30%312%32%309%38$4%418%413%363%359%412$3@4%413$2@$1@3$0@2|@|@|@|@2%332%329%308%312%256%309%38$3%418%413%363%359%409$2@4$1@2$0@2|@|@|@2%332%322%291%312%256%309%38$3%418%413%363%358$2@3$1@2$0@2|@|@|@2%332%321%293%312%256%309%38$3%418%413%363%360$2@3$1@2$0@2|@|@|@2%332%312%269%312%270%312%256%309%38$4%418%413%403$3@$2@2$1@2$0@2|@|@|@|@2%332%312%271%312%273%312%256%309%38$4%418%413%413$3@$2@2$1@2$0@2|@|@|@|@2%332%312%58%312%78$2%419$1@$0@2|@|@2%332%312%96%309%114$2%387$1@$0@2|@|@2%332%312%135%312%156%309%176$3%414$2@$1@$0@2|@|@|@2%332%310%194%310%197$2%388$1@$0@2|@|@2%332%310%198%310%199$2%391$1@$0@2|@|@2%332%313%200%313%201$2%389$1@$0@2|@|@2%332%313%202%313%203$2%393$1@$0@2|@|@2%332%321%204%321%205$2%392$1@$0@2|@|@2%332%321%206%321%208$2%400$1@$0@2|@|@2%321%209%321%210$2%399$1@$0@2|@|@61%309%16$1$0@|@2|@"])
  fun op inputOKr2_def x = x
    val op inputOKr2_def =
    ThmBind.DT(((("SM0r2",2),
                [("SM0r2",[0]),("aclfoundation",[33,110]),("bool",[15]),
                 ("cipher",[36]),("combin",[19]),("principal",[28,52,74]),
                 ("relation",[113,132]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%332%335%396%418%413%363%359%412%345@4%363%368%364@4%410%370%8@5%372@2%332%335%396%418%413%363%359%412%343@4%363%368%351@4%410%370%8@5%372@2%332%335%396%374@2%352@2%332%335%396%353@2%352@2%332%335%396%410%17@3%352@2%332%335%396%404%18@3%352@2%332%335%396%378%196@%207@3%352@2%332%335%396%405%218@%229@3%352@2%332%335%396%395%240@%254@3%352@2%332%335%396%390%272@%289@3%352@2%332%335%396%418%363%248@2%38@3%352@2%332%335%396%418%403%250@%252@2%38@3%352@2%332%335%396%418%413%363%371%283@3%256@2%38@3%352@2%332%335%396%418%413%363%344%285@3%256@2%38@3%352@2%332%335%396%418%413%363%368%287@3%256@2%38@3%352@2%332%335%396%418%413%363%359%412%306@4%363%371%43@4%38@3%352@2%332%335%396%418%413%363%359%412%306@4%363%344%45@4%38@3%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%374@3%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%353@3%352@2%332%335%396%418%413%363%359%412%345@4%363%368%351@4%410%370%195@5%352@2%332%335%396%418%413%363%359%412%350@4%363%368%351@4%410%370%195@5%352@2%332%335%396%418%413%363%359%412%343@4%363%368%364@4%410%370%195@5%352@2%332%335%396%418%413%363%359%412%350@4%363%368%364@4%410%370%195@5%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%410%362@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%404%68@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%378%70@%72@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%405%74@%76@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%395%79@%81@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%390%83@%85@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%418%87@%88@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%419%90@%91@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%387%93@%94@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%414%97@%98@%99@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%388%101@%102@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%391%104@%106@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%389%109@%111@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%393%112@%116@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%392%118@%120@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%400%122@%123@4%352@2%332%335%396%418%413%363%359%412%306@4%363%368%47@4%399%126@%128@4%352@2%332%335%396%418%413%363%359%412%306@4%363%359%49@4%38@3%352@2%332%335%396%418%413%363%359%412%306@4%363%358%51@4%38@3%352@2%332%335%396%418%413%363%359%412%306@4%363%360%53@4%38@3%352@2%332%335%396%418%413%363%359%412%306@4%403%26@%28@3%38@3%352@2%332%335%396%418%413%363%359%412%306@4%413%30@%32@3%38@3%352@2%332%335%396%418%413%363%359%409%308@4%256@2%38@3%352@2%332%335%396%418%413%363%358%291@3%256@2%38@3%352@2%332%335%396%418%413%363%360%293@3%256@2%38@3%352@2%332%335%396%418%413%403%269@%270@2%256@2%38@3%352@2%332%335%396%418%413%413%271@%273@2%256@2%38@3%352@2%332%335%396%419%58@%78@3%352@2%332%335%396%387%96@%114@3%352@2%332%335%396%414%135@%156@%176@3%352@2%332%335%396%388%194@%197@3%352@2%332%335%396%391%198@%199@3%352@2%332%335%396%389%200@%201@3%352@2%332%335%396%393%202@%203@3%352@2%332%335%396%392%204@%205@3%352@2%332%335%396%400%206@%208@3%352@2%335%396%399%209@%210@3%352@60"])
  fun op mapSM0r1input_ind x = x
    val op mapSM0r1input_ind =
    ThmBind.DT(((("SM0r2",7),
                [("aclfoundation",[55,116]),
                 ("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79]),
                 ("principal",[32,56,80]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[12])]),["DISK_THM"]),
               [ThmBind.read"%316%5%340%332%315%8$1%418%413%363%371%345@3%363%368%364@4%410%370$0@4|@2%332%315%8$1%418%413%363%371%343@3%363%368%351@4%410%370$0@4|@2%332$0%374@2%332$0%353@2%332%319%17$1%410$0@2|@2%332%309%18$1%404$0@2|@2%332%309%196%309%207$2%378$1@$0@2|@|@2%332%309%218%309%229$2%405$1@$0@2|@|@2%332%309%240%309%254$2%395$1@$0@2|@|@2%332%309%272%309%289$2%390$1@$0@2|@|@2%332%312%19$1%418$0@%374@2|@2%332%312%19$1%418$0@%353@2|@2%332%326%84%319%247$2%418%363$1@2%410$0@3|@|@2%332%312%86%312%87%319%247$3%418%403$2@$1@2%410$0@3|@|@|@2%332%326%124%329%145%315%100$3%418%413%363$2@2%363%371$1@4%410%370$0@4|@|@|@2%332%326%124%314%147%315%100$3%418%413%363$2@2%363%344$1@4%410%370$0@4|@|@|@2%332%315%100$1%418%413%363%371%345@3%363%368%351@4%410%370$0@4|@2%332%315%100$1%418%413%363%371%350@3%363%368%351@4%410%370$0@4|@2%332%315%100$1%418%413%363%371%343@3%363%368%364@4%410%370$0@4|@2%332%315%100$1%418%413%363%371%350@3%363%368%364@4%410%370$0@4|@2%332%314%171%328%149%315%100$3%418%413%363%344$2@3%363%368$1@4%410%370$0@4|@|@|@2%332%328%173%328%149%315%100$3%418%413%363%368$2@3%363%368$1@4%410%370$0@4|@|@|@2%332%323%175%328%149%315%100$3%418%413%363%359$2@3%363%368$1@4%410%370$0@4|@|@|@2%332%322%178%328%149%315%100$3%418%413%363%358$2@3%363%368$1@4%410%370$0@4|@|@|@2%332%321%180%328%149%315%100$3%418%413%363%360$2@3%363%368$1@4%410%370$0@4|@|@|@2%332%326%124%323%151%315%100$3%418%413%363$2@2%363%359$1@4%410%370$0@4|@|@|@2%332%326%124%322%153%315%100$3%418%413%363$2@2%363%358$1@4%410%370$0@4|@|@|@2%332%326%124%321%155%315%100$3%418%413%363$2@2%363%360$1@4%410%370$0@4|@|@|@2%332%312%125%312%127%326%103%315%100$4%418%413%403$3@$2@2%363$1@3%410%370$0@4|@|@|@|@2%332%312%129%312%132%326%103%315%100$4%418%413%413$3@$2@2%363$1@3%410%370$0@4|@|@|@|@2%332%312%89%312%105%312%107%315%100$4%418%413$3@%403$2@$1@3%410%370$0@4|@|@|@|@2%332%312%89%312%108%312%110%315%100$4%418%413$3@%413$2@$1@3%410%370$0@4|@|@|@|@2%332%312%89%312%90$2%418%413$1@$0@2%410%362@3|@|@2%332%312%19%309%249$2%418$1@%404$0@3|@|@2%332%312%19%309%251%309%253$3%418$2@%378$1@$0@3|@|@|@2%332%312%19%309%255%309%257$3%418$2@%405$1@$0@3|@|@|@2%332%312%19%309%259%309%261$3%418$2@%395$1@$0@3|@|@|@2%332%312%19%309%263%309%265$3%418$2@%390$1@$0@3|@|@|@2%332%312%19%312%267%309%268$3%418$2@%418$1@$0@3|@|@|@2%332%312%19%312%270%312%271$3%418$2@%419$1@$0@3|@|@|@2%332%312%19%312%273%309%274$3%418$2@%387$1@$0@3|@|@|@2%332%312%19%312%276%312%277%309%278$4%418$3@%414$2@$1@$0@3|@|@|@|@2%332%312%19%310%280%310%282$3%418$2@%388$1@$0@3|@|@|@2%332%312%19%310%284%310%286$3%418$2@%391$1@$0@3|@|@|@2%332%312%19%313%288%313%290$3%418$2@%389$1@$0@3|@|@|@2%332%312%19%313%292%313%294$3%418$2@%393$1@$0@3|@|@|@2%332%312%19%321%297%321%298$3%418$2@%392$1@$0@3|@|@|@2%332%312%19%321%300%321%302$3%418$2@%400$1@$0@3|@|@|@2%332%312%19%321%304%321%305$3%418$2@%399$1@$0@3|@|@|@2%332%312%58%312%78$2%419$1@$0@2|@|@2%332%312%96%309%114$2%387$1@$0@2|@|@2%332%312%135%312%156%309%176$3%414$2@$1@$0@2|@|@|@2%332%310%194%310%197$2%388$1@$0@2|@|@2%332%310%198%310%199$2%391$1@$0@2|@|@2%332%313%200%313%201$2%389$1@$0@2|@|@2%332%313%202%313%203$2%393$1@$0@2|@|@2%332%321%204%321%205$2%392$1@$0@2|@|@2%332%321%206%321%208$2%400$1@$0@2|@|@2%321%209%321%210$2%399$1@$0@2|@|@60%309%16$1$0@|@2|@"])
  fun op mapSM0r1input_def x = x
    val op mapSM0r1input_def =
    ThmBind.DT(((("SM0r2",8),
                [("SM0r2",[6]),("aclfoundation",[33,110]),("bool",[15]),
                 ("combin",[19]),("principal",[28,52,74]),
                 ("relation",[113,132]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%332%334%402%418%413%363%371%345@3%363%368%364@4%410%370%8@5%418%413%363%359%412%345@4%363%368%364@4%410%370%8@5%332%334%402%418%413%363%371%343@3%363%368%351@4%410%370%8@5%418%413%363%359%412%343@4%363%368%351@4%410%370%8@5%332%334%402%374@2%374@2%332%334%402%353@2%374@2%332%334%402%410%17@3%374@2%332%334%402%404%18@3%374@2%332%334%402%378%196@%207@3%374@2%332%334%402%405%218@%229@3%374@2%332%334%402%395%240@%254@3%374@2%332%334%402%390%272@%289@3%374@2%332%334%402%418%19@%374@3%374@2%332%334%402%418%19@%353@3%374@2%332%334%402%418%363%84@2%410%247@4%374@2%332%334%402%418%403%86@%87@2%410%247@4%374@2%332%334%402%418%413%363%124@2%363%371%145@4%410%370%100@5%374@2%332%334%402%418%413%363%124@2%363%344%147@4%410%370%100@5%374@2%332%334%402%418%413%363%371%345@3%363%368%351@4%410%370%100@5%374@2%332%334%402%418%413%363%371%350@3%363%368%351@4%410%370%100@5%374@2%332%334%402%418%413%363%371%343@3%363%368%364@4%410%370%100@5%374@2%332%334%402%418%413%363%371%350@3%363%368%364@4%410%370%100@5%374@2%332%334%402%418%413%363%344%171@3%363%368%149@4%410%370%100@5%374@2%332%334%402%418%413%363%368%173@3%363%368%149@4%410%370%100@5%374@2%332%334%402%418%413%363%359%175@3%363%368%149@4%410%370%100@5%374@2%332%334%402%418%413%363%358%178@3%363%368%149@4%410%370%100@5%374@2%332%334%402%418%413%363%360%180@3%363%368%149@4%410%370%100@5%374@2%332%334%402%418%413%363%124@2%363%359%151@4%410%370%100@5%374@2%332%334%402%418%413%363%124@2%363%358%153@4%410%370%100@5%374@2%332%334%402%418%413%363%124@2%363%360%155@4%410%370%100@5%374@2%332%334%402%418%413%403%125@%127@2%363%103@3%410%370%100@5%374@2%332%334%402%418%413%413%129@%132@2%363%103@3%410%370%100@5%374@2%332%334%402%418%413%89@%403%105@%107@3%410%370%100@5%374@2%332%334%402%418%413%89@%413%108@%110@3%410%370%100@5%374@2%332%334%402%418%413%89@%90@2%410%362@4%374@2%332%334%402%418%19@%404%249@4%374@2%332%334%402%418%19@%378%251@%253@4%374@2%332%334%402%418%19@%405%255@%257@4%374@2%332%334%402%418%19@%395%259@%261@4%374@2%332%334%402%418%19@%390%263@%265@4%374@2%332%334%402%418%19@%418%267@%268@4%374@2%332%334%402%418%19@%419%270@%271@4%374@2%332%334%402%418%19@%387%273@%274@4%374@2%332%334%402%418%19@%414%276@%277@%278@4%374@2%332%334%402%418%19@%388%280@%282@4%374@2%332%334%402%418%19@%391%284@%286@4%374@2%332%334%402%418%19@%389%288@%290@4%374@2%332%334%402%418%19@%393%292@%294@4%374@2%332%334%402%418%19@%392%297@%298@4%374@2%332%334%402%418%19@%400%300@%302@4%374@2%332%334%402%418%19@%399%304@%305@4%374@2%332%334%402%419%58@%78@3%374@2%332%334%402%387%96@%114@3%374@2%332%334%402%414%135@%156@%176@3%374@2%332%334%402%388%194@%197@3%374@2%332%334%402%391%198@%199@3%374@2%332%334%402%389%200@%201@3%374@2%332%334%402%393%202@%203@3%374@2%332%334%402%392%204@%205@3%374@2%332%334%402%400%206@%208@3%374@2%334%402%399%209@%210@3%374@59"])
  fun op mapSM0r1_Bob_Operator_privcmd_lemma x = x
    val op mapSM0r1_Bob_Operator_privcmd_lemma =
    ThmBind.DT(((("SM0r2",9),
                [("SM0",[15]),("SM0r1",[9,12]),("SM0r2",[3,4,5,6]),
                 ("aclDrules",[3,4,16]),("aclfoundation",[33,110]),
                 ("aclrules",[32,33]),
                 ("bool",[15,25,26,46,47,50,52,53,57,62,92,93,95]),
                 ("combin",[19]),("principal",[28,52,74]),
                 ("relation",[113,132]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,2,3]),("ssm1",[6,52])]),["DISK_THM"]),
               [ThmBind.read"%340%347%330%0@%331%2@%3@3%346%396@%369@%382%12@%14@2%348%402%401%418%363%368%364@3%410%370%365%14@7%10@2%15@%13@3%417%330%0@%331%2@%3@3%410%370%365%14@5"])
  fun op Operator_Bob_exec_privcmd_justified_thm_r2 x = x
    val op Operator_Bob_exec_privcmd_justified_thm_r2 =
    ThmBind.DT(((("SM0r2",10),
                [("SM0",[15]),("SM0r1",[9,12]),("SM0r2",[3,4,5,6]),
                 ("aclDrules",[3,4,16]),("aclfoundation",[33,110]),
                 ("aclrules",[32,33]),
                 ("bool",[15,25,26,35,46,47,50,52,53,57,62,92,93,95]),
                 ("combin",[19]),("principal",[28,52,74]),
                 ("relation",[113,132]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,2,3]),("ssm1",[6,52,62])]),["DISK_THM"]),
               [ThmBind.read"%318%1%317%4%311%0%324%2%325%3%335%373%330$2@%331$1@$0@3%394%365%14@3%346%396@%369@%382%12@%14@2%348%418%413%363%359%412%345@4%363%368%364@4%410%370%365%14@5%10@2%15@%13@2%346%396@%369@%382%12@%14@2%10@$4%15@%394%365%14@4%349$3%15@%394%365%14@4%13@4%332%396%418%413%363%359%412%345@4%363%368%364@4%410%370%365%14@6%332%347%330$2@%331$1@$0@3%346%396@%369@%382%12@%14@2%348%418%413%363%359%412%345@4%363%368%364@4%410%370%365%14@5%10@2%15@%13@3%417%330$2@%331$1@$0@3%410%370%365%14@7|@|@|@|@|@"])
  fun op Operator_mapSM0r1input_exec_privcmd_justifed_thm x = x
    val op Operator_mapSM0r1input_exec_privcmd_justifed_thm =
    ThmBind.DT(((("SM0r2",11),
                [("SM0",[15]),("SM0r1",[9,12]),("SM0r2",[3,4,5,6]),
                 ("aclDrules",[3,4,16]),("aclfoundation",[33,110]),
                 ("aclrules",[32,33]),
                 ("bool",
                 [13,15,25,26,27,29,35,46,47,50,51,52,53,55,57,62,72,92,93,
                  95]),("combin",[19]),("principal",[28,52,74]),
                 ("relation",[113,132]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,2,3]),("ssm1",[6,52,62])]),["DISK_THM"]),
               [ThmBind.read"%318%1%317%4%311%0%324%2%325%3%335%373%330$2@%331$1@$0@3%394%365%14@3%346%396@%369@%382%12@%14@2%348%402%401%418%363%368%364@3%410%370%365%14@7%10@2%15@%13@2%346%396@%369@%382%12@%14@2%10@$4%15@%394%365%14@4%349$3%15@%394%365%14@4%13@4%332%396%402%401%418%363%368%364@3%410%370%365%14@8%332%347%330$2@%331$1@$0@3%346%396@%369@%382%12@%14@2%348%402%401%418%363%368%364@3%410%370%365%14@7%10@2%15@%13@3%417%330$2@%331$1@$0@3%410%370%365%14@7|@|@|@|@|@"])

  val _ = DB.bindl "SM0r2"
  [("inputOKr2_primitive_def",inputOKr2_primitive_def,DB.Def),
   ("certsr2root_def",certsr2root_def,DB.Def),
   ("certsr2signed_def",certsr2signed_def,DB.Def),
   ("certsr2_def",certsr2_def,DB.Def),
   ("mapSM0r1input_primitive_def",mapSM0r1input_primitive_def,DB.Def),
   ("inputOKr2_ind",inputOKr2_ind,DB.Thm),
   ("inputOKr2_def",inputOKr2_def,DB.Thm),
   ("mapSM0r1input_ind",mapSM0r1input_ind,DB.Thm),
   ("mapSM0r1input_def",mapSM0r1input_def,DB.Thm),
   ("mapSM0r1_Bob_Operator_privcmd_lemma",
    mapSM0r1_Bob_Operator_privcmd_lemma,
    DB.Thm),
   ("Operator_Bob_exec_privcmd_justified_thm_r2",
    Operator_Bob_exec_privcmd_justified_thm_r2,
    DB.Thm),
   ("Operator_mapSM0r1input_exec_privcmd_justifed_thm",
    Operator_mapSM0r1input_exec_privcmd_justifed_thm,
    DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0r2",
    thydataty = "compute",
    read = ThmBind.read,
    data =
        "SM0r2.inputOKr2_def SM0r2.mapSM0r1input_def SM0r2.certsr2_def SM0r2.certsr2root_def SM0r2.certsr2signed_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0r2",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO9.inputOKr24.%396OO11.certsr2root4.%384OO13.certsr2signed4.%386OO7.certsr24.%381OO13.mapSM0r1input4.%402"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val SM0r2_grammars = merge_grammars ["SM0r1"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="SM0r2"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val SM0r2_grammars = 
    Portable.## (addtyUDs,addtmUDs) SM0r2_grammars
  val _ = Parse.grammarDB_insert("SM0r2",SM0r2_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "SM0r2"
end