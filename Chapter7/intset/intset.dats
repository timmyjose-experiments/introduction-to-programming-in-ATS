#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/DATS/list0.dats"

staload "intset.sats"

assume intset = list0 int (* backing datastructure for the abstract type, has to be unique per executable *)

postfix sz

#define sz(x) g0int2uint_int_size(x)

(* val intset_empty(): intset *)

implement intset_empty() = list0_nil

(* fun intset_make_sing(x: int): intset *)

implement intset_make_sing(x) = list0_cons{int}(x, list0_nil())

(* fun intset_make_list(xs: list0 int): intset *)

implement intset_make_list(xs) = 
  let
    fun loop(xs: list0 int, res: intset): intset =
      case+ xs of
        | list0_nil() => res
        | list0_cons(x, xs) => loop(xs, intset_add(res, x))
  in
    loop(xs, list0_nil())
  end

(* fun intset_listize(xs: intset): list0 int *)

implement intset_listize(xs) = xs

(* fun intset_ismem(xs: intset, x: int): bool *)

implement intset_ismem(xs, x0) = 
  case+ xs of
    | list0_nil() => false
    | list0_cons(x, xs) => 
      if x = x0 then true else intset_ismem(xs, x0)

(* fun intset_size(xs: intset): size_t *)

implement intset_size(xs) = 0sz

(* fun intset_add(xs: intset, x: int): intset *)

implement intset_add(xs, x0) = 
  case+ xs of
    | list0_nil() => list0_cons(x0, list0_nil())
    | list0_cons(x, xs) =>
      ifcase 
        | x0 < x => list0_cons{int}(x0, list0_cons{int}(x, xs))
        | x0 > x => list0_cons{int}(x, intset_add(xs, x0))
        | _ => xs

(* fun intset_del(xs: intset, x: int): intset *)

implement intset_del(xs, x0) =
  case+ xs of
    | list0_nil() => list0_nil()
    | list0_cons(x, xs) =>
      ifcase
        | x0 = x => xs
        | _ => list0_cons{int}(x, intset_del(xs, x0))

(* fun intset_union(xs1: intset, xs2: intset): intset *)

implement intset_union(xs1, xs2) = 
  case+ (xs1, xs2) of 
    | (list0_nil(), _) => xs1
    | (_, list0_nil()) => xs2
    | (list0_cons(x, xs), list0_cons(y, ys)) =>
      ifcase
        | x <= y => list0_cons{int}(x, intset_union(xs, xs2))
        | _ => list0_cons{int}(y, intset_union(xs1, ys))

(* fun intset_inter(xs1: intset, xs: intset): intset *)

implement intset_inter(xs1, xs2) = 
  case+ (xs1, xs2) of
    | (list0_nil(), _) => list0_nil()
    | (_, list0_nil()) => list0_nil()
    | (list0_cons(x, xs), list0_cons(y, ys)) =>
        ifcase
          | x < y => intset_inter(xs, xs2)
          | x = y => list0_cons{int}(x, intset_inter(xs, ys))
          | _  => intset_inter(xs1, ys)

(* fun intset_differ(xs1: intset, ys: intset): intset *)

implement intset_differ(xs1, xs2) = 
  case+ (xs1, xs2) of
    | (list0_nil(), _) => list0_nil()
    | (_, list0_nil()) => xs1
    | (list0_cons(x, xs), list0_cons(y, ys)) =>
      ifcase 
        | x < y => list0_cons{int}(x, intset_differ(xs, xs2))
        | x > y => intset_differ(xs, xs2)
        | _ => intset_differ(xs, ys)
