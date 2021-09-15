#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload STDLIB = "libats/libc/SATS/stdlib.sats" 

datatype tree (a: t@ype) = 
  | tree_nil (a) of ()
  | tree_cons (a) of (a, tree a, tree a)

fun {a: t@ype}
size
  (t: tree a): int = 
  case+ t of
    | tree_nil() => 0
    | tree_cons(_, l, r) => 1 + size(l) + size(r)

fun{a: t@ype}
brauntest0
  (t: tree a): bool =
  case+ t of
    | tree_nil() => true
    | tree_cons(_, l, r) =>
        let val sl = size(l) and sr = size(r) 
        in
          brauntest0(l) andalso brauntest0(r) andalso $STDLIB.abs(sl - sr) <= 1
        end

fun{a: t@ype}
brauntest1
  (t: tree a): bool = 
  let
    exception Negative of ()

    fun aux(t: tree a): bool = 
      case+ t of
        | tree_nil() => true
        | tree_cons(_, l, r) =>
          let 
            val sl = size(l) and sr = size(r)
            val diff = $STDLIB.abs(sl - sr)
          in
            if diff != 0 andalso diff != 1 
              then $raise Negative() 
              else brauntest1(l) andalso brauntest1(r)
          end
  in
    try aux(t) with ~Negative() => false
  end

implement main0 () = {
  val t1 = tree_cons{int}(1, tree_cons{int}(2, tree_nil(), tree_nil()), tree_cons{int}(3, tree_nil(), tree_nil()))
  val () = println!("size(t1) = ", size(t1))
  val () = println!("brauntest0(t1) = ", brauntest0(t1), ", brauntest1(t1) = ", brauntest1(t1))

  val t2 = tree_cons{int}(1, 
            tree_cons{int}(2,
              tree_cons{int}(3, 
                tree_cons{int}(4, 
                  tree_nil(), 
                  tree_nil()), 
                tree_nil()),
              tree_nil()), 
            tree_cons(5, 
              tree_nil(), 
              tree_nil()))
  val () = println!("size(t2) = ", size(t2))
  val () = println!("brauntest0(t2) = ", brauntest0(t2), ", brauntest1(t2) = ", brauntest1(t2))
}
