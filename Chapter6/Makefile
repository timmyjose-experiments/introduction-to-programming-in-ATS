all: insertion_sort exceptions listprod braun misc counter arrays isort custom_print permord cmdline matrices basic_io echo copy copy_rs
ATSFLAGS = -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -latslib -O3

copy_rs: copy_rs.rs
	rustc -O -o $@ $<

copy: copy.dats
	acc pc ${ATSFLAGS} -o $@ $<

echo: echo.dats
	acc pc ${ATSFLAGS} -o $@ $<

basic_io: basic_io.dats
	acc pc ${ATSFLAGS} -o $@ $<

matrices: matrices.dats
	acc pc ${ATSFLAGS} -o $@ $<

cmdline: cmdline.dats
	acc pc ${ATSFLAGS} -o $@ $<

permord: permord.dats
	acc pc ${ATSFLAGS} -o $@ $<

custom_print: custom_print.dats
	acc pc ${ATSFLAGS} -o $@ $<

isort: isort.dats
	acc pc ${ATSFLAGS} -o $@ $<

arrays: arrays.dats
	acc pc ${ATSFLAGS} -o $@ $<

counter: counter.dats
	acc pc ${ATSFLAGS} -o $@ $<

misc: misc.dats
	acc pc ${ATSFLAGS} -o $@ $<

braun: braun.dats
	acc pc ${ATSFLAGS} -o $@ $<

listprod: listprod.dats
	acc pc ${ATSFLAGS} -o $@ $<

exceptions: exceptions.dats
	acc pc ${ATSFLAGS} -o $@ $<

insertion_sort: insertion_sort.dats
	acc pc ${ATSFLAGS} -o $@ $<

clean:
	rm -rf *_dats.c insertion_sort exceptions listprod braun misc counter arrays isort custom_print permord cmdline \
		matrices basic_io echo copy copy_rs