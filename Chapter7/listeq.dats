#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

(* this constraint makesthe listeq function typecheck *)
extern fun{a: t@ype}
eq_elt_elt
  (x: a, y: a): bool

(* these implementations must be visible at the location where the equality checks are carried out *)

implement eq_elt_elt<int>(x, y) = g0int_eq(x, y)
implement eq_elt_elt<double>(x, y) = g0float_eq(x, y)
implement eq_elt_elt<string>(x, y) = x = y

fun{a: t@ype} // preferred since it may generate more efficient code
listeq
  (xs: list0 a, ys: list0 a): bool = 
  case+ (xs, ys) of
    | (list0_nil(), list0_nil()) => true
    | (list0_nil(), _) => false
    | (_, list0_nil()) => false
    | (list0_cons(x, xs), list0_cons(y, ys)) =>
        eq_elt_elt<a>(x, y) andalso listeq<a>(xs, ys)

fun{a: t@ype}
listeqf
  (xs: list0 a, ys: list0 a, eq: (a, a) -> bool): bool =
  case+ (xs, ys) of
    | (list0_nil(), list0_nil()) => true
    | (list0_nil(), _) => false
    | (_, list0_nil()) => false
    | (list0_cons(x, xs), list0_cons(y, ys)) => 
        eq(x, y) andalso listeqf(xs, ys, eq)

implement main0 () = {
  val xs1 = list0($arrpsz{int}(1, 2, 3))
  val () = assertloc(listeq<int>(xs1, xs1))
  val () = assertloc(listeqf<int>(xs1, xs1, g0int_eq))

  val xs11 = list0($arrpsz{int}(1, 2, 3, 4, 5))
  val () = assertloc(not(listeq<int>(xs1, xs11)))
  val () = assertloc(not(listeqf<int>(xs1, xs11, g0int_eq)))

  val xs2 = list0($arrpsz{double}(1.2, 2.3, 3.4, 4.5, 5.6))
  val () = assertloc(listeq<double>(xs2, xs2))
  val () = assertloc(listeqf<double>(xs2, xs2, g0float_eq))

  val xs3 = list0($arrpsz{string}("hello", "world", "nice", "to", "meet", "you", "again"))
  val () = assertloc(listeq<string>(xs3, xs3))
  val () = assertloc(listeqf<string>(xs3, xs3, lam (s1, s2) => s1 = s2))
}
