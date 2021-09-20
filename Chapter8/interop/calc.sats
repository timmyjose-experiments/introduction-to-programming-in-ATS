(* to avoid name mangling, so that these functions can be called as is from C, we define them to be external functions, but with
   the implementation in ATS instead of C (as would be usually done with such function interfaces) *)

fun add(m: int, n: int): int = "ext#"
fun subtract(m: int, n: int): int = "ext#"
fun multiply(m: int, n: int): int = "ext#"
fun divide(m: int, n: int): int = "ext#"
