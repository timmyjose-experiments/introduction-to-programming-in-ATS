#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

implement main0 () = {
  local
  val PI = 3.14 and radius = 10.0
  in
  val area = PI * radius * radius
  end
  val _ = print(area)
  val _ = print("\n")
}