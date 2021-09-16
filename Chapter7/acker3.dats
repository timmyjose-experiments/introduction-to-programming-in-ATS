#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

extern fun acker(m: int, n: int): int

implement acker(m, n) = 
  let
    fun aux(m: int, n: int): int = 
      if m > 0 then
        if n > 0 then aux(m - 1, aux(m, n - 1)) else aux(m - 1, 1)
      else n + 1
  in
    aux(m, n)
  end
