#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(*
  filebas.sats

  handle type - FILEref.

  standard handles - stdout_ref, stdin_ref, stderr_ref

  fun fileref_open_exn
    (path: string, fm:file_mode): FILEref

  fun filref_open_opt
    (path: string, fm: file_mode): Option_vt(FILEref)

  fun fileref_close
    (file: FILEref): void

  fun fileref_get_line_string
    (file: FILEref): Strptr1

  file modes:
    file_mode_r (reading, filepos at beginning)
    file_mode_rr (reading and writing, filepos at beginning)
    file_mode_w (truncate or create a new file for writing, filepos at beginning)
    file_mode_ww (truncate or create a new file (for reading and writing), filepos at beginning)
    file_mode_a (reading, filepos at end)
    file_mode_aa (reading and writing, filepos at beginning for reading and at end for writing)
*)

fun write_hello_to_file
  (file: string): void = 
  let 
    val out = fileref_open_exn(file, file_mode_w)
    val () = fprint_string(out, "Hello, world!")
    val () = fprint_newline(out)
    val () = fileref_close(out)
  in end

fun write_hello_to_stdout(): void = 
  let 
    val () = fprint_string(stdout_ref, "Hello, world")
    val () = fprint_newline(stdout_ref)
  in end

implement main0 (argc, argv) = {
  val () = if argc != 2 then prerrln!("Usage: ", argv[0], " <output-file>")
  val () = assertloc (argc = 2)

  val () = write_hello_to_file(argv[1])
  val () = write_hello_to_stdout()
}
