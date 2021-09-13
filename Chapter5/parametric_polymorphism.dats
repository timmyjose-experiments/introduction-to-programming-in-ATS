#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* function templates *)

typedef charint = (char, int)
typedef intchar = (int, char)

fun swap_char_int
  (xy: charint): intchar = (xy.1, xy.0)

fun swap_int_char
  (xy: intchar): charint = (xy.1, xy.0)

fun{a, b: t@ype}
swap
  (xy: (a,b)): (b, a) = 
  (xy.1, xy.0)

fun swap_char_int1
  (xy: charint): intchar = 
  swap<char, int>(xy)

fun swap_int_char1
  (xy: intchar): charint = 
  swap<int, char>(xy)

fun{a: t@ype}{b: t@ype}
swap1
  (xy: (a,b)): (b, a) = 
  (xy.1, xy.0)

fun swap_char_int2
  (xy: charint): intchar = 
  swap1<char><int>(xy)

fun swap_int_char2
  (xy: intchar): charint = 
  swap1<int><char>(xy)

typedef cfun (a: t@ype, b: t@ype) = a -<cloref1> b

fun{a, b, c: t@ype}
compose
  (f: cfun(a, b), g: cfun(b, c)):<cloref1> cfun(a, c) = 
  lam x => g(f(x))

val inc_by_1 = lam (x: int): int =<cloref1> x + 1
val mul_by_2 = lam (x: int): int =<cloref1> x * 2

val inc_by_1_mul_by_2 = compose<int, int, int>(inc_by_1, mul_by_2)
val mul_by_2_inc_by_1 = compose<int, int, int>(mul_by_2, inc_by_1)

(* polymorphic functions *)

fun swap_boxed{a, b: type}
  (xy: (a, b)): (b, a) = 
  (xy.1, xy.0)

fun swap_boxed1{a, b: type}
  (xy: (a, b)): (b, a) =
  (xy.1, xy.0)

(* polymorphic data types *)

datatype list0 (a: t@ype) = 
  | list0_nil (a) of ()
  | list0_cons (a) of (a, list0 a)

fun{a: t@ype}
list0_length
  (xs: list0 a): int = 
  case+ xs of
    | list0_nil() => 0
    | list0_cons(_, xs) => 1 + list0_length<a>(xs)

datatype maybe0 (a: t@ype) = 
  | maybe0_nothing (a) of ()
  | maybe0_just (a) of a

fun divopt
  (x: int, y: int): maybe0 int = 
  ifcase
    | y = 0 => maybe0_nothing()
    | _ => maybe0_just(x / y)

staload "libats/ML/SATS/basis.sats" // option0

fun{a: t@ype}
list0_last
  (xs: list0 a): option0 a = 
  case+ xs of
    | list0_nil() => None0
    | list0_cons(x, list0_nil()) => Some0(x)
    | list0_cons(_, xs) => list0_last<a>(xs)

implement main0 () = {
  val () = let 
    val ci = ('x', 42)
    val ci_swap = swap_char_int(ci)
    val ci_swap1 = swap_char_int1(ci)
    val ci_swap2 = swap_char_int2(ci)
  in
    assertloc(ci_swap.0 = ci.1 andalso ci_swap.1 = ci.0);
    assertloc(ci_swap1.0 = ci.1 andalso ci_swap1.1 = ci.0);
    assertloc(ci_swap2.0 = ci.1 andalso ci_swap2.1 = ci.0)
  end

  val () = let
    val ic = (99, 'e')
    val ic_swap = swap_int_char(ic)
    val ic_swap1 = swap_int_char1(ic)
    val ic_swap2 = swap_int_char2(ic)
  in
    assertloc(ic_swap.0 = ic.1 andalso ic_swap.1 = ic.0);
    assertloc(ic_swap1.0 = ic.1 andalso ic_swap1.1 = ic.0);
    assertloc(ic_swap2.0 = ic.1 andalso ic_swap2.1 = ic.0)
  end

  val () = let
    val x = 100
    val r1 = inc_by_1_mul_by_2(x)
    val r2 = mul_by_2_inc_by_1(x)
  in
    assertloc(r1 = 202);
    assertloc(r2 = 201)
  end

  val () = let
    val AB = (box("A"), box("B"))
    val BA1 = swap_boxed(AB)
    val BA2 = swap_boxed1(AB)
  in
    println!("BA1.0 = ", unbox(BA1.0), ", BA1.1 = ", unbox(BA1.1));
    println!("BA2.0 = ", unbox(BA2.0), ", BA2.1 = ", unbox(BA2.1))
  end

  val xs0 = list0_nil()
  val xs1 = list0_cons(1, list0_cons(2, list0_cons(3, list0_nil())))
  val xs2 = list0_cons(4, list0_cons(5, list0_nil()))
  val () = assertloc(list0_length<int>(xs0) = 0)
  val () = assertloc(list0_length<int>(xs1) = 3)
  val () = assertloc(list0_length<int>(xs2) = 2)
  val-None0 = list0_last<int>(xs0)
  val () = 
  case+ list0_last<int>(xs1) of
    | Some0(l) => println!("Last element of xs1 = ", l)
    | None0 => println!("No last element for xs1")

  val () = 
    case+ list0_last<int>(xs2) of
      | Some0(l) => println!("Last element of xs2 = ", l)
      | None0 => println!("No last element for xs2")

  val () = let
    val x = 10
    val y = 2
    val z = 0
    val-maybe0_just(r) = divopt(x, y);
  in
    println!("divopt(", x, ",", y, ") = ", r);
    case+ divopt(x, z) of
      | maybe0_just(v) => println!("divopt(", x, ",", z, ") = ", v)
      | maybe0_nothing() => println!("Cannot divide ", x, " by ", z)
  end

  val-Some0(last) = list0_last<int>(list0_cons(1, list0_cons(2, list0_nil())))
  val() =  print!("last = ", last)
}
