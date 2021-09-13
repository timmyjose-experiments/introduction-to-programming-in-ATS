#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

datatype list0 (a: t@ype) = 
  | list0_nil (a) of ()
  | list0_cons (a) of (a, list0 a)

fun {a: t@ype}
list0_append
  (xs: list0 a, ys: list0 a): list0 a =
  case+ (xs, ys) of
    | (list0_nil(), ys) => ys
    | (list0_cons(x, xs), ys) => list0_cons{a}(x, list0_append<a>(xs, ys))

fun print_int_list
  (xs: list0 int): void = 
  case+ xs of
    | list0_nil() => ()
    | list0_cons(x, xs) => 
      (
        print!(x, " ");
        print_int_list(xs)
      )

fun print_string_list
  (xs: list0 string): void = 
  case+ xs of
    | list0_nil() => ()
    | list0_cons(x, xs) =>
      (
        print!(x, " ");
        print_string_list(xs)
      )

implement main0 () = {
  val xs1 = list0_cons(1, list0_cons(2, list0_cons(3, list0_nil())))
  val xs2 = list0_cons(4, list0_cons(5, list0_nil()))
  val xs3 = list0_append(xs1, xs2)
  val () = print_int_list(xs3)
  val () = print_newline()

  val ys1 = list0_cons("hello", list0_cons("world", list0_cons("we", list0_nil())))
  val ys2 = list0_cons("meet", list0_cons("again", list0_nil()))
  val ys3 = list0_append(ys1, ys2)
  val () = print_string_list(ys3)
  val () = print_newline()
}