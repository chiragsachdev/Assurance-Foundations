structure certStructureTheory :> certStructureTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading certStructureTheory ... " else ()
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
          ("certStructure",
          Arbnum.fromString "1556067540",
          Arbnum.fromString "718302")
          [("principal",
           Arbnum.fromString "1556067525",
           Arbnum.fromString "878983"),
           ("m0Types",
           Arbnum.fromString "1556067524",
           Arbnum.fromString "815181"),
           ("ssm1",
           Arbnum.fromString "1556067504",
           Arbnum.fromString "669018")];
  val _ = Theory.incorporate_types "certStructure" [("certificate", 2)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("certStructure", "certificate"),
   ID("aclfoundation", "Form"), ID("principal", "principal"),
   ID("ssm1", "inst"), ID("m0Types", "command"),
   ID("principal", "authority"), ID("min", "bool"), ID("num", "num"),
   ID("cipher", "asymMsg"), ID("cipher", "digest"),
   ID("ind_type", "recspace"), ID("pair", "prod"), ID("list", "list"),
   ID("cipher", "pKey"), ID("principal", "staff"), ID("principal", "role"),
   ID("bool", "!"), ID("arithmetic", "+"), ID("pair", ","),
   ID("bool", "/\\"), ID("num", "0"), ID("min", "="), ID("min", "==>"),
   ID("bool", "?"), ID("min", "@"), ID("bool", "ARB"),
   ID("principal", "Authority"), ID("arithmetic", "BIT1"),
   ID("ind_type", "BOTTOM"), ID("bool", "COND"), ID("ind_type", "CONSTR"),
   ID("bool", "DATATYPE"), ID("aclfoundation", "Form_size"),
   ID("combin", "I"), ID("principal", "KeyA"), ID("principal", "KeyS"),
   ID("list", "MAP"), ID("principal", "Machine"),
   ID("arithmetic", "NUMERAL"), ID("certStructure", "RCert"),
   ID("principal", "Role"), ID("certStructure", "SCert"),
   ID("option", "SOME"), ID("option", "option"), ID("num", "SUC"),
   ID("principal", "Staff"), ID("bool", "T"), ID("aclfoundation", "TT"),
   ID("bool", "TYPE_DEFINITION"), ID("relation", "WF"),
   ID("relation", "WFREC"), ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("cipher", "asymMsg_size"), ID("principal", "authority_size"),
   ID("certStructure", "certificateInterpret"),
   ID("certStructure", "certificate_CASE"),
   ID("certStructure", "certificate_size"),
   ID("certStructure", "checkcert"), ID("m0Types", "command_size"),
   ID("cipher", "digest_size"), ID("cipher", "hash"),
   ID("ssm1", "inst_size"), ID("certStructure", "mkRCert"),
   ID("certStructure", "mkSCert"), ID("cipher", "pKey_CASE"),
   ID("principal", "principal_CASE"), ID("principal", "principal_size"),
   ID("cipher", "privK"), ID("cipher", "pubK"), ID("cipher", "sign"),
   ID("cipher", "signVerify"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYV "'e", TYV "'d", TYOP [1, 1, 0], TYOP [3], TYOP [5], TYOP [4, 4],
   TYOP [2, 5, 3, 1, 0], TYOP [0, 6, 2], TYOP [6], TYOP [0, 8, 7],
   TYOP [7], TYOP [0, 2, 10], TYOP [8], TYOP [0, 2, 12], TYOP [0, 0, 12],
   TYOP [0, 14, 13], TYOP [0, 1, 12], TYOP [0, 16, 15], TYV "'a",
   TYOP [10, 6], TYOP [9, 19, 8], TYOP [0, 20, 18], TYOP [0, 6, 21],
   TYOP [0, 3, 22], TYOP [0, 23, 18], TYOP [0, 6, 18], TYOP [0, 25, 24],
   TYOP [0, 2, 26], TYOP [0, 2, 6], TYOP [0, 20, 2], TYOP [0, 6, 29],
   TYOP [0, 3, 30], TYOP [12, 3, 20], TYOP [12, 6, 32], TYOP [11, 33],
   TYOP [0, 34, 10], TYOP [0, 2, 11], TYOP [0, 31, 10], TYOP [0, 7, 37],
   TYOP [0, 2, 18], TYOP [13, 6], TYOP [0, 2, 34], TYOP [15],
   TYOP [14, 42], TYOP [14, 8], TYOP [16], TYOP [0, 6, 10],
   TYOP [0, 46, 10], TYOP [0, 20, 10], TYOP [0, 48, 10], TYOP [0, 8, 10],
   TYOP [0, 50, 10], TYOP [0, 11, 10], TYOP [0, 16, 10], TYOP [0, 53, 10],
   TYOP [0, 14, 10], TYOP [0, 55, 10], TYOP [0, 25, 10], TYOP [0, 57, 10],
   TYOP [0, 52, 10], TYOP [0, 23, 10], TYOP [0, 60, 10], TYOP [0, 35, 10],
   TYOP [0, 62, 10], TYOP [0, 40, 10], TYOP [0, 64, 10], TYOP [0, 12, 10],
   TYOP [0, 66, 10], TYOP [0, 43, 10], TYOP [0, 68, 10], TYOP [0, 3, 10],
   TYOP [0, 70, 10], TYOP [0, 45, 10], TYOP [0, 72, 10], TYOP [0, 42, 10],
   TYOP [0, 74, 10], TYOP [0, 12, 12], TYOP [0, 12, 76], TYOP [0, 32, 33],
   TYOP [0, 6, 78], TYOP [0, 20, 32], TYOP [0, 3, 80], TYOP [0, 10, 10],
   TYOP [0, 10, 82], TYOP [0, 18, 10], TYOP [0, 18, 84], TYOP [0, 6, 46],
   TYOP [0, 20, 48], TYOP [0, 28, 10], TYOP [0, 28, 88], TYOP [0, 11, 52],
   TYOP [0, 40, 64], TYOP [0, 12, 66], TYOP [0, 3, 70], TYOP [0, 34, 35],
   TYOP [0, 39, 10], TYOP [0, 95, 10], TYOP [0, 41, 10], TYOP [0, 97, 10],
   TYOP [0, 36, 10], TYOP [0, 99, 36], TYOP [0, 8, 3], TYOP [0, 6, 6],
   TYOP [0, 6, 102], TYOP [0, 10, 103], TYOP [0, 12, 34],
   TYOP [0, 105, 34], TYOP [0, 33, 106], TYOP [0, 12, 107],
   TYOP [0, 6, 12], TYOP [0, 14, 109], TYOP [0, 16, 110], TYOP [0, 3, 12],
   TYOP [0, 112, 111], TYOP [0, 5, 12], TYOP [0, 114, 113],
   TYOP [0, 44, 3], TYOP [0, 43, 3], TYOP [13, 2], TYOP [0, 40, 118],
   TYOP [0, 7, 119], TYOP [0, 118, 40], TYOP [0, 28, 121], TYOP [0, 12, 3],
   TYOP [0, 45, 3], TYOP [44, 6], TYOP [0, 6, 125], TYOP [0, 42, 3],
   TYOP [0, 35, 97], TYOP [0, 28, 28], TYOP [0, 129, 28],
   TYOP [0, 36, 130], TYOP [0, 11, 11], TYOP [0, 132, 11],
   TYOP [0, 36, 133], TYOP [0, 20, 12], TYOP [0, 8, 12],
   TYOP [0, 136, 135], TYOP [0, 19, 12], TYOP [0, 138, 137],
   TYOP [0, 20, 6], TYOP [0, 6, 140], TYOP [0, 3, 141], TYOP [0, 142, 6],
   TYOP [0, 102, 143], TYOP [0, 2, 144], TYOP [0, 6, 48], TYOP [0, 3, 146],
   TYOP [0, 147, 10], TYOP [0, 46, 148], TYOP [0, 2, 149], TYOP [0, 4, 12],
   TYOP [0, 109, 138], TYOP [0, 125, 19], TYOP [0, 151, 114],
   TYOP [0, 8, 6], TYOP [0, 155, 6], TYOP [0, 155, 156], TYOP [0, 44, 157],
   TYOP [0, 50, 51], TYOP [0, 44, 159], TYOP [0, 12, 6], TYOP [0, 161, 6],
   TYOP [0, 44, 6], TYOP [0, 163, 162], TYOP [0, 43, 6],
   TYOP [0, 165, 164], TYOP [0, 45, 6], TYOP [0, 167, 166],
   TYOP [0, 155, 168], TYOP [0, 42, 6], TYOP [0, 170, 169],
   TYOP [0, 3, 171], TYOP [0, 44, 10], TYOP [0, 173, 67],
   TYOP [0, 68, 174], TYOP [0, 72, 175], TYOP [0, 50, 176],
   TYOP [0, 74, 177], TYOP [0, 3, 178], TYOP [0, 8, 44], TYOP [0, 19, 20],
   TYOP [0, 44, 181], TYOP [0, 125, 10], TYOP [0, 20, 183],
   TYOP [0, 44, 184]]
  end
  val _ = Theory.incorporate_consts "certStructure" tyvector
     [("mkSCert", 9), ("mkRCert", 7), ("checkcert", 11),
      ("certificate_size", 17), ("certificate_CASE", 27),
      ("certificateInterpret", 28), ("SCert", 31), ("RCert", 7)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'certificate'", 35), TMV("F", 6), TMV("M", 2), TMV("M'", 2),
   TMV("P", 11), TMV("R", 36), TMV("a", 6), TMV("a", 20), TMV("a", 2),
   TMV("a'", 6), TMV("a0", 3), TMV("a0'", 3), TMV("a0'", 34), TMV("a1", 6),
   TMV("a1'", 6), TMV("a2", 20), TMV("a2'", 20), TMV("auth", 8),
   TMV("c", 2), TMV("cc", 2), TMV("certificate", 38),
   TMV("certificateInterpret", 28), TMV("checkcert", 11), TMV("f", 16),
   TMV("f", 25), TMV("f'", 25), TMV("f0", 25), TMV("f1", 14),
   TMV("f1", 23), TMV("f1'", 23), TMV("fn", 39), TMV("formList", 40),
   TMV("formula", 6), TMV("formula'", 6), TMV("n", 12), TMV("p", 3),
   TMV("rep", 41), TMV("signature", 20), TMV("v", 2), TMV("v1", 3),
   TMV("v10", 43), TMV("v11", 43), TMV("v12", 44), TMV("v13", 12),
   TMV("v14", 12), TMV("v15", 6), TMV("v16", 20), TMV("v17", 6),
   TMV("v18", 20), TMV("v19", 6), TMV("v20", 20), TMV("v21", 6),
   TMV("v22", 20), TMV("v24", 8), TMV("v25", 8), TMV("v26", 6),
   TMV("v27", 20), TMV("v28", 6), TMV("v29", 20), TMV("v4", 42),
   TMV("v5", 42), TMV("v6", 8), TMV("v7", 8), TMV("v8", 45), TMV("v9", 45),
   TMC(17, 47), TMC(17, 49), TMC(17, 51), TMC(17, 52), TMC(17, 54),
   TMC(17, 56), TMC(17, 58), TMC(17, 59), TMC(17, 61), TMC(17, 63),
   TMC(17, 65), TMC(17, 67), TMC(17, 69), TMC(17, 71), TMC(17, 62),
   TMC(17, 73), TMC(17, 75), TMC(18, 77), TMC(19, 79), TMC(19, 81),
   TMC(20, 83), TMC(21, 12), TMC(22, 85), TMC(22, 86), TMC(22, 87),
   TMC(22, 83), TMC(22, 36), TMC(22, 89), TMC(22, 90), TMC(22, 91),
   TMC(22, 92), TMC(22, 93), TMC(22, 94), TMC(23, 83), TMC(24, 47),
   TMC(24, 49), TMC(24, 96), TMC(24, 98), TMC(24, 71), TMC(25, 100),
   TMC(26, 6), TMC(26, 20), TMC(26, 10), TMC(26, 3), TMC(27, 101),
   TMC(28, 76), TMC(29, 34), TMC(30, 104), TMC(31, 108), TMC(32, 82),
   TMC(33, 115), TMC(34, 102), TMC(34, 82), TMC(35, 116), TMC(36, 117),
   TMC(37, 120), TMC(37, 122), TMC(38, 123), TMC(39, 76), TMC(40, 7),
   TMC(41, 124), TMC(42, 31), TMC(43, 126), TMC(45, 76), TMC(46, 127),
   TMC(47, 10), TMC(48, 6), TMC(49, 128), TMC(50, 99), TMC(51, 131),
   TMC(51, 134), TMC(52, 12), TMC(53, 83), TMC(54, 139), TMC(55, 136),
   TMC(56, 28), TMC(57, 27), TMC(57, 145), TMC(57, 150), TMC(58, 17),
   TMC(59, 11), TMC(60, 151), TMC(61, 152), TMC(62, 153), TMC(63, 154),
   TMC(64, 7), TMC(65, 9), TMC(66, 158), TMC(66, 160), TMC(67, 172),
   TMC(67, 179), TMC(68, 112), TMC(69, 180), TMC(70, 180), TMC(71, 182),
   TMC(72, 185), TMC(73, 82)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op certificate_TY_DEF x = x
    val op certificate_TY_DEF =
    ThmBind.DT(((("certStructure",0),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%102%36%132%12%74%0%98%79%12%98%137%99%6%97$1@%6%113%86@%83$0@%84%108@%106@3%34%111|@|$0@2|@2%103%10%99%13%100%15%97$3@%10%13%15%113%128%86@2%83$1@%84$2@$0@3%34%111|@|||$2@$1@$0@2|@|@|@3$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op certificate_case_def x = x
    val op certificate_case_def =
    ThmBind.DT(((("certStructure",6),
                [("bool",[26,180]),("certStructure",[1,2,3,4,5]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%85%65%6%71%24%73%28%87%141%124$2@2$1@$0@2$1$2@2|@|@|@2%78%10%65%13%66%15%71%24%73%28%87%141%126$4@$3@$2@2$1@$0@2$0$4@$3@$2@2|@|@|@|@|@2"])
  fun op certificate_size_def x = x
    val op certificate_size_def =
    ThmBind.DT(((("certStructure",7),
                [("bool",[26,180]),("certStructure",[1,2,3,4,5]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%85%69%23%70%27%65%6%95%144$2@$1@%124$0@3%82%123%110%136@3%115%149%146@2%156@$2@$1@$0@3|@|@|@2%69%23%70%27%78%10%65%13%66%15%95%144$4@$3@%126$2@$1@$0@3%82%123%110%136@3%82%156$2@2%82%115%149%146@2%156@$4@$3@$1@2%138%147%115%149%146@2%156@$4@$3@3%139@$0@5|@|@|@|@|@2"])
  fun op checkcert_primitive_def x = x
    val op checkcert_primitive_def =
    ThmBind.DT(((("certStructure",17),[]),[]),
               [ThmBind.read"%93%145@%135%104%5%133$0@|@2%22%8%143$0@%32%117%130@|@%39%33%37%155$2@%59%107|@%61%107|@%63%107|@%40%107|@%42%153$0@%17%117%160%158$0@2$2@%127$3@3|@%53%107|@|@%43%107|@|||@||@2"])
  fun op certificateInterpret_primitive_def x = x
    val op certificateInterpret_primitive_def =
    ThmBind.DT(((("certStructure",20),[]),[]),
               [ThmBind.read"%92%140@%134%104%5%133$0@|@2%21%8%142$0@%32%116%112%145%124$0@3$0@%131@2|@%39%33%37%154$2@%59%105|@%61%105|@%63%105|@%40%105|@%42%152$0@%17%116%112%145%126%118%158$0@3$3@$2@3$3@%131@2|@%53%105|@|@%43%105|@|||@||@2"])
  fun op mkRCert_def x = x
    val op mkRCert_def =
    ThmBind.DT(((("certStructure",25),[]),[]),
               [ThmBind.read"%65%32%91%150$0@2%124$0@2|@"])
  fun op mkSCert_def x = x
    val op mkSCert_def =
    ThmBind.DT(((("certStructure",26),[]),[]),
               [ThmBind.read"%67%17%65%32%91%151$1@$0@2%126%118%158$1@3$0@%159%157$1@2%148%127$0@5|@|@"])
  fun op datatype_certificate x = x
    val op datatype_certificate =
    ThmBind.DT(((("certStructure",8),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%114%20%124@%126@2"])
  fun op certificate_11 x = x
    val op certificate_11 =
    ThmBind.DT(((("certStructure",9),
                [("bool",[26,50,55,62,180]),("certStructure",[1,2,3,4,5]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%85%65%6%65%9%90%91%124$1@2%124$0@3%88$1@$0@2|@|@2%78%10%65%13%66%15%78%11%65%14%66%16%90%91%126$5@$4@$3@2%126$2@$1@$0@3%85%96$5@$2@2%85%88$4@$1@2%89$3@$0@4|@|@|@|@|@|@2"])
  fun op certificate_distinct x = x
    val op certificate_distinct =
    ThmBind.DT(((("certStructure",10),
                [("bool",[25,26,46,53,62,180]),
                 ("certStructure",[1,2,3,4,5]),("ind_type",[33,34]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%66%15%65%13%78%10%65%6%161%91%124$0@2%126$1@$2@$3@3|@|@|@|@"])
  fun op certificate_case_cong x = x
    val op certificate_case_cong =
    ThmBind.DT(((("certStructure",11),
                [("bool",[26,180]),
                 ("certStructure",[1,2,3,4,5,6])]),["DISK_THM"]),
               [ThmBind.read"%68%2%68%3%71%24%73%28%98%85%91$3@$2@2%85%65%6%98%91$3@%124$0@3%87$2$0@2%25$0@3|@2%78%10%65%13%66%15%98%91$5@%126$2@$1@$0@3%87$3$2@$1@$0@2%29$2@$1@$0@3|@|@|@4%87%141$3@$1@$0@2%141$2@%25@%29@3|@|@|@|@"])
  fun op certificate_nchotomy x = x
    val op certificate_nchotomy =
    ThmBind.DT(((("certStructure",12),
                [("bool",[26,180]),
                 ("certStructure",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%68%19%137%99%1%91$1@%124$0@2|@2%103%35%99%1%100%7%91$3@%126$2@$1@$0@2|@|@|@2|@"])
  fun op certificate_Axiom x = x
    val op certificate_Axiom =
    ThmBind.DT(((("certStructure",13),
                [("bool",[26,180]),("certStructure",[1,2,3,4,5]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%71%26%73%28%101%30%85%65%6%87$1%124$0@3$3$0@2|@2%78%10%65%13%66%15%87$3%126$2@$1@$0@3$4$2@$1@$0@2|@|@|@2|@|@|@"])
  fun op certificate_induction x = x
    val op certificate_induction =
    ThmBind.DT(((("certStructure",14),
                [("bool",[26]),
                 ("certStructure",[1,2,3,4,5])]),["DISK_THM"]),
               [ThmBind.read"%72%4%98%85%65%1$1%124$0@2|@2%78%35%65%1%66%7$3%126$2@$1@$0@2|@|@|@3%68%18$1$0@|@2|@"])
  fun op certificate_one_one x = x
    val op certificate_one_one =
    ThmBind.DT(((("certStructure",15),
                [("bool",[26,50,55,62,180]),("certStructure",[1,2,3,4,5]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%85%65%6%65%9%90%91%124$1@2%124$0@3%88$1@$0@2|@|@2%78%10%65%13%66%15%78%11%65%14%66%16%90%91%126$5@$4@$3@2%126$2@$1@$0@3%85%96$5@$2@2%85%88$4@$1@2%89$3@$0@4|@|@|@|@|@|@2"])
  fun op certificate_distinct_thm x = x
    val op certificate_distinct_thm =
    ThmBind.DT(((("certStructure",16),
                [("bool",[25,26,46,53,62,180]),
                 ("certStructure",[1,2,3,4,5]),("ind_type",[33,34]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%66%15%65%13%78%10%65%6%161%91%124$0@2%126$1@$2@$3@3|@|@|@|@"])
  fun op checkcert_ind x = x
    val op checkcert_ind =
    ThmBind.DT(((("certStructure",18),
                [("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79,180]),
                 ("certStructure",[1,2,3,4,5]),("cipher",[42]),
                 ("principal",[80]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%72%4%98%85%65%32$1%124$0@2|@2%85%67%17%65%32%66%37$3%126%118%158$2@3$1@$0@2|@|@|@2%85%81%60%65%45%66%46$3%126%129$2@2$1@$0@2|@|@|@2%85%67%62%65%47%66%48$3%126%109$2@2$1@$0@2|@|@|@2%85%80%64%65%49%66%50$3%126%125$2@2$1@$0@2|@|@|@2%85%77%41%65%51%66%52$3%126%119$2@2$1@$0@2|@|@|@2%85%67%54%65%55%66%56$3%126%118%157$2@3$1@$0@2|@|@|@2%76%44%65%57%66%58$3%126%122$2@2$1@$0@2|@|@|@9%68%38$1$0@|@2|@"])
  fun op checkcert_def x = x
    val op checkcert_def =
    ThmBind.DT(((("certStructure",19),
                [("bool",[15]),("certStructure",[6,17]),("cipher",[36]),
                 ("combin",[19]),("principal",[74]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%85%90%145%124%32@3%130@2%90%145%126%118%158%17@3%32@%37@3%160%158%17@2%37@%127%32@4"])
  fun op certificateInterpret_ind x = x
    val op certificateInterpret_ind =
    ThmBind.DT(((("certStructure",21),
                [("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79,180]),
                 ("certStructure",[1,2,3,4,5]),("cipher",[42]),
                 ("principal",[80]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%72%4%98%85%65%32$1%124$0@2|@2%85%67%17%65%32%66%37$3%126%118%158$2@3$1@$0@2|@|@|@2%85%81%60%65%45%66%46$3%126%129$2@2$1@$0@2|@|@|@2%85%67%62%65%47%66%48$3%126%109$2@2$1@$0@2|@|@|@2%85%80%64%65%49%66%50$3%126%125$2@2$1@$0@2|@|@|@2%85%77%41%65%51%66%52$3%126%119$2@2$1@$0@2|@|@|@2%85%67%54%65%55%66%56$3%126%118%157$2@3$1@$0@2|@|@|@2%76%44%65%57%66%58$3%126%122$2@2$1@$0@2|@|@|@9%68%38$1$0@|@2|@"])
  fun op certificateInterpret_def x = x
    val op certificateInterpret_def =
    ThmBind.DT(((("certStructure",22),
                [("bool",[15]),("certStructure",[6,20]),("cipher",[36]),
                 ("combin",[19]),("principal",[74]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%85%88%140%124%32@3%112%145%124%32@3%32@%131@3%88%140%126%118%158%17@3%32@%37@3%112%145%126%118%158%17@3%32@%37@3%32@%131@3"])
  fun op certificateInterpretRCert_thm x = x
    val op certificateInterpretRCert_thm =
    ThmBind.DT(((("certStructure",23),
                [("bool",[15,25,35,55,63]),("certStructure",[6,17,20]),
                 ("cipher",[36]),("combin",[19]),("principal",[74]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%65%32%88%140%124$0@3$0@|@"])
  fun op certificateInterpretSCert_thm x = x
    val op certificateInterpretSCert_thm =
    ThmBind.DT(((("certStructure",24),
                [("bool",[15,25,35,55,62,63]),("certStructure",[6,17,20]),
                 ("cipher",[36,79]),("combin",[19]),("principal",[74]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%65%32%67%17%88%140%126%118%158$0@3$1@%159%157$0@2%148%127$1@6$1@|@|@"])
  fun op certificateInterpret_mkRCert_thm x = x
    val op certificateInterpret_mkRCert_thm =
    ThmBind.DT(((("certStructure",27),
                [("bool",[15,25,35,55,63]),("certStructure",[6,17,20,25]),
                 ("cipher",[36]),("combin",[19]),("principal",[74]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%65%32%88%140%150$0@3$0@|@"])
  fun op certificateInterpret_mkSCert_thm x = x
    val op certificateInterpret_mkSCert_thm =
    ThmBind.DT(((("certStructure",28),
                [("bool",[15,25,35,55,62,63]),
                 ("certStructure",[6,17,20,26]),("cipher",[36,79]),
                 ("combin",[19]),("principal",[74]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%65%32%67%17%88%140%151$0@$1@3$1@|@|@"])
  fun op MAP_certificateInterpret_mkRCert_thm x = x
    val op MAP_certificateInterpret_mkRCert_thm =
    ThmBind.DT(((("certStructure",29),
                [("bool",
                 [13,14,15,25,26,27,29,35,46,47,50,51,52,53,55,62,63,70,92,
                  93,95]),("certStructure",[6,17,20,25]),("cipher",[36]),
                 ("combin",[19]),("list",[23,43]),("principal",[74]),
                 ("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%75%31%94%121%140@%120%150@$0@3$0@|@"])
  fun op MAP_certificateInterpret_mkSCert_thm x = x
    val op MAP_certificateInterpret_mkSCert_thm =
    ThmBind.DT(((("certStructure",30),
                [("bool",
                 [13,14,15,25,26,27,29,35,46,47,50,51,52,53,55,62,63,70,92,
                  93,95]),("certStructure",[6,17,20,26]),
                 ("cipher",[36,79]),("combin",[19]),("list",[23,43]),
                 ("principal",[74]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%75%31%67%17%94%121%140@%120%151$0@2$1@3$1@|@|@"])

  val _ = DB.bindl "certStructure"
  [("certificate_TY_DEF",certificate_TY_DEF,DB.Def),
   ("certificate_case_def",certificate_case_def,DB.Def),
   ("certificate_size_def",certificate_size_def,DB.Def),
   ("checkcert_primitive_def",checkcert_primitive_def,DB.Def),
   ("certificateInterpret_primitive_def",
    certificateInterpret_primitive_def,
    DB.Def), ("mkRCert_def",mkRCert_def,DB.Def),
   ("mkSCert_def",mkSCert_def,DB.Def),
   ("datatype_certificate",datatype_certificate,DB.Thm),
   ("certificate_11",certificate_11,DB.Thm),
   ("certificate_distinct",certificate_distinct,DB.Thm),
   ("certificate_case_cong",certificate_case_cong,DB.Thm),
   ("certificate_nchotomy",certificate_nchotomy,DB.Thm),
   ("certificate_Axiom",certificate_Axiom,DB.Thm),
   ("certificate_induction",certificate_induction,DB.Thm),
   ("certificate_one_one",certificate_one_one,DB.Thm),
   ("certificate_distinct_thm",certificate_distinct_thm,DB.Thm),
   ("checkcert_ind",checkcert_ind,DB.Thm),
   ("checkcert_def",checkcert_def,DB.Thm),
   ("certificateInterpret_ind",certificateInterpret_ind,DB.Thm),
   ("certificateInterpret_def",certificateInterpret_def,DB.Thm),
   ("certificateInterpretRCert_thm",certificateInterpretRCert_thm,DB.Thm),
   ("certificateInterpretSCert_thm",certificateInterpretSCert_thm,DB.Thm),
   ("certificateInterpret_mkRCert_thm",
    certificateInterpret_mkRCert_thm,
    DB.Thm),
   ("certificateInterpret_mkSCert_thm",
    certificateInterpret_mkSCert_thm,
    DB.Thm),
   ("MAP_certificateInterpret_mkRCert_thm",
    MAP_certificateInterpret_mkRCert_thm,
    DB.Thm),
   ("MAP_certificateInterpret_mkSCert_thm",
    MAP_certificateInterpret_mkSCert_thm,
    DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "certStructure",
    thydataty = "compute",
    read = ThmBind.read,
    data =
        "certStructure.checkcert_def certStructure.mkRCert_def certStructure.mkSCert_def certStructure.certificateInterpret_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "certStructure",
    thydataty = "TypeGrammarDeltas",
    read = ThmBind.read,
    data = "NTY13.certStructure,11.certificate"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "certStructure",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO5.RCert4.%124OO5.SCert4.%126OO16.certificate_CASE4.%141OO16.certificate_size4.%144OO4.case4.%141OO9.checkcert4.%145OO20.certificateInterpret4.%140OO7.mkRCert4.%150OO7.mkSCert4.%151"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val certStructure_grammars = merge_grammars ["principal", "m0Types",
                                               "ssm1"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="certStructure"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val certStructure_grammars = 
    Portable.## (addtyUDs,addtmUDs) certStructure_grammars
  val _ = Parse.grammarDB_insert("certStructure",certStructure_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG certificate_Axiom,
           case_def=certificate_case_def,
           case_cong=certificate_case_cong,
           induction=ORIG certificate_induction,
           nchotomy=certificate_nchotomy,
           size=SOME(Parse.Term`(certStructure$certificate_size) :('d -> num$num) ->
('e -> num$num) -> ('d, 'e) certStructure$certificate -> num$num`,
                     ORIG certificate_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME certificate_11,
           distinct=SOME certificate_distinct,
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
val _ = Theory.load_complete "certStructure"
end
