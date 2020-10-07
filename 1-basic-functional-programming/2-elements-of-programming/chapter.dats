#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* names and bindings *)
val x = 1 + 2
val () = assertloc (x = 3)

val PI = 3.14159 and radius = 10.0
val area = PI * radius * radius
val _ = println! ("area = ", area)

(* scopes for bindings *)

// toplevel bindings
val area0 = let val PI = 3.14159 and radius = 10.0 in PI * radius * radius end
val perimeter0 = 2.0 * PI0 * radius0 where {
    val PI0 = 3.14159
    val radius0 = 20.0
}

val _ = println! ("area0 = ", area0, ", and perimeter0 = ", perimeter0)

// local bindings
local
    // these are local to the `local` block
    val PI1 = 3.14159 and radius1 = 10.0
in
    // note that this is a toplevel binding
    val area1 = PI1 * radius1 * radius1
end

// and so we can use it here
val _ = println! ("area1 = ", area1)

// and we cannot do this
//val _ = println! ("PI1 = ", PI1`)

(*
    Primitive types in ATS (with the equivalent in C):

    bool -> bool
    char -> char
    schar -> char
    uchar -> unsigned char
    float -> float
    uint -> unsigned
    ulint -> unsigned long
    llint -> long long
    ullint -> unsigned long long
    lint -> long
    size_t -> size_t
    ssize_t -> ssize_t
    sint -> short
    usint -> unsigned short
    string -> *char
*)

implement
main0 () = {
    (* expressions and values *)
    
    val () = assertloc (1 + 2 = 3)
    val () = assertloc (1 -2 = ~1)
    val () = assertloc ((1 + 2) * (12 / 2) = 18)
    val () = assertloc (~1.1 = ~2.1 + 1.0)

    val () = assertloc (false orelse true)
    val () = assertloc (not (true andalso false))
    val () = assertloc ((1 >= 2) orelse (2 <= 3))
    val () = assertloc ((1 >=2) || (2 <= 3))

    val () = assertloc ('x' = 'x')
    val () = assertloc ("hello \"world\"" = "hello \"world\"")

    val () = assertloc (op+(2, 3) = 5)
    val () = assertloc (op*(2, 3) = 6)


}