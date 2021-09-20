#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload UN = "prelude/SATS/unsafe.sats"
staload TIME = "libats/libc/SATS/time.sats"

staload RG = "contrib/atscntrb/atscntrb-hx-mytesting/SATS/randgen.sats"
staload "contrib/atscntrb/atscntrb-hx-mytesting/DATS/randgen.dats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/SATS/array0.sats"
staload "libats/ML/DATS/array0.dats"

extern
fun{a: t@ype}
array_copy_from_list
  (A: array0 a, xs: list0 a): void

implement{a}
array_copy_from_list(A, xs) = 
  loop(array0_get_ref(A), xs) where {
    fun loop(p: ptr, xs: list0 a): void = 
      case+ xs of
        | list0_nil() => ()
        | list0_cons(x, xs) =>
          (
            $UN.ptr0_set<a>(p, x);
            loop(ptr0_succ<a>(p), xs)
          )
  }

macdef INTMAX = 100L
typedef T = int

implement $RG.randgen_val<T>() = let
  val x = $STDLIB.lrand48() mod INTMAX in $UN.cast2int(x) 
  end

typedef T2 = double

implement $RG.randgen_val<T2>() = $STDLIB.drand48()

implement main0 () = {
  val () = $STDLIB.srand48($UN.cast2lint($TIME.time_get()))

  val A1 = array0_make_elt<int>(15, 0)
  val () = fprintln!(stdout_ref, "A1: ", A1)
  val xs1 = $RG.randgen_list<T>(15)
  val () = fprintln!(stdout_ref, "xs1: ", xs1)
  val () = array_copy_from_list<int>(A1, g0ofg1(xs1))
  val () = fprintln!(stdout_ref, "After copying, A1: ", A1)
  val () = print_newline()

  val A2 = array0_make_elt<double>(10, 0.0)
  val () = fprintln!(stdout_ref, "A2: ", A2)
  val xs2 = $RG.randgen_list<T2>(10)
  val () = fprintln!(stdout_ref, "xs2: ", xs2)
  val () = array_copy_from_list<double>(A2, g0ofg1(xs2))
  val () = fprintln!(stdout_ref, "After copying, A1: ", A2)
}
