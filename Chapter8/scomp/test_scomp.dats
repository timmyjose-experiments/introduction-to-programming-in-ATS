#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "scomp.sats"
staload "scomp.dats"

implement main0 () = {
  val () = assertloc(mystrcmp_ats("abc", "abcd") < 0)
  val () = assertloc(mystrcmp_ats("abcde", "abcd") > 0)
  val () = assertloc(mystrcmp_ats("abcde", "abcde") = 0)

  val () = assertloc(mystrcmp_c(string2ptr("abc"), string2ptr("abcd")) < 0)
  val () = assertloc(mystrcmp_c(string2ptr("abcde"), string2ptr("abcd")) > 0)
  val () = assertloc(mystrcmp_c(string2ptr("abcde"), string2ptr("abcde")) = 0)
}

