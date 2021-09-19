#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "acker1.sats"
dynload "acker1.dats"

implement main0 () = {
  val () = assertloc (acker1(3, 3) = 61)
}
