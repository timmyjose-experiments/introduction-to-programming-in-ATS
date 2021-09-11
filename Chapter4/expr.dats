#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

datatype iexpr = 
  | iexpr_val of int
  | iexpr_neg of int
  | iexpr_add of (iexpr, iexpr)
  | iexpr_sub of (iexpr, iexpr)
  | iexpr_mul of (iexpr, iexpr)
  | iexpr_div of (iexpr, iexpr)
  | iexpr_if of (bexpr, iexpr, iexpr)
and
  bexpr = 
    | bexpr_val of bool
    | bexpr_not of bexpr
    | bexpr_and of (bexpr, bexpr)
    | bexpr_or of (bexpr, bexpr)
    | bexpr_lt of (iexpr, iexpr)
    | bexpr_lte of (iexpr, iexpr)
    | bexpr_eq of (iexpr, iexpr)
    | bexpr_neq of (iexpr, iexpr)
    | bexpr_gt of (iexpr, iexpr)
    | bexpr_gte of (iexpr, iexpr)

fun eval_iexpr(
  expr: iexpr): int =
  case+ expr of
    | iexpr_val(n) => n
    | iexpr_neg(n) => ~n
    | iexpr_add(e0, e1) => eval_iexpr(e0) + eval_iexpr(e1)
    | iexpr_sub(e0, e1) => eval_iexpr(e0) - eval_iexpr(e1)
    | iexpr_mul(e0, e1) => eval_iexpr(e0) * eval_iexpr(e1)
    | iexpr_div(e0, e1) => 
        let 
          val rhs = eval_iexpr(e1)
        in
          if rhs = 0
            then 0
            else eval_iexpr(e0) / rhs
        end
    | iexpr_if(cond, then_expr, else_expr) => 
      if eval_bexpr(cond) 
        then eval_iexpr(then_expr)
        else eval_iexpr(else_expr)

and
  eval_bexpr(e: bexpr): bool =
    case e of
      | bexpr_val(b) => b
      | bexpr_not(b) => not(eval_bexpr(b))
      | bexpr_and(b0, b1) => eval_bexpr(b0) andalso eval_bexpr(b1)
      | bexpr_or(b0, b1) => eval_bexpr(b0) orelse eval_bexpr(b1)
      | bexpr_lt(lhs, rhs) => eval_iexpr(lhs) < eval_iexpr(rhs)
      | bexpr_lte(lhs, rhs) => eval_iexpr(lhs) <= eval_iexpr(rhs)
      | bexpr_eq(lhs, rhs) => eval_iexpr(lhs) = eval_iexpr(rhs)
      | bexpr_neq(lhs, rhs) => eval_iexpr(lhs) != eval_iexpr(rhs)
      | bexpr_gt(lhs, rhs) => eval_iexpr(lhs) > eval_iexpr(rhs)
      | bexpr_gte(lhs, rhs) => eval_iexpr(lhs) >= eval_iexpr(rhs)

implement main0 () = {
  val expr1 = iexpr_add(iexpr_val(1), iexpr_mul(iexpr_val(2), iexpr_val(3)))
  val () = assertloc(eval_iexpr(expr1) = 7)

  val expr2 = iexpr_mul(iexpr_add(iexpr_val(1), iexpr_val(2)), iexpr_val(3))
  val () = assertloc(eval_iexpr(expr2) = 9)

  val expr3 = iexpr_if(bexpr_lte(iexpr_add(iexpr_val(1), iexpr_val(2)), iexpr_mul(iexpr_val(3), iexpr_val(4))), 
  iexpr_add(iexpr_val(5), iexpr_val(6)), iexpr_sub(iexpr_val(7), iexpr_val(8)))

  val () = assertloc(eval_iexpr(expr3) = 11)
}
