#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

extern 
fun fact(n: int): int

extern
fun fact2(n: int, res: int): int = "ext#fact2_in_c"

implement fact(n) = fact2(n, 1)

implement main0 (argc, argv) = {
  val () = if argc != 2 then prerrln!("Usage: ", argv[0], " <num>")
  val () = assertloc(argc = 2)

  val n = g0string2int(argv[1])
  val () = println!(fact(n))
}
