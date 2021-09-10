#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

implement main0 () = {
  val xyz = ('A', 1, 2.0)
  val x = xyz.0 and y = xyz.1 and z = xyz.2
  val _ = print(x)
  val _ = print("\n")
  val _ = print(y)
  val _ = print("\n")
  val _ = print(z)
  val _ = print("\n")
  val (xx, yy, zz) = xyz
  val  _ = print(xx)
  val _ = print("\n")
  val _ = print(yy)
  val _ = print("\n")
  val _ = print(zz)
  val _ = print("\n")

  // boxed tuples
  val bob = '( "Bob", 42, 12345.12)
  val '( name, age, salary) = bob 
  val _ = print(name)
  val _ = print("\n")
  val _ = print(age)
  val _ = print("\n")
  val _ = print(salary)
  val _ = print("\n")
}