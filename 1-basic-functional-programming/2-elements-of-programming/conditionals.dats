#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

local
    val x = 100
    val y = 0
    val z = ~200
in
    val () = if x >= 0 then println! (x) else println! (~x)
    val () = if y >= 0 then println! (y) else println! (~y)
    val () = if z >= 0 then println! (z) else println! (~z)
end

implement
main0 () = {
    
}