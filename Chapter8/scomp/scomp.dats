#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "scomp.sats"

staload UN = "prelude/SATS/unsafe.sats"
staload "libats/ML/SATS/array0.sats"
staload "libats/ML/DATS/array0.dats"

implement mystrcmp_ats(s, t) = 
  let 
    fun loop(s: ptr, t: ptr): int = 
      let
        val p1 = $UN.ptr0_get<uchar>(s)
        val p2 = $UN.ptr0_get<uchar>(t)
      in
        ifcase
          | p1 > p2 => 1
          | p1 < p2 => ~1
          | _ =>
            if $UN.cast{int}(p1) = 0 then 0 else loop(ptr0_succ<uchar>(s), ptr0_succ<uchar>(t))
     end
  in
    loop(string2ptr(s), string2ptr(t))
  end
