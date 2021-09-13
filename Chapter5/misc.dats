#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

typedef 
charint = (char, int)

typedef
intchar = (int, char)

fun swap_char_int0
  (xy: charint): intchar = 
  (xy.1, xy.0)

fun swap_int_char0
  (xy: intchar): charint =
  (xy.1, xy.0)

(* parametric polymorphism via function templates *)

fun {a, b: t@ype}
swap(ab: (a, b)): (b, a) = 
  (ab.1, ab.0)

fun swap_char_int1
  (xy: charint): intchar = 
  swap<char,int>(xy)

fun swap_int_char1
  (xy: intchar): charint = 
  swap<int,char>(xy)

fun {a: t@ype}{b: t@ype}
swap2(ab: (a, b)): (b, a) = 
  (ab.1, ab.0)

fun swap_char_int2
  (xy: charint): intchar = 
  swap2<char><int>(xy)

fun swap_int_char2
  (xy: intchar): charint = 
  swap2<int><char>(xy)

// composing closures

typedef cfun (t1: t@ype, t2: t@ype) = t1 -<cloref1> t2

fun {a, b, c: t@ype}
compose(f: cfun(a, b), g: cfun(b, c)):<cloref1> cfun(a, c) = 
  lam x => g(f(x))

val inc_by_1 = lam (x: int): int =<cloref1> x + 1
val mul_by_2 = lam (x: int): int =<cloref1> x * 2

val inc_by_1_then_mul_by_2 = compose<int, int, int>(inc_by_1, mul_by_2)
val mul_by_2_then_inc_by_1 = compose<int, int, int>(mul_by_2, inc_by_1)

(* polymorphic functions *)

fun {a, b: type}
swap_boxed(ab: (a, b)): (b, a) =
  (ab.1, ab.0)

fun {a: type}{b: type}
swap_boxed2(ab: (a, b)): (b, a) = 
  (ab.1, ab.0)

implement main0 () = {
  val ci0 = ('x', 42)
  val ic0 = swap_char_int0(ci0)
  val () = let val ic1 = (42, 'x') 
  in
    assertloc(ic1.00 = ic0.0 andalso ic1.1 = ic0.1)
  end

  val () = 
  let
    val foo = swap_char_int1(('a', 99))
    val bar = swap_int_char1((99, 'a'))
  in
    assertloc(foo.0 = bar.1 andalso foo.1 = bar.0)
  end

  val () = 
  let
    val foo = swap_char_int2(('a', 99))
    val bar = swap_int_char2((99, 'a'))
  in
    assertloc(foo.0 = bar.1 andalso foo.1 = bar.0)
  end

  val () = assertloc(inc_by_1_then_mul_by_2(1) = 4)
  val () = assertloc(mul_by_2_then_inc_by_1(1) = 3)

  typedef boxstr = boxed(string)
  val AB = (box("A"), box("B"))
  val BA1 = swap_boxed(AB)
  //val BA2 = swap_boxed{boxstr,boxstr}(AB)
  val () = println!("BA1.0 = ", unbox(BA1.0))
  val () = println!("BA1.1 = ", unbox(BA1.1))

  val XY = (box("X"), box("Y"))
  val YX1 = swap_boxed2(XY)
  val () = println!("YX1.0 = ", unbox(YX1.0))
  val () = println!("YX1.1 = ", unbox(YX1.1))
}
