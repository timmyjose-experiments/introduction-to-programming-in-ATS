all: insertion_sort exceptions listprod braun misc counter arrays isort custom_print permord cmdline matrices
ATSFLAGS = -DGNU_SOURCE -DATS_MEMALLOC_LIBC -D_ATS_GCATS

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
		matrices