#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

typedef I(a: t@ype) = a -<cloref1> a

fn{a: t@ype}
twice(f: I(a)):<cloref1> I(a) =
  lam x => f(f(x))

typedef I0 = int
typedef I1 = I(I0)
typedef I2 = I(I1)
typedef I3 = I(I2)

implement main0 () = {
  val Z = 0
  val S = lam (x: int): int =<cloref> x + 1
  val ans0 = twice<I0>(S)(Z)
  val () = println!("ans0 = ", ans0)

  val ans1 = twice<I1>(twice<I0>)(S)(Z)
  val () = println!("ans1 = ", ans1)

  val ans2 = twice<I2>(twice<I1>)(twice<I0>)(S)(Z)
  val () = println!("ans2 = ", ans2)

  val ans3 = twice<I3>(twice<I2>)(twice<I1>)(twice<I0>)(S)(Z)
  val () = println!("ans3 = ", ans3)
}
