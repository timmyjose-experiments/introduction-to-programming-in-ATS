#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "ratmod.sats"

assume rat = (int, int)

fun gcd
  (m: int, n: int): int = 
  let
    val m = if m < 0 then ~m else m
    val n = if n < 0 then ~n else n

    fun loop(m: int, n: int): int = 
      if n = 0 then m else loop(n, m mod n)
  in
    loop(m, n)
  end

implement rat_make_int_int(n, d) = 
  let 
    val g = gcd(n, d)
  in
    (n / g, d / g)
  end

implement ratneg(r) = 
  let
    val n = ~r.0
    val d = ~r.1
  in
    rat_make_int_int(n, d)
  end

implement ratadd(p, q) = 
  let 
    val n = p.0 * q.1 + p.1 * q.0
    val d = p.1 * q.1
  in
    rat_make_int_int(n, d)
  end

implement ratsub(p, q) = 
  let
    val n = p.0 * q.1 - p.1 * q.0
    val d = p.1 * q.1
  in
    rat_make_int_int(n, d)
  end

implement ratmul(p, q) = 
  let
    val n = p.0 * q.0
    val d = p.1 * q.1
  in
    rat_make_int_int(n, d)
  end

implement ratdiv(p, q) = 
  let
    val n = p.0 * q.1
    val d = p.1 * q.0
  in
    rat_make_int_int(n, d)
  end

implement fprint_rat(out, r) = 
  (
    fprint_int(out, r.0);
    fprint_string(out, "/");
    fprint_int(out, r.1)
  )
