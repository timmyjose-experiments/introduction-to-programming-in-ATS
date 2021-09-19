#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun gcd
  (m: int, n: int): int = 
  let 
    val m = if m < 0 then ~m else m
    val n = if n < 0 then ~n else n

    fun loop(m: int, n: int): int = 
      if n = 0 then m else loop(n, m mod n)
  in
    loop(m, n)
  end

implement main0(argc, argv) = {
  val () = if argc != 3 then prerrln!("Usage: ", argv[0], " <num-1> <num-2>")
  val () = assertloc(argc = 3)

  val x = g0string2int(argv[1])
  val y = g0string2int(argv[2])
  val () = println!(gcd(x, y))
}