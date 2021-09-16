#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "acker3.dats"
dynload "acker3.dats"

implement main0 () = {
  val () = assertloc(acker(3, 3) = 61)
}
