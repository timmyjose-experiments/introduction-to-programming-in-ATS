#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

typedef Cint = $extype"int"
typedef Clint = $extype"long int"
typedef Cllint = $extype "long long int"
typedef Cint2 = $extype"struct { int x; int y;}"

macdef NULL = $extval(ptr, "0")
macdef stdin_ref = $extval(FILEref, "stdin")
macdef stdout_ref = $extval(FILEref, "stdout")

macdef atoi = $extval(string -> int, "atoi")
macdef atol = $extval(string -> lint, "atol")
macdef atof = $extval(string -> double, "atof")

extern
fun fact(n: int): int

extern
fun fact2(n: int, res: int): int = "ext#fact2_in_c"

implement fact(n) = fact2(n, 1)

%{
    int fact2_in_c(int n, int res)
    {
      if (n <= 0) {
        return res;
      }

      return fact2_in_c(n - 1, res * n);
    }

%}

implement main0 () = {
  val () = assertloc(atoi("123") = 123)
  val () = assertloc(atol("123") = 123)
  val () = assertloc(atof("123") = 123)

  val () = assertloc(fact(10) = 3628800)
}
