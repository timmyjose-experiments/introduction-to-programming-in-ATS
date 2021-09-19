#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload TIME = "libats/libc/SATS/time.sats"
staload UN = "prelude/SATS/unsafe.sats"

staload RG = "contrib/atscntrb/atscntrb-hx-mytesting/SATS/randgen.sats"
staload "contrib/atscntrb/atscntrb-hx-mytesting/DATS/randgen.dats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

fun{a: t@ype}{b: t@ype}
list0_fold_left
  (f: (b, a) -<cloref1> b, xs: list0 a, ini: b): b =
  case+ xs of
    | list0_nil() => ini
    | list0_cons(x, xs) => list0_fold_left<a><b>(f, xs, f(ini, x))

fun sum_list_int
  (xs: list0 int): int =
  case+ xs of
    | list0_nil() => 0
    | list0_cons(x, xs) => x + sum_list_int(xs)

fun prod_list_int
  (xs: list0 int): int = 
  case+ xs of
    | list0_nil() => 1
    | list0_cons(x, xs) => x * prod_list_int(xs)

implement main0 () = {
  macdef INTMAX = 100L
  #define N 15

  val () = $STDLIB.srand48($UN.cast2lint($TIME.time_get()))

  implement $RG.randgen_val<int>() = let 
    val x = $STDLIB.lrand48() in $UN.cast2int(x mod INTMAX)
  end

  val xs1 = $RG.randgen_list<int>(N)
  val () = fprintln!(stdout_ref, "xs1: ", xs1)

  val () = assertloc(list0_fold_left<int><int>(lam (acc, x) => acc + x, g0ofg1(xs1), 0) = sum_list_int(g0ofg1(xs1)))
  val () = assertloc(list0_fold_left<int><int>(lam (acc, x) => acc * x, g0ofg1(xs1), 1) = prod_list_int(g0ofg1(xs1)))

  val xs2 = list0($arrpsz{int}(1, 2, 3, 4, 5))
  val () = fprintln!(stdout_ref, "xs2: ", xs2)
  val () = assertloc(list0_fold_left<int><int>(lam (acc, x) => acc + x, xs2, 0) = 15)
  val () = assertloc(list0_fold_left<int><int>(lam (acc, x) => acc * x, xs2, 1) = 120)
}
