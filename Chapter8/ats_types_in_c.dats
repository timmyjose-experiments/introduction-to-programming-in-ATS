#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

%{^
  extern int myatoi(void *x)
  {
    return atoi((const char*)x);
  }

%}

macdef myatoi = $extval(string -> int, "myatoi")

datatype abc = 
  | cons1 of int
  | cons2 of (int, double)

extern
vtypedef "cons2_node" = cons2_pstruct(int, double)

vtypedef cons2_node = $extype"cons2_node_"

%{
  cons2_node cons2_make(int i, double d)
  {
    cons2_node p = ATS_MALLOC(sizeof(cons2_node_));
    p->contag = 1; // second variant of the datatype abc
    p->atslab__0 = i;
    p->atslab__1 = d;

    return p;
  }

%}

extern 
fun cons2_make(i: int, d: double): abc = "mac#"

val-cons2(1, 2.345) = cons2_make(1, 2.345)

implement main0{n} (argc, argv) = {
  val () = loop(1, argv) where {
    fun loop(i: natLte n, argv: !argv n): void = 
      if i < argc then
        (
         println!("argv(", i, ") = ", myatoi(argv[i]));
         loop(i + 1, argv)
        )
      else ()
  }

}

