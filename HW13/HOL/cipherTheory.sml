structure cipherTheory :> cipherTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading cipherTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open indexedListsTheory patternMatchesTheory
  in end;
  val _ = Theory.link_parents
          ("cipher",
          Arbnum.fromString "1556067494",
          Arbnum.fromString "649688")
          [("indexedLists",
           Arbnum.fromString "1503148856",
           Arbnum.fromString "404777"),
           ("patternMatches",
           Arbnum.fromString "1503148884",
           Arbnum.fromString "20925")];
  val _ = Theory.incorporate_types "cipher"
       [("symMsg", 1), ("symKey", 0), ("pKey", 1), ("digest", 1),
        ("asymMsg", 2)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("num", "num"), ID("cipher", "symMsg"),
   ID("option", "option"), ID("cipher", "symKey"), ID("min", "bool"),
   ID("cipher", "asymMsg"), ID("cipher", "digest"), ID("cipher", "pKey"),
   ID("ind_type", "recspace"), ID("pair", "prod"), ID("bool", "!"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("min", "="), ID("min", "==>"), ID("bool", "?"),
   ID("arithmetic", "BIT1"), ID("ind_type", "BOTTOM"), ID("bool", "COND"),
   ID("ind_type", "CONSTR"), ID("bool", "DATATYPE"), ID("cipher", "Ea"),
   ID("cipher", "Es"), ID("option", "NONE"), ID("arithmetic", "NUMERAL"),
   ID("option", "SOME"), ID("num", "SUC"), ID("bool", "TYPE_DEFINITION"),
   ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("cipher", "asymMsg_CASE"), ID("cipher", "asymMsg_size"),
   ID("cipher", "deciphP"), ID("cipher", "deciphS"),
   ID("cipher", "digest_CASE"), ID("cipher", "digest_size"),
   ID("cipher", "hash"), ID("basicSize", "option_size"),
   ID("cipher", "pKey_CASE"), ID("cipher", "pKey_size"),
   ID("cipher", "privK"), ID("cipher", "pubK"), ID("cipher", "sign"),
   ID("cipher", "signVerify"), ID("cipher", "sym"),
   ID("cipher", "symKey_CASE"), ID("cipher", "symKey_size"),
   ID("cipher", "symMsg_CASE"), ID("cipher", "symMsg_size"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYV "'message", TYOP [2, 1], TYOP [0, 2, 0], TYOP [0, 1, 0],
   TYOP [0, 4, 3], TYV "'a", TYOP [3, 1], TYOP [0, 7, 6], TYOP [4],
   TYOP [0, 9, 8], TYOP [0, 10, 6], TYOP [0, 2, 11], TYOP [0, 9, 0],
   TYOP [0, 0, 6], TYOP [0, 14, 6], TYOP [0, 9, 15], TYOP [0, 0, 9],
   TYOP [5], TYOP [0, 7, 18], TYV "'princ", TYOP [7, 1], TYOP [6, 21, 20],
   TYOP [0, 22, 19], TYOP [8, 20], TYOP [0, 24, 23], TYOP [0, 21, 22],
   TYOP [0, 24, 26], TYOP [0, 20, 24], TYOP [0, 24, 0], TYOP [0, 20, 0],
   TYOP [0, 30, 29], TYOP [0, 20, 6], TYOP [0, 32, 6], TYOP [0, 32, 33],
   TYOP [0, 24, 34], TYOP [0, 7, 21], TYOP [0, 21, 0], TYOP [0, 4, 37],
   TYOP [0, 8, 6], TYOP [0, 21, 39], TYOP [0, 2, 7], TYOP [0, 9, 41],
   TYOP [6, 1, 20], TYOP [0, 43, 7], TYOP [0, 24, 44], TYOP [0, 43, 0],
   TYOP [0, 30, 46], TYOP [0, 4, 47], TYOP [0, 24, 8], TYOP [0, 49, 6],
   TYOP [0, 43, 50], TYOP [0, 7, 2], TYOP [0, 9, 52], TYOP [0, 7, 43],
   TYOP [0, 24, 54], TYOP [10, 24, 7], TYOP [9, 56], TYOP [0, 57, 18],
   TYOP [9, 7], TYOP [0, 59, 18], TYOP [9, 20], TYOP [0, 61, 18],
   TYOP [9, 0], TYOP [0, 63, 18], TYOP [10, 9, 7], TYOP [9, 65],
   TYOP [0, 66, 18], TYV "'b", TYOP [0, 43, 18], TYOP [0, 21, 18],
   TYOP [0, 24, 18], TYOP [0, 9, 18], TYOP [0, 2, 18], TYOP [0, 9, 73],
   TYOP [0, 24, 69], TYOP [0, 55, 18], TYOP [3, 6], TYOP [0, 36, 18],
   TYOP [6, 6, 68], TYOP [0, 43, 6], TYOP [0, 21, 6], TYOP [0, 24, 6],
   TYOP [0, 9, 6], TYOP [0, 2, 6], TYOP [8, 6], TYOP [8, 68], TYOP [3, 68],
   TYOP [0, 28, 18], TYOP [0, 28, 88], TYOP [0, 43, 57], TYOP [0, 21, 59],
   TYOP [0, 24, 61], TYOP [0, 9, 63], TYOP [0, 2, 66], TYOP [0, 17, 18],
   TYOP [0, 53, 18], TYOP [0, 6, 18], TYOP [0, 97, 18], TYOP [0, 68, 18],
   TYOP [0, 99, 18], TYOP [0, 1, 18], TYOP [0, 101, 18], TYOP [0, 20, 18],
   TYOP [0, 103, 18], TYOP [0, 79, 18], TYOP [0, 105, 18],
   TYOP [0, 69, 18], TYOP [0, 22, 18], TYOP [0, 108, 18], TYOP [0, 70, 18],
   TYOP [0, 4, 18], TYOP [0, 111, 18], TYOP [0, 32, 18], TYOP [0, 113, 18],
   TYOP [0, 30, 18], TYOP [0, 115, 18], TYOP [0, 107, 18],
   TYOP [0, 110, 18], TYOP [0, 14, 18], TYOP [0, 119, 18], TYOP [0, 8, 18],
   TYOP [0, 121, 18], TYOP [0, 71, 18], TYOP [0, 123, 18],
   TYOP [0, 75, 18], TYOP [0, 125, 18], TYOP [0, 49, 18],
   TYOP [0, 127, 18], TYOP [0, 62, 18], TYOP [0, 129, 18],
   TYOP [0, 64, 18], TYOP [0, 131, 18], TYOP [0, 60, 18],
   TYOP [0, 133, 18], TYOP [0, 58, 18], TYOP [0, 135, 18],
   TYOP [0, 67, 18], TYOP [0, 137, 18], TYOP [0, 72, 18],
   TYOP [0, 139, 18], TYOP [0, 10, 18], TYOP [0, 141, 18],
   TYOP [0, 74, 18], TYOP [0, 143, 18], TYOP [0, 73, 18],
   TYOP [0, 145, 18], TYOP [0, 0, 18], TYOP [0, 147, 18], TYOP [0, 77, 18],
   TYOP [0, 149, 18], TYOP [0, 87, 18], TYOP [0, 151, 18],
   TYOP [0, 19, 18], TYOP [0, 85, 18], TYOP [0, 154, 18], TYOP [0, 86, 18],
   TYOP [0, 156, 18], TYOP [0, 0, 0], TYOP [0, 0, 158], TYOP [0, 7, 56],
   TYOP [0, 24, 160], TYOP [0, 7, 65], TYOP [0, 9, 162], TYOP [0, 18, 18],
   TYOP [0, 18, 164], TYOP [0, 6, 97], TYOP [0, 68, 99], TYOP [0, 20, 103],
   TYOP [0, 79, 105], TYOP [0, 43, 69], TYOP [7, 68], TYOP [6, 171, 6],
   TYOP [0, 172, 18], TYOP [0, 172, 173], TYOP [0, 22, 108],
   TYOP [0, 21, 70], TYOP [0, 0, 147], TYOP [0, 77, 149],
   TYOP [0, 87, 151], TYOP [0, 7, 19], TYOP [3, 21], TYOP [0, 181, 18],
   TYOP [0, 181, 182], TYOP [0, 85, 154], TYOP [0, 86, 156],
   TYOP [0, 24, 71], TYOP [0, 61, 62], TYOP [0, 63, 64], TYOP [0, 59, 60],
   TYOP [0, 57, 58], TYOP [0, 66, 67], TYOP [0, 9, 72], TYOP [0, 2, 73],
   TYOP [0, 80, 18], TYOP [0, 194, 18], TYOP [0, 90, 18],
   TYOP [0, 196, 18], TYOP [0, 81, 18], TYOP [0, 198, 18],
   TYOP [0, 91, 18], TYOP [0, 200, 18], TYOP [0, 82, 18],
   TYOP [0, 202, 18], TYOP [0, 92, 18], TYOP [0, 204, 18],
   TYOP [0, 83, 18], TYOP [0, 206, 18], TYOP [0, 93, 18],
   TYOP [0, 208, 18], TYOP [0, 84, 18], TYOP [0, 210, 18],
   TYOP [0, 94, 18], TYOP [0, 212, 18], TYOP [0, 7, 7], TYOP [0, 7, 214],
   TYOP [0, 18, 215], TYOP [0, 0, 61], TYOP [0, 217, 61],
   TYOP [0, 20, 218], TYOP [0, 0, 219], TYOP [0, 0, 63], TYOP [0, 221, 63],
   TYOP [0, 0, 222], TYOP [0, 0, 223], TYOP [0, 0, 59], TYOP [0, 225, 59],
   TYOP [0, 7, 226], TYOP [0, 0, 227], TYOP [0, 0, 57], TYOP [0, 229, 57],
   TYOP [0, 56, 230], TYOP [0, 0, 231], TYOP [0, 0, 66], TYOP [0, 233, 66],
   TYOP [0, 65, 234], TYOP [0, 0, 235], TYOP [6, 68, 6], TYOP [0, 87, 237],
   TYOP [0, 85, 238], TYOP [3, 171], TYOP [0, 240, 172], TYOP [0, 85, 241],
   TYOP [0, 77, 79], TYOP [0, 86, 243], TYOP [6, 1, 68], TYOP [0, 7, 245],
   TYOP [0, 86, 246], TYOP [0, 181, 22], TYOP [0, 24, 248], TYOP [2, 6],
   TYOP [0, 77, 250], TYOP [0, 9, 251], TYOP [0, 6, 77], TYOP [0, 68, 87],
   TYOP [0, 1, 7], TYOP [0, 171, 240], TYOP [0, 21, 181],
   TYOP [0, 62, 204], TYOP [0, 64, 208], TYOP [0, 60, 200],
   TYOP [0, 58, 196], TYOP [0, 67, 212], TYOP [0, 237, 87],
   TYOP [0, 85, 263], TYOP [0, 79, 77], TYOP [0, 86, 265],
   TYOP [0, 245, 7], TYOP [0, 86, 267], TYOP [0, 22, 181],
   TYOP [0, 24, 269], TYOP [0, 250, 77], TYOP [0, 9, 271],
   TYOP [0, 87, 171], TYOP [0, 7, 0], TYOP [0, 4, 274], TYOP [0, 6, 85],
   TYOP [0, 68, 86], TYOP [0, 171, 172], TYOP [0, 85, 278],
   TYOP [0, 172, 151], TYOP [0, 85, 280]]
  end
  val _ = Theory.incorporate_consts "cipher" tyvector
     [("symMsg_size", 5), ("symMsg_CASE", 12), ("symKey_size", 13),
      ("symKey_CASE", 16), ("sym", 17), ("signVerify", 25), ("sign", 27),
      ("pubK", 28), ("privK", 28), ("pKey_size", 31), ("pKey_CASE", 35),
      ("hash", 36), ("digest_size", 38), ("digest_CASE", 40),
      ("deciphS", 42), ("deciphP", 45), ("asymMsg_size", 48),
      ("asymMsg_CASE", 51), ("Es", 53), ("Ea", 55)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'asymMsg'", 58), TMV("'digest'", 60), TMV("'pKey'", 62),
   TMV("'symKey'", 64), TMV("'symMsg'", 67), TMV("M", 43), TMV("M", 21),
   TMV("M", 24), TMV("M", 9), TMV("M", 2), TMV("M'", 43), TMV("M'", 21),
   TMV("M'", 24), TMV("M'", 9), TMV("M'", 2), TMV("P", 6), TMV("P", 68),
   TMV("P", 20), TMV("P", 69), TMV("P", 70), TMV("P", 71), TMV("P", 72),
   TMV("P", 74), TMV("P", 73), TMV("P'", 75), TMV("P1", 6), TMV("P1", 68),
   TMV("P2", 6), TMV("P2", 68), TMV("a", 20), TMV("a", 43), TMV("a", 0),
   TMV("a", 7), TMV("a'", 20), TMV("a'", 0), TMV("a'", 7), TMV("a0", 24),
   TMV("a0", 61), TMV("a0", 63), TMV("a0", 59), TMV("a0", 9),
   TMV("a0'", 24), TMV("a0'", 57), TMV("a0'", 66), TMV("a0'", 9),
   TMV("a1", 7), TMV("a1'", 7), TMV("aa", 43), TMV("asymMsg", 76),
   TMV("c", 77), TMV("d", 21), TMV("dd", 21), TMV("dgst", 21),
   TMV("digest", 78), TMV("enMsg", 79), TMV("enMsg", 2), TMV("f", 4),
   TMV("f", 32), TMV("f", 30), TMV("f", 14), TMV("f", 8), TMV("f", 49),
   TMV("f", 10), TMV("f'", 32), TMV("f'", 14), TMV("f'", 8), TMV("f'", 49),
   TMV("f'", 10), TMV("f0", 32), TMV("f1", 32), TMV("f1", 30),
   TMV("f1'", 32), TMV("fn", 80), TMV("fn", 81), TMV("fn", 82),
   TMV("fn", 83), TMV("fn", 84), TMV("k", 85), TMV("k", 9), TMV("k1", 86),
   TMV("k1", 24), TMV("k1", 9), TMV("k2", 86), TMV("k2", 24), TMV("k2", 9),
   TMV("key", 24), TMV("key", 9), TMV("m1", 68), TMV("m1", 87),
   TMV("m2", 68), TMV("m2", 87), TMV("msg", 6), TMV("msg", 1),
   TMV("msgContents", 7), TMV("n", 0), TMV("o", 7), TMV("p", 20),
   TMV("p", 86), TMV("p", 24), TMV("pKey", 89), TMV("pp", 24),
   TMV("pubKey", 24), TMV("pubKey1", 85), TMV("pubKey2", 85),
   TMV("rep", 90), TMV("rep", 91), TMV("rep", 92), TMV("rep", 93),
   TMV("rep", 94), TMV("s", 9), TMV("s", 2), TMV("signature", 22),
   TMV("ss", 9), TMV("ss", 2), TMV("symKey", 95), TMV("symMsg", 96),
   TMV("text", 6), TMV("text", 68), TMV("text", 1), TMV("text1", 6),
   TMV("text1", 68), TMV("text2", 6), TMV("text2", 68), TMV("v", 24),
   TMV("v", 9), TMV("v1", 43), TMV("v1", 2), TMV("x", 6), TMV("x", 1),
   TMV("y", 6), TMC(11, 98), TMC(11, 100), TMC(11, 102), TMC(11, 104),
   TMC(11, 106), TMC(11, 107), TMC(11, 109), TMC(11, 110), TMC(11, 112),
   TMC(11, 114), TMC(11, 116), TMC(11, 117), TMC(11, 118), TMC(11, 120),
   TMC(11, 122), TMC(11, 124), TMC(11, 126), TMC(11, 128), TMC(11, 130),
   TMC(11, 132), TMC(11, 134), TMC(11, 136), TMC(11, 138), TMC(11, 140),
   TMC(11, 142), TMC(11, 144), TMC(11, 146), TMC(11, 148), TMC(11, 150),
   TMC(11, 152), TMC(11, 153), TMC(11, 155), TMC(11, 157), TMC(11, 123),
   TMC(11, 129), TMC(11, 131), TMC(11, 133), TMC(11, 135), TMC(11, 137),
   TMC(11, 139), TMC(11, 145), TMC(12, 159), TMC(13, 161), TMC(13, 163),
   TMC(14, 165), TMC(15, 0), TMC(16, 166), TMC(16, 167), TMC(16, 168),
   TMC(16, 169), TMC(16, 170), TMC(16, 174), TMC(16, 175), TMC(16, 165),
   TMC(16, 176), TMC(16, 177), TMC(16, 178), TMC(16, 179), TMC(16, 180),
   TMC(16, 183), TMC(16, 184), TMC(16, 185), TMC(16, 186), TMC(16, 187),
   TMC(16, 188), TMC(16, 189), TMC(16, 190), TMC(16, 191), TMC(16, 192),
   TMC(16, 193), TMC(17, 165), TMC(18, 104), TMC(18, 195), TMC(18, 197),
   TMC(18, 199), TMC(18, 201), TMC(18, 203), TMC(18, 205), TMC(18, 207),
   TMC(18, 209), TMC(18, 211), TMC(18, 213), TMC(18, 148), TMC(18, 153),
   TMC(18, 123), TMC(18, 139), TMC(19, 158), TMC(20, 61), TMC(20, 63),
   TMC(20, 59), TMC(20, 57), TMC(20, 66), TMC(21, 216), TMC(22, 220),
   TMC(22, 224), TMC(22, 228), TMC(22, 232), TMC(22, 236), TMC(23, 164),
   TMC(24, 239), TMC(24, 242), TMC(24, 244), TMC(24, 247), TMC(24, 55),
   TMC(24, 249), TMC(25, 252), TMC(25, 53), TMC(26, 77), TMC(26, 7),
   TMC(27, 158), TMC(28, 253), TMC(28, 254), TMC(28, 255), TMC(28, 256),
   TMC(28, 257), TMC(29, 158), TMC(30, 258), TMC(30, 259), TMC(30, 260),
   TMC(30, 261), TMC(30, 262), TMC(31, 0), TMC(32, 165), TMC(33, 51),
   TMC(34, 48), TMC(35, 264), TMC(35, 266), TMC(35, 268), TMC(35, 45),
   TMC(35, 270), TMC(36, 272), TMC(36, 42), TMC(37, 40), TMC(38, 38),
   TMC(39, 273), TMC(39, 36), TMC(40, 275), TMC(41, 35), TMC(42, 31),
   TMC(43, 276), TMC(43, 277), TMC(43, 28), TMC(44, 276), TMC(44, 277),
   TMC(44, 28), TMC(45, 279), TMC(45, 27), TMC(46, 281), TMC(46, 25),
   TMC(47, 17), TMC(48, 16), TMC(49, 13), TMC(50, 12), TMC(51, 5),
   TMC(52, 164)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op symKey_TY_DEF x = x
    val op symKey_TY_DEF =
    ThmBind.DT(((("cipher",0),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%209%107%247%38%149%3%200%165%38%200%212%31%194$1@%31%224%175@$0@%94%218|@|$0@2|@2$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op symKey_case_def x = x
    val op symKey_case_def =
    ThmBind.DT(((("cipher",4),
                [("bool",[26,180]),("cipher",[1,2,3]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%157%31%143%59%176%280%279$1@2$0@2$0$1@2|@|@"])
  fun op symKey_size_def x = x
    val op symKey_size_def =
    ThmBind.DT(((("cipher",5),
                [("bool",[26,180]),("cipher",[1,2,3]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%157%31%185%281%279$0@3%171%239%216%251@3$0@2|@"])
  fun op symMsg_TY_DEF x = x
    val op symMsg_TY_DEF =
    ThmBind.DT(((("cipher",12),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%211%108%250%43%152%4%200%168%43%200%215%40%213%45%197$2@%40%45%227%175@%173$1@$0@2%94%221|@||$1@$0@2|@|@2$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op symMsg_case_def x = x
    val op symMsg_case_def =
    ThmBind.DT(((("cipher",16),
                [("bool",[26,180]),("cipher",[13,14,15]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%169%40%160%45%154%62%176%282%236$2@$1@2$0@2$0$2@$1@2|@|@|@"])
  fun op symMsg_size_def x = x
    val op symMsg_size_def =
    ThmBind.DT(((("cipher",17),
                [("bool",[26,180]),("cipher",[13,14,15]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%138%56%169%40%160%45%185%283$2@%236$1@$0@3%171%239%216%251@3%171%281$1@2%266$2@$0@4|@|@|@"])
  fun op pKey_TY_DEF x = x
    val op pKey_TY_DEF =
    ThmBind.DT(((("cipher",30),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%207%106%246%37%148%2%200%164%37%200%252%201%29%193$1@%29%223%175@$0@%94%217|@|$0@2|@2%201%29%193$1@%29%223%245%175@2$0@%94%217|@|$0@2|@3$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op pKey_case_def x = x
    val op pKey_case_def =
    ThmBind.DT(((("cipher",36),
                [("bool",[26,180]),("cipher",[31,32,33,34,35]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%174%133%29%139%57%139%69%176%267%274$2@2$1@$0@2$1$2@2|@|@|@2%133%29%139%57%139%69%176%267%271$2@2$1@$0@2$0$2@2|@|@|@2"])
  fun op pKey_size_def x = x
    val op pKey_size_def =
    ThmBind.DT(((("cipher",37),
                [("bool",[26,180]),("cipher",[31,32,33,34,35]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%174%140%58%133%29%185%268$1@%274$0@3%171%239%216%251@3$1$0@3|@|@2%140%58%133%29%185%268$1@%271$0@3%171%239%216%251@3$1$0@3|@|@2"])
  fun op asymMsg_TY_DEF x = x
    val op asymMsg_TY_DEF =
    ThmBind.DT(((("cipher",45),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%203%104%249%42%151%0%200%167%42%200%214%36%213%45%196$2@%36%45%226%175@%172$1@$0@2%94%220|@||$1@$0@2|@|@2$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op asymMsg_case_def x = x
    val op asymMsg_case_def =
    ThmBind.DT(((("cipher",49),
                [("bool",[26,180]),("cipher",[46,47,48]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%163%36%160%45%147%61%176%253%233$2@$1@2$0@2$0$2@$1@2|@|@|@"])
  fun op asymMsg_size_def x = x
    val op asymMsg_size_def =
    ThmBind.DT(((("cipher",50),
                [("bool",[26,180]),("cipher",[46,47,48]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%138%56%140%70%163%36%160%45%185%254$3@$2@%233$1@$0@3%171%239%216%251@3%171%268$2@$1@2%266$3@$0@4|@|@|@|@"])
  fun op digest_TY_DEF x = x
    val op digest_TY_DEF =
    ThmBind.DT(((("cipher",64),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%205%105%248%39%150%1%200%166%39%200%213%32%195$1@%32%225%175@$0@%94%219|@|$0@2|@2$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op digest_case_def x = x
    val op digest_case_def =
    ThmBind.DT(((("cipher",68),
                [("bool",[26,180]),("cipher",[65,66,67]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%160%32%144%60%176%262%265$1@2$0@2$0$1@2|@|@"])
  fun op digest_size_def x = x
    val op digest_size_def =
    ThmBind.DT(((("cipher",69),
                [("bool",[26,180]),("cipher",[65,66,67]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%138%56%160%32%185%263$1@%265$0@3%171%239%216%251@3%266$1@$0@3|@|@"])
  fun op sign_def x = x
    val op sign_def =
    ThmBind.DT(((("cipher",77),[]),[]),
               [ThmBind.read"%163%101%137%52%182%276$1@$0@2%234$1@%244$0@3|@|@"])
  fun op signVerify_def x = x
    val op signVerify_def =
    ThmBind.DT(((("cipher",78),[]),[]),
               [ThmBind.read"%163%101%136%111%160%93%183%278$2@$1@$0@2%189%244%265$0@3%259$2@$1@3|@|@|@"])
  fun op datatype_symKey x = x
    val op datatype_symKey =
    ThmBind.DT(((("cipher",6),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%228%114%279@2"])
  fun op symKey_11 x = x
    val op symKey_11 =
    ThmBind.DT(((("cipher",7),
                [("bool",[26,55,62,180]),("cipher",[1,2,3]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%157%31%157%34%183%198%279$1@2%279$0@3%185$1@$0@2|@|@"])
  fun op symKey_case_cong x = x
    val op symKey_case_cong =
    ThmBind.DT(((("cipher",8),
                [("bool",[26,180]),("cipher",[1,2,3,4])]),["DISK_THM"]),
               [ThmBind.read"%169%8%169%13%143%59%200%174%198$2@$1@2%157%31%200%198$2@%279$0@3%176$1$0@2%64$0@3|@3%176%280$2@$0@2%280$1@%64@3|@|@|@"])
  fun op symKey_nchotomy x = x
    val op symKey_nchotomy =
    ThmBind.DT(((("cipher",9),
                [("bool",[26,180]),("cipher",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%169%112%212%94%198$1@%279$0@2|@|@"])
  fun op symKey_Axiom x = x
    val op symKey_Axiom =
    ThmBind.DT(((("cipher",10),
                [("bool",[26,180]),("cipher",[1,2,3]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%143%59%208%75%157%31%176$1%279$0@3$2$0@2|@|@|@"])
  fun op symKey_induction x = x
    val op symKey_induction =
    ThmBind.DT(((("cipher",11),
                [("bool",[26]),("cipher",[1,2,3])]),["DISK_THM"]),
               [ThmBind.read"%153%21%200%157%94$1%279$0@2|@2%169%109$1$0@|@2|@"])
  fun op datatype_symMsg x = x
    val op datatype_symMsg =
    ThmBind.DT(((("cipher",18),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%228%115%236@2"])
  fun op symMsg_11 x = x
    val op symMsg_11 =
    ThmBind.DT(((("cipher",19),
                [("bool",[26,50,55,62,180]),("cipher",[13,14,15]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%169%40%160%45%169%44%160%46%183%199%236$3@$2@2%236$1@$0@3%174%198$3@$1@2%188$2@$0@3|@|@|@|@"])
  fun op symMsg_case_cong x = x
    val op symMsg_case_cong =
    ThmBind.DT(((("cipher",20),
                [("bool",[26,180]),
                 ("cipher",[13,14,15,16])]),["DISK_THM"]),
               [ThmBind.read"%170%9%170%14%154%62%200%174%199$2@$1@2%169%40%160%45%200%199$3@%236$1@$0@3%176$2$1@$0@2%67$1@$0@3|@|@3%176%282$2@$0@2%282$1@%67@3|@|@|@"])
  fun op symMsg_nchotomy x = x
    val op symMsg_nchotomy =
    ThmBind.DT(((("cipher",21),
                [("bool",[26,180]),("cipher",[13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%170%113%215%109%213%95%199$2@%236$1@$0@2|@|@|@"])
  fun op symMsg_Axiom x = x
    val op symMsg_Axiom =
    ThmBind.DT(((("cipher",22),
                [("bool",[26,180]),("cipher",[13,14,15]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%154%62%210%76%169%40%160%45%176$2%236$1@$0@3$3$1@$0@2|@|@|@|@"])
  fun op symMsg_induction x = x
    val op symMsg_induction =
    ThmBind.DT(((("cipher",23),
                [("bool",[26]),("cipher",[13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%156%23%200%169%109%160%95$2%236$1@$0@2|@|@2%170%110$1$0@|@2|@"])
  fun op symKey_one_one x = x
    val op symKey_one_one =
    ThmBind.DT(((("cipher",24),
                [("bool",[26,55,62,180]),("cipher",[1,2,3]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%157%31%157%34%183%198%279$1@2%279$0@3%185$1@$0@2|@|@"])
  fun op symMsg_one_one x = x
    val op symMsg_one_one =
    ThmBind.DT(((("cipher",25),
                [("bool",[26,50,55,62,180]),("cipher",[13,14,15]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%169%40%160%45%169%44%160%46%183%199%236$3@$2@2%236$1@$0@3%174%198$3@$1@2%188$2@$0@3|@|@|@|@"])
  fun op deciphS_ind x = x
    val op deciphS_ind =
    ThmBind.DT(((("cipher",28),
                [("bool",[25,26,46,47,52,53,57,62,71,75,77,79,180]),
                 ("cipher",[13,14,15]),("option",[6]),("pair",[5,16]),
                 ("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%155%22%200%174%169%81%169%84%132%128$3$2@%236$1@%242$0@3|@|@|@2%169%81%169%84$2$1@%236$0@%238@2|@|@3%169%124%170%126$2$1@$0@|@|@2|@"])
  fun op deciphS_def x = x
    val op deciphS_def =
    ThmBind.DT(((("cipher",29),
                [("bool",[15,57]),("cipher",[16,26,27]),("combin",[19]),
                 ("option",[7]),("pair",[49]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%174%188%261%81@%236%84@%242%128@4%222%198%81@%84@2%242%128@2%238@3%188%261%81@%236%84@%238@3%238@2"])
  fun op datatype_pKey x = x
    val op datatype_pKey =
    ThmBind.DT(((("cipher",38),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%228%99%274@%271@2"])
  fun op pKey_11 x = x
    val op pKey_11 =
    ThmBind.DT(((("cipher",39),
                [("bool",[26,55,62,180]),("cipher",[31,32,33,34,35]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%174%133%29%133%33%183%192%274$1@2%274$0@3%178$1@$0@2|@|@2%133%29%133%33%183%192%271$1@2%271$0@3%178$1@$0@2|@|@2"])
  fun op pKey_distinct x = x
    val op pKey_distinct =
    ThmBind.DT(((("cipher",40),
                [("bool",[25,26,46,53,62,180]),("cipher",[31,32,33,34,35]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%133%33%133%29%284%192%274$0@2%271$1@3|@|@"])
  fun op pKey_case_cong x = x
    val op pKey_case_cong =
    ThmBind.DT(((("cipher",41),
                [("bool",[26,180]),
                 ("cipher",[31,32,33,34,35,36])]),["DISK_THM"]),
               [ThmBind.read"%163%7%163%12%139%57%139%69%200%174%192$3@$2@2%174%133%29%200%192$3@%274$0@3%176$2$0@2%63$0@3|@2%133%29%200%192$3@%271$0@3%176$1$0@2%71$0@3|@4%176%267$3@$1@$0@2%267$2@%63@%71@3|@|@|@|@"])
  fun op pKey_nchotomy x = x
    val op pKey_nchotomy =
    ThmBind.DT(((("cipher",42),
                [("bool",[26,180]),
                 ("cipher",[31,32,33,34,35])]),["DISK_THM"]),
               [ThmBind.read"%163%100%252%201%96%192$1@%274$0@2|@2%201%96%192$1@%271$0@2|@2|@"])
  fun op pKey_Axiom x = x
    val op pKey_Axiom =
    ThmBind.DT(((("cipher",43),
                [("bool",[26,180]),("cipher",[31,32,33,34,35]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%139%68%139%69%206%74%174%133%29%176$1%274$0@3$3$0@2|@2%133%29%176$1%271$0@3$2$0@2|@2|@|@|@"])
  fun op pKey_induction x = x
    val op pKey_induction =
    ThmBind.DT(((("cipher",44),
                [("bool",[26]),("cipher",[31,32,33,34,35])]),["DISK_THM"]),
               [ThmBind.read"%145%20%200%174%133%96$1%274$0@2|@2%133%96$1%271$0@2|@3%163%98$1$0@|@2|@"])
  fun op datatype_asymMsg x = x
    val op datatype_asymMsg =
    ThmBind.DT(((("cipher",51),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%228%48%233@2"])
  fun op asymMsg_11 x = x
    val op asymMsg_11 =
    ThmBind.DT(((("cipher",52),
                [("bool",[26,50,55,62,180]),("cipher",[46,47,48]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%163%36%160%45%163%41%160%46%183%180%233$3@$2@2%233$1@$0@3%174%192$3@$1@2%188$2@$0@3|@|@|@|@"])
  fun op asymMsg_case_cong x = x
    val op asymMsg_case_cong =
    ThmBind.DT(((("cipher",53),
                [("bool",[26,180]),
                 ("cipher",[46,47,48,49])]),["DISK_THM"]),
               [ThmBind.read"%135%5%135%10%147%61%200%174%180$2@$1@2%163%36%160%45%200%180$3@%233$1@$0@3%176$2$1@$0@2%66$1@$0@3|@|@3%176%253$2@$0@2%253$1@%66@3|@|@|@"])
  fun op asymMsg_nchotomy x = x
    val op asymMsg_nchotomy =
    ThmBind.DT(((("cipher",54),
                [("bool",[26,180]),("cipher",[46,47,48])]),["DISK_THM"]),
               [ThmBind.read"%135%47%214%98%213%95%180$2@%233$1@$0@2|@|@|@"])
  fun op asymMsg_Axiom x = x
    val op asymMsg_Axiom =
    ThmBind.DT(((("cipher",55),
                [("bool",[26,180]),("cipher",[46,47,48]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%147%61%202%72%163%36%160%45%176$2%233$1@$0@3$3$1@$0@2|@|@|@|@"])
  fun op asymMsg_induction x = x
    val op asymMsg_induction =
    ThmBind.DT(((("cipher",56),
                [("bool",[26]),("cipher",[46,47,48])]),["DISK_THM"]),
               [ThmBind.read"%141%18%200%163%98%160%95$2%233$1@$0@2|@|@2%135%30$1$0@|@2|@"])
  fun op pKey_one_one x = x
    val op pKey_one_one =
    ThmBind.DT(((("cipher",57),
                [("bool",[26,55,62,180]),("cipher",[31,32,33,34,35]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%174%133%29%133%33%183%192%274$1@2%274$0@3%178$1@$0@2|@|@2%133%29%133%33%183%192%271$1@2%271$0@3%178$1@$0@2|@|@2"])
  fun op pKey_distinct_clauses x = x
    val op pKey_distinct_clauses =
    ThmBind.DT(((("cipher",58),
                [("bool",[25,26,46,53,57,62,180]),
                 ("cipher",[31,32,33,34,35]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%174%133%33%133%29%284%192%274$0@2%271$1@3|@|@2%133%33%133%29%284%192%271$1@2%274$0@3|@|@2"])
  fun op asymMsg_one_one x = x
    val op asymMsg_one_one =
    ThmBind.DT(((("cipher",59),
                [("bool",[26,50,55,62,180]),("cipher",[46,47,48]),
                 ("ind_type",[33,34]),("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%163%36%160%45%163%41%160%46%183%180%233$3@$2@2%233$1@$0@3%174%192$3@$1@2%188$2@$0@3|@|@|@|@"])
  fun op deciphP_ind x = x
    val op deciphP_ind =
    ThmBind.DT(((("cipher",62),
                [("bool",[25,26,46,47,52,53,57,62,71,75,76,77,79,180]),
                 ("cipher",[31,32,33,34,35,46,47,48]),("option",[6]),
                 ("pair",[5,16]),("relation",[107,113]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%146%24%200%174%163%85%133%17%132%128$3$2@%233%271$1@2%242$0@3|@|@|@2%174%163%85%133%17%132%128$3$2@%233%274$1@2%242$0@3|@|@|@2%163%80%163%83$2$1@%233$0@%238@2|@|@4%163%123%135%125$2$1@$0@|@|@2|@"])
  fun op deciphP_def x = x
    val op deciphP_def =
    ThmBind.DT(((("cipher",63),
                [("bool",[15,57]),("cipher",[36,49,60,61]),("combin",[19]),
                 ("option",[7]),("pair",[49]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%174%188%258%85@%233%271%17@2%242%128@4%222%192%85@%274%17@3%242%128@2%238@3%174%188%258%85@%233%274%17@2%242%128@4%222%192%85@%271%17@3%242%128@2%238@3%188%258%80@%233%83@%238@3%238@3"])
  fun op datatype_digest x = x
    val op datatype_digest =
    ThmBind.DT(((("cipher",70),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%228%53%265@2"])
  fun op digest_11 x = x
    val op digest_11 =
    ThmBind.DT(((("cipher",71),
                [("bool",[26,55,62,180]),("cipher",[65,66,67]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%160%32%160%35%183%184%265$1@2%265$0@3%188$1@$0@2|@|@"])
  fun op digest_case_cong x = x
    val op digest_case_cong =
    ThmBind.DT(((("cipher",72),
                [("bool",[26,180]),
                 ("cipher",[65,66,67,68])]),["DISK_THM"]),
               [ThmBind.read"%137%6%137%11%144%60%200%174%184$2@$1@2%160%32%200%184$2@%265$0@3%176$1$0@2%65$0@3|@3%176%262$2@$0@2%262$1@%65@3|@|@|@"])
  fun op digest_nchotomy x = x
    val op digest_nchotomy =
    ThmBind.DT(((("cipher",73),
                [("bool",[26,180]),("cipher",[65,66,67])]),["DISK_THM"]),
               [ThmBind.read"%137%51%213%95%184$1@%265$0@2|@|@"])
  fun op digest_Axiom x = x
    val op digest_Axiom =
    ThmBind.DT(((("cipher",74),
                [("bool",[26,180]),("cipher",[65,66,67]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%144%60%204%73%160%32%176$1%265$0@3$2$0@2|@|@|@"])
  fun op digest_induction x = x
    val op digest_induction =
    ThmBind.DT(((("cipher",75),
                [("bool",[26]),("cipher",[65,66,67])]),["DISK_THM"]),
               [ThmBind.read"%142%19%200%160%95$1%265$0@2|@2%137%50$1$0@|@2|@"])
  fun op digest_one_one x = x
    val op digest_one_one =
    ThmBind.DT(((("cipher",76),
                [("bool",[26,55,62,180]),("cipher",[65,66,67]),
                 ("ind_type",[33,34])]),["DISK_THM"]),
               [ThmBind.read"%160%32%160%35%183%184%265$1@2%265$0@3%188$1@$0@2|@|@"])
  fun op signVerifyOK x = x
    val op signVerifyOK =
    ThmBind.DT(((("cipher",79),
                [("bool",[15,25,35,55,57,63]),
                 ("cipher",[36,49,60,61,77,78]),("combin",[19]),
                 ("option",[7]),("pair",[49]),
                 ("relation",[113,132])]),["DISK_THM"]),
               [ThmBind.read"%133%17%132%92%278%274$1@2%276%271$1@2%265%242$0@4%242$0@2|@|@"])
  fun op option_distinct x = x
    val op option_distinct =
    ThmBind.DT(((("cipher",80),[("option",[11])]),["DISK_THM"]),
               [ThmBind.read"%130%127%284%186%237@%240$0@3|@"])
  fun op deciphP_clauses x = x
    val op deciphP_clauses =
    ThmBind.DT(((("cipher",81),
                [("bool",
                 [13,15,25,26,27,42,46,47,52,53,55,57,62,63,70,72,93,108,
                  110,180]),("cipher",[31,32,33,34,35,36,49,60,61,80]),
                 ("combin",[19]),("ind_type",[33,34]),("option",[7]),
                 ("pair",[49]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%174%130%15%131%117%174%187%255%272$1@2%229%269$1@2%241$0@4%241$0@3%187%255%269$1@2%229%272$1@2%241$0@4%241$0@3|@|@2%174%161%77%130%15%131%117%183%187%255$2@%229%269$1@2%241$0@4%241$0@3%190$2@%272$1@3|@|@|@2%174%161%77%130%15%131%117%183%187%255$2@%229%272$1@2%241$0@4%241$0@3%190$2@%269$1@3|@|@|@2%174%132%128%162%82%162%79%131%28%131%26%174%188%257%273$0@2%232%273$1@2%242$4@4%238@2%188%257$2@%232$3@%238@3%238@2|@|@|@|@|@2%132%128%131%28%131%26%188%257%270$0@2%232%270$1@2%242$2@4%238@|@|@|@5"])
  fun op deciphS_clauses x = x
    val op deciphS_clauses =
    ThmBind.DT(((("cipher",82),
                [("bool",
                 [13,15,25,26,27,29,35,46,47,52,53,55,57,62,63,70,72,93,
                  108,110]),("cipher",[16,26,27,80]),("combin",[19]),
                 ("option",[7,12]),("pair",[49]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%174%169%78%130%116%186%260$1@%235$1@%240$0@4%240$0@2|@|@2%174%169%81%169%84%130%116%183%186%260$2@%235$1@%240$0@4%240$0@3%198$2@$1@2|@|@|@2%174%169%81%169%84%130%116%183%186%260$2@%235$1@%240$0@4%237@2%284%198$2@$1@3|@|@|@2%169%81%169%84%186%260$1@%235$0@%237@3%237@|@|@4"])
  fun op option_one_one x = x
    val op option_one_one =
    ThmBind.DT(((("cipher",83),[("option",[10])]),["DISK_THM"]),
               [ThmBind.read"%130%127%130%129%183%186%240$1@2%240$0@3%176$1@$0@2|@|@"])
  fun op sign_one_one x = x
    val op sign_one_one =
    ThmBind.DT(((("cipher",84),
                [("bool",[25,26,46,47,50,52,53,55,57,62,70,92,93,95,180]),
                 ("cipher",[46,47,48,65,66,67,77]),("ind_type",[33,34]),
                 ("option",[10]),("pair",[8,9]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%161%102%161%103%159%88%159%90%183%181%275$3@%264$1@3%275$2@%264$0@4%174%190$3@$2@2%187$1@$0@3|@|@|@|@"])
  fun op deciphS_one_one x = x
    val op deciphS_one_one =
    ThmBind.DT(((("cipher",85),
                [("bool",
                 [13,15,25,26,27,29,35,42,46,47,50,51,52,53,55,57,62,63,70,
                  72,73,74,92,93,95,180]),
                 ("cipher",[13,14,15,16,26,27,82]),("combin",[19]),
                 ("ind_type",[33,34]),("option",[6,7,10,11,25]),
                 ("pair",[8,9,49]),("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%174%169%81%169%84%130%119%130%121%183%186%260$3@%235$2@%240$0@4%240$1@3%174%198$3@$2@2%176$1@$0@3|@|@|@|@2%170%55%132%118%169%86%183%188%261$0@$2@2%242$1@3%199$2@%236$0@%242$1@4|@|@|@2"])
  fun op deciphP_one_one x = x
    val op deciphP_one_one =
    ThmBind.DT(((("cipher",86),
                [("bool",
                 [13,15,25,26,27,29,35,42,46,47,50,51,52,53,55,57,62,63,64,
                  70,72,92,93,95,107,108,110,180]),
                 ("cipher",[31,32,33,34,35,36,46,47,48,49,60,61,81]),
                 ("combin",[19]),("ind_type",[33,34]),
                 ("option",[6,7,10,11]),("pair",[8,9,49]),
                 ("relation",[113,132]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%174%130%25%130%27%131%120%131%122%183%187%255%272$3@2%229%269$2@2%241$0@4%241$1@3%174%176$3@$2@2%177$1@$0@3|@|@|@|@2%174%130%25%130%27%131%120%131%122%183%187%255%269$3@2%229%272$2@2%241$0@4%241$1@3%174%176$3@$2@2%177$1@$0@3|@|@|@|@2%174%162%97%158%49%131%16%130%91%183%186%256%273$1@2%231$3@$2@3%240$0@3%174%191$3@%270$1@3%186$2@%240$0@4|@|@|@|@2%174%134%54%131%16%130%91%183%186%256%273$1@2$2@2%240$0@3%179$2@%231%270$1@2%240$0@4|@|@|@2%174%162%97%158%49%131%16%130%91%183%186%256%270$1@2%231$3@$2@3%240$0@3%174%191$3@%273$1@3%186$2@%240$0@4|@|@|@|@2%134%54%131%16%130%91%183%186%256%270$1@2$2@2%240$0@3%179$2@%231%273$1@2%240$0@4|@|@|@6"])
  fun op signVerify_one_one x = x
    val op signVerify_one_one =
    ThmBind.DT(((("cipher",87),
                [("bool",
                 [13,15,25,26,27,29,35,42,46,47,50,51,52,53,55,57,62,63,64,
                  70,72,92,93,95,107,108,110,180]),
                 ("cipher",
                 [31,32,33,34,35,36,46,47,48,49,60,61,65,66,67,77,78,79,
                  81]),("combin",[19]),("ind_type",[33,34]),
                 ("option",[6,7,10,11]),("pair",[8,9,49]),
                 ("relation",[113,132]),
                 ("sat",
                 [1,3,5,6,7,11,12,13,14,15,17,18,19,20,
                  23])]),["DISK_THM"]),
               [ThmBind.read"%174%130%15%131%87%131%89%183%277%272$2@2%230%269$2@2%243%264%241$1@5%241$0@3%177$1@$0@2|@|@|@2%174%136%111%133%17%132%118%183%278%274$1@2$2@%242$0@3%182$2@%276%271$1@2%265%242$0@5|@|@|@2%131%122%131%120%130%27%130%25%183%277%272$0@2%275%269$1@2%264%241$3@4%241$2@3%174%176$0@$1@2%177$2@$3@3|@|@|@|@3"])

  val _ = DB.bindl "cipher"
  [("symKey_TY_DEF",symKey_TY_DEF,DB.Def),
   ("symKey_case_def",symKey_case_def,DB.Def),
   ("symKey_size_def",symKey_size_def,DB.Def),
   ("symMsg_TY_DEF",symMsg_TY_DEF,DB.Def),
   ("symMsg_case_def",symMsg_case_def,DB.Def),
   ("symMsg_size_def",symMsg_size_def,DB.Def),
   ("pKey_TY_DEF",pKey_TY_DEF,DB.Def),
   ("pKey_case_def",pKey_case_def,DB.Def),
   ("pKey_size_def",pKey_size_def,DB.Def),
   ("asymMsg_TY_DEF",asymMsg_TY_DEF,DB.Def),
   ("asymMsg_case_def",asymMsg_case_def,DB.Def),
   ("asymMsg_size_def",asymMsg_size_def,DB.Def),
   ("digest_TY_DEF",digest_TY_DEF,DB.Def),
   ("digest_case_def",digest_case_def,DB.Def),
   ("digest_size_def",digest_size_def,DB.Def),
   ("sign_def",sign_def,DB.Def), ("signVerify_def",signVerify_def,DB.Def),
   ("datatype_symKey",datatype_symKey,DB.Thm),
   ("symKey_11",symKey_11,DB.Thm),
   ("symKey_case_cong",symKey_case_cong,DB.Thm),
   ("symKey_nchotomy",symKey_nchotomy,DB.Thm),
   ("symKey_Axiom",symKey_Axiom,DB.Thm),
   ("symKey_induction",symKey_induction,DB.Thm),
   ("datatype_symMsg",datatype_symMsg,DB.Thm),
   ("symMsg_11",symMsg_11,DB.Thm),
   ("symMsg_case_cong",symMsg_case_cong,DB.Thm),
   ("symMsg_nchotomy",symMsg_nchotomy,DB.Thm),
   ("symMsg_Axiom",symMsg_Axiom,DB.Thm),
   ("symMsg_induction",symMsg_induction,DB.Thm),
   ("symKey_one_one",symKey_one_one,DB.Thm),
   ("symMsg_one_one",symMsg_one_one,DB.Thm),
   ("deciphS_ind",deciphS_ind,DB.Thm), ("deciphS_def",deciphS_def,DB.Thm),
   ("datatype_pKey",datatype_pKey,DB.Thm), ("pKey_11",pKey_11,DB.Thm),
   ("pKey_distinct",pKey_distinct,DB.Thm),
   ("pKey_case_cong",pKey_case_cong,DB.Thm),
   ("pKey_nchotomy",pKey_nchotomy,DB.Thm),
   ("pKey_Axiom",pKey_Axiom,DB.Thm),
   ("pKey_induction",pKey_induction,DB.Thm),
   ("datatype_asymMsg",datatype_asymMsg,DB.Thm),
   ("asymMsg_11",asymMsg_11,DB.Thm),
   ("asymMsg_case_cong",asymMsg_case_cong,DB.Thm),
   ("asymMsg_nchotomy",asymMsg_nchotomy,DB.Thm),
   ("asymMsg_Axiom",asymMsg_Axiom,DB.Thm),
   ("asymMsg_induction",asymMsg_induction,DB.Thm),
   ("pKey_one_one",pKey_one_one,DB.Thm),
   ("pKey_distinct_clauses",pKey_distinct_clauses,DB.Thm),
   ("asymMsg_one_one",asymMsg_one_one,DB.Thm),
   ("deciphP_ind",deciphP_ind,DB.Thm), ("deciphP_def",deciphP_def,DB.Thm),
   ("datatype_digest",datatype_digest,DB.Thm),
   ("digest_11",digest_11,DB.Thm),
   ("digest_case_cong",digest_case_cong,DB.Thm),
   ("digest_nchotomy",digest_nchotomy,DB.Thm),
   ("digest_Axiom",digest_Axiom,DB.Thm),
   ("digest_induction",digest_induction,DB.Thm),
   ("digest_one_one",digest_one_one,DB.Thm),
   ("signVerifyOK",signVerifyOK,DB.Thm),
   ("option_distinct",option_distinct,DB.Thm),
   ("deciphP_clauses",deciphP_clauses,DB.Thm),
   ("deciphS_clauses",deciphS_clauses,DB.Thm),
   ("option_one_one",option_one_one,DB.Thm),
   ("sign_one_one",sign_one_one,DB.Thm),
   ("deciphS_one_one",deciphS_one_one,DB.Thm),
   ("deciphP_one_one",deciphP_one_one,DB.Thm),
   ("signVerify_one_one",signVerify_one_one,DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "cipher",
    thydataty = "compute",
    read = ThmBind.read,
    data =
        "cipher.deciphS_def cipher.signVerify_def cipher.sign_def cipher.deciphP_def"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "cipher",
    thydataty = "TypeGrammarDeltas",
    read = ThmBind.read,
    data =
        "NTY6.cipher,6.symKeyNTY6.cipher,6.symMsgNTY6.cipher,4.pKeyNTY6.cipher,7.asymMsgNTY6.cipher,6.digest"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "cipher",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO3.sym4.%279OO11.symKey_CASE4.%280OO11.symKey_size4.%281OO4.case4.%280OO2.Es4.%236OO11.symMsg_CASE4.%282OO11.symMsg_size4.%283OO4.case4.%282OO7.deciphS4.%261OO4.pubK4.%274OO5.privK4.%271OO9.pKey_CASE4.%267OO9.pKey_size4.%268OO4.case4.%267OO2.Ea4.%233OO12.asymMsg_CASE4.%253OO12.asymMsg_size4.%254OO4.case4.%253OO7.deciphP4.%258OO4.hash4.%265OO11.digest_CASE4.%262OO11.digest_size4.%263OO4.case4.%262OO4.sign4.%276OO10.signVerify4.%278"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val cipher_grammars = merge_grammars ["indexedLists", "patternMatches"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="cipher"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val cipher_grammars = 
    Portable.## (addtyUDs,addtmUDs) cipher_grammars
  val _ = Parse.grammarDB_insert("cipher",cipher_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG symKey_Axiom,
           case_def=symKey_case_def,
           case_cong=symKey_case_cong,
           induction=ORIG symKey_induction,
           nchotomy=symKey_nchotomy,
           size=SOME(Parse.Term`(cipher$symKey_size) :cipher$symKey -> num$num`,
                     ORIG symKey_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME symKey_11,
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
          {ax=ORIG symMsg_Axiom,
           case_def=symMsg_case_def,
           case_cong=symMsg_case_cong,
           induction=ORIG symMsg_induction,
           nchotomy=symMsg_nchotomy,
           size=SOME(Parse.Term`(cipher$symMsg_size) :('message -> num$num) -> 'message cipher$symMsg -> num$num`,
                     ORIG symMsg_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME symMsg_11,
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
          {ax=ORIG pKey_Axiom,
           case_def=pKey_case_def,
           case_cong=pKey_case_cong,
           induction=ORIG pKey_induction,
           nchotomy=pKey_nchotomy,
           size=SOME(Parse.Term`(cipher$pKey_size) :('princ -> num$num) -> 'princ cipher$pKey -> num$num`,
                     ORIG pKey_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME pKey_11,
           distinct=SOME pKey_distinct,
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
          {ax=ORIG asymMsg_Axiom,
           case_def=asymMsg_case_def,
           case_cong=asymMsg_case_cong,
           induction=ORIG asymMsg_induction,
           nchotomy=asymMsg_nchotomy,
           size=SOME(Parse.Term`(cipher$asymMsg_size) :('message -> num$num) ->
('princ -> num$num) -> ('message, 'princ) cipher$asymMsg -> num$num`,
                     ORIG asymMsg_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME asymMsg_11,
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
          {ax=ORIG digest_Axiom,
           case_def=digest_case_def,
           case_cong=digest_case_cong,
           induction=ORIG digest_induction,
           nchotomy=digest_nchotomy,
           size=SOME(Parse.Term`(cipher$digest_size) :('message -> num$num) -> 'message cipher$digest -> num$num`,
                     ORIG digest_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME digest_11,
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
val _ = Theory.load_complete "cipher"
end
