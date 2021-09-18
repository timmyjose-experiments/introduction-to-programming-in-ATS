#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(*
  $extype"<type in c>"
  
   $extval(T, "val in c")
*)

typedef Cint = $extype"int"
typedef Clint = $extype"long int"
typedef Cllint = $extype"long long int"
typedef Cint2 = $extype"struct { int x; int y; }"

macdef NULL = $extval(ptr, "0")
macdef stdin_ref = $extval(FILEref, "stdin")
macdef stdout_ref = $extval(FILEref, "stdout")

macdef atoi = $extval(string -> int, "atoi")
macdef atol = $extval(string -> lint, "atol")
macdef atof = $extval(string -> double, "atof")

implement main0 () = {
}
