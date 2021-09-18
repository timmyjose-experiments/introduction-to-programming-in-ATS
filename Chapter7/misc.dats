#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload TIME = "libats/libc/SATS/time.sats"
staload UN = "prelude/SATS/unsafe.sats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

staload RG = "contrib/atscntrb/atscntrb-hx-mytesting/SATS/randgen.sats"
staload  "contrib/atscntrb/atscntrb-hx-mytesting/DATS/randgen.dats"

// generic template interface

extern fun{a: t0p}{b: t0p} (* t0p is a synonym for t@ype *)
  list0_fold_left
    (xs: list0 b, f: (a, b) -<cloref1> a, init: a): a

// generic template implementation

implement{a}{b}
list0_fold_left
  (xs, f, ini) = 
  case+ xs of
    | list0_nil() => ini
    | list0_cons(x, xs) => list0_fold_left<a><b>(xs, f, f(ini, x))

(* specific tenplate implementation *)

extern fun{a: t@ype}
eq_elt_elt
  (x: a, y: a): bool

implement eq_elt_elt<int>(x, y) = g0int_eq(x, y)

implement eq_elt_elt<double>(x, y) = g0float_eq(x, y)

implement eq_elt_elt<bool>(x, y) = x = y (* works due to overloading *)

macdef INTMAX = 20L

typedef T1 = llint

implement $RG.randgen_val<T1>() = let 
  val x = $STDLIB.lrand48() mod INTMAX in $UN.cast2llint(x)
end

implement main0 () = {
  #define N 15

  val () = $STDLIB.srand48($UN.cast2lint($TIME.time_get()))

  val xs1 = $RG.randgen_list<T1>(N)
  val () = fprintln!(stdout_ref, "xs1: ", xs1)
  val () = println!("Sum = ", list0_fold_left<llint><llint>(g0ofg1(xs1), lam (acc, x) => acc + x, 0ll))
  val () = println!("Product = ", list0_fold_left<llint><llint>(g0ofg1(xs1), lam (acc, x) => acc * x, 1ll))

  val x = 100
  val y = 200
  val z = 100
  val f = 1.23
  val g = 1.23
  val h = ~1.23
  val () = assertloc(eq_elt_elt<int>(x, z))
  val () = assertloc(not(eq_elt_elt<int>(x, y)))
  val () = assertloc(eq_elt_elt<double>(f, g))
  val () = assertloc(not(eq_elt_elt<double>(f, h)))

  val () = assertloc(eq_elt_elt<bool>(true, true))
  val () = assertloc(eq_elt_elt<bool>(false, false))
  val () = assertloc(not(eq_elt_elt<bool>(true, false)))
}
