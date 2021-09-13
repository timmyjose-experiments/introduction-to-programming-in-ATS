#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/ML/SATS/basis.sats" // option0
staload "libats/ML/SATS/list0.sats" // list0
staload "libats/ML/DATS/list0.dats"

typedef lte (a: t@ype) = (a, a) -> bool

fun{a: t@ype}
merge
  (xs: list0 a, ys: list0 a, lte: lte a): list0 a =
  case+ (xs, ys) of
    | (list0_nil(), list0_nil()) => list0_nil()
    | (list0_nil(), ys) => ys
    | (xs, list0_nil()) => xs
    | (list0_cons(x, xs), list0_cons(y, ys)) when lte(x, y) => 
        list0_cons{a}(x, merge<a>(xs, list0_cons{a}(y, ys), lte)) 
    | (list0_cons(x, xs), list0_cons(y, ys)) =>
        list0_cons{a}(y, merge<a>(list0_cons{a}(x, xs), ys, lte))

fun{a: t@ype}
mergesort
  (xs: list0 a, lte: lte a): list0 a =
  let
    val n = list0_length<a>(xs)
    fun msort
      (xs: list0 a, n: int, lte: lte a): list0 a =
      if n >= 2 then split(xs, n, lte, n/2, nil0) else xs
    and
      split
        (xs: list0 a, n: int, lte: lte a, i: int, xsf: list0 a): list0 a =
        if i > 0 then let
          val-cons0 (x, xs) = xs
        in
          split(xs, n, lte, i - 1, cons0{a}(x, xsf))
        end else let
          val xsf = list0_reverse<a>(xsf)
          val xsf = msort(xsf, n/2, lte) and xs = msort(xs, n - n/2, lte)
        in
          merge<a>(xsf, xs, lte)
        end
  in
    msort(xs, n, lte)
  end

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload TIME = "libats/libc/SATS/time.sats"
staload UN = "prelude/SATS/unsafe.sats"
staload RG = "contrib/atscntrb/atscntrb-hx-mytesting/SATS/randgen.sats"
staload _ = "contrib/atscntrb/atscntrb-hx-mytesting/DATS/randgen.dats"

typedef T1 = int

macdef INTMAX = 1000L

implement $RG.randgen_val<T1>() = let
  val x = $STDLIB.lrand48() mod INTMAX in $UN.cast2int(x)
end

typedef T2 = double

implement $RG.randgen_val<T2>() = $STDLIB.drand48()

implement main0 () = {
  #define N 10
  val () = $STDLIB.srand48($UN.cast2lint($TIME.time_get()))

  val xs1 = $RG.randgen_list<T1>(N)
  val () = fprintln!(stdout_ref, "input:\t", xs1)
  val xs1 = g0ofg1(xs1)
  val ys1 = mergesort<T1>(xs1, lam (x, y) => x <= y)
  val ys1 = g1ofg0(ys1)
  val () = fprintln!(stdout_ref, "output:\t", ys1)
  val () = print_newline()

  val xs11 = $RG.randgen_list<T1>(N)
  val () = fprintln!(stdout_ref, "input:\t", xs11)
  val xs11 = g0ofg1(xs11)
  val ys11 = mergesort<T1>(xs1, lam (x, y) => x >= y)
  val ys11 = g1ofg0(ys11)
  val () = fprintln!(stdout_ref, "output:\t", ys11)
  val () = print_newline()

  val xs2 = $RG.randgen_list<T2>(N)
  val () = fprintln!(stdout_ref, "input:\t", xs2)
  val xs2 = g0ofg1(xs2)
  val ys2 = mergesort<T2>(xs2, lam (x, y) => (x <= y))
  val ys2 = g1ofg0(ys2)
  val () = fprintln!(stdout_ref, "output:\t", ys2)
  val () = print_newline()

  val xs22 = $RG.randgen_list<T2>(N)
  val () = fprintln!(stdout_ref, "input:\t", xs22)
  val xs22 = g0ofg1(xs22)
  val ys22 = mergesort<T2>(xs2, lam (x, y) => x >= y)
  val ys22 = g1ofg0(ys22)
  val () = fprintln!(stdout_ref, "output:\t", ys22)
  val () = print_newline()
}
