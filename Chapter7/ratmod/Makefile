ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

RATMOD_SRC := ratmod.sats ratmod.dats test_ratmod.dats
RATMOD_OBJ := ${RATMOD_SRC}
RATMOD_OBJ := ${patsubst %.sats, %_sats.o, ${RATMOD_OBJ}}
RATMOD_OBJ := ${patsubst %.dats, %_dats.o, ${RATMOD_OBJ}}

test_ratmod: ${RATMOD_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dats.o: %.dats
	acc pc -c $< || touch $@

clean:
	rm -f *.o *_?ats.c test_ratmod
