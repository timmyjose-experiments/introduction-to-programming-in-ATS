#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

extern fun fact(m: int): int = "sta#"

%{

  int fact(int n)
  {
    if (n <= 0) {
      return 1;
    }

    return n * fact(n - 1);
  }

%}

implement main0 () = {
  val () = $extfcall(void, "printf", "%d\n", 42);
  val () = $extfcall(void, "fprintf", stdout_ref, "Hello, %s\n", "world")
  val () = $extfcall(void, "printf", "fact(%d) = %d\n", 10, fact(10))
}

