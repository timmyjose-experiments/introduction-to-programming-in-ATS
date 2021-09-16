#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

fun copy
  (input: string, output: string): void = 
  let 
    val infil = fileref_open_exn(input, file_mode_r)
    val outfil = fileref_open_exn(output, file_mode_w)

    fun aux(): void =
      let
        val continue = fileref_isnot_eof(infil)
      in
        if continue then let
          val line = fileref_get_line_string(infil)
          val () = fprintln!(outfil, line)
          val () = strptr_free(line)
          in aux() end
      end
  in
    aux(); fileref_close(infil); fileref_close(outfil)
  end

implement main0(argc, argv) = {
  val () = if argc != 3 then prerrln!("Usage: ", argv[0], " <input-file> <output-file>")
  val () = assertloc(argc = 3)

  val () = copy(argv[1], argv[2])
}
