#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "calculator.sats"

implement add(x, y) = x + y

implement sub(x, y) = x - y

implement mul(x, y) = x * y

implement div(x, y) = if y = 0 then 0 else x / y
