ATSFLAGS = -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -latslib -O3 -flto

all: same_file sep_files test_acker test_acker2 test_acker3 misc listeq print_person macros

macros: macros.dats
	acc pc ${ATSFLAGS} -o $@ $<

print_person: print_person.dats
	acc pc ${ATSFLAGS} -o $@ $<

listeq: listeq.dats
	acc pc ${ATSFLAGS} -o $@ $<

misc: misc.dats
	acc pc ${ATSFLAGS} -o $@ $<

ACKER_SRC=acker.dats test_acker.dats
ACKER_OBJ := ${ACKER_SRC}
ACKER_OBJ := ${patsubst %.dats, %_dats.o, ${ACKER_OBJ}}

test_acker: ${ACKER_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^ || touch $@

ACKER2_SRC=acker2.dats test_acker2.dats
ACKER2_OBJ := ${ACKER2_SRC}
ACKER2_OBJ := ${patsubst %.dats, %_dats.o, ${ACKER2_OBJ}}

test_acker2: ${ACKER2_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^ || touch $@

ACKER3_SRC=acker3.dats test_acker3.dats
ACKER3_OBJ := ${ACKER3_SRC}
ACKER3_OBJ := ${patsubst %.dats, %_dats.o, ${ACKER3_OBJ}}

test_acker3: ${ACKER3_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^ || touch $@

sep_files: sep_files.dats
	acc pc ${ATSFLAGS} -o $@ $<

same_file: same_file.dats
	acc pc ${ATSFLAGS} -o $@ $<

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dats.o: %.dats
	acc pc -c $< || touch $@

clean:
	rm -f *.o *_?ats.c same_file sep_files test_acker test_acker2 test_acker3 misc listeq print_person macros