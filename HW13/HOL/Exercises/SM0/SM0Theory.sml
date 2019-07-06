structure SM0Theory :> SM0Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading SM0Theory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open m0TypesTheory principalTheory ssm1Theory
  in end;
  val _ = Theory.link_parents
          ("SM0",Arbnum.fromString "1556067545",Arbnum.fromString "531015")
          [("principal",
           Arbnum.fromString "1556067525",
           Arbnum.fromString "878983"),
           ("m0Types",
           Arbnum.fromString "1556067524",
           Arbnum.fromString "815181"),
           ("ssm1",
           Arbnum.fromString "1556067504",
           Arbnum.fromString "669018")];
  val _ = Theory.incorporate_types "SM0" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("aclfoundation", "Form"),
   ID("principal", "principal"), ID("ssm1", "inst"),
   ID("m0Types", "command"), ID("list", "list"), ID("m0Types", "privcmd"),
   ID("m0Types", "npriv"), ID("m0Types", "output"), ID("ssm1", "trType"),
   ID("m0Types", "state"), ID("aclfoundation", "Kripke"),
   ID("aclfoundation", "po"), ID("principal", "staff"),
   ID("aclfoundation", "Princ"), ID("aclfoundation", "IntLevel"),
   ID("aclfoundation", "SecLevel"), ID("num", "num"),
   ID("principal", "authority"), ID("cipher", "pKey"),
   ID("principal", "role"), ID("bool", "!"), ID("pair", ","),
   ID("pair", "prod"), ID("bool", "/\\"), ID("min", "="), ID("min", "==>"),
   ID("min", "@"), ID("m0Types", "ACTIVE"), ID("principal", "Authority"),
   ID("ssm1", "CFG"), ID("ssm1", "configuration"),
   ID("ssm1", "CFGInterpret"), ID("list", "CONS"),
   ID("principal", "Commander"), ID("bool", "F"),
   ID("aclfoundation", "FF"), ID("aclfoundation", "Form_CASE"),
   ID("combin", "I"), ID("principal", "KeyA"), ID("principal", "KeyS"),
   ID("principal", "Machine"), ID("list", "NIL"), ID("ssm1", "NONE"),
   ID("m0Types", "NP"), ID("aclfoundation", "Name"),
   ID("principal", "Operator"), ID("m0Types", "PR"),
   ID("aclfoundation", "Princ_CASE"), ID("principal", "Role"),
   ID("SM0", "SM0StateInterp"), ID("SM0", "SM0ns"), ID("SM0", "SM0out"),
   ID("ssm1", "SOME"), ID("m0Types", "STBY"), ID("principal", "Staff"),
   ID("bool", "T"), ID("ssm1", "TR"), ID("aclfoundation", "TT"),
   ID("relation", "WF"), ID("relation", "WFREC"),
   ID("aclfoundation", "andf"), ID("SM0", "certs"),
   ID("aclfoundation", "controls"), ID("ssm1", "discard"),
   ID("aclfoundation", "domi"), ID("aclfoundation", "doms"),
   ID("aclfoundation", "eqf"), ID("aclfoundation", "eqi"),
   ID("aclfoundation", "eqn"), ID("aclfoundation", "eqs"),
   ID("ssm1", "exec"), ID("aclfoundation", "impf"), ID("SM0", "inputOK"),
   ID("ssm1", "inst_CASE"), ID("m0Types", "launch"),
   ID("aclfoundation", "lt"), ID("aclfoundation", "lte"),
   ID("aclfoundation", "meet"), ID("aclfoundation", "notf"),
   ID("m0Types", "off"), ID("m0Types", "on"), ID("aclfoundation", "orf"),
   ID("principal", "principal_CASE"), ID("aclfoundation", "prop"),
   ID("aclfoundation", "quoting"), ID("aclfoundation", "reps"),
   ID("m0Types", "reset"), ID("aclrules", "sat"),
   ID("aclfoundation", "says"), ID("aclfoundation", "speaks_for"),
   ID("m0Types", "status"), ID("ssm1", "trap"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYV "'e", TYV "'d", TYOP [3], TYOP [5], TYOP [4, 4],
   TYOP [2, 5, 3, 2, 1], TYOP [0, 6, 0], TYOP [6, 6], TYOP [7],
   TYOP [0, 9, 8], TYOP [8], TYOP [0, 11, 10], TYOP [9], TYOP [10, 4],
   TYOP [0, 14, 13], TYOP [11], TYOP [0, 16, 15], TYOP [0, 14, 16],
   TYOP [0, 16, 18], TYOP [0, 16, 6], TYV "'b", TYOP [12, 5, 21, 3, 2, 1],
   TYOP [13, 2], TYOP [13, 1], TYOP [0, 14, 0], TYOP [0, 16, 25],
   TYOP [14], TYOP [0, 6, 7], TYV "'a", TYOP [6, 13], TYOP [15, 3],
   TYOP [16, 3, 2], TYOP [17, 3, 1], TYOP [18], TYOP [19], TYOP [20, 27],
   TYOP [20, 35], TYOP [21], TYOP [0, 29, 0], TYOP [0, 39, 0],
   TYOP [0, 7, 0], TYOP [0, 32, 0], TYOP [0, 42, 0], TYOP [0, 22, 0],
   TYOP [0, 44, 0], TYOP [0, 31, 0], TYOP [0, 46, 0], TYOP [0, 33, 0],
   TYOP [0, 48, 0], TYOP [0, 35, 0], TYOP [0, 50, 0], TYOP [0, 4, 0],
   TYOP [0, 52, 0], TYOP [0, 41, 0], TYOP [0, 26, 0], TYOP [0, 55, 0],
   TYOP [0, 17, 0], TYOP [0, 57, 0], TYOP [0, 19, 0], TYOP [0, 59, 0],
   TYOP [0, 5, 0], TYOP [0, 61, 0], TYOP [0, 8, 0], TYOP [0, 63, 0],
   TYOP [0, 30, 0], TYOP [0, 65, 0], TYOP [0, 11, 0], TYOP [0, 67, 0],
   TYOP [0, 34, 0], TYOP [0, 69, 0], TYOP [0, 37, 0], TYOP [0, 71, 0],
   TYOP [0, 36, 0], TYOP [0, 73, 0], TYOP [0, 23, 0], TYOP [0, 75, 0],
   TYOP [0, 24, 0], TYOP [0, 77, 0], TYOP [0, 3, 0], TYOP [0, 79, 0],
   TYOP [0, 9, 0], TYOP [0, 81, 0], TYOP [0, 27, 0], TYOP [0, 83, 0],
   TYOP [0, 16, 0], TYOP [0, 85, 0], TYOP [0, 25, 0], TYOP [24, 23, 24],
   TYOP [24, 22, 88], TYOP [0, 88, 89], TYOP [0, 22, 90], TYOP [0, 24, 88],
   TYOP [0, 23, 92], TYOP [0, 0, 0], TYOP [0, 0, 94], TYOP [0, 7, 41],
   TYOP [0, 8, 63], TYOP [0, 13, 0], TYOP [0, 13, 98], TYOP [0, 16, 85],
   TYOP [0, 28, 0], TYOP [0, 101, 28], TYOP [0, 35, 3],
   TYOP [32, 4, 2, 1, 13, 3, 16], TYOP [0, 30, 104], TYOP [0, 16, 105],
   TYOP [0, 8, 106], TYOP [0, 8, 107], TYOP [0, 20, 108], TYOP [0, 7, 109],
   TYOP [0, 104, 0], TYOP [0, 89, 111], TYOP [0, 8, 8], TYOP [0, 6, 113],
   TYOP [0, 30, 30], TYOP [0, 13, 115], TYOP [0, 34, 69], TYOP [0, 117, 0],
   TYOP [0, 117, 118], TYOP [0, 117, 119], TYOP [0, 33, 48],
   TYOP [0, 121, 120], TYOP [0, 121, 122], TYOP [0, 32, 42],
   TYOP [0, 124, 123], TYOP [0, 124, 125], TYOP [0, 31, 7],
   TYOP [0, 31, 127], TYOP [0, 128, 126], TYOP [0, 127, 129],
   TYOP [0, 31, 46], TYOP [0, 131, 130], TYOP [0, 127, 132],
   TYOP [0, 28, 133], TYOP [0, 28, 134], TYOP [0, 28, 135],
   TYOP [0, 28, 136], TYOP [0, 7, 137], TYOP [0, 61, 138],
   TYOP [0, 0, 139], TYOP [0, 0, 140], TYOP [0, 6, 141], TYOP [0, 37, 3],
   TYOP [0, 36, 3], TYOP [0, 34, 3], TYOP [0, 11, 4], TYOP [0, 3, 31],
   TYOP [0, 9, 4], TYOP [0, 131, 0], TYOP [0, 131, 149], TYOP [0, 79, 150],
   TYOP [0, 31, 151], TYOP [0, 38, 3], TYOP [0, 4, 5], TYOP [0, 27, 3],
   TYOP [0, 104, 111], TYOP [0, 14, 156], TYOP [0, 89, 157],
   TYOP [0, 7, 7], TYOP [0, 159, 7], TYOP [0, 28, 160], TYOP [0, 6, 6],
   TYOP [0, 6, 162], TYOP [0, 31, 162], TYOP [0, 32, 6], TYOP [0, 32, 165],
   TYOP [0, 33, 6], TYOP [0, 33, 167], TYOP [0, 34, 6], TYOP [0, 34, 169],
   TYOP [0, 4, 14], TYOP [0, 52, 94], TYOP [0, 5, 172], TYOP [0, 31, 31],
   TYOP [0, 31, 174], TYOP [0, 71, 70], TYOP [0, 73, 176], TYOP [0, 38, 0],
   TYOP [0, 178, 177], TYOP [0, 50, 179], TYOP [0, 83, 180],
   TYOP [0, 3, 181], TYOP [0, 5, 6], TYOP [0, 31, 164], TYOP [0, 89, 7],
   TYOP [0, 31, 6], TYOP [0, 31, 186]]
  end
  val _ = Theory.incorporate_consts "SM0" tyvector
     [("inputOK", 7), ("certs", 12), ("SM0out", 17), ("SM0ns", 19),
      ("SM0StateInterp", 20)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 22), TMV("NS", 19), TMV("Oi", 23), TMV("Os", 24),
   TMV("Out", 17), TMV("P", 7), TMV("P", 26), TMV("P", 27), TMV("R", 28),
   TMV("a", 6), TMV("cmd", 29), TMV("cmd", 4), TMV("inputOK", 7),
   TMV("ins", 8), TMV("npriv", 11), TMV("outs", 30), TMV("privcmd", 9),
   TMV("s", 16), TMV("state", 16), TMV("v", 6), TMV("v", 5), TMV("v", 16),
   TMV("v1", 6), TMV("v1", 14), TMV("v10", 31), TMV("v100", 6),
   TMV("v101", 6), TMV("v102", 6), TMV("v103", 6), TMV("v104", 6),
   TMV("v105", 6), TMV("v106", 6), TMV("v107", 6), TMV("v108", 6),
   TMV("v109", 31), TMV("v110", 6), TMV("v111", 31), TMV("v112", 31),
   TMV("v113", 31), TMV("v114", 6), TMV("v115", 31), TMV("v116", 31),
   TMV("v117", 6), TMV("v118", 32), TMV("v119", 32), TMV("v12", 31),
   TMV("v120", 32), TMV("v121", 32), TMV("v122", 33), TMV("v123", 33),
   TMV("v124", 33), TMV("v125", 33), TMV("v126", 34), TMV("v127", 34),
   TMV("v128", 34), TMV("v129", 34), TMV("v13", 31), TMV("v130", 34),
   TMV("v131", 34), TMV("v132", 3), TMV("v133", 31), TMV("v134", 31),
   TMV("v135", 31), TMV("v136", 31), TMV("v137", 3), TMV("v138", 31),
   TMV("v139", 31), TMV("v14", 31), TMV("v140", 31), TMV("v141", 31),
   TMV("v142", 4), TMV("v143", 4), TMV("v144", 27), TMV("v145", 35),
   TMV("v147", 36), TMV("v148", 37), TMV("v149", 34), TMV("v15", 6),
   TMV("v150", 27), TMV("v151", 35), TMV("v152", 38), TMV("v153", 36),
   TMV("v154", 37), TMV("v155", 34), TMV("v16", 31), TMV("v17", 31),
   TMV("v18", 6), TMV("v19", 32), TMV("v2", 6), TMV("v20", 32),
   TMV("v21", 32), TMV("v22", 32), TMV("v23", 33), TMV("v24", 33),
   TMV("v25", 33), TMV("v26", 33), TMV("v27", 34), TMV("v28", 34),
   TMV("v29", 34), TMV("v3", 6), TMV("v30", 34), TMV("v31", 34),
   TMV("v32", 34), TMV("v33", 5), TMV("v34", 6), TMV("v35", 6),
   TMV("v36", 6), TMV("v37", 6), TMV("v38", 6), TMV("v39", 6),
   TMV("v4", 6), TMV("v40", 6), TMV("v41", 6), TMV("v42", 6),
   TMV("v43", 31), TMV("v44", 6), TMV("v45", 31), TMV("v46", 31),
   TMV("v47", 31), TMV("v48", 6), TMV("v49", 31), TMV("v5", 6),
   TMV("v50", 31), TMV("v51", 6), TMV("v52", 32), TMV("v53", 32),
   TMV("v54", 32), TMV("v55", 32), TMV("v56", 33), TMV("v57", 33),
   TMV("v58", 33), TMV("v59", 33), TMV("v6", 6), TMV("v60", 34),
   TMV("v61", 34), TMV("v62", 34), TMV("v63", 34), TMV("v64", 34),
   TMV("v65", 34), TMV("v66", 5), TMV("v67", 6), TMV("v68", 6),
   TMV("v69", 6), TMV("v7", 6), TMV("v70", 6), TMV("v71", 6),
   TMV("v72", 6), TMV("v73", 6), TMV("v74", 6), TMV("v75", 6),
   TMV("v76", 31), TMV("v77", 6), TMV("v78", 31), TMV("v79", 31),
   TMV("v8", 6), TMV("v80", 31), TMV("v81", 6), TMV("v82", 31),
   TMV("v83", 31), TMV("v84", 6), TMV("v85", 32), TMV("v86", 32),
   TMV("v87", 32), TMV("v88", 32), TMV("v89", 33), TMV("v9", 6),
   TMV("v90", 33), TMV("v91", 33), TMV("v92", 33), TMV("v93", 34),
   TMV("v94", 34), TMV("v95", 34), TMV("v96", 34), TMV("v97", 34),
   TMV("v98", 34), TMV("v99", 5), TMC(22, 40), TMC(22, 41), TMC(22, 43),
   TMC(22, 45), TMC(22, 47), TMC(22, 49), TMC(22, 51), TMC(22, 53),
   TMC(22, 54), TMC(22, 56), TMC(22, 58), TMC(22, 60), TMC(22, 62),
   TMC(22, 64), TMC(22, 66), TMC(22, 68), TMC(22, 70), TMC(22, 72),
   TMC(22, 74), TMC(22, 76), TMC(22, 78), TMC(22, 80), TMC(22, 82),
   TMC(22, 84), TMC(22, 86), TMC(22, 87), TMC(23, 91), TMC(23, 93),
   TMC(25, 95), TMC(26, 28), TMC(26, 95), TMC(26, 96), TMC(26, 97),
   TMC(26, 99), TMC(26, 100), TMC(27, 95), TMC(28, 102), TMC(29, 16),
   TMC(30, 103), TMC(31, 110), TMC(33, 112), TMC(34, 114), TMC(34, 116),
   TMC(35, 38), TMC(36, 0), TMC(37, 6), TMC(38, 142), TMC(39, 94),
   TMC(40, 143), TMC(41, 144), TMC(42, 145), TMC(43, 8), TMC(44, 5),
   TMC(45, 146), TMC(46, 147), TMC(47, 38), TMC(48, 148), TMC(49, 152),
   TMC(50, 153), TMC(51, 20), TMC(52, 19), TMC(53, 17), TMC(54, 154),
   TMC(55, 16), TMC(56, 155), TMC(57, 0), TMC(58, 158), TMC(59, 6),
   TMC(60, 101), TMC(61, 161), TMC(62, 163), TMC(63, 12), TMC(64, 164),
   TMC(65, 14), TMC(66, 166), TMC(67, 168), TMC(68, 163), TMC(69, 166),
   TMC(70, 170), TMC(71, 168), TMC(72, 171), TMC(73, 163), TMC(74, 7),
   TMC(75, 173), TMC(76, 9), TMC(77, 170), TMC(78, 170), TMC(79, 175),
   TMC(80, 162), TMC(81, 13), TMC(82, 13), TMC(83, 163), TMC(84, 182),
   TMC(85, 183), TMC(86, 175), TMC(87, 184), TMC(88, 9), TMC(89, 185),
   TMC(90, 164), TMC(91, 187), TMC(92, 11), TMC(93, 171), TMC(94, 94)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op inputOK_primitive_def x = x
    val op inputOK_primitive_def =
    ThmBind.DT(((("SM0",8),[]),[]),
               [ThmBind.read"%207%258@%245%212%8%244$0@|@2%12%9%222$0@%223%220@2%223%220@2%103%223%220@|@%104%223%220@|@%105%106%223%220@||@%107%108%223%220@||@%109%111%223%220@||@%112%113%223%220@||@%114%115%222$0@%223%220@2%223%220@2%175%233$2@%64%259$1@%71%268$1@%78%223%220@|@%79%223%220@|@%80%223%241@|@%81%223%220@|@%82%223%220@|@%83%223%220@|@|@%223%220@2|@%65%66%223%220@||@%68%69%223%220@||@|@%25%223%220@|@%26%27%223%220@||@%28%29%223%220@||@%30%31%223%220@||@%32%33%223%220@||@%34%35%223%220@||@%36%37%223%220@||@%38%39%223%220@||@%40%41%42%223%220@|||@%43%44%223%220@||@%46%47%223%220@||@%48%49%223%220@||@%50%51%223%220@||@%52%53%223%220@||@%54%55%223%220@||@%57%58%223%220@||@||@%116%117%223%220@||@%118%119%223%220@||@%120%122%123%223%220@|||@%124%125%223%220@||@%126%127%223%220@||@%128%129%223%220@||@%130%131%223%220@||@%133%134%223%220@||@%135%136%223%220@||@%137%138%223%220@||@||@2"])
  fun op SM0StateInterp_def x = x
    val op SM0StateInterp_def =
    ThmBind.DT(((("SM0",11),[]),[]),
               [ThmBind.read"%200%18%205%235$0@2%243@|@"])
  fun op certs_def x = x
    val op certs_def =
    ThmBind.DT(((("SM0",15),[]),[]),
               [ThmBind.read"%191%14%198%16%208%247$1@$0@2%217%248%230%234%231@3%269%238%229$1@5%217%248%230%234%231@3%269%238%232$0@5%217%248%230%234%219@3%269%238%229$1@5%217%257%274%230%234%219@3%269%238%232$0@5%269%228@3%227@5|@|@"])
  fun op SM0ns_ind x = x
    val op SM0ns_ind =
    ThmBind.DT(((("SM0",2),
                [("bool",[25,26,46,47,52,53,62]),("m0Types",[19,40,55,79]),
                 ("pair",[5,16]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[31])]),["DISK_THM"]),
               [ThmBind.read"%185%6%211%204$0%239@%256%232%272@4%204$0%239@%256%232%260@4%204$0%239@%256%229%276@4%204$0%213@%256%232%272@4%204$0%213@%256%232%260@4%204$0%213@%256%229%276@4%204$0%239@%277%232%272@4%204$0%239@%277%232%260@4%204$0%239@%277%229%276@4%204$0%213@%277%232%272@4%204$0%213@%277%232%260@4%204$0%213@%277%229%276@4%204$0%239@%249@2$0%213@%249@15%200%21%201%23$2$1@$0@|@|@2|@"])
  fun op SM0ns_def x = x
    val op SM0ns_def =
    ThmBind.DT(((("SM0",3),
                [("SM0",[0,1]),("bool",[15,57]),("combin",[19]),
                 ("m0Types",[15,49,75]),("pair",[49]),
                 ("relation",[113,132]),("ssm1",[25])]),["DISK_THM"]),
               [ThmBind.read"%204%210%236%239@%256%232%272@4%239@2%204%210%236%239@%256%232%260@4%213@2%204%210%236%239@%256%229%276@4%239@2%204%210%236%213@%256%232%272@4%239@2%204%210%236%213@%256%232%260@4%213@2%204%210%236%213@%256%229%276@4%213@2%204%210%236%239@%277%232%272@4%239@2%204%210%236%239@%277%232%260@4%239@2%204%210%236%239@%277%229%276@4%239@2%204%210%236%213@%277%232%272@4%213@2%204%210%236%213@%277%232%260@4%213@2%204%210%236%213@%277%229%276@4%213@2%204%210%236%239@%249@2%239@2%210%236%213@%249@2%213@14"])
  fun op SM0out_ind x = x
    val op SM0out_ind =
    ThmBind.DT(((("SM0",6),
                [("bool",[25,26,46,47,52,53,62]),("m0Types",[19,40,55,79]),
                 ("pair",[5,16]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[31])]),["DISK_THM"]),
               [ThmBind.read"%185%6%211%204$0%239@%256%232%272@4%204$0%239@%256%232%260@4%204$0%239@%256%229%276@4%204$0%213@%256%232%272@4%204$0%213@%256%232%260@4%204$0%213@%256%229%276@4%204$0%239@%277%232%272@4%204$0%239@%277%232%260@4%204$0%239@%277%229%276@4%204$0%213@%277%232%272@4%204$0%213@%277%232%260@4%204$0%213@%277%229%276@4%204$0%239@%249@2$0%213@%249@15%200%21%201%23$2$1@$0@|@|@2|@"])
  fun op SM0out_def x = x
    val op SM0out_def =
    ThmBind.DT(((("SM0",7),
                [("SM0",[4,5]),("bool",[15,57]),("combin",[19]),
                 ("m0Types",[15,49,75]),("pair",[49]),
                 ("relation",[113,132]),("ssm1",[25])]),["DISK_THM"]),
               [ThmBind.read"%204%209%237%239@%256%232%272@4%265@2%204%209%237%239@%256%232%260@4%266@2%204%209%237%239@%256%229%276@4%265@2%204%209%237%213@%256%232%272@4%265@2%204%209%237%213@%256%232%260@4%266@2%204%209%237%213@%256%229%276@4%266@2%204%209%237%239@%277%232%272@4%265@2%204%209%237%239@%277%232%260@4%265@2%204%209%237%239@%277%229%276@4%265@2%204%209%237%213@%277%232%272@4%266@2%204%209%237%213@%277%232%260@4%266@2%204%209%237%213@%277%229%276@4%266@2%204%209%237%239@%249@2%265@2%209%237%213@%249@2%266@14"])
  fun op inputOK_ind x = x
    val op inputOK_ind =
    ThmBind.DT(((("SM0",9),
                [("aclfoundation",[55,116]),
                 ("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79]),
                 ("principal",[32,80]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("ssm1",[12])]),["DISK_THM"]),
               [ThmBind.read"%184%5%211%204%183%11$1%274%230%234%231@3%269%238$0@4|@2%204%183%11$1%274%230%234%219@3%269%238$0@4|@2%204$0%243@2%204$0%221@2%204%188%20$1%269$0@2|@2%204%177%22$1%264$0@2|@2%204%177%88%177%99$2%246$1@$0@2|@|@2%204%177%110%177%121$2%267$1@$0@2|@|@2%204%177%132%177%143$2%257$1@$0@2|@|@2%204%177%154%177%165$2%252$1@$0@2|@|@2%204%180%24$1%274$0@%243@2|@2%204%180%24$1%274$0@%221@2|@2%204%199%72%183%70$2%274%230%240$1@3%269%238$0@4|@|@2%204%182%73%183%70$2%274%230%214$1@3%269%238$0@4|@|@2%204%194%74%183%70$2%274%230%225$1@3%269%238$0@4|@|@2%204%193%75%183%70$2%274%230%224$1@3%269%238$0@4|@|@2%204%192%76%183%70$2%274%230%226$1@3%269%238$0@4|@|@2%204%197%59$1%274%230$0@2%269%228@3|@2%204%180%60%180%61%188%139$3%274%263$2@$1@2%269$0@3|@|@|@2%204%180%62%180%63%188%139$3%274%270$2@$1@2%269$0@3|@|@|@2%204%180%24%177%140$2%274$1@%264$0@3|@|@2%204%180%24%177%141%177%142$3%274$2@%246$1@$0@3|@|@|@2%204%180%24%177%144%177%145$3%274$2@%267$1@$0@3|@|@|@2%204%180%24%177%146%177%147$3%274$2@%257$1@$0@3|@|@|@2%204%180%24%177%148%177%149$3%274$2@%252$1@$0@3|@|@|@2%204%180%24%180%150%177%151$3%274$2@%274$1@$0@3|@|@|@2%204%180%24%180%152%180%153$3%274$2@%275$1@$0@3|@|@|@2%204%180%24%180%155%177%156$3%274$2@%248$1@$0@3|@|@|@2%204%180%24%180%157%180%158%177%159$4%274$3@%271$2@$1@$0@3|@|@|@|@2%204%180%24%178%160%178%161$3%274$2@%250$1@$0@3|@|@|@2%204%180%24%178%162%178%163$3%274$2@%253$1@$0@3|@|@|@2%204%180%24%181%164%181%166$3%274$2@%251$1@$0@3|@|@|@2%204%180%24%181%167%181%168$3%274$2@%255$1@$0@3|@|@|@2%204%180%24%192%169%192%170$3%274$2@%254$1@$0@3|@|@|@2%204%180%24%192%171%192%172$3%274$2@%262$1@$0@3|@|@|@2%204%180%24%192%173%192%174$3%274$2@%261$1@$0@3|@|@|@2%204%180%45%180%56$2%275$1@$0@2|@|@2%204%180%67%177%77$2%248$1@$0@2|@|@2%204%180%84%180%85%177%86$3%271$2@$1@$0@2|@|@|@2%204%178%87%178%89$2%250$1@$0@2|@|@2%204%178%90%178%91$2%253$1@$0@2|@|@2%204%181%92%181%93$2%251$1@$0@2|@|@2%204%181%94%181%95$2%255$1@$0@2|@|@2%204%192%96%192%97$2%254$1@$0@2|@|@2%204%192%98%192%100$2%262$1@$0@2|@|@2%192%101%192%102$2%261$1@$0@2|@|@47%177%19$1$0@|@2|@"])
  fun op inputOK_def x = x
    val op inputOK_def =
    ThmBind.DT(((("SM0",10),
                [("SM0",[8]),("aclfoundation",[33,110]),("bool",[15]),
                 ("combin",[19]),("principal",[74]),("relation",[113,132]),
                 ("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%204%206%258%274%230%234%231@3%269%238%11@5%241@2%204%206%258%274%230%234%219@3%269%238%11@5%241@2%204%206%258%243@2%220@2%204%206%258%221@2%220@2%204%206%258%269%20@3%220@2%204%206%258%264%22@3%220@2%204%206%258%246%88@%99@3%220@2%204%206%258%267%110@%121@3%220@2%204%206%258%257%132@%143@3%220@2%204%206%258%252%154@%165@3%220@2%204%206%258%274%24@%243@3%220@2%204%206%258%274%24@%221@3%220@2%204%206%258%274%230%240%72@3%269%238%70@5%220@2%204%206%258%274%230%214%73@3%269%238%70@5%220@2%204%206%258%274%230%225%74@3%269%238%70@5%220@2%204%206%258%274%230%224%75@3%269%238%70@5%220@2%204%206%258%274%230%226%76@3%269%238%70@5%220@2%204%206%258%274%230%59@2%269%228@4%220@2%204%206%258%274%263%60@%61@2%269%139@4%220@2%204%206%258%274%270%62@%63@2%269%139@4%220@2%204%206%258%274%24@%264%140@4%220@2%204%206%258%274%24@%246%141@%142@4%220@2%204%206%258%274%24@%267%144@%145@4%220@2%204%206%258%274%24@%257%146@%147@4%220@2%204%206%258%274%24@%252%148@%149@4%220@2%204%206%258%274%24@%274%150@%151@4%220@2%204%206%258%274%24@%275%152@%153@4%220@2%204%206%258%274%24@%248%155@%156@4%220@2%204%206%258%274%24@%271%157@%158@%159@4%220@2%204%206%258%274%24@%250%160@%161@4%220@2%204%206%258%274%24@%253%162@%163@4%220@2%204%206%258%274%24@%251%164@%166@4%220@2%204%206%258%274%24@%255%167@%168@4%220@2%204%206%258%274%24@%254%169@%170@4%220@2%204%206%258%274%24@%262%171@%172@4%220@2%204%206%258%274%24@%261%173@%174@4%220@2%204%206%258%275%45@%56@3%220@2%204%206%258%248%67@%77@3%220@2%204%206%258%271%84@%85@%86@3%220@2%204%206%258%250%87@%89@3%220@2%204%206%258%253%90@%91@3%220@2%204%206%258%251%92@%93@3%220@2%204%206%258%255%94@%95@3%220@2%204%206%258%254%96@%97@3%220@2%204%206%258%262%98@%100@3%220@2%206%258%261%101@%102@3%220@46"])
  fun op inputOK_staff_rejected_lemma x = x
    val op inputOK_staff_rejected_lemma =
    ThmBind.DT(((("SM0",12),
                [("SM0",[8]),("aclfoundation",[33,110]),
                 ("bool",[15,25,26,46,47,52,53,62,70,72]),("combin",[19]),
                 ("principal",[74]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,14,15]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%199%7%183%11%278%258%274%230%240$1@3%269%238$0@5|@|@"])
  fun op inputOK_cmd_reject_lemma x = x
    val op inputOK_cmd_reject_lemma =
    ThmBind.DT(((("SM0",13),
                [("SM0",[8]),("aclfoundation",[33,110]),
                 ("bool",[15,25,26,46,47,52,53,62,70,72]),("combin",[19]),
                 ("principal",[74]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,14,15]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%183%11%278%258%269%238$0@4|@"])
  fun op inputOK_TT_reject_lemma x = x
    val op inputOK_TT_reject_lemma =
    ThmBind.DT(((("SM0",14),
                [("SM0",[8]),("aclfoundation",[33,110]),
                 ("bool",[15,25,26,46,47,52,53,62,72]),("combin",[19]),
                 ("principal",[74]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,14,15]),("ssm1",[6])]),["DISK_THM"]),
               [ThmBind.read"%278%258%243@2"])
  fun op Operator_privcmd_lemma x = x
    val op Operator_privcmd_lemma =
    ThmBind.DT(((("SM0",16),
                [("SM0",[11,15]),("aclDrules",[3]),("aclrules",[63]),
                 ("bool",[25,26,46,47,50,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15]),("satList",[1,3]),
                 ("ssm1",[52])]),["DISK_THM"]),
               [ThmBind.read"%211%216%202%0@%203%2@%3@3%215%258@%235@%247%14@%16@2%217%274%230%234%231@3%269%238%232%16@5%13@2%17@%15@3%273%202%0@%203%2@%3@3%269%238%232%16@5"])
  fun op Operator_exec_privcmd_justified_thm x = x
    val op Operator_exec_privcmd_justified_thm =
    ThmBind.DT(((("SM0",17),
                [("SM0",[11,15]),("aclDrules",[3]),("aclrules",[63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,62])]),["DISK_THM"]),
               [ThmBind.read"%187%1%186%4%179%0%195%2%196%3%206%242%202$2@%203$1@$0@3%256%232%16@3%215%258@%235@%247%14@%16@2%217%274%230%234%231@3%269%238%232%16@5%13@2%17@%15@2%215%258@%235@%247%14@%16@2%13@$4%17@%256%232%16@4%218$3%17@%256%232%16@4%15@4%204%258%274%230%234%231@3%269%238%232%16@6%204%216%202$2@%203$1@$0@3%215%258@%235@%247%14@%16@2%217%274%230%234%231@3%269%238%232%16@5%13@2%17@%15@3%273%202$2@%203$1@$0@3%269%238%232%16@7|@|@|@|@|@"])
  fun op Operator_privcmd_verified_thm x = x
    val op Operator_privcmd_verified_thm =
    ThmBind.DT(((("SM0",18),
                [("SM0",[11,15]),("aclDrules",[3]),("aclrules",[63]),
                 ("bool",
                 [25,26,35,42,46,47,50,52,53,55,57,62,70,76,83,92,93,95,
                  145]),("combin",[19]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[52,62])]),["DISK_THM"]),
               [ThmBind.read"%187%1%186%4%179%0%195%2%196%3%211%242%202$2@%203$1@$0@3%256%232%16@3%215%258@%235@%247%14@%16@2%217%274%230%234%231@3%269%238%232%16@5%13@2%17@%15@2%215%258@%235@%247%14@%16@2%13@$4%17@%256%232%16@4%218$3%17@%256%232%16@4%15@4%273%202$2@%203$1@$0@3%269%238%232%16@5|@|@|@|@|@"])
  fun op Operator_justified_privcmd_exec_thm x = x
    val op Operator_justified_privcmd_exec_thm =
    ThmBind.DT(((("SM0",19),
                [("SM0",[8,11,15]),("aclDrules",[3]),
                 ("aclfoundation",[33,110]),("aclrules",[63]),
                 ("bool",
                 [15,25,26,35,42,46,47,50,52,53,55,57,62,70,72,76,83,92,93,
                  95,145]),("combin",[19]),("principal",[74]),
                 ("relation",[113,132]),("sat",[1,3,5,6,7,11,12,13,14,15]),
                 ("satList",[1,3]),("ssm1",[6,52,62])]),["DISK_THM"]),
               [ThmBind.read"%187%1%186%4%179%0%195%2%196%3%176%10%191%14%198%16%189%13%200%17%190%15%211%204%258%274%230%234%231@3%269%238%232$3@6%216%202$8@%203$7@$6@3%215%258@%235@%247$4@$3@2%217%274%230%234%231@3%269%238%232$3@5$2@2$1@$0@4%242%202$8@%203$7@$6@3%256%232$3@3%215%258@%235@%247$4@$3@2%217%274%230%234%231@3%269%238%232$3@5$2@2$1@$0@2%215%258@%235@%247$4@$3@2$2@$10$1@%256%232$3@4%218$9$1@%256%232$3@4$0@4|@|@|@|@|@|@|@|@|@|@|@"])

  val _ = DB.bindl "SM0"
  [("inputOK_primitive_def",inputOK_primitive_def,DB.Def),
   ("SM0StateInterp_def",SM0StateInterp_def,DB.Def),
   ("certs_def",certs_def,DB.Def), ("SM0ns_ind",SM0ns_ind,DB.Thm),
   ("SM0ns_def",SM0ns_def,DB.Thm), ("SM0out_ind",SM0out_ind,DB.Thm),
   ("SM0out_def",SM0out_def,DB.Thm), ("inputOK_ind",inputOK_ind,DB.Thm),
   ("inputOK_def",inputOK_def,DB.Thm),
   ("inputOK_staff_rejected_lemma",inputOK_staff_rejected_lemma,DB.Thm),
   ("inputOK_cmd_reject_lemma",inputOK_cmd_reject_lemma,DB.Thm),
   ("inputOK_TT_reject_lemma",inputOK_TT_reject_lemma,DB.Thm),
   ("Operator_privcmd_lemma",Operator_privcmd_lemma,DB.Thm),
   ("Operator_exec_privcmd_justified_thm",
    Operator_exec_privcmd_justified_thm,
    DB.Thm),
   ("Operator_privcmd_verified_thm",Operator_privcmd_verified_thm,DB.Thm),
   ("Operator_justified_privcmd_exec_thm",
    Operator_justified_privcmd_exec_thm,
    DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0",
    thydataty = "compute",
    read = ThmBind.read,
    data =
        "SM0.SM0ns_def SM0.SM0out_def SM0.certs_def SM0.SM0StateInterp_def SM0.inputOK_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "SM0",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO5.SM0ns4.%236OO6.SM0out4.%237OO7.inputOK4.%258OO14.SM0StateInterp4.%235OO5.certs4.%247"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val SM0_grammars = merge_grammars ["principal", "m0Types", "ssm1"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="SM0"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val SM0_grammars = 
    Portable.## (addtyUDs,addtmUDs) SM0_grammars
  val _ = Parse.grammarDB_insert("SM0",SM0_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "SM0"
end
