#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

exception FatalError0 of ()
exception FatalError1 of (string)
exception FatalError2 of (int, string, double)

fun exndemo
  (x: int): int = 
  let
    fun raise_exception(x: int): int =
      case+ x of
        | 0 => $raise FatalError0()
        | 1 => $raise FatalError1("error1")
        | 2 => $raise FatalError2(42, "Wowbagger's curse", 1.2345)
        | _ => x
  in
    try
      raise_exception(x)
    with
      | ~FatalError0() => (println!("got an error of kind 0"); 0)
      | ~FatalError1(msg) => (println!(msg); 0)
      | ~FatalError2(ival, sval, dval) =>
        (println!(ival, ":", sval, ":", dval); 0)
  end

exception DivisionByZero of ()

fun divexn
  (x: int, y: int): int = 
  if y != 0 then x / y else $raise DivisionByZero()

fun safediv
  (x: int, y: int): int = 
  try
    divexn(x, y)
  with
    ~DivisionByZero() => 0

implement main0 () = {
  val () = let
    val res1 = divexn(10, 2)
  in
    println!("divexn(10, 2) = ", res1)
  end

  val () = let
    val res2 = try 
      divexn(10, 0)
    with
      ~DivisionByZero() => 0
  in
    println!("divexn(10, 0) = ", res2)
  end

  val () = println!("safediv(10, 2) = ", safediv(10, 2))
  val () = println!("safediv(10, 0) = ", safediv(10, 0))

  val () = println!(exndemo(0))
  val () = println!(exndemo(1))
  val () = println!(exndemo(2))
  val () = println!(exndemo(3))
}
