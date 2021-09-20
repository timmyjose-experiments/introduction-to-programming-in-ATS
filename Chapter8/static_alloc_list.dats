#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload UN = "prelude/SATS/unsafe.sats"

vtypedef 
list_node = list_cons_pstruct(int, ptr)

extern
vtypedef "list_node" = list_node

typedef 
list_node_ = $extype"list_node_" (* automatically generated type in C for non-boxed version *)

local
  #define N 10

  var nodes = @[list_node_][N]() // static allocation

  fun loop
    (p: ptr, i: int): void = 
     if i < N then let
       val res = $UN.castvwtp0{list_node}(p)
       val+list_cons(x, xs) = res
       val () = x := i * i
       val p = ptr0_succ<list_node_>(p)
       val i = i + 1
       val () = (if i < N then xs := p else xs := the_null_ptr)
       val _ = $UN.castvwtp0{ptr}((view@x, view@xs | res))
    in
      loop(p, i)
    end else ()
in
  val () = loop(addr@nodes, 0)
  val xs_static = $UN.castvwtp0{list(int, N)}((view@nodes | addr@nodes))
  val () = println!("xs_static = ", xs_static)
end

implement main0 () = ()

