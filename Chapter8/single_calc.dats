#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

extern 
fun add(m: int, n: int): int = "ext#c_add"

extern
fun sub(m: int, n: int): int = "ext#c_sub"

extern
fun mul(m: int, n: int): int = "ext#c_mul"

extern
fun div(m: int, n: int): int = "ext#c_div"

%{^

  int c_add(int x, int y)
  {
    return x + y;
  }

  int c_sub(int x, int y)
  {
    return x - y;
  }
  int c_mul(int x, int y)
  {
    return x * y;
  }
  int c_div(int x, int y)
  {
    return x / y;
  }

%}

implement main0 (argc, argv) = {
  val () = if argc != 3 then prerrln!("Usage: ", argv[0], "<num1> <num2>")
  val () = assertloc (argc = 3)

  val m = g0string2int(argv[1])
  val n = g0string2int(argv[2])
  val () = println!(add(m, n))
  val () = println!(sub(m, n))
  val () = println!(mul(m, n))
  val () = println!(div(m, n))
}
