#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload UN = "prelude/SATS/unsafe.sats"

extern
fun strcmp(s1: string, s2: string): int

implement strcmp(s1, s2) = 
  let
    fun loop(p1: ptr, p2: ptr): int = 
    let
      val c1 = $UN.ptr0_get<uchar>(p1)
      val c2 = $UN.ptr0_get<uchar>(p2)
    in
      ifcase
        | c1 < c2 => ~1
        | c1 > c2 => 1
        | _ => 
        if $UN.cast{int}(c1) = 0
          then 0 
          else loop(ptr0_succ<uchar>(p1), ptr0_succ<uchar>(p2))
    end
  in
    loop(string2ptr(s1), string2ptr(s2))
  end

implement main0 () = {
  val () = assertloc(strcmp("abcdefg", "abcde") > 0)
  val () = assertloc(strcmp("abcde", "abcde") = 0)
  val () = assertloc(strcmp("abccc", "abcd") < 0)
}
