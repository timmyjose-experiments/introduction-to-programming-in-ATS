#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "ratmod.sats"

assume rat = (int, int)

fun gcd
  (m: int, n: int): int = 
  if n = 0 then m else gcd(n, m mod n)

implement rat_make_int_int(x, y) = 
  if y = 0 then $raise Denominator
    else let val g = gcd(x, y) in (x / g, y / g) end

implement ratadd(p: rat, q: rat): rat = 
  let val num = p.0 * q.1 + p.1 * q.0
      val denom = p.1 * q.1
  in
    rat_make_int_int(num, denom)
  end

implement ratsub(p: rat, q: rat): rat =
  let val num = p.0 * q.1 - p.1 * q.0
      val denom = p.1 * q.1
  in
    rat_make_int_int(num, denom)
  end

implement ratmul(p: rat, q: rat): rat = 
  let val num = p.0 * q.0
      val denom = p.1 * q.1
  in
    rat_make_int_int(num, denom)
  end

implement ratdiv(p: rat, q: rat): rat = 
  if q.0 != 0 then let
    val num = p.0 * q.1
    val denom = p.1 * q.0
  in
    rat_make_int_int(num, denom)
  end else $raise DivisionByZero
    
implement fprint_rat(out, r) = 
  (
    fprint_int(out, r.0);
    if r.1 != 1 then
      (
        fprint_string(out, "/");
        fprint_int(out, r.1)
      )
  )
