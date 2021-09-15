#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

typedef person = @{ name = string, age = uint, salary = double }

fun newPerson
  (name: string, age: uint, salary: double): person = 
  @{
    name = name,
    age = age,
    salary = salary
  }

fun print_person
  (p: person): void = 
  let
    val @{name = theName, age = theAge, salary = theSalary} = p
  in
    $extfcall(void, "printf", "Person { name = %s, age = %d, salary = %.3f}\n", theName, theAge, theSalary)
  end

implement main0 () = {
  val bob = newPerson("Bob", g0int2uint(42), 12345.9876)
  val () = print_person(bob)
  val () = let 
    val @{name = theName, age = theAge, salary = theSalary } = bob
  in
   fprintln!(stdout_ref, "Person { name = ", theName, ", age = ", theAge, ", salary = ", theSalary, " }")
  end
}
