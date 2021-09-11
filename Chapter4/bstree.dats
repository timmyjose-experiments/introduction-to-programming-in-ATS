#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

datatype bstree = 
  | bstree_leaf of ()
  | bstree_node of (bstree, string, bstree)

fun bstree_insert
  (bst: bstree, elem: string): bstree = 
  case+ bst of
    | bstree_leaf() => bstree_node(bstree_leaf(), elem, bstree_leaf())
    | bstree_node(left, n, right) =>
        if elem <= n 
          then bstree_node(bstree_insert(left, elem), n, right)
          else bstree_node(left, n, bstree_insert(right, elem))

fun bstree_search
  (bst: bstree, elem: string): bool =
  case+ bst of
    | bstree_leaf() => false
    | bstree_node(left, n, right) =>
      ifcase 
        | elem < n => bstree_search(left, elem)
        | elem = n => true
        | _ => bstree_search(right, elem)

fun bstree_size
  (bst: bstree): int = 
  case+ bst of
    | bstree_leaf() => 0
    | bstree_node(left, _, right) => 1 + bstree_size(left) + bstree_size(right)

fun bstree_height
  (bst: bstree): int = 
  case bst of
    | bstree_leaf() => 0
    | bstree_node(left, _, right) => 1 + max(bstree_height(left), bstree_height(right))

fun bstree_preorder
  (bst: bstree): void = 
  case bst of
    | bstree_leaf() => ()
    | bstree_node(left, node, right) =>
      (
        print!(node, " ");
        bstree_preorder(left);
        bstree_preorder(right)
      )

fun bstree_inorder
  (bst: bstree): void = 
  case bst of
    | bstree_leaf() => ()
    | bstree_node(left, node, right) =>
      (
        bstree_inorder(left);
        print!(node, " ");
        bstree_inorder(right)
      )

fun bstree_postorder
  (bst: bstree): void = 
  case bst of
    | bstree_leaf() => ()
    | bstree_node(left, node, right) =>
      (
        bstree_postorder(left);
        bstree_postorder(right);
        print!(node, " ")
      )

implement main0 () = {
  val bst = bstree_leaf()
  val bst = bstree_insert(bst, "a")
  val bst = bstree_insert(bst, "z")
  val bst = bstree_insert(bst, "c")
  val bst = bstree_insert(bst, "b")
  val bst = bstree_insert(bst, "f")
  val bst = bstree_insert(bst, "m")
  val bst = bstree_insert(bst, "t")
  val bst = bstree_insert(bst, "l")

  val () = assertloc(bstree_search(bst, "t"))
  val () = assertloc(not(bstree_search(bst, "x")))
  val () = assertloc(bstree_size(bst) = 8)
  val () = assertloc(bstree_height(bst) = 6)

  val () = bstree_preorder(bst)
  val () = print_newline()
  val () = bstree_inorder(bst)
  val () = print_newline()
  val () = bstree_postorder(bst)
  val () = print_newline()
}
