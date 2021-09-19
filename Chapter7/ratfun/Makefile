ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

RATFUN_SRC := ratfun.sats ratfun.dats test_ratfun.dats
RATFUN_OBJ := ${RATFUN_SRC}
RATFUN_OBJ := ${patsubst %.sats, %_sats.o, ${RATFUN_OBJ}}
RATFUN_OBJ := ${patsubst %.dats, %_dats.o, ${RATFUN_OBJ}}

test_ratfun: ${RATFUN_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dats.o: %.dats
	acc pc -DATS_MEMALLOC_LIBC -c $< || touch $@

clean:
	rm -f *.o *_?ats.c test_ratfun
