ATSFLAGS = -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

INTSET_SRC := intset.sats intset.dats test_intset.dats
INTSET_OBJ := ${INTSET_SRC}
INTSET_OBJ := ${patsubst %.sats, %_sats.o, ${INTSET_OBJ}}
INTSET_OBJ := ${patsubst %.dats, %_dats.o, ${INTSET_OBJ}}

test_intset: ${INTSET_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^ || touch $@

%_sats.o: %.sats
	acc pc -DATS_MEMALLOC_LIBC -c $< || touch $@

%_dats.o: %.dats
	acc pc -DATS_MEMALLOC_LIBC -c $< || touch $@

clean:
	rm -rf *.o *_?ats.c  test_intset