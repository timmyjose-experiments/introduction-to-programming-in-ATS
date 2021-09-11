#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun factorial
  (n: int): int = 
  if n <= 0 then 1
    else n * factorial(n - 1)

fun tc_factorial
  (n: int): int =
  let 
    fun aux(n: int, acc: int): int = 
      if n = 0
        then acc
        else aux(n - 1, acc * n)
  in
    aux(n, 1)
  end

implement main0() = {
  val fac10 = factorial(10)
  val _ = println!("factorial(10) = ", fac10)

  val tc_fac10 = tc_factorial(10)
  val _ = println!("tc_factorial(10) = ", tc_fac10)
}