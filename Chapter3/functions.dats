#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fn square(x: double): double = 
  x * x

val cube = lam (x: double): double => x * x * x

fn area_of_ring
  (R: double, r: double): double =
  3.14159 * (square(R) - square(r))

fn sqrsum1(x: int, y: int): int = 
  x * x + y * y

typedef int2 = @(int, int)

fn sqrsum2
  (xy: int2): int = 
  xy.0 * xy.0 + xy.1 * xy.1

implement main0 () = {
  val res1 = square(10.0)
  val _ = print(res1)
  val _ = print("\n")

  val res2 = cube(10.0)
  val _ = print(res2)
  val _ = print("\n")

  val area = area_of_ring(R, r) where {
    val R = 20.0 
    val r = 10.0
  }

  val _ = print(area)
  val _ = print("\n")

  val s1  = sqrsum1(3, 4)
  val s2 = sqrsum2(@(3, 4))
  val _ = print(s1)
  val _ = print("\n")
  val _ = print(s2)
  val _ = print("\n")
}