#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* enumerative data types *)

datatype intopt = 
  | intopt of ()
  | intopt of (int)

fun check_intopt
  (v: intopt): void =
  case v of
    | intopt() => println!("No value found")
    | intopt(x) => println!("Got a value: ", x)

datatype wday = 
  | Monday of ()
  | Tuesday of ()
  | Wednesday of ()
  | Thursday of ()
  | Friday of ()
  | Saturday of ()
  | Sunday of ()

fun isWeekDay
  (d: wday): bool = 
  case d of
    | Monday() => true
    | Tuesday() => true
    | Wednesday() => true
    | Thursday() => true
    | Friday() => true
    | _ => false

fun isWeekendDay
  (d: wday): bool = 
  case d of
    | Saturday() => true
    | Sunday() => true
    | _ => false

implement main0 () = {
  val () = check_intopt(intopt())
  val () = check_intopt(intopt(42))

  val () = assertloc(isWeekDay(Monday) =  true)
  val () = assertloc(isWeekDay(Tuesday) =  true)
  val () = assertloc(isWeekDay(Wednesday) =  true)
  val () = assertloc(isWeekDay(Thursday) =  true)
  val () = assertloc(isWeekDay(Friday) =  true)
  val () = assertloc(isWeekDay(Saturday) =  false)
  val () = assertloc(isWeekDay(Sunday) =  false)

  val () = assertloc(isWeekendDay(Monday) =  false)
  val () = assertloc(isWeekendDay(Tuesday) =  false)
  val () = assertloc(isWeekendDay(Wednesday) =  false)
  val () = assertloc(isWeekendDay(Thursday) =  false)
  val () = assertloc(isWeekendDay(Friday) =  false)
  val () = assertloc(isWeekendDay(Saturday) =  true)
  val () = assertloc(isWeekendDay(Sunday) =  true)
}
