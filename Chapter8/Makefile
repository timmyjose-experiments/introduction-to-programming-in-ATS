ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

all: fact misc includec extfcall

extfcall: extfcall.dats
	acc pc ${ATSFLAGS} -o $@ $<

includec: includec.dats
	acc pc ${ATSFLAGS} -o $@ $<

misc: misc.dats
	acc pc ${ATSFLAGS} -o $@ $<

FACT_SRC := fact2.c fact.dats
FACT_OBJ := ${FACT_SRC}
FACT_OBJ := ${patsubst %.dats, %_dats.o, ${FACT_OBJ}}
FACT_OBJ := ${patsubst %.c, %.o, ${FACT_OBJ}}

fact: ${FACT_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^ 

%.o: %.c
	gcc -c $< || touch $@

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dats.o: %.dats
	acc pc -DATS_MEMALLOC_LIBC -c $< || touch $@

clean:
	rm -f *.o *_?ats.c fact misc includec extfcall