#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define N 8

typedef
int8 = @(int, int, int, int, int, int, int, int)

fun print_dots
  (i: int): void = 
  if i > 0
    then (print ". "; print_dots(i - 1))

fun print_row
  (r: int): void =
  (
  print_dots(r);
  print("Q ");
  print_dots(N - r - 1);
  print("\n")
  )

fun print_board
  (bd: int8): void = 
  (
  print_row(bd.0);
  print_row(bd.1);
  print_row(bd.2);
  print_row(bd.3);
  print_row(bd.4);
  print_row(bd.5);
  print_row(bd.6);
  print_row(bd.7);
  print_newline();
  )

fun board_get
  (bd: int8, i: int): int =
  if i = 0 then bd.0
  else if i = 1 then bd.1
  else if i = 2 then bd.2
  else if i = 3 then bd.3
  else if i = 4 then bd.4
  else if i = 5 then bd.5
  else if i = 6 then bd.6
  else if i = 7 then bd.7
  else ~1

fun board_set
  (bd: int8, i: int, j: int): int8 = 
  let 
    val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
  in
    if i = 0 then (j, x1, x2, x3, x4, x5, x6, x7)
    else if i = 1 then (x0, j, x2, x3, x4, x5, x6, x7)
    else if i = 2 then (x0, x1, j, x3, x4, x5, x6, x7)
    else if i = 3 then (x0, x1, x2, j, x4, x5, x6, x7)
    else if i = 4 then (x0, x1, x2, x3, j, x5, x6, x7)
    else if i = 5 then (x0, x1, x2, x3, x4, j, x6, x7)
    else if i = 6 then (x0, x1, x2, x3, x4, x5, j, x7)
    else if i = 7 then (x0, x1, x2, x3, x4, x5, x6, j)
    else bd
  end

fun safety_test1
  (i0: int, j0: int, i1: int, j1: int): bool = 
  j0 <> j1 andalso abs(i0 - i1) <> abs(j0 - j1)

fun safety_test2
  (i0: int, j0: int, bd: int8, i: int): bool = 
  if i >= 0 then
    if safety_test1(i0, j0, i, board_get(bd, i))
      then safety_test2(i0, j0, bd, i - 1)
      else false
  else true

fun search
  (bd: int8, i: int, j: int, nsol: int): int = 
  if j < N  then
    let
      val test = safety_test2(i, j, bd, i - 1)
    in
      if test then 
        let 
          val bd1 = board_set(bd, i, j)
        in
          if i + 1 = N then
            let 
              val () = print!("Solution #", nsol + 1, ":\n\n")
              val () = print_board(bd1)
            in 
              search(bd, i + 1, j + 1, nsol + 1)
            end
          else search(bd1, i + 1, 0, nsol)
        end
      else search(bd, i, j + 1, nsol)
   end
  else  if i > 0 then search(bd, i - 1, board_get(bd, i - 1) + 1, nsol) else nsol

implement main0 () = {
  val bd = @(0, 1, 2, 3, 4, 5, 6, 7)
  val nsol = search(bd, 0, 0, 0)
  val _ = assertloc(nsol = 92)
}
