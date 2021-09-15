#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats"
staload TIME = "libats/libc/SATS/time.sats"
staload UN = "prelude/SATS/unsafe.sats"

staload RG = "contrib/atscntrb/atscntrb-hx-mytesting/SATS/randgen.sats"
staload "contrib/atscntrb/atscntrb-hx-mytesting/DATS/randgen.dats"

(*
  matrixref.sats

  fun{a: t@ype}
  mtrxszref_make_elt
    (row: size_t, col: size_t, x: a): mtrxszref a

  fun{a: t@ype)
  mtrxszref_get_elt_at
    (M: mtrxszref a, i: size_t, j: size_t): a

  fun{a: t@ype}
  mtrxszref_set_elt_at
    (M: mtrxszref a, i: size_t, j: size_t, x: a): void

  fun mtrxszref_get_nrow{a: t@ype}
    (M: mtrxszref a): size_t

  fun mtrxszref_get_ncol{a: t@ype}
    (M: mtrxszref a): size_t

*)

postfix sz
#define sz(x) g0int2uint_int_size(x)

fun print_int_matrix
  (M: mtrxszref int): void = 
  let 
    val nrow = mtrxszref_get_nrow(M)
    val ncol = mtrxszref_get_ncol(M)

    fun print_row
      (i: size_t, j: size_t): void = 
        if j < ncol then (print!(M[i, j], " "); print_row(i, j + 1))

    fun aux
      (i: size_t): void = 
        if i < nrow then (print_row(i, 0sz); print_newline(); aux(i + 1))
  in
    (
      aux(0sz);
      print_newline()
    )
  end

fun sum_int_matrix
  (M: mtrxszref int): int = 
  aux(g0int2uint_int_size(0)) where {
    val nrow = mtrxszref_get_nrow(M)
    val ncol = mtrxszref_get_ncol(M)

    fun sum_row
      (i: size_t, j: size_t): int = 
        if j < ncol then M[i, j] + sum_row(i, j + 1) else 0

    fun aux
      (i: size_t) : int = 
      if i < nrow then aux(i + 1) + sum_row(i, 0sz) else 0
  }

// this asssumes a square matrix
fun{a: t@ype}
mtrxszref_transpose
  (M: mtrxszref a): void =
  let
    val nrow = mtrxszref_get_nrow(M)

    fun loop1
      (i: size_t): void = 
      if i < nrow then loop2(i, 0sz) else ()
    and
      loop2
        (i: size_t, j: size_t): void = 
        if j < i then let
          val tmp = M[i, j]
        in
          M[i, j] := M[j, i]; M[j, i] := tmp; loop2(i, j + 1)
        end else loop1(i + 1)
  in
    loop1(0sz)
  end

implement main0 () = {
    macdef INTMAX = 10L
    #define N g0int2uint_int_size(5)
    #define M g0int2uint_int_size(8)

    val () = $STDLIB.srand48($UN.cast2lint($TIME.time_get()))

    val M1 = mtrxszref_make_elt<int>(2sz, 3sz, 0)
    val () = assertloc(mtrxszref_get_nrow{int}(M1) = 2)
    val () = assertloc(mtrxszref_get_ncol{int}(M1) = 3)
    val () = assertloc(M1[0, 2] = 0)
    val () = print_int_matrix(M1)

    val _ = (M1[0, 0] := 1; M1[0, 1] := 2; M1[0, 2] := 3; M1[1, 0] := 4; M1[1, 1] := 5; M1[1, 2] := 6)
    val () = print_int_matrix(M1)

    typedef T = int
    implement $RG.randgen_val<T>() = let
      val x = $STDLIB.lrand48() mod INTMAX in $UN.cast2int(x)
    end

    val M2 = $RG.randgen_mtrxszref<T>(N, M)
    val () = print_int_matrix(M2)
    val () = println!("Sum of matrix elements = ", sum_int_matrix(M2))

    val M3 = $RG.randgen_mtrxszref<T>(N, N)
    val () = print_int_matrix(M3)
    val () = mtrxszref_transpose<int>(M3)
    val () = print_int_matrix(M3)
}
