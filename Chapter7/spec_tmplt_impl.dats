#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

// constraint
extern 
fun{a: t@ype}
eq_elt_elt
  (x: a, y: a): bool

implement eq_elt_elt<int>(x, y) = g0int_eq(x, y)
implement eq_elt_elt<double>(x, y) = g0float_eq(x, y)
implement eq_elt_elt<string>(x, y) = x = y

fun{a: t@ype}
listeq
  (xs: list0 a, ys: list0 a): bool =
  case+ (xs, ys) of
    | (list0_nil(), list0_nil()) => true
    | (list0_nil(), _) => false
    | (_, list0_nil()) => false
    | (list0_cons(x, xs), list0_cons(y, ys)) =>
        ifcase
          | eq_elt_elt<a>(x, y) => listeq<a>(xs, ys)
          | _ => false

fun{a: t@ype}
listeqf
  (xs: list0 a, ys: list0 a, eq: (a, a) -> bool): bool = 
  case+ (xs, ys) of
    | (list0_nil(), list0_nil()) => true
    | (list0_nil(), _) => false
    | (_, list0_nil()) => false
    | (list0_cons(x, xs), list0_cons(y, ys)) =>
        ifcase
          | eq(x, y) => listeqf<a>(xs, ys, eq)
          | _ => false

implement main0 () = {
  val xs1 = list0($arrpsz{int}(1, 2, 3, 4, 5))
  val xs2 = list0($arrpsz{int}(1, 2, 3, 4, 5, 6))
  val xs3 = list0($arrpsz{int}(1, 2, 3, 4, 5))

  val () = assertloc(listeq<int>(xs1, xs3))
  val () = assertloc(not(listeq<int>(xs1, xs2)))
  val () = assertloc(not(listeq<int>(xs2, xs3)))
  val () = assertloc(listeqf<int>(xs1, xs3, lam (x, y) => x = y))
  val () = assertloc(not(listeqf<int>(xs1, xs2, lam (x, y) => x = y)))
  val () = assertloc(not(listeqf<int>(xs2, xs3, lam (x, y) => x = y)))

  val ys1 = list0($arrpsz{double}(1.0, 2.1, 3.2, 4.3, 5.0))
  val ys2 = list0($arrpsz{double}(1.0, 2.1, 3.2, 3.4, 2.3))
  val ys3 = list0($arrpsz{double}(1.0, 2.1, 3.2, 4.3, 5.0))

  val () = assertloc(listeq<double>(ys1, ys3))
  val () = assertloc(not(listeq<double>(ys1, ys2)))
  val () = assertloc(not(listeq<double>(ys2, ys3)))
  val () = assertloc(listeqf<double>(ys1, ys3, eq_elt_elt<double>))
  val () = assertloc(not(listeqf<double>(ys1, ys2, eq_elt_elt<double>)))
  val () = assertloc(not(listeqf<double>(ys2, ys3, eq_elt_elt<double>)))
}
