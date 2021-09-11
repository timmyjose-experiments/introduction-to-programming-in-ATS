#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun myabs
  (x: int): int =
  ifcase
    | x < 0 => ~x
    | x = 0 => 0
    | _ => x

fun mysignum
  (x: int): int = 
  ifcase
    | x < 0 => ~1
    | x = 0 => 0
    | _ => 1

implement main0 () = {
  val () = assertloc(myabs(~10) = 10)
  val () = assertloc(mysignum(~10) = ~1)
  val () = assertloc(mysignum(0) = 0)
  val () = assertloc(mysignum(10) = 1)
}
