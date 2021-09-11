#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* recursive data types *)

datatype charlst = 
  | charlst_nil of ()
  | charlst_cons of (char, charlst)

fun charlst_length
  (cs: charlst): int =
  case cs of
    | charlst_nil() => 0
    | charlst_cons(_, cs) => 1 + charlst_length(cs)

fun print_charlst
  (cs: charlst): void =
  case cs of
    | charlst_nil() => (print_newline())
    | charlst_cons(c, cs) =>
    (
      print(c);
      print(' ');
      print_charlst(cs)
    )

fun tc_charlst_length
  (cs: charlst): int = 
  let 
    fun loop(cs: charlst, acc: int): int = 
      case cs of
        | charlst_nil() => acc
        | charlst_cons(_, cs) => loop(cs, acc + 1)
  in
    loop(cs, 0)
  end

fun charlst_last
  (cs: charlst): char =
  case- cs of
    | charlst_cons(c, charlst_nil()) => c
    | charlst_cons(_, cs) => charlst_last(cs)

fun charlst_last1
  (cs: charlst): char = 
  case- cs of
    | charlst_cons(c, cs) =>
      case+ cs of
        | charlst_nil() => c
        | charlst_cons(_, cs) => charlst_last1(cs)

fun charlst_last2
  (cs: charlst): char = 
  let 
    val- charlst_cons(c, cs) = cs
  in
    case- cs of
      | charlst_nil() => c
      | charlst_cons(_, cs) => charlst_last2(cs)
  end

implement main0 () = {
  val clist0 = charlst_cons('a', charlst_cons('b', charlst_cons('c', charlst_nil())))
  val () = assertloc(charlst_length(clist0) = 3)
  val () = assertloc(tc_charlst_length(clist0) = 3)
  val () = print_charlst(clist0)

  val () = assertloc(charlst_last(clist0) = 'c')
  val () = assertloc(charlst_last1(clist0) = 'c')
  val () = assertloc(charlst_last2(clist0) = 'c')
}
