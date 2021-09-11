#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun bsearch(
  f: int -<cloref1> uint,
  x0: uint, lb: int, ub: int): int = 
  if lb <= ub 
    then let 
      val mid = (ub + lb) / 2
    in
      if x0 < f(mid) 
        then bsearch(f, x0, lb, mid - 1)
        else bsearch(f, x0, mid + 1, ub)
    end
  else ub

val
ISQRT_MAX = (1 << 16) - 1

fun square
  (x: uint): uint = 
  x * x

fun isqrt
  (x: uint): int = 
  bsearch(lam i => square(g0i2u(i)), x, 0, ISQRT_MAX)

implement main0 () = {
  val () = println!("The integer square root of 100 is ", isqrt(g0i2u(100)))
  val () = println!("The integer square root of 10 is ", isqrt(g0i2u(10)))
  val () = println!("The integer square root of 1 is ", isqrt(g0i2u(1)))
}
