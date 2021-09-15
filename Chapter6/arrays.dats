#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload TIME = "libats/libc/SATS/time.sats"
staload UN = "prelude/SATS/unsafe.sats"

(*
  arrayref.sats

  arrszref T - array type

  fun{a: t@ype}
  arrszref_make_elt
    (asz: size_t, x: a): arrszref a

  fun{a: t@ype}
  arrszref_get_alt_at
    (A: arrszref a, i: size_t): a

  fun{a: t@ype}
  arrszref_set_elt_at
    (A: arrszef, i: size_t, x: a): void

  fun arrszref_get_size // polymorphic
    {a: t@ype}(A: arrszref a): size_t

  convert from int to size_t: g0int2uint_int_size
  convert from size_t to int: g0uint2int_size_int

*)

macdef SZMAX = 20L
macdef VALMAX = 1000L

fun random_array() =
  let val sz = g0int2uint_int_size($UN.cast2int($STDLIB.lrand48() mod SZMAX))
      val arri = arrszref_make_elt<int>(sz, 0)

      fun init(arr: arrszref int, i: size_t, n: size_t): void = 
        if i < n
            then (
            arri[i] := $UN.cast2int($STDLIB.lrand48() mod VALMAX);
            init(arr, i + 1, n)
            )
  in
    (
    init(arri, g0int2uint_int_size(0), sz);
    arri
    )
  end
    
implement main0 () = {
  val() = $STDLIB.srand48($UN.cast2lint($TIME.time_get()))
  val arr1 = random_array()
  val arr1sz = arrszref_get_size{int}(arr1)
  val () = fprintln!(stdout_ref, "size = ", arr1sz, ", arr1: ", arr1)
}
