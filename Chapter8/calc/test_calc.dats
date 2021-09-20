#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "calc.sats"

%{#
    int add(int x, int y)
    {
      return x + y;
    }

    int subtract(int x, int y)
    {
      return x - y;
    }

    int multiply(int x, int y)
    {
      return x * y;
    }

    int divide(int x, int y)
    {
      if (y == 0) {
        return 0;
      }
      return x / y;
    }

%}

implement main0 (argc, argv) = {
  val () = if argc != 3 then prerrln!("Usage: ", argv[0], " <num1> <num2>")
  val () = assertloc(argc = 3)

  val x = g0string2int(argv[1])
  val y = g0string2int(argv[2])
  val () = println!(add(x, y))
  val () = println!(subtract(x, y))
  val () = println!(multiply(x, y))
  val () = println!(divide(x, y))
}

