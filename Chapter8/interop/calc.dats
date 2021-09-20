#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define ATS_DYNLOADFLAG 0

staload "calc.sats"

implement add(m, n) = m + n
implement subtract(m, n) = m - n
implement multiply(m, n) = m * n
implement divide(m, n) = m / n
