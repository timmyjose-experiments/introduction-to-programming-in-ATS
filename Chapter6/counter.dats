#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

typedef counter = '{
  get = () -<cloref1> int,
  inc = () -<cloref1> void,
  reset = () -<cloref1> void
}

fun newCounter
  (): counter = 
  let 
    val count = ref<int>(0)
  in
    '{
      get = lam () => !count,
      inc = lam () => !count := !count + 1,
      reset = lam () => !count := 0
      }
  end

implement main0 () = {
  val ctr1 = newCounter()
  val () = 
    let val '{ get = getfunc, inc = incfunc, reset = resetfunc } = ctr1 
    in
      (
        assertloc(getfunc() = 0);
        incfunc();
        incfunc();
        assertloc(getfunc() = 2);
        resetfunc();
        incfunc();
        assertloc(getfunc() = 1);
      )
    end
}
