#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

val xx = let val x = 3.14 * (10.0 - 1.0 / 1.4142) in x * x end
val () = println! (xx)

// a non-recursive function
fn square (x: double): double = x * x

val yy = let val y = 3.14 * (10.0 - 1.0 / 1.4142) in square (y) end
val () = println! (yy)

val squareAgain = lam (x: double): double => x * x

val zz = let val z = 3.14 * (10.0 - 1.0 / 1.4142) in squareAgain (z) end
val () = println! (zz)

fn area_of_ring (R: double, r: double): double = 
    outer - inner where {
        val PI = 3.14159
        val outer = PI * R * R
        val inner = PI * r * r
    }

val R = 20.0 and r = 10.0
val () = println! ("Area of a ring of inner radius ", r, " and outer radius ", R, " is ", area_of_ring (R, r))    

(* arity *)

val intsqr = lam (x: int): int => x * x

// binary function
fn sqrsum1 (x: int, y: int): int = intsqr (x) + intsqr (y)

typedef
int2 = (int, int)

// unary function equivalent to sqrsum1
fn sqrsum2 (xy: int2): int = intsqr (xy.0) + intsqr (xy.1)

fn abs (x: int): int = if x >= 0 then x else ~x

(* evaluation of recursive function calls *)

fun
fib (n: int): int = 
    if n >= 2 then fib (n - 1) + fib (n - 2) else n

fun
print_fibs_till (n: int) = 
    let fun aux (startval: int, endval: int) =
            if startval < endval then
                (println! ("fib(", n, ") = ", fib (startval)); aux (startval + 1, endval))
    in
        aux (0, n)
    end                

(* tail-call and tail-recursion *)    

fun
f91 (n: int): int = 
    if n >= 101 then n - 10 else f91 (f91 (n + 11))

fun
print_f91_till (n: int) = 
    let fun aux (startval : int, endval: int) = 
            if startval < endval then
                (println! ("f91 (", startval, ") = ", f91 (startval)); aux (startval + 1, endval))    
    in  
        aux (0, n)
    end                

fun
sum_iter (n: int): int = 
    let fun aux (n: int, acc: int): int = 
            if n = 0 then
                acc else aux (n - 1, acc + n)
    in
        aux (n, 0)
    end
    
implement
main0 () = {
    val () = assertloc (sqrsum1 (1, 2) = sqrsum2 @(1, 2))
    val () = assertloc (sqrsum1 (91, 12) = sqrsum2 @(91, 12))
    val () = assertloc (sqrsum1 (11, 32) = sqrsum2 @(11, 32))

    val () = assertloc (abs (100) = 100)
    val () = assertloc (abs (0) = 0)
    val () = assertloc (abs (~200) = 200)
    val () = print_fibs_till (20)
    
    val () = print_f91_till (10)

    val () = assertloc (sum_iter (0) = 0)
    val () = assertloc (sum_iter (10) = 55)
}