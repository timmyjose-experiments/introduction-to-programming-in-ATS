#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload TIME = "libats/libc/SATS/time.sats"

staload RG = "contrib/atscntrb/atscntrb-hx-mytesting/SATS/randgen.sats"
staload "contrib/atscntrb/atscntrb-hx-mytesting/DATS/randgen.dats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

fun listprod1
  (xs: list0 lint): lint = 
  case+ xs of
    | list0_nil() => 1L
    | list0_cons(x, xs) => x * listprod1(xs)

fun listprod2
  (xs: list0 lint): lint = 
  case+ xs of
    | list0_nil() => 1L
    | list0_cons(0L, _) => 0L
    | list0_cons(x, xs) => x * listprod2(xs)

fun listprod3
  (xs: list0 lint): lint = 
  let 
    exception ZERO of ()

    fun aux
      (xs: list0 lint): lint = 
      case+ xs of
        | list0_nil() => 1L
        | list0_cons(0L, _) => $raise ZERO()
        | list0_cons(x, xs) => x * listprod3(xs)
  in
    try aux(xs) with ~ZERO() => 0L
  end

macdef INTMAX = 20L

implement $RG.randgen_val<lint>() = $STDLIB.lrand48() mod INTMAX 

implement main0 () = {
  #define N 10
  
  val () = $STDLIB.srand48($UN.cast2lint($TIME.time_get()))

  val xs1 = $RG.randgen_list<lint>(N)
  val () = fprintln!(stdout_ref, "input:\t", xs1)
  val () = fprintln!(stdout_ref, "listprod1(input) = ", g1ofg0(listprod1(g0ofg1(xs1))))
  val () = fprintln!(stdout_ref, "listprod2(input) = ", g1ofg0(listprod2(g0ofg1(xs1))))
  val () = fprintln!(stdout_ref, "listprod3(input) = ", g1ofg0(listprod3(g0ofg1(xs1))))
  val () = print_newline()

  val xs2 = $RG.randgen_list<lint>(N)
  val () = fprintln!(stdout_ref, "input:\t", xs2)
  val () = fprintln!(stdout_ref, "listprod1(input) = ", g1ofg0(listprod1(g0ofg1(xs2))))
  val () = fprintln!(stdout_ref, "listprod2(input) = ", g1ofg0(listprod2(g0ofg1(xs2))))
  val () = fprintln!(stdout_ref, "listprod3(input) = ", g1ofg0(listprod3(g0ofg1(xs2))))
  val () = print_newline()

  val xs3 = $RG.randgen_list<lint>(N)
  val () = fprintln!(stdout_ref, "input:\t", xs3)
  val () = fprintln!(stdout_ref, "listprod1(input) = ", g1ofg0(listprod1(g0ofg1(xs3))))
  val () = fprintln!(stdout_ref, "listprod2(input) = ", g1ofg0(listprod2(g0ofg1(xs3))))
  val () = fprintln!(stdout_ref, "listprod3(input) = ", g1ofg0(listprod3(g0ofg1(xs3))))
  val () = print_newline()
}
