#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(*
  $UN.ptr0_get<T>
  $UN.ptr0_set<T>
  ptr0_succ<T>
  $UN.cast{T}
  array0_get_ref
*)

staload UN = "prelude/SATS/unsafe.sats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"
staload "libats/ML/SATS/array0.sats"
staload "libats/ML/DATS/array0.dats"

extern
fun{a: t@ype}
array_copy_from_list(A: array0 a, xs: list0 a): void

implement{a}
array_copy_from_list(A, xs) = 
  let 
    fun loop(p: ptr, xs: list0 a): void = 
      case+ xs of
        | list0_nil() => ()
        | list0_cons(x, xs) => 
          (
            $UN.ptr0_set<a>(p, x);
            loop(ptr0_succ<a>(p), xs)
          )
  in
    loop(array0_get_ref(A), xs)
  end

implement main0 () = {
  val xs1 = list0($arrpsz{int}(1, 2, 3, 4, 5))
  val () = fprintln!(stdout_ref, "xs1: ", xs1)

  val A1 = array0_make_elt<int>(5, 0)
  val () = fprintln!(stdout_ref, "A1: ", A1)

  val () = array_copy_from_list(A1, xs1)
  val () = fprintln!(stdout_ref, "A1 (after copying): ", A1)
}

