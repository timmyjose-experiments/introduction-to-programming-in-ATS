#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun
sum1 (n: int): int =
    if n >= 1 then n + sum1 (n - 1) else 0

fun
sum2 (m: int, n: int): int = 
    if m < n then m + sum2 (m + 1, n) else n

fun
sum3 (m: int, n: int): int = 
    if m <= n then
        let val mid = (m + n) / 2
        in
            sum3 (m, mid - 1) + mid + sum3 (mid + 1, n)
        end
    else 0            

implement
main0 () = {
    val () = assertloc (sum1 (0) = 0)
    val () = assertloc (sum1 (1) = 1)
    val () = assertloc (sum1 (2) = 3)
    val () = assertloc (sum1 (3) = 6)
    val () = assertloc (sum1 (4) = 10)
    val () = assertloc (sum1 (5) = 15)

    val () = assertloc (sum2 (1, 0) = 0)
    val () = assertloc (sum2 (1, 1) = 1)
    val () = assertloc (sum2 (1, 2) = 3)
    val () = assertloc (sum2 (1, 3) = 6)
    val () = assertloc (sum2 (1, 4) = 10)
    val () = assertloc (sum2 (1, 5) = 15)

    val () = assertloc (sum3 (1, 0) = 0)
    val () = assertloc (sum3 (1, 1) = 1)
    val () = assertloc (sum3 (1, 2) = 3)
    val () = assertloc (sum3 (1, 3) = 6)
    val () = assertloc (sum3 (1, 4) = 10)
    val () = assertloc (sum3 (1, 5) = 15)
}