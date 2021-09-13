#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

datatype ilist = 
  | ilist_nil of ()
  | ilist_cons of (int, ilist)

fun ilist_length
  (lst: ilist): int = 
  case+ lst of
    | ilist_nil() => 0
    | ilist_cons(_, lst) => 1 + ilist_length(lst)

fun print_list
  (lst: ilist): void =
  case+ lst of
    | ilist_nil() => ()
    | ilist_cons(e, lst) =>
      (
        print!(e, " ");
        print_list(lst)
      )

implement main0 () = {
  val lst1 = ilist_nil()
  val () = assertloc(ilist_length(lst1) = 0)
  val () = print_list(lst1)
  val () = print_newline()

  val lst2 = ilist_cons(1, ilist_cons(2, ilist_cons(3, ilist_cons(4, ilist_cons(5, ilist_nil())))))
  val () = assertloc(ilist_length(lst2) = 5)
  val () = print_list(lst2)
  val () = print_newline()
}
