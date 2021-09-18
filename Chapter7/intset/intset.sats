abstype intset = ptr (* an abstract boxed type that needs a backing data structure *)

staload "libats/ML/SATS/basis.sats"

val intset_empty(): intset

fun intset_make_sing(x: int): intset

fun intset_make_list(xs: list0 int): intset

fun intset_listize(xs: intset): list0 int

fun intset_ismem(xs: intset, x: int): bool

fun intset_size(xs: intset): size_t

fun intset_add(xs: intset, x: int): intset

fun intset_del(xs: intset, x: int): intset

fun intset_union(xs1: intset, xs2: intset): intset

fun intset_inter(xs1: intset, xs: intset): intset

fun intset_differ(xs1: intset, ys: intset): intset

