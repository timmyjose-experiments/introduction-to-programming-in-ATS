abstype intset = ptr

staload ML = "libats/ML/SATS/basis.sats"

typedef list0 (a: t@ype) = $ML.list0 (a)

fun intset_nil(): intset

fun intset_make_sing(x: int): intset

fun intset_make_list(xs: list0 int): intset

fun intset_listize(xs: intset): list0 int

fun intset_ismem(xs: intset, x: int): bool

fun intset_add(xs: intset, x: int): intset

fun intset_del(xs: intset, x: int): intset

fun intset_union(xs: intset, ys: intset): intset

fun intset_inter(xs: intset, ys: intset): intset

fun intset_differ(xs: intset, ys: intset): intset
