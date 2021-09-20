ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

SCOMP_SRC := scomp.c scomp.sats scomp.dats test_scomp.dats
SCOMP_OBJ := ${SCOMP_SRC}
SCOMP_OBJ := ${patsubst %.c, %.o, ${SCOMP_OBJ}}
SCOMP_OBJ := ${patsubst %.sats, %_sats.o, ${SCOMP_OBJ}}
SCOMP_OBJ := ${patsubst %.dats, %_dats.o, ${SCOMP_OBJ}}

test_scomp: ${SCOMP_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^ 

%.o: %.c
	gcc -c $< || touch $@

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dats.o: %.dats
	acc pc -DATS_MEMALLOC_LIBC -c $< || touch $@

clean:
	rm -f *.o *_?ats.c test_scomp