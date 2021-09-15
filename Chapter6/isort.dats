#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload TIME = "libats/libc/SATS/time.sats"
staload UN = "prelude/SATS/unsafe.sats"
staload RG = "contrib/atscntrb/atscntrb-hx-mytesting/SATS/randgen.sats"
staload "contrib/atscntrb/atscntrb-hx-mytesting/DATS/randgen.dats"

fun{a: t@ype}
insertion_sort
  (A: arrszref a, cmp: (a, a) -> int): void = 
  let
    val n = g0uint2int_size_int(arrszref_get_size{a}(A))
    
    fun ins(x: a, i: int):<cloref1> void = 
      if i >= 0 then
        if cmp(x, A[i]) < 0 then (A[i + 1] := A[i]; ins(x, i - 1))
        else A[i + 1] := x
      else A[0] := x

    fun loop(i: int):<cloref1> void = 
      if i < n then (ins(A[i], i - 1); loop(i + 1)) else ()
  in
    loop(1)
  end

macdef INTMAX = 1000L
typedef T = int

implement $RG.randgen_val<T>() = let 
    val x = $STDLIB.lrand48() mod INTMAX in $UN.cast2int(x)
  end

typedef T2 = double

implement $RG.randgen_val<T2>() = $STDLIB.drand48()

implement main0 () = {
  #define N 10

  val () = $STDLIB.srand48($UN.cast2lint($TIME.time_get()))

  val A = $RG.randgen_arrszref<T>(g0int2uint_int_size(N))
  val () = fprintln!(stdout_ref, "A (before sorting): ", A)
  val () = insertion_sort<T>(A, lam (x, y) => compare(x, y))
  val () = fprintln!(stdout_ref, "A(after sorting): ", A)
  val () = print_newline()

  val B = $RG.randgen_arrszref<T2>(g0int2uint_int_size(N))
  val () = fprintln!(stdout_ref, "B (before sorting): ", B)
  val () = insertion_sort<T2>(B, lam (x, y) => compare(y, x))
  val () = fprintln!(stdout_ref, "B (after sorting): ", B)
}
