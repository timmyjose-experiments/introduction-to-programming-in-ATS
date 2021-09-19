#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

extern fun acker2(m: int, n: int): int

implement acker2(m, n) = 
  if m > 0 then
    if n > 0 then
      acker2(m - 1, acker2(m, n - 1))
    else acker2(m - 1, 1)
  else n + 1
