ATSFLAGS := -DGNU_SOURCE -DATS_ME_MALLOC -cleanaft -flto -O3 -latslib

all: fact basic_interop misc include_c calc single_calc

single_calc: single_calc.dats
	acc pc ${ATSFLAGS} -o $@ $^

CALC_SRC := calc.sats calc.dats
CALC_OBJ := ${CALC_SRC}
CALC_OBJ := ${patsubst %.sats, %_sats.o, ${CALC_OBJ}}
CALC_OBJ := ${patsubst %.dats, %_dats.o, ${CALC_OBJ}}

calc: ${CALC_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

%_sats.o: %.sats
	acc pc -c $<  || touch $@

%_dats.o: %.dats
	acc pc -c $< || touch $@

include_c: include_c.dats
	acc pc ${ATSFLAGS} -o $@ $< 

misc: misc.dats
	acc pc ${ATSFLAGS} -o $@ $<

basic_interop: basic_interop.dats basic_interop.c
	acc pc ${ATSFLAGS} -o $@ $^ 

fact: fact.dats fact2.c
	acc pc ${ATSFLAGS} -o $@ $^

clean:
	rm -f *.o *_?ats.c fact basic_interop misc include_c calc single_calc