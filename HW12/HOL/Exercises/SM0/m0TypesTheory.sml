structure m0TypesTheory :> m0TypesTheory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading m0TypesTheory ... " else ()
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
          ("m0Types",
          Arbnum.fromString "1555472137",
          Arbnum.fromString "541063")
          [("indexedLists",
           Arbnum.fromString "1503148856",
           Arbnum.fromString "404777"),
           ("patternMatches",
           Arbnum.fromString "1503148884",
           Arbnum.fromString "20925")];
  val _ = Theory.incorporate_types "m0Types"
       [("state", 0), ("privcmd", 0), ("output", 0), ("npriv", 0),
        ("command", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("m0Types", "npriv"), ID("min", "fun"), ID("num", "num"),
   ID("m0Types", "state"), ID("m0Types", "privcmd"),
   ID("m0Types", "output"), ID("m0Types", "command"), ID("min", "bool"),
   ID("ind_type", "recspace"), ID("pair", "prod"), ID("bool", "!"),
   ID("arithmetic", "+"), ID("pair", ","), ID("bool", "/\\"),
   ID("num", "0"), ID("prim_rec", "<"), ID("min", "="), ID("min", "==>"),
   ID("bool", "?"), ID("m0Types", "ACTIVE"), ID("bool", "ARB"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"),
   ID("ind_type", "BOTTOM"), ID("bool", "COND"), ID("ind_type", "CONSTR"),
   ID("bool", "DATATYPE"), ID("m0Types", "NP"),
   ID("arithmetic", "NUMERAL"), ID("m0Types", "PR"), ID("m0Types", "STBY"),
   ID("num", "SUC"), ID("bool", "TYPE_DEFINITION"),
   ID("arithmetic", "ZERO"), ID("bool", "\\/"),
   ID("m0Types", "command_CASE"), ID("m0Types", "command_size"),
   ID("m0Types", "launch"), ID("m0Types", "npriv2num"),
   ID("m0Types", "npriv_CASE"), ID("m0Types", "npriv_size"),
   ID("m0Types", "num2npriv"), ID("m0Types", "num2output"),
   ID("m0Types", "num2privcmd"), ID("m0Types", "num2state"),
   ID("m0Types", "off"), ID("m0Types", "on"), ID("m0Types", "output2num"),
   ID("m0Types", "output_CASE"), ID("m0Types", "output_size"),
   ID("m0Types", "privcmd2num"), ID("m0Types", "privcmd_CASE"),
   ID("m0Types", "privcmd_size"), ID("m0Types", "reset"),
   ID("m0Types", "state2num"), ID("m0Types", "state_CASE"),
   ID("m0Types", "state_size"), ID("m0Types", "status"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [0], TYOP [2], TYOP [3], TYOP [1, 2, 1], TYV "'a", TYOP [1, 4, 4],
   TYOP [1, 4, 5], TYOP [1, 2, 6], TYOP [4], TYOP [1, 8, 1],
   TYOP [1, 8, 6], TYOP [5], TYOP [1, 11, 1], TYOP [1, 11, 6],
   TYOP [1, 1, 2], TYOP [1, 1, 8], TYOP [1, 1, 11], TYOP [1, 1, 0],
   TYOP [1, 0, 1], TYOP [1, 0, 5], TYOP [6], TYOP [1, 20, 1],
   TYOP [1, 8, 4], TYOP [1, 22, 4], TYOP [1, 0, 4], TYOP [1, 24, 23],
   TYOP [1, 20, 25], TYOP [1, 8, 20], TYOP [1, 0, 20], TYOP [7],
   TYOP [9, 0, 8], TYOP [8, 30], TYOP [1, 31, 29], TYOP [1, 20, 29],
   TYOP [1, 0, 29], TYOP [1, 11, 29], TYOP [1, 8, 29], TYOP [1, 2, 29],
   TYOP [1, 27, 29], TYOP [1, 28, 38], TYOP [1, 11, 4], TYOP [1, 2, 4],
   TYOP [1, 20, 4], TYOP [1, 11, 35], TYOP [1, 8, 36], TYOP [1, 20, 31],
   TYOP [1, 2, 37], TYOP [1, 4, 29], TYOP [1, 47, 29], TYOP [1, 33, 29],
   TYOP [1, 49, 29], TYOP [1, 24, 29], TYOP [1, 51, 29], TYOP [1, 34, 29],
   TYOP [1, 53, 29], TYOP [1, 35, 29], TYOP [1, 55, 29], TYOP [1, 22, 29],
   TYOP [1, 57, 29], TYOP [1, 36, 29], TYOP [1, 59, 29], TYOP [1, 32, 29],
   TYOP [1, 61, 29], TYOP [1, 37, 29], TYOP [1, 63, 29], TYOP [1, 1, 29],
   TYOP [1, 65, 29], TYOP [1, 1, 1], TYOP [1, 1, 67], TYOP [1, 8, 30],
   TYOP [1, 0, 69], TYOP [1, 29, 29], TYOP [1, 29, 71], TYOP [1, 1, 65],
   TYOP [1, 4, 47], TYOP [1, 20, 33], TYOP [1, 0, 34], TYOP [1, 31, 32],
   TYOP [1, 42, 29], TYOP [1, 78, 29], TYOP [1, 45, 29], TYOP [1, 80, 29],
   TYOP [1, 18, 29], TYOP [1, 82, 29], TYOP [1, 40, 29], TYOP [1, 84, 29],
   TYOP [1, 12, 29], TYOP [1, 86, 29], TYOP [1, 9, 29], TYOP [1, 88, 29],
   TYOP [1, 41, 29], TYOP [1, 90, 29], TYOP [1, 3, 29], TYOP [1, 92, 29],
   TYOP [1, 29, 6], TYOP [1, 1, 31], TYOP [1, 95, 31], TYOP [1, 30, 96],
   TYOP [1, 1, 97], TYOP [1, 65, 82], TYOP [1, 65, 86], TYOP [1, 65, 88],
   TYOP [1, 65, 92], TYOP [1, 32, 80]]
  end
  val _ = Theory.incorporate_consts "m0Types" tyvector
     [("status", 0), ("state_size", 3), ("state_CASE", 7),
      ("state2num", 3), ("reset", 8), ("privcmd_size", 9),
      ("privcmd_CASE", 10), ("privcmd2num", 9), ("output_size", 12),
      ("output_CASE", 13), ("output2num", 12), ("on", 11), ("off", 11),
      ("num2state", 14), ("num2privcmd", 15), ("num2output", 16),
      ("num2npriv", 17), ("npriv_size", 18), ("npriv_CASE", 19),
      ("npriv2num", 18), ("launch", 8), ("command_size", 21),
      ("command_CASE", 26), ("STBY", 2), ("PR", 27), ("NP", 28),
      ("ACTIVE", 2)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("'command'", 32), TMV("M", 20), TMV("M", 0), TMV("M", 11),
   TMV("M", 8), TMV("M", 2), TMV("M'", 20), TMV("M'", 0), TMV("M'", 11),
   TMV("M'", 8), TMV("M'", 2), TMV("P", 33), TMV("P", 34), TMV("P", 35),
   TMV("P", 36), TMV("P", 37), TMV("a", 0), TMV("a", 11), TMV("a", 8),
   TMV("a", 2), TMV("a'", 0), TMV("a'", 11), TMV("a'", 8), TMV("a'", 2),
   TMV("a0", 31), TMV("c", 20), TMV("cc", 20), TMV("command", 39),
   TMV("f", 24), TMV("f", 40), TMV("f", 22), TMV("f", 41), TMV("f'", 24),
   TMV("f0", 24), TMV("f1", 22), TMV("f1'", 22), TMV("fn", 42),
   TMV("m", 1), TMV("n", 0), TMV("n", 1), TMV("npriv", 34),
   TMV("output", 43), TMV("p", 8), TMV("privcmd", 44), TMV("r", 1),
   TMV("r'", 1), TMV("rep", 45), TMV("rep", 18), TMV("rep", 12),
   TMV("rep", 9), TMV("rep", 3), TMV("state", 46), TMV("v0", 4),
   TMV("v0'", 4), TMV("v1", 4), TMV("v1'", 4), TMV("x", 0), TMV("x", 11),
   TMV("x", 8), TMV("x", 2), TMV("x0", 4), TMV("x1", 4), TMC(10, 48),
   TMC(10, 49), TMC(10, 50), TMC(10, 52), TMC(10, 54), TMC(10, 56),
   TMC(10, 58), TMC(10, 60), TMC(10, 62), TMC(10, 64), TMC(10, 53),
   TMC(10, 66), TMC(10, 55), TMC(10, 59), TMC(10, 61), TMC(10, 63),
   TMC(11, 68), TMC(12, 70), TMC(13, 72), TMC(14, 1), TMC(15, 73),
   TMC(16, 74), TMC(16, 72), TMC(16, 75), TMC(16, 76), TMC(16, 73),
   TMC(16, 43), TMC(16, 44), TMC(16, 77), TMC(16, 46), TMC(17, 72),
   TMC(18, 79), TMC(18, 81), TMC(18, 52), TMC(18, 83), TMC(18, 85),
   TMC(18, 87), TMC(18, 58), TMC(18, 89), TMC(18, 91), TMC(18, 93),
   TMC(18, 53), TMC(18, 66), TMC(18, 55), TMC(18, 59), TMC(18, 63),
   TMC(19, 2), TMC(20, 0), TMC(20, 8), TMC(21, 67), TMC(22, 67),
   TMC(23, 31), TMC(24, 94), TMC(25, 98), TMC(26, 71), TMC(27, 28),
   TMC(28, 67), TMC(29, 27), TMC(30, 2), TMC(31, 67), TMC(32, 99),
   TMC(32, 100), TMC(32, 101), TMC(32, 102), TMC(32, 103), TMC(33, 1),
   TMC(34, 72), TMC(35, 26), TMC(36, 21), TMC(37, 8), TMC(38, 18),
   TMC(39, 19), TMC(40, 18), TMC(41, 17), TMC(42, 16), TMC(43, 15),
   TMC(44, 14), TMC(45, 11), TMC(46, 11), TMC(47, 12), TMC(48, 13),
   TMC(49, 12), TMC(50, 9), TMC(51, 10), TMC(52, 9), TMC(53, 8),
   TMC(54, 3), TMC(55, 7), TMC(56, 3), TMC(57, 0), TMC(58, 71)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op privcmd_TY_DEF x = x
    val op privcmd_TY_DEF =
    ThmBind.DT(((("m0Types",0),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%100%49%124%39%82$0@%118%112%127@3|@$0@|@"])
  fun op privcmd_BIJ x = x
    val op privcmd_BIJ =
    ThmBind.DT(((("m0Types",1),
                [("bool",[116]),("m0Types",[0])]),["DISK_THM"]),
               [ThmBind.read"%80%75%18%89%137%144$0@3$0@|@2%73%44%84%39%82$0@%118%112%127@3|$0@2%87%144%137$0@3$0@2|@2"])


  fun op privcmd_size_def x = x
    val op privcmd_size_def =
    ThmBind.DT(((("m0Types",13),[]),[]),
               [ThmBind.read"%75%58%87%146$0@2%81@|@"])
  fun op privcmd_CASE x = x
    val op privcmd_CASE =
    ThmBind.DT(((("m0Types",14),[]),[]),
               [ThmBind.read"%75%58%62%52%62%54%83%145$2@$1@$0@2%37%114%87$0@%81@2$2@$1@|%144$2@3|@|@|@"])
  fun op npriv_TY_DEF x = x
    val op npriv_TY_DEF =
    ThmBind.DT(((("m0Types",23),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%96%47%122%39%82$0@%118%111%127@3|@$0@|@"])
  fun op npriv_BIJ x = x
    val op npriv_BIJ =
    ThmBind.DT(((("m0Types",24),
                [("bool",[116]),("m0Types",[23])]),["DISK_THM"]),
               [ThmBind.read"%80%72%16%86%135%132$0@3$0@|@2%73%44%84%39%82$0@%118%111%127@3|$0@2%87%132%135$0@3$0@2|@2"])

  fun op npriv_size_def x = x
    val op npriv_size_def =
    ThmBind.DT(((("m0Types",35),[]),[]),
               [ThmBind.read"%72%56%87%134$0@2%81@|@"])
  fun op npriv_CASE x = x
    val op npriv_CASE =
    ThmBind.DT(((("m0Types",36),[]),[]),
               [ThmBind.read"%72%56%62%52%83%133$1@$0@2%37$1|%132$1@3|@|@"])
  fun op command_TY_DEF x = x
    val op command_TY_DEF =
    ThmBind.DT(((("m0Types",43),[("bool",[26])]),["DISK_THM"]),
               [ThmBind.read"%94%46%126%24%70%0%92%76%24%92%128%103%16%90$1@%16%115%81@%79$0@%110@2%39%113|@|$0@2|@2%106%18%90$1@%18%115%121%81@2%79%109@$0@2%39%113|@|$0@2|@3$1$0@2|@2$0$1@2|@|@$0@|@"])
  fun op command_case_def x = x
    val op command_case_def =
    ThmBind.DT(((("m0Types",49),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("m0Types",[44,45,46,47,48]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%80%72%16%65%28%68%34%83%129%117$2@2$1@$0@2$1$2@2|@|@|@2%75%18%65%28%68%34%83%129%119$2@2$1@$0@2$0$2@2|@|@|@2"])
  fun op command_size_def x = x
    val op command_size_def =
    ThmBind.DT(((("m0Types",50),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("m0Types",[44,45,46,47,48]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%80%72%16%87%130%117$0@3%78%118%111%127@3%134$0@3|@2%75%18%87%130%119$0@3%78%118%111%127@3%146$0@3|@2"])
  fun op state_TY_DEF x = x
    val op state_TY_DEF =
    ThmBind.DT(((("m0Types",60),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%102%50%125%39%82$0@%118%112%127@3|@$0@|@"])
  fun op state_BIJ x = x
    val op state_BIJ =
    ThmBind.DT(((("m0Types",61),
                [("bool",[116]),("m0Types",[60])]),["DISK_THM"]),
               [ThmBind.read"%80%77%19%91%138%148$0@3$0@|@2%73%44%84%39%82$0@%118%112%127@3|$0@2%87%148%138$0@3$0@2|@2"])


  fun op state_size_def x = x
    val op state_size_def =
    ThmBind.DT(((("m0Types",73),[]),[]),
               [ThmBind.read"%77%59%87%150$0@2%81@|@"])
  fun op state_CASE x = x
    val op state_CASE =
    ThmBind.DT(((("m0Types",74),[]),[]),
               [ThmBind.read"%77%59%62%52%62%54%83%149$2@$1@$0@2%37%114%87$0@%81@2$2@$1@|%148$2@3|@|@|@"])
  fun op output_TY_DEF x = x
    val op output_TY_DEF =
    ThmBind.DT(((("m0Types",83),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%98%48%123%39%82$0@%118%112%127@3|@$0@|@"])
  fun op output_BIJ x = x
    val op output_BIJ =
    ThmBind.DT(((("m0Types",84),
                [("bool",[116]),("m0Types",[83])]),["DISK_THM"]),
               [ThmBind.read"%80%74%17%88%136%141$0@3$0@|@2%73%44%84%39%82$0@%118%112%127@3|$0@2%87%141%136$0@3$0@2|@2"])


  fun op output_size_def x = x
    val op output_size_def =
    ThmBind.DT(((("m0Types",96),[]),[]),
               [ThmBind.read"%74%57%87%143$0@2%81@|@"])
  fun op output_CASE x = x
    val op output_CASE =
    ThmBind.DT(((("m0Types",97),[]),[]),
               [ThmBind.read"%74%57%62%52%62%54%83%142$2@$1@$0@2%37%114%87$0@%81@2$2@$1@|%141$2@3|@|@|@"])
  fun op num2privcmd_privcmd2num x = x
    val op num2privcmd_privcmd2num =
    ThmBind.DT(((("m0Types",2),[("m0Types",[1])]),["DISK_THM"]),
               [ThmBind.read"%75%18%89%137%144$0@3$0@|@"])
  fun op privcmd2num_num2privcmd x = x
    val op privcmd2num_num2privcmd =
    ThmBind.DT(((("m0Types",3),[("m0Types",[1])]),["DISK_THM"]),
               [ThmBind.read"%73%44%84%82$0@%118%112%127@4%87%144%137$0@3$0@2|@"])
  fun op num2privcmd_11 x = x
    val op num2privcmd_11 =
    ThmBind.DT(((("m0Types",4),
                [("bool",[26]),("m0Types",[1])]),["DISK_THM"]),
               [ThmBind.read"%73%44%73%45%92%82$1@%118%112%127@4%92%82$0@%118%112%127@4%84%89%137$1@2%137$0@3%87$1@$0@4|@|@"])
  fun op privcmd2num_11 x = x
    val op privcmd2num_11 =
    ThmBind.DT(((("m0Types",5),
                [("bool",[26]),("m0Types",[1])]),["DISK_THM"]),
               [ThmBind.read"%75%18%75%22%84%87%144$1@2%144$0@3%89$1@$0@2|@|@"])
  fun op num2privcmd_ONTO x = x
    val op num2privcmd_ONTO =
    ThmBind.DT(((("m0Types",6),
                [("bool",[25,62]),("m0Types",[1])]),["DISK_THM"]),
               [ThmBind.read"%75%18%104%44%80%89$1@%137$0@3%82$0@%118%112%127@4|@|@"])
  fun op privcmd2num_ONTO x = x
    val op privcmd2num_ONTO =
    ThmBind.DT(((("m0Types",7),
                [("bool",[26]),("m0Types",[1])]),["DISK_THM"]),
               [ThmBind.read"%73%44%84%82$0@%118%112%127@4%106%18%87$1@%144$0@2|@2|@"])
  fun op num2privcmd_thm x = x
    val op num2privcmd_thm =
    ThmBind.DT(((("m0Types",10),[("m0Types",[8,9])]),[]),
               [ThmBind.read"%80%89%137%81@2%131@2%89%137%118%111%127@4%147@2"])
  fun op privcmd2num_thm x = x
    val op privcmd2num_thm =
    ThmBind.DT(((("m0Types",11),
                [("bool",[25,53]),("m0Types",[3,8,9]),
                 ("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%80%87%144%131@2%81@2%87%144%147@2%118%111%127@4"])
  fun op privcmd_EQ_privcmd x = x
    val op privcmd_EQ_privcmd =
    ThmBind.DT(((("m0Types",12),
                [("bool",[57]),("m0Types",[5])]),["DISK_THM"]),
               [ThmBind.read"%75%18%75%22%84%89$1@$0@2%87%144$1@2%144$0@3|@|@"])
  fun op privcmd_case_def x = x
    val op privcmd_case_def =
    ThmBind.DT(((("m0Types",15),
                [("bool",[55,63]),("m0Types",[11,14]),
                 ("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%80%62%52%62%54%83%145%131@$1@$0@2$1@|@|@2%62%52%62%54%83%145%147@$1@$0@2$0@|@|@2"])
  fun op datatype_privcmd x = x
    val op datatype_privcmd =
    ThmBind.DT(((("m0Types",16),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%116%43%131@%147@2"])
  fun op privcmd_distinct x = x
    val op privcmd_distinct =
    ThmBind.DT(((("m0Types",17),
                [("m0Types",[11,12]),("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%152%89%131@%147@2"])
  fun op privcmd_case_cong x = x
    val op privcmd_case_cong =
    ThmBind.DT(((("m0Types",18),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[6,8,9,15]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%75%4%75%9%62%52%62%54%92%80%89$3@$2@2%80%92%89$2@%131@2%83$1@%53@3%92%89$2@%147@2%83$0@%55@5%83%145$3@$1@$0@2%145$2@%53@%55@3|@|@|@|@"])
  fun op privcmd_nchotomy x = x
    val op privcmd_nchotomy =
    ThmBind.DT(((("m0Types",19),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[6,8,9]),("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%75%18%128%89$0@%131@2%89$0@%147@2|@"])
  fun op privcmd_Axiom x = x
    val op privcmd_Axiom =
    ThmBind.DT(((("m0Types",20),
                [("bool",[8,14,25,55,63]),("m0Types",[11]),
                 ("numeral",[3,8])]),["DISK_THM"]),
               [ThmBind.read"%62%60%62%61%99%30%80%83$0%131@2$2@2%83$0%147@2$1@2|@|@|@"])
  fun op privcmd_induction x = x
    val op privcmd_induction =
    ThmBind.DT(((("m0Types",21),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[6,8,9]),("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%69%14%92%80$0%131@2$0%147@3%75%18$1$0@|@2|@"])
  fun op privcmd_distinct_clauses x = x
    val op privcmd_distinct_clauses =
    ThmBind.DT(((("m0Types",22),
                [("m0Types",[11,12]),("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%152%89%131@%147@2"])
  fun op num2npriv_npriv2num x = x
    val op num2npriv_npriv2num =
    ThmBind.DT(((("m0Types",25),[("m0Types",[24])]),["DISK_THM"]),
               [ThmBind.read"%72%16%86%135%132$0@3$0@|@"])
  fun op npriv2num_num2npriv x = x
    val op npriv2num_num2npriv =
    ThmBind.DT(((("m0Types",26),[("m0Types",[24])]),["DISK_THM"]),
               [ThmBind.read"%73%44%84%82$0@%118%111%127@4%87%132%135$0@3$0@2|@"])
  fun op num2npriv_11 x = x
    val op num2npriv_11 =
    ThmBind.DT(((("m0Types",27),
                [("bool",[26]),("m0Types",[24])]),["DISK_THM"]),
               [ThmBind.read"%73%44%73%45%92%82$1@%118%111%127@4%92%82$0@%118%111%127@4%84%86%135$1@2%135$0@3%87$1@$0@4|@|@"])
  fun op npriv2num_11 x = x
    val op npriv2num_11 =
    ThmBind.DT(((("m0Types",28),
                [("bool",[26]),("m0Types",[24])]),["DISK_THM"]),
               [ThmBind.read"%72%16%72%20%84%87%132$1@2%132$0@3%86$1@$0@2|@|@"])
  fun op num2npriv_ONTO x = x
    val op num2npriv_ONTO =
    ThmBind.DT(((("m0Types",29),
                [("bool",[25,62]),("m0Types",[24])]),["DISK_THM"]),
               [ThmBind.read"%72%16%104%44%80%86$1@%135$0@3%82$0@%118%111%127@4|@|@"])
  fun op npriv2num_ONTO x = x
    val op npriv2num_ONTO =
    ThmBind.DT(((("m0Types",30),
                [("bool",[26]),("m0Types",[24])]),["DISK_THM"]),
               [ThmBind.read"%73%44%84%82$0@%118%111%127@4%103%16%87$1@%132$0@2|@2|@"])
  fun op num2npriv_thm x = x
    val op num2npriv_thm =
    ThmBind.DT(((("m0Types",32),[("m0Types",[31])]),[]),
               [ThmBind.read"%86%135%81@2%151@"])
  fun op npriv2num_thm x = x
    val op npriv2num_thm =
    ThmBind.DT(((("m0Types",33),
                [("bool",[25]),("m0Types",[26,31]),
                 ("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%87%132%151@2%81@"])
  fun op npriv_EQ_npriv x = x
    val op npriv_EQ_npriv =
    ThmBind.DT(((("m0Types",34),
                [("bool",[57]),("m0Types",[28])]),["DISK_THM"]),
               [ThmBind.read"%72%16%72%20%84%86$1@$0@2%87%132$1@2%132$0@3|@|@"])
  fun op npriv_case_def x = x
    val op npriv_case_def =
    ThmBind.DT(((("m0Types",37),[("m0Types",[33,36])]),["DISK_THM"]),
               [ThmBind.read"%62%52%83%133%151@$0@2$0@|@"])
  fun op datatype_npriv x = x
    val op datatype_npriv =
    ThmBind.DT(((("m0Types",38),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%116%40%151@2"])
  fun op npriv_case_cong x = x
    val op npriv_case_cong =
    ThmBind.DT(((("m0Types",39),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[29,31,37]),("numeral",[3,5,6,7,8,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%72%2%72%7%62%52%92%80%86$2@$1@2%92%86$1@%151@2%83$0@%53@4%83%133$2@$0@2%133$1@%53@3|@|@|@"])
  fun op npriv_nchotomy x = x
    val op npriv_nchotomy =
    ThmBind.DT(((("m0Types",40),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[29,31]),("numeral",[3,5,6,7,8,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%72%16%86$0@%151@|@"])
  fun op npriv_Axiom x = x
    val op npriv_Axiom =
    ThmBind.DT(((("m0Types",41),
                [("bool",[8,25,55]),("m0Types",[33])]),["DISK_THM"]),
               [ThmBind.read"%62%60%95%28%83$0%151@2$1@|@|@"])
  fun op npriv_induction x = x
    val op npriv_induction =
    ThmBind.DT(((("m0Types",42),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[29,31]),("numeral",[3,5,6,7,8,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%66%12%92$0%151@2%72%16$1$0@|@2|@"])
  fun op datatype_command x = x
    val op datatype_command =
    ThmBind.DT(((("m0Types",51),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%116%27%117@%119@2"])
  fun op command_11 x = x
    val op command_11 =
    ThmBind.DT(((("m0Types",52),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("m0Types",[44,45,46,47,48]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%80%72%16%72%20%84%85%117$1@2%117$0@3%86$1@$0@2|@|@2%75%18%75%22%84%85%119$1@2%119$0@3%89$1@$0@2|@|@2"])
  fun op command_distinct x = x
    val op command_distinct =
    ThmBind.DT(((("m0Types",53),
                [("bool",[25,26,46,53,62,180]),("ind_type",[33,34]),
                 ("m0Types",[44,45,46,47,48]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%75%22%72%16%152%85%117$0@2%119$1@3|@|@"])
  fun op command_case_cong x = x
    val op command_case_cong =
    ThmBind.DT(((("m0Types",54),
                [("bool",[26,180]),
                 ("m0Types",[44,45,46,47,48,49])]),["DISK_THM"]),
               [ThmBind.read"%63%1%63%6%65%28%68%34%92%80%85$3@$2@2%80%72%16%92%85$3@%117$0@3%83$2$0@2%32$0@3|@2%75%18%92%85$3@%119$0@3%83$1$0@2%35$0@3|@4%83%129$3@$1@$0@2%129$2@%32@%35@3|@|@|@|@"])
  fun op command_nchotomy x = x
    val op command_nchotomy =
    ThmBind.DT(((("m0Types",55),
                [("bool",[26,180]),
                 ("m0Types",[44,45,46,47,48])]),["DISK_THM"]),
               [ThmBind.read"%63%26%128%103%38%85$1@%117$0@2|@2%106%42%85$1@%119$0@2|@2|@"])
  fun op command_Axiom x = x
    val op command_Axiom =
    ThmBind.DT(((("m0Types",56),
                [("bool",[26,180]),("ind_type",[33,34]),
                 ("m0Types",[44,45,46,47,48]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%65%33%68%34%93%36%80%72%16%83$1%117$0@3$3$0@2|@2%75%18%83$1%119$0@3$2$0@2|@2|@|@|@"])
  fun op command_induction x = x
    val op command_induction =
    ThmBind.DT(((("m0Types",57),
                [("bool",[26]),
                 ("m0Types",[44,45,46,47,48])]),["DISK_THM"]),
               [ThmBind.read"%64%11%92%80%72%38$1%117$0@2|@2%75%42$1%119$0@2|@3%63%25$1$0@|@2|@"])
  fun op command_distinct_clauses x = x
    val op command_distinct_clauses =
    ThmBind.DT(((("m0Types",58),
                [("bool",[25,26,46,53,62,180]),("ind_type",[33,34]),
                 ("m0Types",[44,45,46,47,48]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%75%22%72%16%152%85%117$0@2%119$1@3|@|@"])
  fun op command_one_one x = x
    val op command_one_one =
    ThmBind.DT(((("m0Types",59),
                [("bool",[26,55,62,180]),("ind_type",[33,34]),
                 ("m0Types",[44,45,46,47,48]),
                 ("pair",[8,9])]),["DISK_THM"]),
               [ThmBind.read"%80%72%16%72%20%84%85%117$1@2%117$0@3%86$1@$0@2|@|@2%75%18%75%22%84%85%119$1@2%119$0@3%89$1@$0@2|@|@2"])
  fun op num2state_state2num x = x
    val op num2state_state2num =
    ThmBind.DT(((("m0Types",62),[("m0Types",[61])]),["DISK_THM"]),
               [ThmBind.read"%77%19%91%138%148$0@3$0@|@"])
  fun op state2num_num2state x = x
    val op state2num_num2state =
    ThmBind.DT(((("m0Types",63),[("m0Types",[61])]),["DISK_THM"]),
               [ThmBind.read"%73%44%84%82$0@%118%112%127@4%87%148%138$0@3$0@2|@"])
  fun op num2state_11 x = x
    val op num2state_11 =
    ThmBind.DT(((("m0Types",64),
                [("bool",[26]),("m0Types",[61])]),["DISK_THM"]),
               [ThmBind.read"%73%44%73%45%92%82$1@%118%112%127@4%92%82$0@%118%112%127@4%84%91%138$1@2%138$0@3%87$1@$0@4|@|@"])
  fun op state2num_11 x = x
    val op state2num_11 =
    ThmBind.DT(((("m0Types",65),
                [("bool",[26]),("m0Types",[61])]),["DISK_THM"]),
               [ThmBind.read"%77%19%77%23%84%87%148$1@2%148$0@3%91$1@$0@2|@|@"])
  fun op num2state_ONTO x = x
    val op num2state_ONTO =
    ThmBind.DT(((("m0Types",66),
                [("bool",[25,62]),("m0Types",[61])]),["DISK_THM"]),
               [ThmBind.read"%77%19%104%44%80%91$1@%138$0@3%82$0@%118%112%127@4|@|@"])
  fun op state2num_ONTO x = x
    val op state2num_ONTO =
    ThmBind.DT(((("m0Types",67),
                [("bool",[26]),("m0Types",[61])]),["DISK_THM"]),
               [ThmBind.read"%73%44%84%82$0@%118%112%127@4%107%19%87$1@%148$0@2|@2|@"])
  fun op num2state_thm x = x
    val op num2state_thm =
    ThmBind.DT(((("m0Types",70),[("m0Types",[68,69])]),[]),
               [ThmBind.read"%80%91%138%81@2%120@2%91%138%118%111%127@4%108@2"])
  fun op state2num_thm x = x
    val op state2num_thm =
    ThmBind.DT(((("m0Types",71),
                [("bool",[25,53]),("m0Types",[63,68,69]),
                 ("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%80%87%148%120@2%81@2%87%148%108@2%118%111%127@4"])
  fun op state_EQ_state x = x
    val op state_EQ_state =
    ThmBind.DT(((("m0Types",72),
                [("bool",[57]),("m0Types",[65])]),["DISK_THM"]),
               [ThmBind.read"%77%19%77%23%84%91$1@$0@2%87%148$1@2%148$0@3|@|@"])
  fun op state_case_def x = x
    val op state_case_def =
    ThmBind.DT(((("m0Types",75),
                [("bool",[55,63]),("m0Types",[71,74]),
                 ("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%80%62%52%62%54%83%149%120@$1@$0@2$1@|@|@2%62%52%62%54%83%149%108@$1@$0@2$0@|@|@2"])
  fun op datatype_state x = x
    val op datatype_state =
    ThmBind.DT(((("m0Types",76),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%116%51%120@%108@2"])
  fun op state_distinct x = x
    val op state_distinct =
    ThmBind.DT(((("m0Types",77),
                [("m0Types",[71,72]),("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%152%91%120@%108@2"])
  fun op state_case_cong x = x
    val op state_case_cong =
    ThmBind.DT(((("m0Types",78),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[66,68,69,75]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%77%5%77%10%62%52%62%54%92%80%91$3@$2@2%80%92%91$2@%120@2%83$1@%53@3%92%91$2@%108@2%83$0@%55@5%83%149$3@$1@$0@2%149$2@%53@%55@3|@|@|@|@"])
  fun op state_nchotomy x = x
    val op state_nchotomy =
    ThmBind.DT(((("m0Types",79),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[66,68,69]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%77%19%128%91$0@%120@2%91$0@%108@2|@"])
  fun op state_Axiom x = x
    val op state_Axiom =
    ThmBind.DT(((("m0Types",80),
                [("bool",[8,14,25,55,63]),("m0Types",[71]),
                 ("numeral",[3,8])]),["DISK_THM"]),
               [ThmBind.read"%62%60%62%61%101%31%80%83$0%120@2$2@2%83$0%108@2$1@2|@|@|@"])
  fun op state_induction x = x
    val op state_induction =
    ThmBind.DT(((("m0Types",81),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[66,68,69]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%71%15%92%80$0%108@2$0%120@3%77%19$1$0@|@2|@"])
  fun op state_distinct_clauses x = x
    val op state_distinct_clauses =
    ThmBind.DT(((("m0Types",82),
                [("m0Types",[71,72]),("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%152%91%120@%108@2"])
  fun op num2output_output2num x = x
    val op num2output_output2num =
    ThmBind.DT(((("m0Types",85),[("m0Types",[84])]),["DISK_THM"]),
               [ThmBind.read"%74%17%88%136%141$0@3$0@|@"])
  fun op output2num_num2output x = x
    val op output2num_num2output =
    ThmBind.DT(((("m0Types",86),[("m0Types",[84])]),["DISK_THM"]),
               [ThmBind.read"%73%44%84%82$0@%118%112%127@4%87%141%136$0@3$0@2|@"])
  fun op num2output_11 x = x
    val op num2output_11 =
    ThmBind.DT(((("m0Types",87),
                [("bool",[26]),("m0Types",[84])]),["DISK_THM"]),
               [ThmBind.read"%73%44%73%45%92%82$1@%118%112%127@4%92%82$0@%118%112%127@4%84%88%136$1@2%136$0@3%87$1@$0@4|@|@"])
  fun op output2num_11 x = x
    val op output2num_11 =
    ThmBind.DT(((("m0Types",88),
                [("bool",[26]),("m0Types",[84])]),["DISK_THM"]),
               [ThmBind.read"%74%17%74%21%84%87%141$1@2%141$0@3%88$1@$0@2|@|@"])
  fun op num2output_ONTO x = x
    val op num2output_ONTO =
    ThmBind.DT(((("m0Types",89),
                [("bool",[25,62]),("m0Types",[84])]),["DISK_THM"]),
               [ThmBind.read"%74%17%104%44%80%88$1@%136$0@3%82$0@%118%112%127@4|@|@"])
  fun op output2num_ONTO x = x
    val op output2num_ONTO =
    ThmBind.DT(((("m0Types",90),
                [("bool",[26]),("m0Types",[84])]),["DISK_THM"]),
               [ThmBind.read"%73%44%84%82$0@%118%112%127@4%105%17%87$1@%141$0@2|@2|@"])
  fun op num2output_thm x = x
    val op num2output_thm =
    ThmBind.DT(((("m0Types",93),[("m0Types",[91,92])]),[]),
               [ThmBind.read"%80%88%136%81@2%140@2%88%136%118%111%127@4%139@2"])
  fun op output2num_thm x = x
    val op output2num_thm =
    ThmBind.DT(((("m0Types",94),
                [("bool",[25,53]),("m0Types",[86,91,92]),
                 ("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%80%87%141%140@2%81@2%87%141%139@2%118%111%127@4"])
  fun op output_EQ_output x = x
    val op output_EQ_output =
    ThmBind.DT(((("m0Types",95),
                [("bool",[57]),("m0Types",[88])]),["DISK_THM"]),
               [ThmBind.read"%74%17%74%21%84%88$1@$0@2%87%141$1@2%141$0@3|@|@"])
  fun op output_case_def x = x
    val op output_case_def =
    ThmBind.DT(((("m0Types",98),
                [("bool",[55,63]),("m0Types",[94,97]),
                 ("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%80%62%52%62%54%83%142%140@$1@$0@2$1@|@|@2%62%52%62%54%83%142%139@$1@$0@2$0@|@|@2"])
  fun op datatype_output x = x
    val op datatype_output =
    ThmBind.DT(((("m0Types",99),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%116%41%140@%139@2"])
  fun op output_distinct x = x
    val op output_distinct =
    ThmBind.DT(((("m0Types",100),
                [("m0Types",[94,95]),("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%152%88%140@%139@2"])
  fun op output_case_cong x = x
    val op output_case_cong =
    ThmBind.DT(((("m0Types",101),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[89,91,92,98]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%74%3%74%8%62%52%62%54%92%80%88$3@$2@2%80%92%88$2@%140@2%83$1@%53@3%92%88$2@%139@2%83$0@%55@5%83%142$3@$1@$0@2%142$2@%53@%55@3|@|@|@|@"])
  fun op output_nchotomy x = x
    val op output_nchotomy =
    ThmBind.DT(((("m0Types",102),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[89,91,92]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%74%17%128%88$0@%140@2%88$0@%139@2|@"])
  fun op output_Axiom x = x
    val op output_Axiom =
    ThmBind.DT(((("m0Types",103),
                [("bool",[8,14,25,55,63]),("m0Types",[94]),
                 ("numeral",[3,8])]),["DISK_THM"]),
               [ThmBind.read"%62%60%62%61%97%29%80%83$0%140@2$2@2%83$0%139@2$1@2|@|@|@"])
  fun op output_induction x = x
    val op output_induction =
    ThmBind.DT(((("m0Types",104),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("m0Types",[89,91,92]),
                 ("numeral",[3,5,6,7,8,15,16]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%67%13%92%80$0%139@2$0%140@3%74%17$1$0@|@2|@"])
  fun op output_distinct_clauses x = x
    val op output_distinct_clauses =
    ThmBind.DT(((("m0Types",105),
                [("m0Types",[94,95]),("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%152%88%140@%139@2"])

  val _ = DB.bindl "m0Types"
  [("privcmd_TY_DEF",privcmd_TY_DEF,DB.Def),
   ("privcmd_BIJ",privcmd_BIJ,DB.Def),
   ("privcmd_size_def",privcmd_size_def,DB.Def),
   ("privcmd_CASE",privcmd_CASE,DB.Def),
   ("npriv_TY_DEF",npriv_TY_DEF,DB.Def), ("npriv_BIJ",npriv_BIJ,DB.Def),
   ("npriv_size_def",npriv_size_def,DB.Def),
   ("npriv_CASE",npriv_CASE,DB.Def),
   ("command_TY_DEF",command_TY_DEF,DB.Def),
   ("command_case_def",command_case_def,DB.Def),
   ("command_size_def",command_size_def,DB.Def),
   ("state_TY_DEF",state_TY_DEF,DB.Def), ("state_BIJ",state_BIJ,DB.Def),
   ("state_size_def",state_size_def,DB.Def),
   ("state_CASE",state_CASE,DB.Def),
   ("output_TY_DEF",output_TY_DEF,DB.Def),
   ("output_BIJ",output_BIJ,DB.Def),
   ("output_size_def",output_size_def,DB.Def),
   ("output_CASE",output_CASE,DB.Def),
   ("num2privcmd_privcmd2num",num2privcmd_privcmd2num,DB.Thm),
   ("privcmd2num_num2privcmd",privcmd2num_num2privcmd,DB.Thm),
   ("num2privcmd_11",num2privcmd_11,DB.Thm),
   ("privcmd2num_11",privcmd2num_11,DB.Thm),
   ("num2privcmd_ONTO",num2privcmd_ONTO,DB.Thm),
   ("privcmd2num_ONTO",privcmd2num_ONTO,DB.Thm),
   ("num2privcmd_thm",num2privcmd_thm,DB.Thm),
   ("privcmd2num_thm",privcmd2num_thm,DB.Thm),
   ("privcmd_EQ_privcmd",privcmd_EQ_privcmd,DB.Thm),
   ("privcmd_case_def",privcmd_case_def,DB.Thm),
   ("datatype_privcmd",datatype_privcmd,DB.Thm),
   ("privcmd_distinct",privcmd_distinct,DB.Thm),
   ("privcmd_case_cong",privcmd_case_cong,DB.Thm),
   ("privcmd_nchotomy",privcmd_nchotomy,DB.Thm),
   ("privcmd_Axiom",privcmd_Axiom,DB.Thm),
   ("privcmd_induction",privcmd_induction,DB.Thm),
   ("privcmd_distinct_clauses",privcmd_distinct_clauses,DB.Thm),
   ("num2npriv_npriv2num",num2npriv_npriv2num,DB.Thm),
   ("npriv2num_num2npriv",npriv2num_num2npriv,DB.Thm),
   ("num2npriv_11",num2npriv_11,DB.Thm),
   ("npriv2num_11",npriv2num_11,DB.Thm),
   ("num2npriv_ONTO",num2npriv_ONTO,DB.Thm),
   ("npriv2num_ONTO",npriv2num_ONTO,DB.Thm),
   ("num2npriv_thm",num2npriv_thm,DB.Thm),
   ("npriv2num_thm",npriv2num_thm,DB.Thm),
   ("npriv_EQ_npriv",npriv_EQ_npriv,DB.Thm),
   ("npriv_case_def",npriv_case_def,DB.Thm),
   ("datatype_npriv",datatype_npriv,DB.Thm),
   ("npriv_case_cong",npriv_case_cong,DB.Thm),
   ("npriv_nchotomy",npriv_nchotomy,DB.Thm),
   ("npriv_Axiom",npriv_Axiom,DB.Thm),
   ("npriv_induction",npriv_induction,DB.Thm),
   ("datatype_command",datatype_command,DB.Thm),
   ("command_11",command_11,DB.Thm),
   ("command_distinct",command_distinct,DB.Thm),
   ("command_case_cong",command_case_cong,DB.Thm),
   ("command_nchotomy",command_nchotomy,DB.Thm),
   ("command_Axiom",command_Axiom,DB.Thm),
   ("command_induction",command_induction,DB.Thm),
   ("command_distinct_clauses",command_distinct_clauses,DB.Thm),
   ("command_one_one",command_one_one,DB.Thm),
   ("num2state_state2num",num2state_state2num,DB.Thm),
   ("state2num_num2state",state2num_num2state,DB.Thm),
   ("num2state_11",num2state_11,DB.Thm),
   ("state2num_11",state2num_11,DB.Thm),
   ("num2state_ONTO",num2state_ONTO,DB.Thm),
   ("state2num_ONTO",state2num_ONTO,DB.Thm),
   ("num2state_thm",num2state_thm,DB.Thm),
   ("state2num_thm",state2num_thm,DB.Thm),
   ("state_EQ_state",state_EQ_state,DB.Thm),
   ("state_case_def",state_case_def,DB.Thm),
   ("datatype_state",datatype_state,DB.Thm),
   ("state_distinct",state_distinct,DB.Thm),
   ("state_case_cong",state_case_cong,DB.Thm),
   ("state_nchotomy",state_nchotomy,DB.Thm),
   ("state_Axiom",state_Axiom,DB.Thm),
   ("state_induction",state_induction,DB.Thm),
   ("state_distinct_clauses",state_distinct_clauses,DB.Thm),
   ("num2output_output2num",num2output_output2num,DB.Thm),
   ("output2num_num2output",output2num_num2output,DB.Thm),
   ("num2output_11",num2output_11,DB.Thm),
   ("output2num_11",output2num_11,DB.Thm),
   ("num2output_ONTO",num2output_ONTO,DB.Thm),
   ("output2num_ONTO",output2num_ONTO,DB.Thm),
   ("num2output_thm",num2output_thm,DB.Thm),
   ("output2num_thm",output2num_thm,DB.Thm),
   ("output_EQ_output",output_EQ_output,DB.Thm),
   ("output_case_def",output_case_def,DB.Thm),
   ("datatype_output",datatype_output,DB.Thm),
   ("output_distinct",output_distinct,DB.Thm),
   ("output_case_cong",output_case_cong,DB.Thm),
   ("output_nchotomy",output_nchotomy,DB.Thm),
   ("output_Axiom",output_Axiom,DB.Thm),
   ("output_induction",output_induction,DB.Thm),
   ("output_distinct_clauses",output_distinct_clauses,DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "m0Types",
    thydataty = "TypeGrammarDeltas",
    read = ThmBind.read,
    data =
        "NTY7.m0Types,7.privcmdNTY7.m0Types,5.nprivNTY7.m0Types,7.commandNTY7.m0Types,5.stateNTY7.m0Types,6.output"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "m0Types",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO11.privcmd2num4.%144OO11.num2privcmd4.%137OO6.launch4.%131OO5.reset4.%147OO12.privcmd_size4.%146OO12.privcmd_CASE4.%145OO4.case4.%145OO9.npriv2num4.%132OO9.num2npriv4.%135OO6.status4.%151OO10.npriv_size4.%134OO10.npriv_CASE4.%133OO4.case4.%133OO2.NP4.%117OO2.PR4.%119OO12.command_CASE4.%129OO12.command_size4.%130OO4.case4.%129OO9.state2num4.%148OO9.num2state4.%138OO4.STBY4.%120OO6.ACTIVE4.%108OO10.state_size4.%150OO10.state_CASE4.%149OO4.case4.%149OO10.output2num4.%141OO10.num2output4.%136OO2.on4.%140OO3.off4.%139OO11.output_size4.%143OO11.output_CASE4.%142OO4.case4.%142"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val m0Types_grammars = merge_grammars ["indexedLists", "patternMatches"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="m0Types"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val m0Types_grammars = 
    Portable.## (addtyUDs,addtmUDs) m0Types_grammars
  val _ = Parse.grammarDB_insert("m0Types",m0Types_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG privcmd_Axiom,
           case_def=privcmd_case_def,
           case_cong=privcmd_case_cong,
           induction=ORIG privcmd_induction,
           nchotomy=privcmd_nchotomy,
           size=SOME(Parse.Term`(m0Types$privcmd_size) :m0Types$privcmd -> num$num`,
                     ORIG privcmd_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME privcmd_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2privcmd_thm privcmd2num_thm NONE tyinfo0
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
          {ax=ORIG npriv_Axiom,
           case_def=npriv_case_def,
           case_cong=npriv_case_cong,
           induction=ORIG npriv_induction,
           nchotomy=npriv_nchotomy,
           size=SOME(Parse.Term`(m0Types$npriv_size) :m0Types$npriv -> num$num`,
                     ORIG npriv_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=NONE,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2npriv_thm npriv2num_thm (SOME ("npriv", npriv_EQ_npriv)) tyinfo0
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
          {ax=ORIG command_Axiom,
           case_def=command_case_def,
           case_cong=command_case_cong,
           induction=ORIG command_induction,
           nchotomy=command_nchotomy,
           size=SOME(Parse.Term`(m0Types$command_size) :m0Types$command -> num$num`,
                     ORIG command_size_def),
           encode = NONE,
           lift=NONE,
           one_one=SOME command_11,
           distinct=SOME command_distinct,
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
          {ax=ORIG state_Axiom,
           case_def=state_case_def,
           case_cong=state_case_cong,
           induction=ORIG state_induction,
           nchotomy=state_nchotomy,
           size=SOME(Parse.Term`(m0Types$state_size) :m0Types$state -> num$num`,
                     ORIG state_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME state_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2state_thm state2num_thm NONE tyinfo0
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
          {ax=ORIG output_Axiom,
           case_def=output_case_def,
           case_cong=output_case_cong,
           induction=ORIG output_induction,
           nchotomy=output_nchotomy,
           size=SOME(Parse.Term`(m0Types$output_size) :m0Types$output -> num$num`,
                     ORIG output_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME output_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2output_thm output2num_thm NONE tyinfo0
        val () = computeLib.write_datatype_info tyinfo0
      in
        tyinfo0
      end
    ];

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "m0Types"
end
