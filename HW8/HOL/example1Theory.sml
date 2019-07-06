structure example1Theory :> example1Theory =
struct
  val _ = if !Globals.print_thy_loads then TextIO.print "Loading example1Theory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (* Parents and ML dependencies *)
  local open aclDrulesTheory
  in end;
  val _ = Theory.link_parents
          ("example1",
          Arbnum.fromString "1553033126",
          Arbnum.fromString "662190")
          [("aclDrules",
           Arbnum.fromString "1534466515",
           Arbnum.fromString "648647")];
  val _ = Theory.incorporate_types "example1"
       [("staff", 0), ("commands", 0)];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("num", "num"), ID("example1", "staff"),
   ID("example1", "commands"), ID("aclfoundation", "Kripke"),
   ID("aclfoundation", "po"), ID("aclfoundation", "Princ"),
   ID("min", "bool"), ID("aclfoundation", "Form"), ID("bool", "!"),
   ID("pair", ","), ID("pair", "prod"), ID("bool", "/\\"), ID("num", "0"),
   ID("prim_rec", "<"), ID("min", "="), ID("min", "==>"), ID("bool", "?"),
   ID("example1", "Alice"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("example1", "Bob"), ID("bool", "COND"),
   ID("example1", "Carol"), ID("bool", "DATATYPE"), ID("example1", "Dan"),
   ID("arithmetic", "NUMERAL"), ID("aclfoundation", "Name"),
   ID("bool", "TYPE_DEFINITION"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("example1", "abort"),
   ID("example1", "commands2num"), ID("example1", "commands_CASE"),
   ID("example1", "commands_size"), ID("aclfoundation", "controls"),
   ID("example1", "go"), ID("aclfoundation", "impf"),
   ID("example1", "launch"), ID("example1", "nogo"),
   ID("example1", "num2commands"), ID("example1", "num2staff"),
   ID("aclfoundation", "prop"), ID("aclfoundation", "quoting"),
   ID("aclfoundation", "reps"), ID("aclrules", "sat"),
   ID("aclfoundation", "says"), ID("aclfoundation", "speaks_for"),
   ID("example1", "staff2num"), ID("example1", "staff_CASE"),
   ID("example1", "staff_size"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYV "'a", TYOP [0, 3, 3],
   TYOP [0, 3, 4], TYOP [0, 3, 5], TYOP [0, 3, 6], TYOP [0, 1, 7],
   TYOP [0, 0, 1], TYOP [3], TYOP [0, 0, 10], TYOP [0, 10, 0],
   TYOP [0, 10, 7], TYV "'e", TYV "'d", TYV "'c", TYV "'b",
   TYOP [4, 3, 17, 16, 15, 14], TYOP [4, 10, 17, 1, 15, 14], TYOP [5, 15],
   TYOP [5, 14], TYOP [6, 16], TYOP [7], TYOP [0, 10, 23], TYOP [0, 1, 23],
   TYOP [0, 10, 24], TYOP [0, 10, 26], TYOP [0, 10, 27],
   TYOP [8, 3, 16, 15, 14], TYOP [0, 10, 3], TYOP [0, 1, 3],
   TYOP [0, 1, 25], TYOP [0, 1, 32], TYOP [0, 1, 33], TYOP [0, 3, 23],
   TYOP [0, 35, 23], TYOP [0, 24, 23], TYOP [0, 37, 23], TYOP [0, 25, 23],
   TYOP [0, 39, 23], TYOP [0, 0, 23], TYOP [0, 41, 23], TYOP [11, 20, 21],
   TYOP [11, 18, 43], TYOP [0, 43, 44], TYOP [0, 18, 45],
   TYOP [11, 19, 43], TYOP [0, 43, 47], TYOP [0, 19, 48], TYOP [0, 21, 43],
   TYOP [0, 20, 50], TYOP [0, 23, 23], TYOP [0, 23, 52], TYOP [0, 0, 41],
   TYOP [0, 3, 35], TYOP [0, 30, 23], TYOP [0, 56, 23], TYOP [0, 12, 23],
   TYOP [0, 58, 23], TYOP [0, 31, 23], TYOP [0, 60, 23], TYOP [0, 2, 23],
   TYOP [0, 62, 23], TYOP [0, 0, 0], TYOP [0, 23, 5], TYOP [6, 1],
   TYOP [0, 1, 66], TYOP [0, 41, 58], TYOP [0, 41, 62], TYOP [0, 29, 29],
   TYOP [0, 22, 70], TYOP [8, 10, 1, 15, 14], TYOP [0, 72, 72],
   TYOP [0, 66, 73], TYOP [0, 72, 73], TYOP [0, 10, 72], TYOP [0, 22, 22],
   TYOP [0, 22, 77], TYOP [0, 22, 71], TYOP [0, 29, 23], TYOP [0, 44, 80],
   TYOP [0, 72, 23], TYOP [0, 47, 82], TYOP [0, 22, 29], TYOP [0, 22, 84],
   TYOP [0, 66, 72], TYOP [0, 66, 86]]
  end
  val _ = Theory.incorporate_consts "example1" tyvector
     [("staff_size", 2), ("staff_CASE", 8), ("staff2num", 2),
      ("num2staff", 9), ("num2commands", 11), ("nogo", 10), ("launch", 10),
      ("go", 10), ("commands_size", 12), ("commands_CASE", 13),
      ("commands2num", 12), ("abort", 10), ("Dan", 1), ("Carol", 1),
      ("Bob", 1), ("Alice", 1)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("M", 18), TMV("M", 19), TMV("M", 10), TMV("M", 1), TMV("M'", 10),
   TMV("M'", 1), TMV("Oi", 20), TMV("Os", 21), TMV("P", 22), TMV("P", 24),
   TMV("P", 25), TMV("P'", 22), TMV("Q", 22), TMV("Q'", 22), TMV("a", 10),
   TMV("a", 1), TMV("a'", 10), TMV("a'", 1), TMV("commands", 28),
   TMV("f", 29), TMV("f", 30), TMV("f", 31), TMV("m", 0), TMV("n", 0),
   TMV("r", 0), TMV("r'", 0), TMV("rep", 12), TMV("rep", 2),
   TMV("staff", 34), TMV("v0", 3), TMV("v0'", 3), TMV("v1", 3),
   TMV("v1'", 3), TMV("v2", 3), TMV("v2'", 3), TMV("v3", 3), TMV("v3'", 3),
   TMV("x", 10), TMV("x", 1), TMV("x0", 3), TMV("x1", 3), TMV("x2", 3),
   TMV("x3", 3), TMC(9, 36), TMC(9, 37), TMC(9, 38), TMC(9, 40),
   TMC(9, 42), TMC(9, 39), TMC(10, 46), TMC(10, 49), TMC(10, 51),
   TMC(12, 53), TMC(13, 0), TMC(14, 54), TMC(15, 55), TMC(15, 53),
   TMC(15, 26), TMC(15, 54), TMC(15, 32), TMC(16, 53), TMC(17, 37),
   TMC(17, 57), TMC(17, 59), TMC(17, 61), TMC(17, 63), TMC(17, 42),
   TMC(17, 39), TMC(18, 1), TMC(19, 64), TMC(20, 64), TMC(21, 1),
   TMC(22, 65), TMC(23, 1), TMC(24, 52), TMC(25, 1), TMC(26, 64),
   TMC(27, 67), TMC(28, 68), TMC(28, 69), TMC(29, 0), TMC(30, 53),
   TMC(31, 10), TMC(32, 12), TMC(33, 13), TMC(34, 12), TMC(35, 71),
   TMC(35, 74), TMC(36, 10), TMC(37, 75), TMC(38, 10), TMC(39, 10),
   TMC(40, 11), TMC(41, 9), TMC(42, 76), TMC(43, 78), TMC(44, 79),
   TMC(45, 81), TMC(45, 83), TMC(46, 71), TMC(46, 74), TMC(47, 85),
   TMC(47, 87), TMC(48, 2), TMC(49, 8), TMC(50, 2), TMC(51, 52)]
  end
  structure ThmBind = struct
    val DT = Thm.disk_thm
    val read = Term.read_raw tmvector
  end
  fun op commands_TY_DEF x = x
    val op commands_TY_DEF =
    ThmBind.DT(((("example1",0),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%63%26%78%23%54$0@%76%70%69%80@4|@$0@|@"])
  fun op commands_BIJ x = x
    val op commands_BIJ =
    ThmBind.DT(((("example1",1),
                [("bool",[116]),("example1",[0])]),["DISK_THM"]),
               [ThmBind.read"%52%44%14%57%92%83$0@3$0@|@2%47%24%56%23%54$0@%76%70%69%80@4|$0@2%58%83%92$0@3$0@2|@2"])




  fun op commands_size_def x = x
    val op commands_size_def =
    ThmBind.DT(((("example1",15),[]),[]),
               [ThmBind.read"%44%37%58%85$0@2%53@|@"])
  fun op commands_CASE x = x
    val op commands_CASE =
    ThmBind.DT(((("example1",16),[]),[]),
               [ThmBind.read"%44%37%43%29%43%31%43%33%43%35%55%84$4@$3@$2@$1@$0@2%22%72%54$0@%76%69%80@4$4@%72%54$0@%76%70%80@4$3@%72%58$0@%76%70%80@4$2@$1@3|%83$4@3|@|@|@|@|@"])
  fun op staff_TY_DEF x = x
    val op staff_TY_DEF =
    ThmBind.DT(((("example1",24),
                [("bool",[25]),("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%65%27%79%23%54$0@%76%70%69%80@4|@$0@|@"])
  fun op staff_BIJ x = x
    val op staff_BIJ =
    ThmBind.DT(((("example1",25),
                [("bool",[116]),("example1",[24])]),["DISK_THM"]),
               [ThmBind.read"%52%48%15%59%93%103$0@3$0@|@2%47%24%56%23%54$0@%76%70%69%80@4|$0@2%58%103%93$0@3$0@2|@2"])




  fun op staff_size_def x = x
    val op staff_size_def =
    ThmBind.DT(((("example1",39),[]),[]),
               [ThmBind.read"%48%38%58%105$0@2%53@|@"])
  fun op staff_CASE x = x
    val op staff_CASE =
    ThmBind.DT(((("example1",40),[]),[]),
               [ThmBind.read"%48%38%43%29%43%31%43%33%43%35%55%104$4@$3@$2@$1@$0@2%22%72%54$0@%76%69%80@4$4@%72%54$0@%76%70%80@4$3@%72%58$0@%76%70%80@4$2@$1@3|%103$4@3|@|@|@|@|@"])
  fun op num2commands_commands2num x = x
    val op num2commands_commands2num =
    ThmBind.DT(((("example1",2),[("example1",[1])]),["DISK_THM"]),
               [ThmBind.read"%44%14%57%92%83$0@3$0@|@"])
  fun op commands2num_num2commands x = x
    val op commands2num_num2commands =
    ThmBind.DT(((("example1",3),[("example1",[1])]),["DISK_THM"]),
               [ThmBind.read"%47%24%56%54$0@%76%70%69%80@5%58%83%92$0@3$0@2|@"])
  fun op num2commands_11 x = x
    val op num2commands_11 =
    ThmBind.DT(((("example1",4),
                [("bool",[26]),("example1",[1])]),["DISK_THM"]),
               [ThmBind.read"%47%24%47%25%60%54$1@%76%70%69%80@5%60%54$0@%76%70%69%80@5%56%57%92$1@2%92$0@3%58$1@$0@4|@|@"])
  fun op commands2num_11 x = x
    val op commands2num_11 =
    ThmBind.DT(((("example1",5),
                [("bool",[26]),("example1",[1])]),["DISK_THM"]),
               [ThmBind.read"%44%14%44%16%56%58%83$1@2%83$0@3%57$1@$0@2|@|@"])
  fun op num2commands_ONTO x = x
    val op num2commands_ONTO =
    ThmBind.DT(((("example1",6),
                [("bool",[25,62]),("example1",[1])]),["DISK_THM"]),
               [ThmBind.read"%44%14%66%24%52%57$1@%92$0@3%54$0@%76%70%69%80@5|@|@"])
  fun op commands2num_ONTO x = x
    val op commands2num_ONTO =
    ThmBind.DT(((("example1",7),
                [("bool",[26]),("example1",[1])]),["DISK_THM"]),
               [ThmBind.read"%47%24%56%54$0@%76%70%69%80@5%61%14%58$1@%83$0@2|@2|@"])
  fun op num2commands_thm x = x
    val op num2commands_thm =
    ThmBind.DT(((("example1",12),[("example1",[8,9,10,11])]),[]),
               [ThmBind.read"%52%57%92%53@2%88@2%52%57%92%76%69%80@4%91@2%52%57%92%76%70%80@4%90@2%57%92%76%69%69%80@5%82@4"])
  fun op commands2num_thm x = x
    val op commands2num_thm =
    ThmBind.DT(((("example1",13),
                [("bool",[25,53]),("example1",[3,8,9,10,11]),
                 ("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%52%58%83%88@2%53@2%52%58%83%91@2%76%69%80@4%52%58%83%90@2%76%70%80@4%58%83%82@2%76%69%69%80@7"])
  fun op commands_EQ_commands x = x
    val op commands_EQ_commands =
    ThmBind.DT(((("example1",14),
                [("bool",[57]),("example1",[5])]),["DISK_THM"]),
               [ThmBind.read"%44%14%44%16%56%57$1@$0@2%58%83$1@2%83$0@3|@|@"])
  fun op commands_case_def x = x
    val op commands_case_def =
    ThmBind.DT(((("example1",17),
                [("bool",[53,55,63]),("example1",[13,16]),
                 ("numeral",[3,6,7])]),["DISK_THM"]),
               [ThmBind.read"%52%43%29%43%31%43%33%43%35%55%84%88@$3@$2@$1@$0@2$3@|@|@|@|@2%52%43%29%43%31%43%33%43%35%55%84%91@$3@$2@$1@$0@2$2@|@|@|@|@2%52%43%29%43%31%43%33%43%35%55%84%90@$3@$2@$1@$0@2$1@|@|@|@|@2%43%29%43%31%43%33%43%35%55%84%82@$3@$2@$1@$0@2$0@|@|@|@|@4"])
  fun op datatype_commands x = x
    val op datatype_commands =
    ThmBind.DT(((("example1",18),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%74%18%88@%91@%90@%82@2"])
  fun op commands_distinct x = x
    val op commands_distinct =
    ThmBind.DT(((("example1",19),
                [("example1",[13,14]),("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%52%106%57%88@%91@3%52%106%57%88@%90@3%52%106%57%88@%82@3%52%106%57%91@%90@3%52%106%57%91@%82@3%106%57%90@%82@7"])
  fun op commands_case_cong x = x
    val op commands_case_cong =
    ThmBind.DT(((("example1",20),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("example1",[6,8,9,10,11,17]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%44%2%44%4%43%29%43%31%43%33%43%35%60%52%57$5@$4@2%52%60%57$4@%88@2%55$3@%30@3%52%60%57$4@%91@2%55$2@%32@3%52%60%57$4@%90@2%55$1@%34@3%60%57$4@%82@2%55$0@%36@7%55%84$5@$3@$2@$1@$0@2%84$4@%30@%32@%34@%36@3|@|@|@|@|@|@"])
  fun op commands_nchotomy x = x
    val op commands_nchotomy =
    ThmBind.DT(((("example1",21),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("example1",[6,8,9,10,11]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%44%14%81%57$0@%88@2%81%57$0@%91@2%81%57$0@%90@2%57$0@%82@4|@"])
  fun op commands_Axiom x = x
    val op commands_Axiom =
    ThmBind.DT(((("example1",22),
                [("bool",[8,14,25,53,55,63]),("example1",[13]),
                 ("numeral",[3,8])]),["DISK_THM"]),
               [ThmBind.read"%43%39%43%40%43%41%43%42%62%20%52%55$0%88@2$4@2%52%55$0%91@2$3@2%52%55$0%90@2$2@2%55$0%82@2$1@4|@|@|@|@|@"])
  fun op commands_induction x = x
    val op commands_induction =
    ThmBind.DT(((("example1",23),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("example1",[6,8,9,10,11]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%45%9%60%52$0%82@2%52$0%88@2%52$0%90@2$0%91@5%44%14$1$0@|@2|@"])
  fun op num2staff_staff2num x = x
    val op num2staff_staff2num =
    ThmBind.DT(((("example1",26),[("example1",[25])]),["DISK_THM"]),
               [ThmBind.read"%48%15%59%93%103$0@3$0@|@"])
  fun op staff2num_num2staff x = x
    val op staff2num_num2staff =
    ThmBind.DT(((("example1",27),[("example1",[25])]),["DISK_THM"]),
               [ThmBind.read"%47%24%56%54$0@%76%70%69%80@5%58%103%93$0@3$0@2|@"])
  fun op num2staff_11 x = x
    val op num2staff_11 =
    ThmBind.DT(((("example1",28),
                [("bool",[26]),("example1",[25])]),["DISK_THM"]),
               [ThmBind.read"%47%24%47%25%60%54$1@%76%70%69%80@5%60%54$0@%76%70%69%80@5%56%59%93$1@2%93$0@3%58$1@$0@4|@|@"])
  fun op staff2num_11 x = x
    val op staff2num_11 =
    ThmBind.DT(((("example1",29),
                [("bool",[26]),("example1",[25])]),["DISK_THM"]),
               [ThmBind.read"%48%15%48%17%56%58%103$1@2%103$0@3%59$1@$0@2|@|@"])
  fun op num2staff_ONTO x = x
    val op num2staff_ONTO =
    ThmBind.DT(((("example1",30),
                [("bool",[25,62]),("example1",[25])]),["DISK_THM"]),
               [ThmBind.read"%48%15%66%24%52%59$1@%93$0@3%54$0@%76%70%69%80@5|@|@"])
  fun op staff2num_ONTO x = x
    val op staff2num_ONTO =
    ThmBind.DT(((("example1",31),
                [("bool",[26]),("example1",[25])]),["DISK_THM"]),
               [ThmBind.read"%47%24%56%54$0@%76%70%69%80@5%67%15%58$1@%103$0@2|@2|@"])
  fun op num2staff_thm x = x
    val op num2staff_thm =
    ThmBind.DT(((("example1",36),[("example1",[32,33,34,35])]),[]),
               [ThmBind.read"%52%59%93%53@2%68@2%52%59%93%76%69%80@4%71@2%52%59%93%76%70%80@4%73@2%59%93%76%69%69%80@5%75@4"])
  fun op staff2num_thm x = x
    val op staff2num_thm =
    ThmBind.DT(((("example1",37),
                [("bool",[25,53]),("example1",[27,32,33,34,35]),
                 ("numeral",[3,7])]),["DISK_THM"]),
               [ThmBind.read"%52%58%103%68@2%53@2%52%58%103%71@2%76%69%80@4%52%58%103%73@2%76%70%80@4%58%103%75@2%76%69%69%80@7"])
  fun op staff_EQ_staff x = x
    val op staff_EQ_staff =
    ThmBind.DT(((("example1",38),
                [("bool",[57]),("example1",[29])]),["DISK_THM"]),
               [ThmBind.read"%48%15%48%17%56%59$1@$0@2%58%103$1@2%103$0@3|@|@"])
  fun op staff_case_def x = x
    val op staff_case_def =
    ThmBind.DT(((("example1",41),
                [("bool",[53,55,63]),("example1",[37,40]),
                 ("numeral",[3,6,7])]),["DISK_THM"]),
               [ThmBind.read"%52%43%29%43%31%43%33%43%35%55%104%68@$3@$2@$1@$0@2$3@|@|@|@|@2%52%43%29%43%31%43%33%43%35%55%104%71@$3@$2@$1@$0@2$2@|@|@|@|@2%52%43%29%43%31%43%33%43%35%55%104%73@$3@$2@$1@$0@2$1@|@|@|@|@2%43%29%43%31%43%33%43%35%55%104%75@$3@$2@$1@$0@2$0@|@|@|@|@4"])
  fun op datatype_staff x = x
    val op datatype_staff =
    ThmBind.DT(((("example1",42),[("bool",[25,170])]),["DISK_THM"]),
               [ThmBind.read"%74%28%68@%71@%73@%75@2"])
  fun op staff_distinct x = x
    val op staff_distinct =
    ThmBind.DT(((("example1",43),
                [("example1",[37,38]),("numeral",[3,6])]),["DISK_THM"]),
               [ThmBind.read"%52%106%59%68@%71@3%52%106%59%68@%73@3%52%106%59%68@%75@3%52%106%59%71@%73@3%52%106%59%71@%75@3%106%59%73@%75@7"])
  fun op staff_case_cong x = x
    val op staff_case_cong =
    ThmBind.DT(((("example1",44),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("example1",[30,32,33,34,35,41]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%48%3%48%5%43%29%43%31%43%33%43%35%60%52%59$5@$4@2%52%60%59$4@%68@2%55$3@%30@3%52%60%59$4@%71@2%55$2@%32@3%52%60%59$4@%73@2%55$1@%34@3%60%59$4@%75@2%55$0@%36@7%55%104$5@$3@$2@$1@$0@2%104$4@%30@%32@%34@%36@3|@|@|@|@|@|@"])
  fun op staff_nchotomy x = x
    val op staff_nchotomy =
    ThmBind.DT(((("example1",45),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("example1",[30,32,33,34,35]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%48%15%81%59$0@%68@2%81%59$0@%71@2%81%59$0@%73@2%59$0@%75@4|@"])
  fun op staff_Axiom x = x
    val op staff_Axiom =
    ThmBind.DT(((("example1",46),
                [("bool",[8,14,25,53,55,63]),("example1",[37]),
                 ("numeral",[3,8])]),["DISK_THM"]),
               [ThmBind.read"%43%39%43%40%43%41%43%42%64%21%52%55$0%68@2$4@2%52%55$0%71@2$3@2%52%55$0%73@2$2@2%55$0%75@2$1@4|@|@|@|@|@"])
  fun op staff_induction x = x
    val op staff_induction =
    ThmBind.DT(((("example1",47),
                [("arithmetic",
                 [24,25,27,41,46,59,73,95,178,179,183,186,275]),
                 ("bool",
                 [8,14,25,31,35,42,50,51,53,57,62,63,92,95,100,103,104,
                  106]),("example1",[30,32,33,34,35]),
                 ("numeral",[3,5,6,7,8,15,16,17]),
                 ("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
               [ThmBind.read"%46%10%60%52$0%68@2%52$0%71@2%52$0%73@2$0%75@5%48%15$1$0@|@2|@"])
  fun op example1Theorem x = x
    val op example1Theorem =
    ThmBind.DT(((("example1",48),[("aclDrules",[3])]),["DISK_THM"]),
               [ThmBind.read"%60%98%50%1@%51%6@%7@3%100%77%68@2%94%88@4%60%98%50%1@%51%6@%7@3%87%77%68@2%94%88@4%98%50%1@%51%6@%7@3%94%88@4"])
  fun op example1TheoremA x = x
    val op example1TheoremA =
    ThmBind.DT(((("example1",49),
                [("aclDrules",[3]),
                 ("bool",[25,26,46,47,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%60%98%50%1@%51%6@%7@3%100%77%68@2%94%88@4%60%98%50%1@%51%6@%7@3%87%77%68@2%94%88@4%98%50%1@%51%6@%7@3%94%88@4"])
  fun op example1TheoremB x = x
    val op example1TheoremB =
    ThmBind.DT(((("example1",50),
                [("aclDrules",[3]),("bool",[25,62])]),["DISK_THM"]),
               [ThmBind.read"%60%98%50%1@%51%6@%7@3%100%77%68@2%94%88@4%60%98%50%1@%51%6@%7@3%87%77%68@2%94%88@4%98%50%1@%51%6@%7@3%94%88@4"])
  fun op example2Theorem x = x
    val op example2Theorem =
    ThmBind.DT(((("example1",51),[("aclDrules",[3,16])]),["DISK_THM"]),
               [ThmBind.read"%60%98%50%1@%51%6@%7@3%100%77%68@2%94%88@4%60%98%50%1@%51%6@%7@3%102%77%68@2%77%71@4%60%98%50%1@%51%6@%7@3%87%77%71@2%94%88@4%98%50%1@%51%6@%7@3%94%88@5"])
  fun op example2TheoremA x = x
    val op example2TheoremA =
    ThmBind.DT(((("example1",52),
                [("aclDrules",[3,16]),
                 ("bool",[25,26,46,47,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%60%98%50%1@%51%6@%7@3%100%77%68@2%94%88@4%60%98%50%1@%51%6@%7@3%102%77%68@2%77%71@4%60%98%50%1@%51%6@%7@3%87%77%71@2%94%88@4%98%50%1@%51%6@%7@3%94%88@5"])
  fun op example2TheoremB x = x
    val op example2TheoremB =
    ThmBind.DT(((("example1",53),
                [("aclDrules",[3,16]),("bool",[25,62])]),["DISK_THM"]),
               [ThmBind.read"%60%98%50%1@%51%6@%7@3%100%77%68@2%94%88@4%60%98%50%1@%51%6@%7@3%102%77%68@2%77%71@4%60%98%50%1@%51%6@%7@3%87%77%71@2%94%88@4%98%50%1@%51%6@%7@3%94%88@5"])
  fun op example3Theorem x = x
    val op example3Theorem =
    ThmBind.DT(((("example1",54),[("aclrules",[23,24])]),["DISK_THM"]),
               [ThmBind.read"%60%98%50%1@%51%6@%7@3%89%94%88@2%94%90@4%60%98%50%1@%51%6@%7@3%94%88@3%98%50%1@%51%6@%7@3%100%77%73@2%94%90@5"])
  fun op example3TheoremA x = x
    val op example3TheoremA =
    ThmBind.DT(((("example1",55),
                [("aclrules",[23,24]),
                 ("bool",[25,26,46,47,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%60%98%50%1@%51%6@%7@3%89%94%88@2%94%90@4%60%98%50%1@%51%6@%7@3%94%88@3%98%50%1@%51%6@%7@3%100%77%73@2%94%90@5"])
  fun op Mono_Reps_Theorem x = x
    val op Mono_Reps_Theorem =
    ThmBind.DT(((("example1",56),
                [("aclDrules",[3,4,16]),("aclrules",[33]),
                 ("bool",[25,26,46,47,52,53,62,92,93,95]),
                 ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
               [ThmBind.read"%60%97%49%0@%51%6@%7@3%86%12@%19@3%60%97%49%0@%51%6@%7@3%96%8@%12@%19@3%60%97%49%0@%51%6@%7@3%99%95%11@%13@2%19@3%60%97%49%0@%51%6@%7@3%101%11@%8@3%60%97%49%0@%51%6@%7@3%101%13@%12@3%97%49%0@%51%6@%7@3%19@6"])

  val _ = DB.bindl "example1"
  [("commands_TY_DEF",commands_TY_DEF,DB.Def),
   ("commands_BIJ",commands_BIJ,DB.Def),
   ("commands_size_def",commands_size_def,DB.Def),
   ("commands_CASE",commands_CASE,DB.Def),
   ("staff_TY_DEF",staff_TY_DEF,DB.Def), ("staff_BIJ",staff_BIJ,DB.Def),
   ("staff_size_def",staff_size_def,DB.Def),
   ("staff_CASE",staff_CASE,DB.Def),
   ("num2commands_commands2num",num2commands_commands2num,DB.Thm),
   ("commands2num_num2commands",commands2num_num2commands,DB.Thm),
   ("num2commands_11",num2commands_11,DB.Thm),
   ("commands2num_11",commands2num_11,DB.Thm),
   ("num2commands_ONTO",num2commands_ONTO,DB.Thm),
   ("commands2num_ONTO",commands2num_ONTO,DB.Thm),
   ("num2commands_thm",num2commands_thm,DB.Thm),
   ("commands2num_thm",commands2num_thm,DB.Thm),
   ("commands_EQ_commands",commands_EQ_commands,DB.Thm),
   ("commands_case_def",commands_case_def,DB.Thm),
   ("datatype_commands",datatype_commands,DB.Thm),
   ("commands_distinct",commands_distinct,DB.Thm),
   ("commands_case_cong",commands_case_cong,DB.Thm),
   ("commands_nchotomy",commands_nchotomy,DB.Thm),
   ("commands_Axiom",commands_Axiom,DB.Thm),
   ("commands_induction",commands_induction,DB.Thm),
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
   ("example1Theorem",example1Theorem,DB.Thm),
   ("example1TheoremA",example1TheoremA,DB.Thm),
   ("example1TheoremB",example1TheoremB,DB.Thm),
   ("example2Theorem",example2Theorem,DB.Thm),
   ("example2TheoremA",example2TheoremA,DB.Thm),
   ("example2TheoremB",example2TheoremB,DB.Thm),
   ("example3Theorem",example3Theorem,DB.Thm),
   ("example3TheoremA",example3TheoremA,DB.Thm),
   ("Mono_Reps_Theorem",Mono_Reps_Theorem,DB.Thm)]

  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "example1",
    thydataty = "TypeGrammarDeltas",
    read = ThmBind.read,
    data = "NTY8.example1,8.commandsNTY8.example1,5.staff"
  }
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "example1",
    thydataty = "TermGrammarDeltas",
    read = ThmBind.read,
    data =
        "OO12.commands2num3.%83OO12.num2commands3.%92OO2.go3.%88OO4.nogo3.%91OO6.launch3.%90OO5.abort3.%82OO13.commands_size3.%85OO13.commands_CASE3.%84OO4.case3.%84OO9.staff2num4.%103OO9.num2staff3.%93OO5.Alice3.%68OO3.Bob3.%71OO5.Carol3.%73OO3.Dan3.%75OO10.staff_size4.%105OO10.staff_CASE4.%104OO4.case4.%104"
  }
  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val example1_grammars = merge_grammars ["aclDrules"]
  local
  val (tyUDs, tmUDs) = GrammarDeltas.thy_deltas{thyname="example1"}
  val addtmUDs = term_grammar.add_deltas tmUDs
  val addtyUDs = type_grammar.apply_deltas tyUDs
  in
  val example1_grammars = 
    Portable.## (addtyUDs,addtmUDs) example1_grammars
  val _ = Parse.grammarDB_insert("example1",example1_grammars)
  val _ = Parse.temp_set_grammars (addtyUDs (Parse.type_grammar()), addtmUDs (Parse.term_grammar()))
  end (* addUDs local *)
  end


  val _ =
    TypeBase.write [
      let
        open TypeBasePure
        val tyinfo0 = mk_datatype_info
          {ax=ORIG commands_Axiom,
           case_def=commands_case_def,
           case_cong=commands_case_cong,
           induction=ORIG commands_induction,
           nchotomy=commands_nchotomy,
           size=SOME(Parse.Term`(example1$commands_size) :example1$commands -> num$num`,
                     ORIG commands_size_def),
           encode = NONE,
           lift=NONE,
           one_one=NONE,
           distinct=SOME commands_distinct,
           fields=let fun T t s A = mk_thy_type{Thy=t,Tyop=s,Args=A}
    val U = mk_vartype
in
[] end,
           accessors=[],
           updates=[],
           recognizers=[],
           destructors=[]}
        val tyinfo0 = EnumType.update_tyinfo num2commands_thm commands2num_thm NONE tyinfo0
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
           size=SOME(Parse.Term`(example1$staff_size) :example1$staff -> num$num`,
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

val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "example1"
end
