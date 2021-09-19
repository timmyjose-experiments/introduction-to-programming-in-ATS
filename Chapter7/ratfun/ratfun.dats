#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "ratfun.sats"

assume rat(a: t@ype) = (a, a)

fun{a: t@ype}
gcd
  (int: intmod a, x: a, y: a): a = 
  let
    macdef intneg(x) = int.neg(,(x))
    macdef intgtz(x) = int.cmp(,(x), int.ofint(0)) > 0
    macdef intmod(x, y) = int.mod(,(x), ,(y))
    macdef inteqz(x) = int.cmp(,(x), int.ofint(0)) = 0

    val x = if intgtz(x) then intneg(x) else x
    val y = if intgtz(y) then intneg(y) else y

    fun gcd(x: a, y: a): a = 
      if inteqz(y) then x else gcd(y, intmod(x, y))
  in
    gcd(x, y)
  end

implement{a}
ratmod_make_intmod(int) = 
  let
      macdef intneg(x) = int.neg(,(x))
      macdef intadd(x, y) = int.add(,(x), ,(y))
      macdef intsub(x, y) = int.sub(,(x), ,(y))
      macdef intmul(x, y) = int.mul(,(x), ,(y))
      macdef intdiv(x, y) = int.div(,(x), ,(y))
      macdef intcmp(x, y) = int.cmp(,(x), ,(y))
    
      fun make(n: a, d: a):<cloref1> rat a =
        let 
          val g = gcd<a>(int, n, d)
        in
          (n \intdiv g, d \intdiv g)
        end
  in
    '{
      make = make,
      fprint = lam (out, r) => {
        val () = int.fprint(out, r.0)
        val () = fprint_string(out, "/")
        val () = int.fprint(out, r.1)
      },
      numer = lam r => r.0,
      denom = lam r => r.1,
      neg = lam r => (intneg(r.0), intneg(r.1)),
      add = lam (p, q) => let
        val n = intmul(p.0, q.1) \intadd intmul(p.1, q.0)
        val d = p.1 \intmul q.1 in make(n, d)
      end,
      sub = lam (p, q) => let
        val n = intmul(p.0, q.1) \intsub intmul(p.1, q.0)
        val d = p.1 \intmul q.1 in make(n, d)
      end,
      mul = lam (p, q) => let
        val n = p.0 \intmul q.0
        val d = p.1 \intmul q.1 in make(n, d)
      end,
      div = lam (p, q) => let
        val n = p.0 \intmul q.1
        val d = p.1 \intmul q.0 in make(n, d)
      end,
      cmp = lam (p, q) =>
        intcmp(intmul(p.0, q.1), intmul(p.1, q.0))
      }
  end
