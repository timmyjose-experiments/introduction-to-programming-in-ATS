#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun sum1
  (n: int) : int = 
  if n >= 1 
    then n + sum1(n - 1)
    else n

fun sum2
  (m: int, n: int) : int =
  if m <= n 
    then m + sum2(m + 1, n)
    else 0

fun factorial
  (n: int) : int = 
  if n <= 0
    then 1
    else n * factorial (n - 1)

fun sum3
  (m: int, n: int): int = 
  if m <= n
    then let 
    val mn2 = (m + n) / 2
  in
    sum3(m, mn2 - 1) + mn2 +  sum3(mn2 + 1, n)
  end
  else 0

fun fib
  (n: int) : int = 
  if n <= 2
    then n
    else fib(n - 1) + fib(n -2)

implement main0 () = {
  val res1 = sum1(10)
  val _ = print(res1)
  val _ = print("\n")

  val res11 = sum2(1, 10)
  val _ = print(res11)
  val _ = print("\n")

  val res111 = sum3(1, 10)
  val _ = print(res111)
  val _ = print("\n")

  val res2 = factorial(10)
  val _ = print(res2)
  val _ = print("\n")

  val res3 = fib(15)
  val _ = print(res3)
  val _ = print("\n")
}