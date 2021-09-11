all: functions recursion coin_change factorial tail_rec nqueens mut_rec closures hof bsearch hof_fun currying
ATSFLAGS = -DATS_MEMALLOC_LIBC

currying: currying.dats
	acc pc ${ATSFLAGS} -o $@ $<

hof_fun: hof_fun.dats
	acc pc ${ATSFLAGS} -o $@ $<

bsearch: bsearch.dats
	acc pc ${ATSFLAGS} -o $@ $<

hof: hof.dats
	acc pc ${ATSFLAGS} -o $@ $<

closures: closures.dats
	acc pc ${ATSFLAGS} -o $@ $<

mut_rec: mut_rec.dats
	acc pc ${ATSFLAGS} -o $@ $<

nqueens: nqueens.dats
	acc pc ${ATSFLAGS} -o $@ $<

tail_rec: tail_rec.dats
	acc pc ${ATSFLAGS} -o $@ $<

factorial: factorial.dats
	acc pc ${ATSFLAGS} -o $@ $<

functions:  functions.dats
	acc pc ${ATSFLAGS} -o $@ $<

recursion: recursion.dats
	acc pc ${ATSFLAGS} -o $@ $<

coin_change: coin_change.dats
	acc pc ${ATSFLAGS} -o $@ $<

clean:
	rm -rf *dats.c functions recursion coin_change factorial tail_rec nqueens mut_rec closures hof bsearch hof_fun currying
