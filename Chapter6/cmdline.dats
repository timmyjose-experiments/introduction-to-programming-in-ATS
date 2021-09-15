#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun add
  (x: int, y: int): int = 
  x + y

implement main0 (argc, argv) = {
  val () = if argc != 3 then prerrln!("Usage: ", argv[0], " <integer> <integer>")
  val () = assertloc (argc >= 3)

  val x = g0string2int(argv[1])
  val y = g0string2int(argv[2])
  val () = println!("Sum = ", add(x, y))
}
