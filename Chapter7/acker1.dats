#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload ACKER = "acker1.sats"

implement $ACKER.acker1(m, n) = 
  if m > 0 then
    if n > 0 then
      $ACKER.acker1(m - 1, $ACKER.acker1(m, n - 1))
    else $ACKER.acker1(m - 1, 1)
  else n + 1

