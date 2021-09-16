fun add(int, int): int
fun sub(x: int, y: int): int
fun mul : (int, int) -> int
fun div : (int ,int) -> int

fun fact : int -> int
val fact10 : int

fun swap_boxed{a, b: type}(xy: (a, b)): (b, a)
fun{a, b: t@ype} swap_tmplt(xy: (a, b)): (b, a)
