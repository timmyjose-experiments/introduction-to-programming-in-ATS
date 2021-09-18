#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

macdef add(x, y) = ,(x) + ,(y)
macdef sub(x, y) = ,(x) - ,(y)
macdef mul(x, y) = ,(x) * ,(y)
macdef div(x, y) = ,(x) / ,(y)

macdef unless(cond, then_clause, else_clause) = 
  if not ,(cond)
    then ,(then_clause)
    else ,(else_clause)

implement main0 () = {
  val () = assertloc (add(1 + 2, 3 + 2) = 8)
  val () = assertloc (sub(1 + 2, 3 + 2) = ~2)
  val () = assertloc (mul(1 + 2, 3 + 2) = 15)
  val () = assertloc (div(4 + 2, 1 + 2) = 2)

  val () = unless (1 + 2 > 2 + 3, println!("1 + 2 is not greater than 2 + 3"), println!("1 + 2 is greater than 2 + 3"))
}
