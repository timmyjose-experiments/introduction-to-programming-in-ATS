ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

all: fact misc includec extfcall strcmp array_copy_from_list ats_types_in_c static_alloc_list

static_alloc_list: static_alloc_list.dats
	acc pc ${ATSFLAGS} -o $@ $<

ats_types_in_c: ats_types_in_c.dats
	acc pc ${ATSFLAGS} -o $@ $<

array_copy_from_list: array_copy_from_list.dats
	acc pc ${ATSFLAGS} -o $@ $<

strcmp: strcmp.dats
	acc pc ${ATSFLAGS} -o $@ $<

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
	rm -f *.o *_?ats.c fact misc includec extfcall strcmp array_copy_from_list ats_types_in_c static_alloc_list