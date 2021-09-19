#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "ratmod.sats"
dynload "ratmod.dats"

implement main0 () = {
  val r_1_2 = rat_make_int_int(2, 4)
  val () = fprintln!(stdout_ref, "r_1_2: ", r_1_2)

  val r_2_3 = rat_make_int_int(12, 18)
  val () = fprintln!(stdout_ref, "r_2_3: ", r_2_3)

  val r_7_6 = ratadd(r_1_2, r_2_3)
  val () = fprintln!(stdout_ref, "r_7_6: ", r_7_6)

  val r_minus1_6 = ratsub(r_1_2, r_2_3)
  val () = fprintln!(stdout_ref, "r_minus1_6: ", r_minus1_6);

  val r_1_3 = ratmul(r_1_2, r_2_3)
  val () = fprintln!(stdout_ref, "r_1_3: ", r_1_3)

  val r_3_4 = ratdiv(r_1_2, r_2_3)
  val () = fprintln!(stdout_ref, "r_3_4: ", r_3_4)
}
