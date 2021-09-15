#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun print_intarray
  (A: arrszref int): void = 
  loop(0, ", ") where {
    val asz = g0uint2int_size_int(arrszref_get_size{int}(A))

    fun loop
      (i: int, sep: string): void = 
      if i < asz then
        (if i > 0 then print sep; print A[i]; loop(i + 1, sep))
  }

fun lrotate
  (A: arrszref int, i: int, j: int): void = 
  let 
    fun lshift
      (A: arrszref int, i: int, j: int): void = 
        if i < j then (A[i] := A[i + 1]; lshift(A, i + 1, j))
  in
    if i < j then let
      val tmp = A[i] in lshift(A, i, j); A[j] := tmp
    end
  end

fun rrotate
  (A: arrszref int, i: int, j: int): void = 
  let
    fun rshift
      (A: arrszref int, i: int, j: int): void =
        if i < j then (A[j] := A[j - 1]; rshift(A, i, j - 1))
  in
    if i < j then let
      val tmp = A[j] in rshift(A, i, j); A[i] := tmp
    end
  end

fun permute
  (n: int): void = 
  aux(1) where {
    val A = arrszref_make_elt<int>(g0int2uint_int_size(n), 0)
    
    val () = init(0) where {
      fun init(i: int): void =
        if i < n then (A[i] := i + 1; init(i + 1))
    }

    fun aux
      (i: int): void = 
      (
        if  i <= n then aux2(i, i)
        else (print_intarray(A); print_newline())
      )

    and aux2
      (i: int, j: int): void = 
        (
          if j <= n then let 
            val () = (rrotate(A, i - 1, j - 1); aux(i + 1); lrotate(A, i - 1, j - 1))
          in
            aux2(i, j + 1)
          end
        )
  }

implement main0 (argc, argv) = {
  val () = if argc != 2 then prerrln!("Usage: ", argv[0], " <integer>")
  val () = assertloc (argc = 2)
  
  val n = g0string2int(argv[1])
  val () = permute(n)
}
