abst@ype rat = (int, int) (* unboxed abstract type with a pair of ints as its backing data structure *)

exception Denominator
exception DivisionByZero

fun rat_make_int_int(p: int, q: int): rat
fun ratneg(r: rat): rat
fun ratadd(p: rat, q: rat): rat
fun ratsub(p: rat, q: rat): rat
fun ratmul(p: rat, q: rat): rat
fun ratdiv(p: rat, q: rat): rat

// for printing rational values

fun fprint_rat(out: FILEref, x: rat): void

overload fprint with fprint_rat
