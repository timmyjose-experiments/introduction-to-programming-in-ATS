ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

RATFUN_SRC := ratmod.sats ratmod.dats test_ratmod.dats
RATFUN_OBJ := ${RATFUN_SRC}
RATFUN_OBJ := ${patsubst %.sats, %_sats.o, ${RATFUN_OBJ}}
RATFUN_OBJ := ${patsubst %.dats, %_dats.o, ${RATFUN_OBJ}}

test_ratmod: ${RATFUN_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^ || touch $@

%_sats.o: %.sats
	acc pc -c $< || touch %@

%_dats.o: %.dats
	acc pc -c $< || touch $@

clean:
	rm -f *.o *_?ats.c test_ratmod