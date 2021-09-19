#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "intset.sats"
dynload "intset.dats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

implement main0 () = {
  val xs1 = intset_make_list(list0($arrpsz{int}(1, 2, 3, 4, 5, 1, 2, 3, 4, 5)))
  val () = let 
    val xs1 = intset_listize(xs1) in fprintln!(stdout_ref, "xs1: ", xs1)
  end

  val xs2 = intset_make_list(list0($arrpsz{int}(1, 2, 3, 6, 7, 8, 9, 10, 9)))
  val () = let
    val xs2 = intset_listize(xs2) in fprintln!(stdout_ref, "xs2: ", xs2)
  end

  val () = assertloc(intset_ismem(xs1, 5))
  val () = assertloc(intset_ismem(xs1, 1))
  val () = assertloc(intset_ismem(xs1, 2))
  val () = assertloc(not(intset_ismem(xs1, 10)))
  val () = assertloc(not(intset_ismem(xs1, 0)))
  val () = assertloc(not(intset_ismem(xs1, 6)))

  val xs1_union_xs2 = intset_union(xs1, xs2)
  val () = 
  let
    val xs1_union_xs2 = intset_listize(xs1_union_xs2) 
  in 
    fprintln!(stdout_ref, "xs1_union_xs2: ", xs1_union_xs2)
  end

  val xs1_inter_xs2 = intset_inter(xs1, xs2)
  val () =
  let
    val xs1_inter_xs2 = intset_listize(xs1_inter_xs2)
  in
    fprintln!(stdout_ref, "xs1_inter_xs2: ", xs1_inter_xs2)
  end

  val xs1_differ_xs2 = intset_differ(xs1, xs2)
  val () = 
  let
    val xs1_differ_xs2 = intset_listize(xs1_differ_xs2)
  in
    fprintln!(stdout_ref, "xs1_differ_xs2: ", xs1_differ_xs2)
  end

  val xs2_differ_xs1 = intset_differ(xs2, xs1)
  val () = 
  let
    val xs2_differ_xs1 = intset_listize(xs2_differ_xs1)
  in
    fprintln!(stdout_ref, "xs2_differ_xs1: ", xs2_differ_xs1)
  end
}
