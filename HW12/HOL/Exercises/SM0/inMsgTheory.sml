structure inMsgTheory :> inMsgTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading inMsgTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open m0TypesTheory principalTheory ssm2Theory
  in end;
  val _ = Theory.link_parents
          ("inMsg",
          Arbnum.fromString "1555472148",
          Arbnum.fromString "640734")
          [("principal",
           Arbnum.fromString "1555472138",
           Arbnum.fromString "337809"),
           ("m0Types",
           Arbnum.fromString "1555472137",
           Arbnum.fromString "541063"),
           ("ssm2",
           Arbnum.fromString "1555472128",
           Arbnum.fromString "914021")];
  val _ = Theory.incorporate_types "inMsg" [("order", 0), ("inMsg", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("num", "num"), ID("inMsg", "order"),
   ID("m0Types", "command"), ID("principal", "role"),
   ID("aclfoundation", "Form"), ID("principal", "principal"),
   ID("ssm1", "inst"), ID("inMsg", "inMsg"), ID("cipher", "asymMsg"),
   ID("principal", "staff"), ID("cipher", "digest"), ID("min", "bool"),
   ID("ind_type", "recspace"), ID("pair", "prod"),
   ID("aclfoundation", "IntLevel"), ID("aclfoundation", "SecLevel"),
   ID("aclfoundation", "Princ"), ID("principal", "authority"),
   ID("cipher", "pKey"), ID("bool", "!"), ID("arithmetic", "+"),
   ID("pair", ","), ID("bool", "/\\"), ID("num", "0"), ID("min", "="),
   ID("min", "==>"), ID("bool", "?"), ID("min", "@"), ID("bool", "ARB"),
   ID("principal", "Authority"), ID("arithmetic", "BIT1"),
   ID("ind_type", "BOTTOM"), ID("bool", "COND"), ID("ind_type", "CONSTR"),
   ID("bool", "DATATYPE"), ID("aclfoundation", "FF"),
   ID("aclfoundation", "Form_CASE"), ID("combin", "I"),
   ID("principal", "KeyA"), ID("principal", "KeyS"), ID("inMsg", "MSG"),
   ID("principal", "Machine"), ID("inMsg", "MsgInterpret"),
   ID("ssm1", "NONE"), ID("arithmetic", "NUMERAL"),
   ID("aclfoundation", "Name"), ID("inMsg", "Order"),
   ID("aclfoundation", "Princ_CASE"), ID("principal", "Role"),
   ID("option", "SOME"), ID("option", "option"), ID("ssm1", "SOME"),
   ID("principal", "Staff"), ID("aclfoundation", "TT"),
   ID("bool", "TYPE_DEFINITION"), ID("relation", "WF"),
   ID("relation", "WFREC"), ID("arithmetic", "ZERO"),
   ID("aclfoundation", "andf"), ID("cipher", "asymMsg_size"),
   ID("inMsg", "checkMsg"), ID("m0Types", "command_size"),
   ID("aclfoundation", "controls"), ID("cipher", "digest_size"),
   ID("aclfoundation", "domi"), ID("aclfoundation", "doms"),
   ID("aclfoundation", "eqf"), ID("aclfoundation", "eqi"),
   ID("aclfoundation", "eqn"), ID("aclfoundation", "eqs"),
   ID("cipher", "hash"), ID("aclfoundation", "impf"),
   ID("inMsg", "inMsg_CASE"), ID("inMsg", "inMsg_size"),
   ID("ssm1", "inst_CASE"), ID("aclfoundation", "lt"),
   ID("aclfoundation", "lte"), ID("aclfoundation", "meet"),
   ID("inMsg", "mkinMsg"), ID("aclfoundation", "notf"),
   ID("inMsg", "orderInterpret"), ID("inMsg", "order_CASE"),
   ID("inMsg", "order_size"), ID("aclfoundation", "orf"),
   ID("cipher", "pKey_CASE"), ID("principal", "principal_CASE"),
   ID("cipher", "privK"), ID("aclfoundation", "prop"),
   ID("cipher", "pubK"), ID("aclfoundation", "quoting"),
   ID("aclfoundation", "reps"), ID("principal", "role_size"),
   ID("aclfoundation", "says"), ID("cipher", "sign"),
   ID("cipher", "signVerify"), ID("aclfoundation", "speaks_for"),
   ID("principal", "staff_size")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYV "'a", TYOP [3], TYOP [0, 4, 3],
   TYOP [4], TYOP [0, 6, 5], TYOP [0, 7, 3], TYOP [0, 1, 8], TYV "'e",
   TYV "'d", TYOP [6], TYOP [7, 4], TYOP [5, 13, 12, 11, 10],
   TYOP [0, 1, 14], TYOP [8], TYOP [0, 14, 16], TYOP [0, 16, 0], TYOP [10],
   TYOP [11, 1], TYOP [9, 20, 19], TYOP [0, 21, 3], TYOP [0, 1, 22],
   TYOP [0, 19, 23], TYOP [0, 24, 3], TYOP [0, 16, 25], TYOP [12],
   TYOP [0, 16, 27], TYOP [0, 4, 1], TYOP [0, 6, 29], TYOP [0, 16, 14],
   TYOP [0, 21, 16], TYOP [0, 1, 32], TYOP [0, 19, 33], TYOP [14, 1, 21],
   TYOP [14, 19, 35], TYOP [13, 36], TYOP [0, 37, 27], TYOP [14, 6, 4],
   TYOP [13, 39], TYOP [0, 40, 27], TYOP [0, 14, 27], TYOP [0, 1, 27],
   TYOP [0, 14, 42], TYOP [0, 16, 28], TYOP [0, 16, 3], TYOP [0, 1, 3],
   TYOP [0, 34, 27], TYOP [0, 30, 27], TYOP [0, 16, 37], TYOP [0, 1, 40],
   TYOP [15, 12, 11], TYOP [16, 12, 10], TYOP [17, 12], TYOP [18],
   TYOP [19, 19], TYOP [19, 55], TYOP [0, 42, 27], TYOP [0, 52, 27],
   TYOP [0, 59, 27], TYOP [0, 54, 27], TYOP [0, 61, 27], TYOP [0, 53, 27],
   TYOP [0, 63, 27], TYOP [0, 21, 27], TYOP [0, 65, 27], TYOP [0, 55, 27],
   TYOP [0, 67, 27], TYOP [0, 4, 27], TYOP [0, 69, 27], TYOP [0, 58, 27],
   TYOP [0, 28, 27], TYOP [0, 72, 27], TYOP [0, 43, 27], TYOP [0, 74, 27],
   TYOP [0, 41, 27], TYOP [0, 76, 27], TYOP [0, 38, 27], TYOP [0, 78, 27],
   TYOP [0, 7, 27], TYOP [0, 80, 27], TYOP [0, 24, 27], TYOP [0, 82, 27],
   TYOP [0, 13, 27], TYOP [0, 84, 27], TYOP [0, 0, 27], TYOP [0, 86, 27],
   TYOP [0, 57, 27], TYOP [0, 88, 27], TYOP [0, 56, 27], TYOP [0, 90, 27],
   TYOP [0, 12, 27], TYOP [0, 92, 27], TYOP [0, 6, 27], TYOP [0, 94, 27],
   TYOP [0, 19, 27], TYOP [0, 96, 27], TYOP [0, 0, 0], TYOP [0, 0, 98],
   TYOP [0, 21, 35], TYOP [0, 1, 100], TYOP [0, 4, 39], TYOP [0, 6, 102],
   TYOP [0, 35, 36], TYOP [0, 19, 104], TYOP [0, 27, 27],
   TYOP [0, 27, 106], TYOP [0, 3, 27], TYOP [0, 3, 108], TYOP [0, 21, 65],
   TYOP [0, 4, 69], TYOP [0, 17, 27], TYOP [0, 17, 112], TYOP [0, 31, 27],
   TYOP [0, 31, 114], TYOP [0, 0, 86], TYOP [0, 1, 43], TYOP [0, 40, 41],
   TYOP [0, 37, 38], TYOP [0, 6, 94], TYOP [0, 19, 96], TYOP [0, 46, 27],
   TYOP [0, 122, 27], TYOP [0, 50, 27], TYOP [0, 124, 27],
   TYOP [0, 47, 27], TYOP [0, 126, 27], TYOP [0, 51, 27],
   TYOP [0, 128, 27], TYOP [0, 44, 27], TYOP [0, 130, 44],
   TYOP [0, 45, 27], TYOP [0, 132, 45], TYOP [0, 55, 12], TYOP [0, 14, 14],
   TYOP [0, 14, 135], TYOP [0, 27, 136], TYOP [0, 0, 40],
   TYOP [0, 138, 40], TYOP [0, 39, 139], TYOP [0, 0, 140], TYOP [0, 0, 37],
   TYOP [0, 142, 37], TYOP [0, 36, 143], TYOP [0, 0, 144], TYOP [0, 0, 16],
   TYOP [0, 0, 146], TYOP [0, 147, 16], TYOP [0, 147, 148],
   TYOP [0, 147, 149], TYOP [0, 53, 16], TYOP [0, 53, 151],
   TYOP [0, 152, 150], TYOP [0, 152, 153], TYOP [0, 52, 16],
   TYOP [0, 52, 155], TYOP [0, 156, 154], TYOP [0, 156, 157],
   TYOP [0, 54, 17], TYOP [0, 54, 159], TYOP [0, 160, 158],
   TYOP [0, 159, 161], TYOP [0, 54, 16], TYOP [0, 54, 163],
   TYOP [0, 164, 162], TYOP [0, 159, 165], TYOP [0, 14, 17],
   TYOP [0, 167, 166], TYOP [0, 167, 168], TYOP [0, 167, 169],
   TYOP [0, 167, 170], TYOP [0, 17, 171], TYOP [0, 13, 16],
   TYOP [0, 173, 172], TYOP [0, 16, 174], TYOP [0, 16, 175],
   TYOP [0, 14, 176], TYOP [0, 16, 16], TYOP [0, 57, 12], TYOP [0, 56, 12],
   TYOP [0, 0, 12], TYOP [0, 12, 54], TYOP [0, 164, 16],
   TYOP [0, 164, 183], TYOP [0, 12, 16], TYOP [0, 185, 184],
   TYOP [0, 54, 186], TYOP [0, 6, 12], TYOP [51, 1], TYOP [0, 1, 189],
   TYOP [0, 4, 13], TYOP [0, 19, 12], TYOP [0, 41, 128], TYOP [0, 38, 124],
   TYOP [0, 17, 17], TYOP [0, 195, 17], TYOP [0, 44, 196],
   TYOP [0, 31, 31], TYOP [0, 198, 31], TYOP [0, 45, 199], TYOP [0, 21, 0],
   TYOP [0, 19, 0], TYOP [0, 202, 201], TYOP [0, 20, 0],
   TYOP [0, 204, 203], TYOP [0, 4, 0], TYOP [0, 54, 135], TYOP [0, 2, 204],
   TYOP [0, 52, 14], TYOP [0, 52, 209], TYOP [0, 53, 14],
   TYOP [0, 53, 211], TYOP [0, 0, 14], TYOP [0, 0, 213], TYOP [0, 189, 20],
   TYOP [0, 21, 14], TYOP [0, 1, 216], TYOP [0, 19, 217],
   TYOP [0, 218, 14], TYOP [0, 16, 219], TYOP [0, 4, 16],
   TYOP [0, 221, 178], TYOP [0, 13, 222], TYOP [0, 54, 54],
   TYOP [0, 54, 224], TYOP [0, 4, 14], TYOP [0, 6, 226], TYOP [0, 227, 14],
   TYOP [0, 1, 228], TYOP [0, 19, 16], TYOP [0, 230, 16],
   TYOP [0, 230, 231], TYOP [0, 56, 232], TYOP [0, 146, 16],
   TYOP [0, 57, 16], TYOP [0, 235, 234], TYOP [0, 56, 16],
   TYOP [0, 237, 236], TYOP [0, 6, 16], TYOP [0, 239, 238],
   TYOP [0, 55, 16], TYOP [0, 241, 240], TYOP [0, 230, 242],
   TYOP [0, 12, 243], TYOP [0, 19, 56], TYOP [0, 13, 14],
   TYOP [0, 54, 207], TYOP [0, 6, 0], TYOP [0, 20, 21], TYOP [0, 56, 249],
   TYOP [0, 189, 27], TYOP [0, 21, 251], TYOP [0, 56, 252],
   TYOP [0, 54, 14], TYOP [0, 54, 254]]
  end
  val _ = Theory.incorporate_consts "inMsg" tyvector
     [("order_size", 2), ("order_CASE", 9), ("orderInterpret", 15),
      ("mkinMsg", 17), ("inMsg_size", 18), ("inMsg_CASE", 26),
      ("checkMsg", 28), ("Order", 30), ("MsgInterpret", 31), ("MSG", 34)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'inMsg'", 38), TMV("'order'", 41), TMV("M", 16), TMV("M", 1),
   TMV("M'", 16), TMV("M'", 1), TMV("MsgInterpret", 31), TMV("P", 42),
   TMV("P", 28), TMV("P", 43), TMV("R", 44), TMV("R", 45), TMV("a", 14),
   TMV("a", 21), TMV("a", 16), TMV("a0", 6), TMV("a0", 19), TMV("a0'", 40),
   TMV("a0'", 37), TMV("a0'", 6), TMV("a0'", 19), TMV("a1", 4),
   TMV("a1", 1), TMV("a1'", 4), TMV("a1'", 1), TMV("a2", 21),
   TMV("a2'", 21), TMV("c", 4), TMV("command", 4), TMV("f", 7),
   TMV("f", 24), TMV("f'", 7), TMV("f'", 24), TMV("fn", 46), TMV("fn", 47),
   TMV("i", 16), TMV("ii", 16), TMV("inMsg", 48), TMV("mkinMsg", 17),
   TMV("n", 0), TMV("o", 1), TMV("oo", 1), TMV("order", 49),
   TMV("order", 1), TMV("r", 6), TMV("rep", 50), TMV("rep", 51),
   TMV("role", 6), TMV("s", 19), TMV("signature", 21), TMV("staff", 19),
   TMV("v", 14), TMV("v", 16), TMV("v", 13), TMV("v1", 13), TMV("v1", 1),
   TMV("v10", 14), TMV("v100", 14), TMV("v101", 52), TMV("v102", 52),
   TMV("v103", 52), TMV("v104", 52), TMV("v105", 52), TMV("v106", 52),
   TMV("v107", 52), TMV("v108", 52), TMV("v109", 53), TMV("v11", 14),
   TMV("v110", 53), TMV("v111", 53), TMV("v112", 53), TMV("v113", 53),
   TMV("v114", 53), TMV("v115", 53), TMV("v116", 53), TMV("v117", 0),
   TMV("v118", 0), TMV("v119", 0), TMV("v12", 14), TMV("v120", 0),
   TMV("v121", 0), TMV("v122", 0), TMV("v123", 0), TMV("v124", 0),
   TMV("v125", 0), TMV("v126", 0), TMV("v127", 0), TMV("v128", 0),
   TMV("v129", 54), TMV("v13", 14), TMV("v130", 54), TMV("v131", 12),
   TMV("v132", 12), TMV("v133", 54), TMV("v134", 54), TMV("v135", 54),
   TMV("v136", 54), TMV("v137", 54), TMV("v138", 54), TMV("v139", 13),
   TMV("v14", 14), TMV("v140", 13), TMV("v142", 12), TMV("v143", 54),
   TMV("v144", 54), TMV("v145", 54), TMV("v146", 54), TMV("v147", 54),
   TMV("v148", 54), TMV("v149", 54), TMV("v15", 14), TMV("v150", 54),
   TMV("v151", 12), TMV("v152", 54), TMV("v153", 54), TMV("v154", 54),
   TMV("v155", 54), TMV("v156", 54), TMV("v157", 54), TMV("v158", 54),
   TMV("v159", 54), TMV("v16", 14), TMV("v160", 19), TMV("v161", 19),
   TMV("v162", 55), TMV("v163", 55), TMV("v165", 56), TMV("v166", 56),
   TMV("v167", 57), TMV("v168", 57), TMV("v169", 0), TMV("v17", 14),
   TMV("v170", 0), TMV("v171", 12), TMV("v172", 12), TMV("v173", 19),
   TMV("v174", 19), TMV("v175", 55), TMV("v176", 55), TMV("v177", 6),
   TMV("v178", 6), TMV("v179", 56), TMV("v18", 14), TMV("v180", 57),
   TMV("v181", 57), TMV("v182", 0), TMV("v183", 0), TMV("v184", 6),
   TMV("v185", 6), TMV("v186", 6), TMV("v188", 19), TMV("v189", 19),
   TMV("v19", 14), TMV("v190", 6), TMV("v191", 6), TMV("v192", 12),
   TMV("v193", 12), TMV("v194", 12), TMV("v195", 12), TMV("v196", 4),
   TMV("v197", 12), TMV("v198", 4), TMV("v199", 4), TMV("v2", 14),
   TMV("v20", 54), TMV("v200", 54), TMV("v201", 4), TMV("v202", 54),
   TMV("v203", 54), TMV("v204", 54), TMV("v205", 54), TMV("v206", 54),
   TMV("v207", 54), TMV("v208", 54), TMV("v209", 54), TMV("v21", 14),
   TMV("v210", 54), TMV("v211", 54), TMV("v212", 54), TMV("v213", 54),
   TMV("v214", 54), TMV("v215", 54), TMV("v216", 54), TMV("v217", 54),
   TMV("v218", 54), TMV("v219", 54), TMV("v22", 54), TMV("v220", 54),
   TMV("v23", 54), TMV("v24", 54), TMV("v25", 54), TMV("v26", 54),
   TMV("v27", 14), TMV("v28", 54), TMV("v29", 14), TMV("v3", 14),
   TMV("v30", 54), TMV("v31", 54), TMV("v32", 14), TMV("v33", 54),
   TMV("v34", 54), TMV("v35", 14), TMV("v36", 52), TMV("v37", 52),
   TMV("v38", 52), TMV("v39", 52), TMV("v4", 14), TMV("v40", 52),
   TMV("v41", 52), TMV("v42", 52), TMV("v43", 52), TMV("v44", 53),
   TMV("v45", 53), TMV("v46", 53), TMV("v47", 53), TMV("v48", 53),
   TMV("v49", 53), TMV("v5", 14), TMV("v50", 53), TMV("v51", 53),
   TMV("v52", 0), TMV("v53", 0), TMV("v54", 0), TMV("v55", 0),
   TMV("v56", 0), TMV("v57", 0), TMV("v58", 0), TMV("v59", 0),
   TMV("v6", 14), TMV("v60", 0), TMV("v61", 0), TMV("v62", 0),
   TMV("v63", 0), TMV("v64", 13), TMV("v65", 14), TMV("v66", 14),
   TMV("v67", 14), TMV("v68", 14), TMV("v69", 14), TMV("v7", 14),
   TMV("v70", 14), TMV("v71", 14), TMV("v72", 14), TMV("v73", 14),
   TMV("v74", 14), TMV("v75", 14), TMV("v76", 14), TMV("v77", 14),
   TMV("v78", 14), TMV("v79", 14), TMV("v8", 14), TMV("v80", 14),
   TMV("v81", 14), TMV("v82", 14), TMV("v83", 54), TMV("v84", 14),
   TMV("v85", 54), TMV("v86", 14), TMV("v87", 54), TMV("v88", 54),
   TMV("v89", 54), TMV("v9", 14), TMV("v90", 54), TMV("v91", 54),
   TMV("v92", 14), TMV("v93", 54), TMV("v94", 14), TMV("v95", 54),
   TMV("v96", 54), TMV("v97", 14), TMV("v98", 54), TMV("v99", 54),
   TMC(20, 58), TMC(20, 60), TMC(20, 62), TMC(20, 64), TMC(20, 66),
   TMC(20, 68), TMC(20, 70), TMC(20, 71), TMC(20, 73), TMC(20, 75),
   TMC(20, 77), TMC(20, 79), TMC(20, 81), TMC(20, 83), TMC(20, 72),
   TMC(20, 85), TMC(20, 87), TMC(20, 74), TMC(20, 89), TMC(20, 91),
   TMC(20, 93), TMC(20, 76), TMC(20, 78), TMC(20, 95), TMC(20, 97),
   TMC(21, 99), TMC(22, 101), TMC(22, 103), TMC(22, 105), TMC(23, 107),
   TMC(24, 0), TMC(25, 109), TMC(25, 44), TMC(25, 110), TMC(25, 107),
   TMC(25, 111), TMC(25, 113), TMC(25, 115), TMC(25, 45), TMC(25, 116),
   TMC(25, 117), TMC(25, 118), TMC(25, 119), TMC(25, 120), TMC(25, 121),
   TMC(26, 107), TMC(27, 66), TMC(27, 70), TMC(27, 123), TMC(27, 125),
   TMC(27, 127), TMC(27, 129), TMC(27, 74), TMC(27, 95), TMC(27, 97),
   TMC(28, 131), TMC(28, 133), TMC(29, 16), TMC(30, 134), TMC(31, 98),
   TMC(32, 40), TMC(32, 37), TMC(33, 137), TMC(34, 141), TMC(34, 145),
   TMC(35, 106), TMC(36, 14), TMC(37, 177), TMC(38, 135), TMC(38, 178),
   TMC(39, 179), TMC(40, 180), TMC(41, 34), TMC(42, 181), TMC(43, 31),
   TMC(44, 13), TMC(45, 98), TMC(46, 182), TMC(47, 30), TMC(48, 187),
   TMC(49, 188), TMC(50, 190), TMC(52, 191), TMC(53, 192), TMC(54, 14),
   TMC(55, 193), TMC(55, 194), TMC(56, 130), TMC(56, 132), TMC(57, 197),
   TMC(57, 200), TMC(58, 0), TMC(59, 136), TMC(60, 205), TMC(61, 28),
   TMC(62, 206), TMC(63, 207), TMC(64, 208), TMC(65, 210), TMC(66, 212),
   TMC(67, 136), TMC(68, 210), TMC(69, 214), TMC(70, 212), TMC(71, 215),
   TMC(72, 136), TMC(73, 26), TMC(73, 220), TMC(74, 18), TMC(75, 223),
   TMC(76, 214), TMC(77, 214), TMC(78, 225), TMC(79, 17), TMC(80, 135),
   TMC(81, 15), TMC(82, 9), TMC(82, 229), TMC(83, 2), TMC(84, 136),
   TMC(85, 233), TMC(86, 244), TMC(87, 245), TMC(88, 246), TMC(89, 245),
   TMC(90, 225), TMC(91, 247), TMC(92, 248), TMC(93, 207), TMC(94, 250),
   TMC(95, 253), TMC(96, 255), TMC(97, 202)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op order_TY_DEF x = x
    val op order_TY_DEF =
    ThmBind.DT(((("inMsg",0),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%323%46%357%17%282%1%317%293%17%317%325%15%319%21%313$2@%15%21%335%302@%299$1@$0@2%39%332|@||$1@$0@2|@|@2$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op order_case_def x = x
    val op order_case_def =
    ThmBind.DT(((("inMsg",4),
                [("bool",[26,180]),("inMsg",[1,2,3]),("ind_type",[33,34]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%295%15%278%21%284%29%303%388%350$2@$1@2$0@2$0$2@$1@2|@|@|@"])
  fun op order_size_def x = x
    val op order_size_def =
    ThmBind.DT(((("inMsg",5),
                [("bool",[26,180]),("inMsg",[1,2,3]),("ind_type",[33,34]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%295%15%278%21%311%390%350$1@$0@3%297%348%331%363@3%297%399$1@2%367$0@4|@|@"])
  fun op orderInterpret_def x = x
    val op orderInterpret_def =
    ThmBind.DT(((("inMsg",13),
                [("bool",[26,180]),("inMsg",[1,2,3]),("ind_type",[33,34]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%295%47%278%28%304%387%350$1@$0@3%400%349%352$1@3%395%354$0@4|@|@"])
  fun op inMsg_TY_DEF x = x
    val op inMsg_TY_DEF =
    ThmBind.DT(((("inMsg",14),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%321%45%358%18%283%0%317%294%18%317%326%16%324%22%318%25%314$3@%16%22%25%336%302@%300$2@%298$1@$0@3%39%333|@|||$2@$1@$0@2|@|@|@2$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op inMsg_case_def x = x
    val op inMsg_case_def =
    ThmBind.DT(((("inMsg",18),
                [("bool",[26,180]),("inMsg",[15,16,17]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%296%16%289%22%276%25%285%30%303%378%344$3@$2@$1@2$0@2$0$3@$2@$1@2|@|@|@|@"])
  fun op inMsg_size_def x = x
    val op inMsg_size_def =
    ThmBind.DT(((("inMsg",19),
                [("bool",[26,180]),("inMsg",[15,16,17]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%296%16%289%22%276%25%311%380%344$2@$1@$0@3%297%348%331%363@3%297%404$2@2%297%390$1@2%365%369%390@2%404@$0@5|@|@|@"])
  fun op checkMsg_def x = x
    val op checkMsg_def =
    ThmBind.DT(((("inMsg",27),
                [("bool",[26,180]),("inMsg",[15,16,17]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%296%50%289%43%276%49%306%366%344$2@$1@$0@3%402%396$2@2$0@%353$1@3|@|@|@"])
  fun op MsgInterpret_primitive_def x = x
    val op MsgInterpret_primitive_def =
    ThmBind.DT(((("inMsg",29),[]),[]),
               [ThmBind.read"%309%346@%362%328%11%360$0@|@2%6%14%379$0@%50%55%49%389$1@%47%28%340%334%366%344$4@%350$1@$0@2$2@3%400%397%349%343%396$4@4%349%352$1@4%395%354$0@4%356@2||@|||@||@2"])
  fun op mkinMsg_primitive_def x = x
    val op mkinMsg_primitive_def =
    ThmBind.DT(((("inMsg",33),[]),[]),
               [ThmBind.read"%308%385@%361%327%10%359$0@|@2%38%12%339$0@%329@%329@%53%329|@%163%329|@%206%217%329||@%250%261%329||@%78%89%329||@%121%131%329||@%164%175%339$0@%329@%329@%233%351$2@%91%329|@%93%94%329||@%97%98%381$2@%28%351$1@%102%351$3@%112%393$1@%122%329|@%124%329|@%47%393$1@%135%329|@%137%329|@%139%329|@%141%392$0@%50%341%344$0@%350$2@$5@2%401%394$0@2%376%353%350$2@$5@6|@%150%329|@|@%143%329|@%145%329|@|@%126%329|@%128%329|@%130%329|@|@%113%114%329||@%117%118%329||@|@%103%104%329||@%107%108%329||@|@%329@||@|@%234%329|@%236%237%329||@%241%242%329||@%245%246%329||@%249%251%329||@%254%255%329||@%258%259%329||@%263%264%329||@%267%268%269%329|||@%58%59%329||@%62%63%329||@%66%68%329||@%71%72%329||@%75%76%329||@%80%81%329||@%84%85%329||@||@%186%188%329||@%191%192%329||@%196%197%198%329|||@%202%203%329||@%207%208%329||@%211%212%329||@%215%216%329||@%220%221%329||@%224%225%329||@%229%230%329||@||@2"])
  fun op datatype_order x = x
    val op datatype_order =
    ThmBind.DT(((("inMsg",6),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%337%42%350@2"])
  fun op order_11 x = x
    val op order_11 =
    ThmBind.DT(((("inMsg",7),
                [("bool",[26,50,55,62,180]),("inMsg",[1,2,3]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%295%15%278%21%295%19%278%23%306%312%350$3@$2@2%350$1@$0@3%301%315$3@$1@2%307$2@$0@3|@|@|@|@"])
  fun op order_case_cong x = x
    val op order_case_cong =
    ThmBind.DT(((("inMsg",8),
                [("bool",[26,180]),("inMsg",[1,2,3,4])]),["DISK_THM"]),
               [ThmBind.read"%289%3%289%5%284%29%317%301%312$2@$1@2%295%15%278%21%317%312$3@%350$1@$0@3%303$2$1@$0@2%31$1@$0@3|@|@3%303%388$2@$0@2%388$1@%31@3|@|@|@"])
  fun op order_nchotomy x = x
    val op order_nchotomy =
    ThmBind.DT(((("inMsg",9),
                [("bool",[26,180]),("inMsg",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%289%41%325%44%319%27%312$2@%350$1@$0@2|@|@|@"])
  fun op order_Axiom x = x
    val op order_Axiom =
    ThmBind.DT(((("inMsg",10),
                [("bool",[26,180]),("inMsg",[1,2,3]),("ind_type",[33,34]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%284%29%322%34%295%15%278%21%303$2%350$1@$0@3$3$1@$0@2|@|@|@|@"])
  fun op order_induction x = x
    val op order_induction =
    ThmBind.DT(((("inMsg",11),
                [("bool",[26]),("inMsg",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%281%9%317%295%44%278%27$2%350$1@$0@2|@|@2%289%40$1$0@|@2|@"])
  fun op order_one_one x = x
    val op order_one_one =
    ThmBind.DT(((("inMsg",12),
                [("bool",[26,50,55,62,180]),("inMsg",[1,2,3]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%295%15%278%21%295%19%278%23%306%312%350$3@$2@2%350$1@$0@3%301%315$3@$1@2%307$2@$0@3|@|@|@|@"])
  fun op datatype_inMsg x = x
    val op datatype_inMsg =
    ThmBind.DT(((("inMsg",20),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%337%37%344@2"])
  fun op inMsg_11 x = x
    val op inMsg_11 =
    ThmBind.DT(((("inMsg",21),
                [("bool",[26,50,55,62,180]),("inMsg",[15,16,17]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%296%16%289%22%276%25%296%20%289%24%276%26%306%310%344$5@$4@$3@2%344$2@$1@$0@3%301%316$5@$2@2%301%312$4@$1@2%305$3@$0@4|@|@|@|@|@|@"])
  fun op inMsg_case_cong x = x
    val op inMsg_case_cong =
    ThmBind.DT(((("inMsg",22),
                [("bool",[26,180]),("inMsg",[15,16,17,18])]),["DISK_THM"]),
               [ThmBind.read"%286%2%286%4%285%30%317%301%310$2@$1@2%296%16%289%22%276%25%317%310$4@%344$2@$1@$0@3%303$3$2@$1@$0@2%32$2@$1@$0@3|@|@|@3%303%378$2@$0@2%378$1@%32@3|@|@|@"])
  fun op inMsg_nchotomy x = x
    val op inMsg_nchotomy =
    ThmBind.DT(((("inMsg",23),
                [("bool",[26,180]),("inMsg",[15,16,17])]),["DISK_THM"]),
               [ThmBind.read"%286%36%326%48%324%40%318%13%310$3@%344$2@$1@$0@2|@|@|@|@"])
  fun op inMsg_Axiom x = x
    val op inMsg_Axiom =
    ThmBind.DT(((("inMsg",24),
                [("bool",[26,180]),("inMsg",[15,16,17]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%285%30%320%33%296%16%289%22%276%25%303$3%344$2@$1@$0@3$4$2@$1@$0@2|@|@|@|@|@"])
  fun op inMsg_induction x = x
    val op inMsg_induction =
    ThmBind.DT(((("inMsg",25),
                [("bool",[26]),("inMsg",[15,16,17])]),["DISK_THM"]),
               [ThmBind.read"%280%8%317%296%48%289%40%276%13$3%344$2@$1@$0@2|@|@|@2%286%35$1$0@|@2|@"])
  fun op inMsg_one_one x = x
    val op inMsg_one_one =
    ThmBind.DT(((("inMsg",26),
                [("bool",[26,50,55,62,180]),("inMsg",[15,16,17]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%296%16%289%22%276%25%296%20%289%24%276%26%306%310%344$5@$4@$3@2%344$2@$1@$0@3%301%316$5@$2@2%301%312$4@$1@2%305$3@$0@4|@|@|@|@|@|@"])
  fun op checkMsgOK x = x
    val op checkMsgOK =
    ThmBind.DT(((("inMsg",28),
                [("bool",[25,26,46,47,52,53,62]),("cipher",[79]),
                 ("inMsg",[27]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%366%344%50@%43@%401%394%50@2%376%353%43@5"])
  fun op MsgInterpret_ind x = x
    val op MsgInterpret_ind =
    ThmBind.DT(((("inMsg",30),
                [("bool",[25,26,27,52,53,62,180]),
                 ("inMsg",[1,2,3,15,16,17]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,15])]),["DISK_THM"]),
               [ThmBind.read"%280%8%317%296%50%295%47%278%28%276%49$4%344$3@%350$2@$1@2$0@2|@|@|@|@2%286%52$1$0@|@2|@"])
  fun op MsgInterpret_def x = x
    val op MsgInterpret_def =
    ThmBind.DT(((("inMsg",31),
                [("bool",[15]),("combin",[19]),("inMsg",[4,18,29]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%304%346%344%50@%350%47@%28@2%49@3%334%366%344%50@%350%47@%28@2%49@3%400%397%349%343%396%50@4%349%352%47@4%395%354%28@4%356@2"])
  fun op MsgInterpretOK x = x
    val op MsgInterpretOK =
    ThmBind.DT(((("inMsg",32),
                [("bool",[15,25,35,55,62,63]),("cipher",[79]),
                 ("combin",[19]),("inMsg",[4,18,27,29]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%296%50%295%47%278%28%304%346%344$2@%350$1@$0@2%401%394$2@2%376%353%350$1@$0@7%400%397%349%343%396$2@4%349%352$1@4%395%354$0@4|@|@|@"])
  fun op mkinMsg_ind x = x
    val op mkinMsg_ind =
    ThmBind.DT(((("inMsg",34),
                [("aclfoundation",[55,116]),
                 ("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79]),
                 ("cipher",[42]),("principal",[80]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[12])]),["DISK_THM"]),
               [ThmBind.read"%279%7%317%301%296%50%295%47%278%28$3%400%397%349%343%396$2@4%349%352$1@4%395%354$0@4|@|@|@2%301$0%356@2%301$0%338@2%301%287%54$1%395$0@2|@2%301%272%195$1%386$0@2|@2%301%272%228%272%239$2%364$1@$0@2|@|@2%301%272%56%272%67$2%391$1@$0@2|@|@2%301%272%100%272%110$2%377$1@$0@2|@|@2%301%272%142%272%152$2%372$1@$0@2|@|@2%301%274%88$1%400$0@%356@2|@2%301%274%90$1%400$0@%338@2|@2%301%292%92%287%99$2%400%349$1@2%395$0@3|@|@2%301%274%95%274%96%287%101$3%400%384$2@$1@2%395$0@3|@|@|@2%301%292%133%296%123%278%28$3%400%397%349$2@2%349%355$1@4%395%354$0@4|@|@|@2%301%292%134%277%125%278%28$3%400%397%349$2@2%349%330$1@4%395%354$0@4|@|@|@2%301%296%136%295%147%278%28$3%400%397%349%355$2@3%349%352$1@4%395%354$0@4|@|@|@2%301%277%138%295%148%278%28$3%400%397%349%330$2@3%349%352$1@4%395%354$0@4|@|@|@2%301%295%140%295%149%278%28$3%400%397%349%352$2@3%349%352$1@4%395%354$0@4|@|@|@2%301%296%151%295%47%278%28$3%400%397%349%343%394$2@4%349%352$1@4%395%354$0@4|@|@|@2%301%290%144%295%153%278%28$3%400%397%349%342$2@3%349%352$1@4%395%354$0@4|@|@|@2%301%288%146%295%154%278%28$3%400%397%349%345$2@3%349%352$1@4%395%354$0@4|@|@|@2%301%292%155%291%127%278%28$3%400%397%349$2@2%349%343$1@4%395%354$0@4|@|@|@2%301%292%156%290%129%278%28$3%400%397%349$2@2%349%342$1@4%395%354$0@4|@|@|@2%301%292%157%288%132%278%28$3%400%397%349$2@2%349%345$1@4%395%354$0@4|@|@|@2%301%274%115%274%116%292%158%278%159$4%400%397%384$3@$2@2%349$1@3%395%354$0@4|@|@|@|@2%301%274%119%274%120%292%160%278%161$4%400%397%397$3@$2@2%349$1@3%395%354$0@4|@|@|@|@2%301%274%165%274%105%274%106%278%162$4%400%397$3@%384$2@$1@3%395%354$0@4|@|@|@|@2%301%274%167%274%109%274%111%278%166$4%400%397$3@%397$2@$1@3%395%354$0@4|@|@|@|@2%301%274%168%274%169$2%400%397$1@$0@2%395%347@3|@|@2%301%274%170%272%235$2%400$1@%386$0@3|@|@2%301%274%171%272%238%272%240$3%400$2@%364$1@$0@3|@|@|@2%301%274%172%272%243%272%244$3%400$2@%391$1@$0@3|@|@|@2%301%274%173%272%247%272%248$3%400$2@%377$1@$0@3|@|@|@2%301%274%174%272%252%272%253$3%400$2@%372$1@$0@3|@|@|@2%301%274%176%274%256%272%257$3%400$2@%400$1@$0@3|@|@|@2%301%274%177%274%260%274%262$3%400$2@%403$1@$0@3|@|@|@2%301%274%178%274%265%272%266$3%400$2@%368$1@$0@3|@|@|@2%301%274%179%274%270%274%271%272%57$4%400$3@%398$2@$1@$0@3|@|@|@|@2%301%274%180%273%60%273%61$3%400$2@%370$1@$0@3|@|@|@2%301%274%181%273%64%273%65$3%400$2@%373$1@$0@3|@|@|@2%301%274%182%275%69%275%70$3%400$2@%371$1@$0@3|@|@|@2%301%274%183%275%73%275%74$3%400$2@%375$1@$0@3|@|@|@2%301%274%184%288%77%288%79$3%400$2@%374$1@$0@3|@|@|@2%301%274%185%288%82%288%83$3%400$2@%383$1@$0@3|@|@|@2%301%274%187%288%86%288%87$3%400$2@%382$1@$0@3|@|@|@2%301%274%189%274%190$2%403$1@$0@2|@|@2%301%274%193%272%194$2%368$1@$0@2|@|@2%301%274%199%274%200%272%201$3%398$2@$1@$0@2|@|@|@2%301%273%204%273%205$2%370$1@$0@2|@|@2%301%273%209%273%210$2%373$1@$0@2|@|@2%301%275%213%275%214$2%371$1@$0@2|@|@2%301%275%218%275%219$2%375$1@$0@2|@|@2%301%288%222%288%223$2%374$1@$0@2|@|@2%301%288%226%288%227$2%383$1@$0@2|@|@2%288%231%288%232$2%382$1@$0@2|@|@56%272%51$1$0@|@2|@"])
  fun op mkinMsg_def x = x
    val op mkinMsg_def =
    ThmBind.DT(((("inMsg",35),
                [("aclfoundation",[33,110]),("bool",[15]),("cipher",[36]),
                 ("combin",[19]),("inMsg",[33]),("principal",[74]),
                 ("relation",[113,132]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%310%385%400%397%349%343%396%50@4%349%352%47@4%395%354%28@5%344%50@%350%47@%28@2%401%394%50@2%376%353%350%47@%28@6"])
  fun op MsgInterpret_inverts_mkinMsg_thm x = x
    val op MsgInterpret_inverts_mkinMsg_thm =
    ThmBind.DT(((("inMsg",36),
                [("aclfoundation",[33,110]),("bool",[15,25,35,55,62,63]),
                 ("cipher",[36,79]),("combin",[19]),
                 ("inMsg",[4,18,27,29,33]),("principal",[74]),
                 ("relation",[113,132]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%296%50%295%47%278%28%304%346%385%400%397%349%343%396$2@4%349%352$1@4%395%354$0@6%400%397%349%343%396$2@4%349%352$1@4%395%354$0@4|@|@|@"])

  val _ = DB.bindl "inMsg"
  [("order_TY_DEF",order_TY_DEF,DB.Def),
   ("order_case_def",order_case_def,DB.Def),
   ("order_size_def",order_size_def,DB.Def),
   ("orderInterpret_def",orderInterpret_def,DB.Def),
   ("inMsg_TY_DEF",inMsg_TY_DEF,DB.Def),
   ("inMsg_case_def",inMsg_case_def,DB.Def),
   ("inMsg_size_def",inMsg_size_def,DB.Def),
   ("checkMsg_def",checkMsg_def,DB.Def),
   ("MsgInterpret_primitive_def",MsgInterpret_primitive_def,DB.Def),
   ("mkinMsg_primitive_def",mkinMsg_primitive_def,DB.Def),
   ("datatype_order",datatype_order,DB.Thm), ("order_11",order_11,DB.Thm),
   ("order_case_cong",order_case_cong,DB.Thm),
   ("order_nchotomy",order_nchotomy,DB.Thm),
   ("order_Axiom",order_Axiom,DB.Thm),
   ("order_induction",order_induction,DB.Thm),
   ("order_one_one",order_one_one,DB.Thm),
   ("datatype_inMsg",datatype_inMsg,DB.Thm), ("inMsg_11",inMsg_11,DB.Thm),
   ("inMsg_case_cong",inMsg_case_cong,DB.Thm),
   ("inMsg_nchotomy",inMsg_nchotomy,DB.Thm),
   ("inMsg_Axiom",inMsg_Axiom,DB.Thm),
   ("inMsg_induction",inMsg_induction,DB.Thm),
   ("inMsg_one_one",inMsg_one_one,DB.Thm),
   ("checkMsgOK",checkMsgOK,DB.Thm),
   ("MsgInterpret_ind",MsgInterpret_ind,DB.Thm),
   ("MsgInterpret_def",MsgInterpret_def,DB.Thm),
   ("MsgInterpretOK",MsgInterpretOK,DB.Thm),
   ("mkinMsg_ind",mkinMsg_ind,DB.Thm), ("mkinMsg_def",mkinMsg_def,DB.Thm),
   ("MsgInterpret_inverts_mkinMsg_thm",
    MsgInterpret_inverts_mkinMsg_thm,
    DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "inMsg",
    thydataty = "compute",
    read = ThmBind.read,
    data =
        "inMsg.orderInterpret_def inMsg.mkinMsg_def inMsg.MsgInterpret_def inMsg.checkMsg_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "inMsg",
    thydataty = "TypeGrammarDeltas",
    read = ThmBind.read,
    data = "NTY5.inMsg,5.orderNTY5.inMsg,5.inMsg"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "inMsg",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO5.Order4.%350OO10.order_CASE4.%388OO10.order_size4.%390OO4.case4.%388OO14.orderInterpret4.%387OO3.MSG4.%344OO10.inMsg_CASE4.%378OO10.inMsg_size4.%380OO4.case4.%378OO8.checkMsg4.%366OO12.MsgInterpret4.%346OO7.mkinMsg4.%385"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val inMsg_grammars = merge_grammars ["principal", "m0Types", "ssm2"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="inMsg"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val inMsg_grammars = 
    Portable.## (addtyUDs,addtmUDs) inMsg_grammars
  val _ = Parse.grammarDB_insert("inMsg",inMsg_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG order_Axiom,
           case_def=order_case_def,
           case_cong=order_case_cong,
           induction=ORIG order_induction,
           nchotomy=order_nchotomy,
           size=SOME(Parse.Term`(inMsg$order_size) :inMsg$order -> num$num`,
                     ORIG order_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME order_11,
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
          {ax=ORIG inMsg_Axiom,
           case_def=inMsg_case_def,
           case_cong=inMsg_case_cong,
           induction=ORIG inMsg_induction,
           nchotomy=inMsg_nchotomy,
           size=SOME(Parse.Term`(inMsg$inMsg_size) :inMsg$inMsg -> num$num`,
                     ORIG inMsg_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME inMsg_11,
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
val _ = Theory.load_complete "inMsg"
end
