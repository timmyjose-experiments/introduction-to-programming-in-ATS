#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"

typedef person = '{
  name = string,
  age = int,
  salary = double
}

fun newPerson
  (name: string, age: int, salary: double): person = 
  '{
    name = name,
    age = age,
    salary = salary
  }

fun sumup
  (n: int): int = 
  let 
    val res = ref<int>(0)

    fun loop(i: int, n: int): void = 
      if i <= n then (!res := !res + i; loop(i + 1, n))
  in
    (
    loop(1, n);
    !res
    )
  end

fun factorial
  (n: int): int = 
  let
    val f = ref<int>(1)
    
    fun loop(i: int, n: int): void = 
      if i <= n then (!f := !f * i; loop(i + 1, n))
  in
    (
      loop(1, n);
      !f
    )
  end

implement main0 () = {
  val () = 
    let val x = 0
        val y = ~10
        val z = 20
    in
      (
        println!("abs(", x, ") = ", $STDLIB.abs(x));
        println!("abs(", y, ") = ", $STDLIB.abs(y));
        println!("abs(", z, ") = ", $STDLIB.abs(z))
      )
  end

  // references
  // references.sats
  // fun{a: t@ype} ref_get_elt(r: ref a): a
  // fun{a: t@ype} ref_set_elt(r: ref a, x: a): void // !r := x
  val refi = ref<int>(0)
  val () = !refi := !refi + 1
  val () = assertloc(!refi = 1)
  val () = !refi := !refi + 100
  val () = assertloc(!refi = 101)

  val refd = ref<double>(0.0)
  val () = assertloc(!refd = 0.0)
  val () = !refd := !refd + 3.14159
  val () = println!("refd = ", !refd)

  val refb = ref<bool>(false)
  val () = assertloc(ref_get_elt<bool>(refb) = false)
  val () = ref_set_elt<bool>(refb, true)
  val () = assertloc(ref_get_elt<bool>(refb) = true)

  val () = assertloc(sumup(10) = 55)
  val () = assertloc(sumup(0) = 0)

  val () = assertloc(factorial(0) = 1)
  val () = assertloc(factorial(1) = 1)
  val () = assertloc(factorial(2) = 2)
  val () = assertloc(factorial(3) = 6)
  val () = assertloc(factorial(4) = 24)
  val () = assertloc(factorial(5) = 120)

  val bob = newPerson("Bob", 42, 12345.789)
  val '{name = bobName, age = bobAge, salary = bobSalary} = bob
  val () = println!("Bob's details: name = ", bobName, ", age = ", bobAge, ", salary = ", bobSalary)
  val () = println!("Bob's details: name = ", bobName, ", age = ", bobAge, ", salary = ", bobSalary)

  val alice = newPerson("alice", 22, 5678.221)
  val '{name = aliceName, age = aliceAge, salary = aliceSalary} = alice
  val () = println!("Alice's details: name = ", aliceName, ", age = ", aliceAge, ", salary = ", aliceSalary)
}
