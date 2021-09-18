#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload CALC = "calculator.sats"
staload "calculator.dats"

implement main0 (argc, argv) = {
  val () = if argc != 3 then prerrln!("Usage: ", argv[0], " <num-1> <num-2>")
  val () = assertloc(argc = 3)

  val a = g0string2int(argv[1])
  val b = g0string2int(argv[2])
  val () = println!($CALC.add(a, b))
  val () = println!($CALC.sub(a, b))
  val () = println!($CALC.mul(a, b)) 
  val () = println!($CALC.div(a, b))
}
