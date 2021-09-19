#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "ratfun.sats"
staload "ratfun.dats"

staload M = "libats/libc/SATS/math.sats"
staload "libats/libc/DATS/math.dats"

typedef T = int
val () = println!("T = int")

val intmod_int = '{
  ofint = lam x => x,
  fprint = lam (out, x) => fprint_int(out, x),
  neg = lam x => ~x,
  add = lam (x, y) => x + y,
  sub = lam (x, y) => x - y,
  mul = lam (x, y) => x * y,
  div = lam (x, y) => x / y,
  mod = lam (x, y) => x % y,
  cmp = lam (x, y) => compare(x, y)
}: intmod T

val ratmod_int = ratmod_make_intmod<T>(intmod_int)

fun rat_make_int_int
  (p: int, q: int): rat T =
  ratmod_int.make(intmod_int.ofint(p), intmod_int.ofint(q))

  // int
val r_1_2 = rat_make_int_int (2, 4)
val () = (print "r_1_2 = "; ratmod_int.fprint (stdout_ref, r_1_2); print_newline ())

val r_1_3 = rat_make_int_int (~3, ~9)
val () = (print "r_1_3 = "; ratmod_int.fprint (stdout_ref, r_1_3); print_newline ())

val r_5_6 = ratmod_int.add (r_1_2, r_1_3)
val () = (print "r_5_6 = "; ratmod_int.fprint (stdout_ref, r_5_6); print_newline ())

val r_1_6 = ratmod_int.sub (r_1_2, r_1_3)
val () = (print "r_1_6 = "; ratmod_int.fprint (stdout_ref, r_1_6); print_newline ())

val r_1_1 = ratmod_int.add (r_5_6, r_1_6)
val () = (print "r_1_1 = "; ratmod_int.fprint (stdout_ref, r_1_1); print_newline ())

typedef T = double
val () = println!("T = double")

val intmod_dbl = '{
  ofint = lam x => g0i2f(x),
  fprint = lam (out, x) => $extfcall(void, "printf", "%.3f", x),
  neg = lam x => ~x,
  add = lam (x, y) => x + y,
  sub = lam (x, y) => x - y,
  mul = lam (x, y) => x * y,
  div = lam (x, y) => $M.trunc(x / y),
  mod = lam (x, y) => $M.fmod(x, y),
  cmp = lam (x, y) => compare(x, y)
}: intmod T

val ratmod_dbl = ratmod_make_intmod<T>(intmod_dbl)

fun rat_make_int_int
  (p: int, q: int): rat(T) = 
  ratmod_dbl.make(intmod_dbl.ofint(p), intmod_dbl.ofint(q))

// double
val r_1_2 = rat_make_int_int (2, 4)
val () = (print "r_1_2 = "; ratmod_dbl.fprint (stdout_ref, r_1_2); print_newline ())

val r_1_3 = rat_make_int_int (~3, ~9)
val () = (print "r_1_3 = "; ratmod_dbl.fprint (stdout_ref, r_1_3); print_newline ())

val r_5_6 = ratmod_dbl.add (r_1_2, r_1_3)
val () = (print "r_5_6 = "; ratmod_dbl.fprint (stdout_ref, r_5_6); print_newline ())

val r_1_6 = ratmod_dbl.sub (r_1_2, r_1_3)
val () = (print "r_1_6 = "; ratmod_dbl.fprint (stdout_ref, r_1_6); print_newline ())

val r_1_1 = ratmod_dbl.add (r_5_6, r_1_6)
val () = (print "r_1_1 = "; ratmod_dbl.fprint (stdout_ref, r_1_1); print_newline ())

implement main0 () = ()
