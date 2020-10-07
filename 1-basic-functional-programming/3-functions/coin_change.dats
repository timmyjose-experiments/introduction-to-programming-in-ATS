#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(*
    cc(S, x) is the coin change function.

    cc(S, 0) = 1
    if x < 0 then cc(S, x) = 0
    if S is empty and x > 0 then cc(S, x) = 0
    cc(S, x) = cc(S1, x) + cc(S, x-c) where S1 = S - c
*)

typedef
int4 = (int, int, int, int)

val theCoins = (1, 5, 10, 25) : int4

fn
coin_get (n: int): int = 
    if n = 0 then theCoins.0
    else if n = 1 then theCoins.1
    else if n = 2 then theCoins.2
    else if n = 3 then theCoins.3
    else ~1

fun
coin_change (sum: int): int = 
    let fun aux (sum: int, n: int): int = 
            if sum > 0 then
                if n >= 0 then
                    aux (sum, n - 1) + aux (sum - coin_get (n), n) 
                else 0
            else if sum < 0 then 0 else 1
    in
        aux (sum, 3)            
    end

implement
main0 () = {
    val () = assertloc (coin_change (25) = 13)
    val () = assertloc (coin_change (100) = 242)
    val () = assertloc (coin_change (1000) = 142511)
}