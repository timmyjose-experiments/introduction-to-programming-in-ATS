#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "share/HATS/atslib_staload_libats_libc.hats"

implement main0 () = {
  val x = 1 + 2
  val _ = print(x)
  val _ = print("\n")
  val PI = 3.14 and radius = 10.0
  val area = PI * radius * radius
  val _ = print(area)
  val _ = print("\n")
  val circumference = let 
  val PI = 3.14 and radius = 10.0 in 2.0 * PI * radius * radius 
  end
  val _ = print(circumference)
  val _ = print("\n")
  val area1 = $MATH.sqrt(s * (s - a) * (s - b) * (s - c)) where {
    val a = 3.0 and b = 4.0 and c = 5.0
    val s = (a + b + c) / 2
  }
  val _ = print(area1)
  val _ = print("\n")
}