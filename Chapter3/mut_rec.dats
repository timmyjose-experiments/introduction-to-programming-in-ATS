#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun is_even
  (n: int): bool = 
  if n = 0 then true
    else is_odd(n - 1)
and
  is_odd
    (n: int): bool = 
    if n = 0 then false
      else is_even(n - 1)

implement main0() = {
  val _ = assertloc(is_even(2))
  val _ = assertloc(is_even(12))
  val _ = assertloc(not(is_even(13)))

  val _ = assertloc(is_odd(1))
  val _ = assertloc(not(is_odd(2)))
  val _ = assertloc(is_odd(3))
  val _ = assertloc(is_odd(13))
}
