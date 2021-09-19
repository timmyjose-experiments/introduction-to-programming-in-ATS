#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "acker2.dats"
dynload "acker2.dats"

implement main0 () = {
  val () = assertloc (acker2(3, 3) = 61)
}
