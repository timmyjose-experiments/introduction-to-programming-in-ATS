#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "includec.sats"

extern fun add(m: int, n: int): int = "ext#"
extern fun sub(m: int, n: int): int = "ext#"

implement main0 (argc, argv) = {
  val () = if argc != 3 then prerrln!("Usage: ", argv[0], " <num1> <num2>")
  val () = assertloc(argc = 3)

  val m = g0string2int(argv[1])
  val n = g0string2int(argv[2])
  val () = println!(add(m, n))
  val () = println!(sub(m, n))
}
