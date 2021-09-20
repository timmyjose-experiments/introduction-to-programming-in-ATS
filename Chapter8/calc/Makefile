ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

CALC_SRC := calc.sats test_calc.dats
CALC_OBJ := ${CALC_SRC}
CALC_OBJ := ${patsubst %.sats, %_sats.o, ${CALC_OBJ}}
CALC_OBJ := ${patsubst %.dats, %_dats.o, ${CALC_OBJ}}

test_calc: ${CALC_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dats.o: %.dats
	acc pc -c $< || touch $@

clean:
	rm -f *.o *_ats.c test_calc

