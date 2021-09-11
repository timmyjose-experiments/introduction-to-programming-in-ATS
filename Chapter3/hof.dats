#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun rtfind
  (f: int -> int): int = 
  let 
    fun loop(f: int -> int, n: int): int = 
      if f(n) = 0 
        then n
        else loop(f, n + 1)
  in
    loop(f, 0)
  end

fun sum
  (n: int): int =
  let 
    fun aux(n: int, acc: int): int = 
      if n = 0
        then acc
        else aux(n - 1, acc + n)
  in
    aux(n, 0)
  end

fun prod
  (n: int): int =
  let 
    fun aux(n: int, acc: int): int = 
      if n = 0
        then acc
        else aux(n - 1, acc * n)
  in
    aux(n, 1)
  end

fun ifold
  (f: (int, int) -> int, init: int, n: int): int =
  if n > 0
    then ifold(f, f(init, n), n - 1)
    else init

(*
// This does not work since the lambda passed to the ifold function is a closure.

fun sqrmodsum
  (n: int, d: int): int = 
  ifold(lam (acc, x) => if x mod d = 0 then acc + x * x else acc, 0, n)
*)

fun ifold2
  (f: (int, int) -<cloref1> int, init: int, n: int):<cloref1> int = 
  if n > 0
    then ifold2(f, f(init, n), n - 1)
  else init

fun sqrmodsum
  (n: int, d: int): int = 
  ifold2(lam (acc, x) => if x mod d = 0 then acc + x * x else acc, 0, n)

implement main0() = {
  val root = rtfind(lam x => x * x - x - 110)
  val () = println!("rtfind(lam x => x * x - x - 110) = ", root)

  val () = assertloc(sum(10) = 55)
  val () = assertloc(prod(10) = 3628800)

  val fold_sum = lam n => ifold(lam (acc, x) => acc + x, 0, n)
  val () = assertloc(sum(10) = fold_sum(10))

  val fold_prod = lam n => ifold(lam (acc, x) => acc * x, 1, n)
  val () = assertloc(prod(10) = fold_prod(10))

  val sqrsum = lam n => ifold(lam (acc, x) => acc + x * x, 0, n)
  val () = println!("sqrsum(10) = ", sqrsum(10))

  val modres = sqrmodsum(100, 3)
  val () = print(modres)
  val () = print_newline()
}
