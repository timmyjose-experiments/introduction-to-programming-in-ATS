#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/ML/SATS/basis.sats"
staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload TIME = "libats/libc/SATS/time.sats"
staload UN = "prelude/SATS/unsafe.sats"

staload RG = "contrib/atscntrb/atscntrb-hx-mytesting/SATS/randgen.sats"
staload "contrib/atscntrb/atscntrb-hx-mytesting/DATS/randgen.dats"

staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

typedef lte (a: t@ype) = (a, a) -> bool

fun{a: t@ype}
insert
  (e: a, xs: list0 a, lte: lte a): list0 a =
  case+ xs of
    | list0_nil() => list0_cons(e, list0_nil())
    | list0_cons(x, xs) when e \lte x => list0_cons{a}(e, list0_cons{a}(x, xs))
    | list0_cons(x, xs) => list0_cons{a}(x, insert<a>(e, xs, lte))

fun{a: t@ype}
insertion_sort
  (xs: list0 a, lte: lte a): list0 a = 
  case+ xs of
    | list0_nil() => list0_nil()
    | list0_cons(x, xs) => insert<a>(x, insertion_sort<a>(xs, lte), lte)

macdef INTMAX = 1000L

typedef T1 = int
implement $RG.randgen_val<T1>() = let
  val x = $STDLIB.lrand48() mod INTMAX in $UN.cast2int(x)
end

typedef T2 = double
implement $RG.randgen_val<T2>() = $STDLIB.drand48()

implement main0 () = {
  #define N 10

  val xs1 = $RG.randgen_list<T1>(N)
  val () = fprintln!(stdout_ref, "before sorting:\t", xs1)
  val xs1 = g0ofg1(xs1)
  val ys1 = insertion_sort<int>(xs1, lam (x, y) => x <= y)
  val ys1 = g1ofg0(ys1)
  val () = fprintln!(stdout_ref, "after sorting (ascending): ", ys1)
  val () = print_newline()

  val xs2 = $RG.randgen_list<T2>(N)
  val () = fprintln!(stdout_ref, "input:\t", xs2)
  val xs2 = g0ofg1(xs2)
  val ys2 = insertion_sort<double>(xs2, lam (x, y) => x >= y)
  val ys2 = g1ofg0(ys2)
  val () = fprintln!(stdout_ref, "after sorting (descending):  ", ys2)
  val () = print_newline()
}
