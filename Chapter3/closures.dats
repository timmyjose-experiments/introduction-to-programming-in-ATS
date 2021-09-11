#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun sum1
  (n: int): int =
  let 
    fun loop(n: int, acc: int): int = 
      if n = 0
        then acc
        else loop(n - 1, acc + n)
  in
    loop(n, 0)
  end

(* this is a closure function since it 
   captures the `n` from the surrounding context *)
fun sum2
  (n: int): int = 
  let 
    fun loop(i: int, acc: int):<cloref1> int = 
      if i = 0
        then acc
        else loop(i - 1, acc + i)
  in
    loop(n, 0)
  end

fun addx(x: int): int -<cloref1> int = 
  lam y => x + y

implement main0() = {
  val () = println!("sum1(100) = ", sum1(100))
  val () = println!("sum2(100) = ", sum2(100))

  val plus1 = addx(1)
  val () = println!("plus1(99) = ", plus1(99))

  val plus100 = addx(100)
  val () = println!("plus100(99) = ", plus100(99))
}
