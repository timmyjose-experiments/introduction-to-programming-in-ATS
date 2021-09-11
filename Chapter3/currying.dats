#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun acker1
  (m: int, n: int): int = 
  if m > 0
    then if n > 0 then acker1(m - 1, acker1(m, n - 1)) else acker1(m - 1, 1)
    else n + 1

fun acker2
  (m: int) (n: int): int = 
  if m > 0
    then if n > 0 then acker2 (m - 1) (acker2 m (n - 1)) else acker2 (m - 1) 1
    else n + 1

fun add1
  (x: int, y: int): int = 
  x + y

fun add2
  (x: int) (y: int): int = 
  x + y

fun mul1
  (x: int, y: int, z: int): int = 
  x * y * z

fun mul2
  (x: int) (y: int) (z: int): int = 
  x * y * z

implement main0 () = {
  val () = println!("acker1(2, 3) = ", acker1(2, 3))
  val () = println!("acker1(3, 4) = ", acker1(3, 4))

  val () = println!("acker2 2 3 = ", acker2 2 3)
  val () = println!("acker2 3 4 = ", acker2 3 4)

  val () = assertloc(add1(11, 12) = add2 11 12)
  val () = assertloc(mul1(2, 3, 4) = mul2 2 3 4)
}
