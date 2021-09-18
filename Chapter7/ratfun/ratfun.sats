exception Denominator
exception DivisionByZero

abst@ype rat (a: t@ype) = (a, a)

typedef
intmod (a: t@ype) = '{
  ofint = int -> a,
  fprint = (FILEref, a) -> void,
  neg = a -> a,
  add = (a, a) -> a,
  sub = (a, a) -> a,
  mul = (a, a) -> a,
  div = (a, a) -> a,
  mod = (a, a) -> a,
  cmp = (a, a) -> int
}

typedef
ratmod (a: t@ype) = '{
  make = (a, a) -<cloref1> rat a,
  fprint = (FILEref, rat a) -<cloref1> void,
  numer = rat a -> a,
  denom = rat a -> a,
  neg = rat a -<cloref1> rat a,
  add = (rat a, rat a) -<cloref1> rat a,
  sub = (rat a, rat a) -<cloref1> rat a,
  mul = (rat a, rat a) -<cloref1> rat a,
  div = (rat a, rat a) -<cloref1> rat a,
  cmp = (rat a, rat a) -<cloref1> int
}

fun{a: t@ype}
ratmod_make_intmod(int: intmod a): ratmod a
