#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* flat/native/unboxed tuples *)

val xyz = ('A', 1, 2.0)
val () = let val (c, i, f) = xyz in println! ("c = ", c, " i = ", i, " f = ", f) end

val bob = @("Bob", 42, 220.33)
local
    val name = bob.0 and age = bob.1 and salary = bob.2
in
    val () = println! (name, " is ", age, " years old, and earns ", salary)    
end    

// explicit type-annotation
val t0 = @(1, false, 3.0f, 'x', "Hello") : (int, bool, float, char, string)
val () = println! (t0.0, t0.1, t0.2, t0.3)

// boxed tuples - stored on the heap, needs GC
val rectangle = '(10.1, 20.0)
local
    val area = rectangle.0 * rectangle.1
in
    val () = println! ("Area of rectangle of dimensions ", rectangle.0, " by ", rectangle.1, " is ", area)    
end    

implement
main0 () = {

}