#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* Strptr1 is a linear string. strptr_free is used to free such values

  fun fileref_get_line_string
    (fil: FILEref): Strptr1

  fun fileref_isnot_eof
    (fil: FILEref): bool
*)

implement main0 () = 
  loop() where {

    fun loop(): void = 
      let 
        val continue = fileref_isnot_eof(stdin_ref)
      in
        if continue then let
          val line = fileref_get_line_string(stdin_ref)
          val () = fprintln!(stdout_ref, line)
          val () = strptr_free(line)
        in loop() end
        else ()
      end
  }

