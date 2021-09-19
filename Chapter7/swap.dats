#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

extern
fun swap_boxed{a, b: type}(xy: (a, b)): (b, a)

implement swap_boxed{a, b}(xy) = (xy.1, xy.0)

extern
fun{a, b: t@ype} swap_tmplt(xy: (a, b)): (b, a)

implement{a, b} swap_tmplt(xy) = (xy.1, xy.0)

implement main0 () = {
  val AB = ("hello", 42)
  val BA1 = swap_tmplt<string, int>(AB)
  val () = assertloc(BA1.0 = 42 andalso BA1.1 = "hello")

  val AB1 = (box("hello"), box("world"))
  val BA2 = swap_boxed(AB1)
  val () = assertloc (unbox(BA2.0) = "world" andalso unbox(BA2.1) = "hello")
}
