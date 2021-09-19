#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

extern
fun fact(n: int): int

extern val fact10: int

implement fact(n) = 
  if n <= 0 then 1 else n * fact(n - 1)

implement fact10 = fact(10)

implement main0 (argc, argv) = {
  val () = if argc != 2 then prerrln!("Usage: ", argv[0], " <num>")
  val () = assertloc (argc = 2)

  val n = g0string2int(argv[1])
  val () = println!(fact(n))

  val () = println!(fact10)
}
