#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

typedef person = @{ name = string, age = int, salary = double }

extern fun fprint_person(out: FILEref, p: person): void
overload fprint with fprint_person

implement fprint_person(out, p) = 
  let val @{ name = theName, age = theAge, salary = theSalary } = p
  in
    fprint_string(out, "Person { name = ");
    fprint_string(out, theName);
    fprint_string(out, ", age = ");
    fprint_int(out, theAge);
    fprint_string(out, ", salary = ");
    fprint_double(out, theSalary)
  end

val bob = @{ name = "Bob", age = 42, salary = 12345.9876 }

implement main0 () = {
  val () = fprintln!(stdout_ref, "bob = ", bob)
}
