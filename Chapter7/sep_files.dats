#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "sep_files.sats"

implement add(x, y) = x + y
implement sub(x, y) = x - y
implement mul(x, y) = x * y
implement div(x, y) = if y = 0 then 0 else x / y

implement fact(n) =
  ifcase
    | n <= 0 => 1
    | _ => n * fact(n - 1)

implement fact10 = fact(10)

implement swap_boxed{a, b}(xy) = (xy.1, xy.0)

implement{a, b} swap_tmplt(xy) = (xy.1, xy.0)

implement main0 (argc, argv) = {
  val () = if argc != 3 then prerrln!("Usage: ", argv[0], " <num-1> <num-2>")
  val () = assertloc(argc = 3)
  
  val x = g0string2int(argv[1])
  val y = g0string2int(argv[2])
  val () = println!(add(x, y))
  val () = println!(sub(x, y))
  val () = println!(mul(x, y))
  val () = println!(div(x, y))

  val () = println!(fact(x))
  val () = println!(fact(y))
  val () = println!(fact10)

  val t1 = (box("world"), box("hello"))
  val () = let val (f1, s1) = swap_boxed(t1) in
  println!(unbox(f1), ", " , unbox(s1)) end

  val t2 = (1, "again")
  val () = let val (f2, s2) = swap_tmplt<int, string>(t2) in
  println!(f2, ", " , s2) end
}
