#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun sum_rec
  (n: int): int = 
  if n = 0
    then 0
    else n + sum_rec(n - 1)

fun prod_rec
  (n: int): int = 
  if n = 0
    then 1
    else n * prod_rec(n - 1)

fun sum_tco
  (n: int): int = 
  let 
    fun aux(n: int, acc: int): int = 
      if n = 0
        then acc
        else aux(n - 1, acc + n)
  in
    aux(n, 0)
  end

fun prod_tco
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
  val _ = sum_rec(10) = sum_tco(10)
  val _ = println!("sum_rec(10) = ", sum_rec(10), ", sum_tco(10) = ", sum_tco(10))
  val _ = prod_rec(10) = prod_tco(10)
  val _ = println!("prod_rec(10) = ", prod_rec(10), ", prod_tco(10) = ", prod_tco(10))
}
