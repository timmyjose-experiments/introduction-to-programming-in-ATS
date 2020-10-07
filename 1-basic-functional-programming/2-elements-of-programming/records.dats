#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* flat/native/unboxed records *)

typedef
point2D = @{ x = double, y = double }

local
    val theOrigin = @{ x = 0.0, y = 0.0 }
in
    val () = println! ("theOrigin = {", theOrigin.x, ", ", theOrigin.y, "}")
end    

// with explicit type-annotation
local
    val aRandomPoint = @{ x = 1.2345, y = ~5.232321 } : point2D
in
    val () = println! ("aRandomPoint = {", aRandomPoint.x, ", ", aRandomPoint.y, "}")    
end

// pattern matching

typedef
person = @{ name = string, age = int, salary = double }

local
    val bob = @{ name = "Bob", age = 42, salary = 12345.99 }
in
    val () = let val @{ name = bobName, age = bobAge, salary = bobSalary } = bob 
            in
                println! (bobName, " is ", bobAge, " years old, and has a salary of ", bobSalary) 
            end
end    

(* boxed records *)

typedef 
album = '{ artist = string, title = string, year = int }

local
    val help = '{ artist = "The Beatles", title = "Help", year = 1965 }
in
    val () = 
        let val '{ artist = theArtist, title = theTitle, year = theYear } = help 
        in
            println! (theArtist, " created \"", theTitle, "\" in ", theYear)    
        end
end        

implement
main0 () = {

}