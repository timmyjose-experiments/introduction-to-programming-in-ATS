#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

staload "intset.sats"
dynload "intset.dats"

implement main0 () = {
  val xs1 = intset_make_list(list0($arrpsz{int}(0, 1, 2, 3, 4, 5, 6, 7, 8, 0)))
  val () = let 
    val xs1 = intset_listize(xs1) in fprintln!(stdout_ref, "xs1: ", xs1)
  end

  val xs2 = intset_make_list(list0($arrpsz{int}(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, ~9, ~8, ~7, ~6, ~5, ~4, ~3, ~2, ~1, 0)))
  val () = let
    val xs2 = intset_listize(xs2) in fprintln!(stdout_ref, "xs2: ", xs2)
  end

  val union_xs1_xs2 = intset_union(xs1, xs2)
  val () = let
    val union_xs1_xs2 = intset_listize(union_xs1_xs2) in fprintln!(stdout_ref, "union_xs1_xs2: ", union_xs1_xs2)
  end

  val inter_xs1_xs2 = intset_inter(xs1, xs2)
  val () = let 
    val inter_xs1_xs2 = intset_listize(inter_xs1_xs2) in fprintln!(stdout_ref, "inter_xs1_xs2: ", inter_xs1_xs2)
  end

  val differ_xs1_xs2 = intset_differ(xs1, xs2)
  val () = let
    val differ_xs1_xs2 = intset_listize(differ_xs1_xs2) in fprintln!(stdout_ref, "differ_xs1_xs2: ", differ_xs1_xs2)
  end

  val differ_xs2_xs1 = intset_differ(xs2, xs1)
  val () = let
    val differ_xs2_xs1 = intset_listize(differ_xs2_xs1) in fprintln!(stdout_ref, "differ_xs2_xs1: ", differ_xs2_xs1)
  end

  val () = assertloc(
    intset_size(xs1) + intset_size(xs2) = 
    intset_size(union_xs1_xs2) + intset_size(inter_xs1_xs2)
  )

  val () = assertloc(
    intset_size(union_xs1_xs2) - intset_size(inter_xs1_xs2) =
    intset_size(differ_xs1_xs2) + intset_size(differ_xs2_xs1)
  )
}
