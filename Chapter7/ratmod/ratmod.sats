exception Denominator
exception DivisionByZero

abst@ype rat = (int, int)

fun rat_make_int_int(p: int, q: int): rat

fun fprint_rat(out: FILEref, r: rat): void
overload fprint with fprint_rat

fun ratneg(r: rat): rat
fun ratadd(p: rat, q: rat): rat
fun ratsub(p: rat, q: rat): rat
fun ratmul(p: rat, q: rat): rat
fun ratdiv(p: rat, q: rat): rat
