#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

val () = (print 'H'; print 'e'; print 'l'; print 'l'; print 'o'; print '\n')
val () = (print 'H'; print 'e'; print 'l'; print 'l'; print 'o'; print '\n';)

val () = 
begin
    print 'H'; print 'o'; print 'l'; print 'a'; print '\n'
end

val () = 
begin
    print 'P'; print 'r'; print 'i'; print 'v'; print 'e'; print 't'; print '\n';
end

val () = 
let
    val () = print 'H'
    val () = print 'a'
    val () = print 'l'
    val () = print 'l'
    val () = print 'o'
    val () = print '\n'
in
end    

implement
main0 () = ()

