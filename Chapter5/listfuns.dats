#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

datatype list0 (a: t@ype) =
  | list0_nil (a) of ()
  | list0_cons (a) of (a, list0 a)

fun list0_int_print
  (xs: list0 int): void = 
  case+ xs of
    | list0_nil() => ()
    | list0_cons(x, xs) =>
      (
        print!(x, " ");
        list0_int_print(xs)
      )

fun list0_intstring_print
  (xs: list0 @(int, string)): void = 
  case+ xs of
    | list0_nil() => ()
    | list0_cons(@(a, b), xs) => 
      (
        print!("(", a, ", ", b, ")");
        list0_intstring_print(xs)
      )

fun{a: t@ype}
list0_append
  (xs: list0 a, ys: list0 a): list0 a =
  case+ (xs, ys) of
    | (list0_nil(), ys) => ys
    | (list0_cons(x, xs), ys) => list0_cons{a}(x, list0_append<a>(xs, ys))

fun{a: t@ype}
list0_reverse_append
  (xs: list0 a, ys: list0 a): list0 a =
  case+ (xs, ys) of
    | (list0_nil(), ys) => ys
    | (list0_cons(x, xs), ys) => list0_reverse_append<a>(xs, list0_cons{a}(x, ys))

fun{a: t@ype}
list0_reverse
  (xs: list0 a): list0 a =
  list0_reverse_append<a>(xs, list0_nil())

fun{a, b: t@ype}
list0_map
  (f: a -<cloref1> b, xs: list0 a): list0 b =
  case+ xs of
    | list0_nil() => list0_nil()
    | list0_cons(x, xs) => list0_cons{b}(f(x), list0_map<a, b>(f, xs))

fun{a, b: t@ype}
list0_foldleft
  (f: (b, a) -<cloref1> b, ini: b, xs: list0 a): b =
  case+ xs of
    | list0_nil() => ini
    | list0_cons(x, xs) => list0_foldleft<a, b>(f, f(ini, x), xs)

fun{a, b: t@ype}
list0_foldright
  (f: (a, b) -<cloref1> b, ini: b, xs: list0 a): b =
  case+ xs of
    | list0_nil() => ini
    | list0_cons(x, xs) => f(x, list0_foldright<a, b>(f, ini, xs))

fun{a, b: t@ype}
list0_zip
  (xs: list0 a, ys: list0 b): list0@(a, b) =
  case+ (xs, ys) of
    | (list0_nil(), _) => list0_nil()
    | (_, list0_nil()) => list0_nil()
    | (list0_cons(x, xs), list0_cons(y, ys)) => list0_cons{@(a, b)}(@(x, y), list0_zip<a, b>(xs, ys))

fun{a, b, c: t@ype}
list0_zipwith
  (f: (a, b) -<cloref1> c, xs: list0 a, ys: list0 b): list0 c =
  case+ (xs, ys) of
    | (list0_nil(), _) => list0_nil()
    | (_, list0_nil()) => list0_nil()
    | (list0_cons(x, xs), list0_cons(y, ys)) =>
        list0_cons{c}(f(x, y), list0_zipwith<a, b, c>(f, xs, ys))

implement main0 () = {
  val xs1 = list0_cons(1, list0_cons(2, list0_cons(3, list0_cons(4, list0_cons(5, list0_nil())))))
  val () = list0_int_print(xs1)
  val () = print_newline()

  val xs2 = list0_cons(~19, list0_cons(0, list0_cons(12, list0_nil())))
  val () = list0_int_print(xs2)
  val () = print_newline()

  val xs12 = list0_append(xs1, xs2)
  val () = list0_int_print(xs12)
  val () = print_newline()

  val xs1revxs2 = list0_reverse_append(xs1, xs2)
  val () = list0_int_print(xs1revxs2)
  val () = print_newline()

  val xs1rev = list0_reverse(xs1)
  val () = list0_int_print(xs1rev)
  val () = print_newline()

  val xs2rev = list0_reverse(xs2)
  val () = list0_int_print(xs2rev)
  val () = print_newline()

  val xs1sqr = list0_map<int, int>(lam x => x * x, xs1)
  val () = list0_int_print(xs1sqr)
  val () = print_newline()

  val xs2suml = list0_foldleft<int, int>(lam (acc, x) => acc + x, 0, xs2)
  val () = assertloc(xs2suml = ~7)

  val xs1prodl = list0_foldleft<int, int>(lam (acc, x) => acc * x, 1, xs1)
  val () = assertloc(xs1prodl = 120)

  val xs2sumr = list0_foldright<int, int>(lam (x, acc) => acc + x, 0, xs2)
  val () = assertloc(xs2sumr = ~7)

  val xs1prodr = list0_foldright<int, int>(lam (x, acc) => acc * x, 1, xs1)
  val () = assertloc(xs1prodr = 120)

  val xss = list0_cons("hello", list0_cons("world", list0_cons("again", list0_nil())))
  val xs1zipxss = list0_zip<int, string>(xs1, xss)
  val () = list0_intstring_print(xs1zipxss)
  val () = print_newline()

  val xs1plusxs2 = list0_zipwith<int, int, int>(lam (l, r) => l + r, xs1, xs2)
  val () = list0_int_print(xs1plusxs2)
  val () = print_newline()
}
