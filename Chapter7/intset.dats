#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "intset.sats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

assume intset = list0 int

implement intset_nil() = list0_nil()

implement intset_make_sing(x) = list0_cons(x, list0_nil())

implement intset_make_list(xs) = let
  fun loop(xs: list0 int, res: intset): intset =
    case+ xs of
      | list0_nil() => res
      | list0_cons(x, xs) => loop(xs, intset_add(res, x))
  in
    loop(xs, intset_nil())
  end

implement intset_listize(xs) = xs

implement intset_ismem(xs, x0) = 
  case+ xs of
    | list0_nil() => false
    | list0_cons(x, xs) => x = x0 orelse intset_ismem(xs, x0)

implement intset_add(xs, x0) = 
  case+ xs of
    | list0_nil() => list0_cons{int}(x0, list0_nil())
    | list0_cons(x, xs1) =>
      ifcase
        | x0 < x => list0_cons{int}(x0, xs) 
        | x0 > x => list0_cons{int}(x, intset_add(xs1, x0))
        | _ => xs

implement intset_del(xs, x0) = 
  case+ xs of
    | list0_nil() => list0_nil()
    | list0_cons(x, xs1) =>
      ifcase
        | x0 < x => xs
        | x0 = x => xs1
        | _ => list0_cons{int}(x, intset_del(xs1, x0))

implement intset_union(xs, ys) = 
  case+ (xs, ys) of
    | (list0_nil(), _) => ys
    | (_, list0_nil()) => xs
    | (list0_cons(x, xs1), list0_cons(y, ys1)) =>
      ifcase
        | x < y => list0_cons{int}(x, intset_union(xs1, ys))
        | x = y => list0_cons{int}(x, intset_union(xs1, ys1))
        | _ => list0_cons{int}(y, intset_union(xs, ys1))

implement intset_inter(xs, ys) =
  case+ (xs, ys) of
    | (list0_nil(), _) => list0_nil()
    | (_, list0_nil()) => list0_nil()
    | (list0_cons(x, xs1), list0_cons(y, ys1)) =>
      ifcase
        | x < y => intset_inter(xs1, ys)
        | x = y => list0_cons{int}(x, intset_inter(xs1, ys1))
        | _ => intset_inter(xs, ys1)

implement intset_differ(xs, ys) =
  case+ (xs, ys) of
    | (list0_nil(), _) => list0_nil()
    | (_, list0_nil()) => xs
    | (list0_cons(x, xs1), list0_cons(y, ys1)) =>
      ifcase
        | x < y => list0_cons{int}(x, intset_differ(xs1, ys))
        | x = y => intset_differ(xs1, ys1)
        | _ => intset_differ(xs1, ys)
