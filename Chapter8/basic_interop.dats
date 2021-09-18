#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun ats_add
  (x: int, y: int): int = 
  x + y

fun ats_sub
  (x: int, y: int): int = 
  x - y

fun ats_mul
  (x: int, y: int): int = 
  x * y

fun ats_div
  (x: int, y: int): int = 
  if y = 0 then 0 else x / y

fun ats_mod
  (x: int, y: int): int = 
  if y = 0 then 0 else op mod(x, y)

fun ats_cmp
  (x: int, y: int): int = 
  compare(x, y)

extern
fun c_add(x: int, y: int): int = "ext#"

extern
fun c_sub(x: int, y: int): int = "ext#c_sub_in_c"

extern
fun c_mul(x: int, y: int): int = "ext#c_mul" // same as "ext#"

extern
fun c_div(x: int, y: int): int = "mac#c_div"

extern 
fun c_cmp(x: int, y: int): int = "sta#"

extern 
fun c_mod(x: int, y: int): int = "sta#c_mod" // same as "sta#"

%{
  int c_div(int x, int y)
  {
    if (y == 0) {
      return 0;
    }
    return x / y;
  }

  int c_cmp(int x, int y)
  {
    if (x < y) {
      return -1;
    } else if (x == y) {
      return 0;
    } else {
      return 1;
    }
  }

  int c_mod(int x, int y) 
  {
    if (y == 0) {
      return 0;
    }

    return x % y;
  }
%}

implement main0 (argc, argv) = {
  val () = if argc != 3 then prerrln!("Usage: ", argv[0], "<num-1> <num-2>")
  val () = assertloc(argc = 3)

  val a = g0string2int(argv[1])
  val b = g0string2int(argv[2])

  val () = assertloc(c_add(a, b) = ats_add(a, b))
  val () = assertloc(c_sub(a, b) = ats_sub(a, b))
  val () = assertloc(c_mul(a, b) = ats_mul(a, b))
  val () = assertloc(c_div(a, b) = ats_div(a, b))
  val () = assertloc(c_mod(a, b) = ats_mod(a, b))
  val () = assertloc(c_cmp(a, b) = ats_cmp(a, b))
}
