ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

CALC_SRC := calc.sats calc.dats
CALC_OBJ := ${CALC_SRC}
CALC_OBJ := ${patsubst %.sats, %_sats.o, ${CALC_OBJ}}
CALC_OBJ := ${patsubst %.dats, %_dats.o, ${CALC_OBJ}}

demo: client.o ${CALC_OBJ}
	gcc -shared ${CALC_OBJ} -o libcalc.dylib
	gcc ${CFLAGS} -o $@ client.o -L. -lcalc

%.o: %.c
	gcc -c $< || touch $@

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dats.o: %.dats
	acc pc -DATS_MEMALLOC_LIBC -c $< || touch $@

clean:
	rm -f *.o *_?ats.c demo libcalc.dylib