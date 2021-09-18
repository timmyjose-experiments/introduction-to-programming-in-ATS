#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "ratfun.sats"

assume rat (a: t@ype) = (a, a)

fun{a: t@ype}
intgcd
  (int: intmod a, x: a, y: a): a = 
  let
    macdef intneg(x) = int.neg(,(x))
    macdef intmod(x, y) = int.mod(,(x), ,(y))
    macdef intgtz(x) = int.cmp(,(x), int.ofint(0)) > 0
    macdef intgtez(x) = int.cmp(,(x), int.ofint(0)) >= 0

    fun gcd(x: a, y: a):<cloref1> a =
      if intgtz(y) then gcd(y, x \intmod y) else x
  in
    if intgtez(x) then
      if intgtez(y) then gcd(x, y) else gcd(x, intneg(y))
    else
      if intgtez(y) then gcd(intneg(x), y) else gcd(intneg(x), intneg(y))
  end

implement{a}
ratmod_make_intmod(int) = 
  let 
    macdef intneg(x) = int.neg(,(x))
    macdef intmod(x, y) = int.mod(,(x), ,(y))
    macdef intgtz(x) = int.cmp(,(x), int.ofint(0)) > 0
    macdef intadd(x, y) = int.add(,(x), ,(y))
    macdef intsub(x, y) = int.sub(,(x), ,(y))
    macdef intmul(x, y) = int.mul(,(x), ,(y))
    macdef intdiv(x, y) = int.div(,(x), ,(y))
    macdef intmod(x, y) = int.mod(,(x), ,(y))
    macdef intcmp(x, y) = int.cmp(,(x), ,(y))

    fun make0(p: a, q: a):<cloref1> rat a = let
      val g = intgcd<a>(int, p, q) in (p \intdiv g, q \intdiv g)
    end

    fun make(p: a, q: a):<cloref1> rat a = 
      if intgtz(q) then make0(p, q) else make0(intneg(p), intneg(q))
  in
    '{
      make = make,
      fprint = lam (out, x) => {
        val () = int.fprint(out, x.0)
        val () = fprint_string(out, "/")
        val () = int.fprint(out, x.1)
      },
      numer = lam x => x.0,
      denom = lam x => x.1,
      neg = lam (x) => (intneg(x.0), x.1),
      add = lam (x, y) => let
        val p = intadd(x.0 \intmul y.1, x.1 \intmul y.0)
        val q = x.1 \intmul y.1
      in
        make(p, q)
      end,
      sub = lam (x, y) => let
        val p = intsub(x.0 \intmul y.1, x.1 \intmul y.0)
        val q = x.1 \intmul y.1
      in
        make(p, q)
      end,
      mul = lam (x, y) => let
        val p = x.0 \intmul y.0
        val q = x.1 \intmul y.1
      in
        make(p, q)
      end,
      div = lam (x, y) => let
        val p = x.0 \intmul y.1
        val q = x.1 \intmul y.0
      in
        make(p, q)
      end,
      cmp = lam(x, y) => intcmp(x.0 \intmul y.1, x.1 \intmul y.0)
  }
  end
