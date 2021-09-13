#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* polymorphic data types *)

datatype list0 (a: t@ype) = 
  | list0_nil (a) of ()
  | list0_cons (a) of (a, list0 a)

fun {a: t@ype}
list0_length
  (lst: list0 a): int = 
  case+ lst of
    | list0_nil () => 0
    | list0_cons (_, lst) => 1 + list0_length(lst)

datatype option0 (a: t@ype) = 
  | option0_none (a) of ()
  | option0_some (a) of a

fun divopt
  (x: int, y: int): option0 int = 
  ifcase
    | y = 0 => option0_none()
    | _ => option0_some{int}(x/y)

fun {a: t@ype}
list0_last
  (lst: list0 a): option0 a =
  case+ lst of
    | list0_nil () => option0_none()
    | list0_cons(x, list0_nil()) => option0_some{a}(x)
    | list0_cons(_, lst) => list0_last(lst)

implement main0 () = {
  val charlst0 = list0_nil()
  val () = assertloc(list0_length<char>(charlst0) = 0)

  val charlst1 = list0_cons('h', list0_cons('e', list0_cons('l', list0_cons('l', list0_cons('o', list0_nil())))))
  val () = assertloc(list0_length(charlst1) = 5)

  val intlst1 = list0_cons(1, list0_cons(2, list0_cons(3, list0_cons(4, list0_cons(5, list0_nil())))))
  val () = assertloc(list0_length(intlst1) = 5)

  val () = 
    case divopt(10, 2) of
      | option0_some(x) => println!("The result of the division is ", x)
      | option0_none() => println!("No answer!")

  val () = 
    case divopt(10, 0) of
      | option0_some(x) => println!("The result of the division is ", x)
      | option0_none() => println!("No answer!")

  val strlst0 = list0_nil{string}()
  val () = 
    case list0_last(strlst0) of
      | option0_some(s) => println!("The last element of strlst0 is ", s)
      | option0_none() => println!("No last value for strlst0")
}

