#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

extern
fun fact(n: int): int 

extern 
fun fact2(n: int, acc: int): int = "sta#fact2_in_c"

(* 
  %{^ %} for inclusion of C code at the beginning of the generated C file

  %{$ %} for inclusion of C code at the end of the generated C file

  %{# %} so that such code in a SATS file, when said file is staloaded in a DATS file, will include this C code 

*)

  
%{

  int fact2_in_c(int n, int acc)
  {
    if (n <= 0) {
      return acc;
    }

    return fact2_in_c(n - 1, acc * n);
  }

%}

implement fact(n) = fact2(n, 1)

implement main0 (argc, argv) = {
  val () = if argc != 2 then prerrln!("Usage: ", argv[0], "<num>")
  val () = assertloc (argc = 2)
  
  val n = g0string2int(argv[1])
  val () = println!(fact(n))
}
