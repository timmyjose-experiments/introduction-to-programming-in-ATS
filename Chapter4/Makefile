all: basic rec_types bstree ifcase expr
ATSFLAGS = -DATS_MEMALLOC_LIBC

expr: expr.dats
	acc pc ${ATSFLAGS} -o $@ $<

ifcase: ifcase.dats
	acc pc ${ATSFLAGS} -o $@ $<

bstree: bstree.dats
	acc pc ${ATSFLAGS} -o $@ $<

rec_types: rec_types.dats
	acc pc ${ATSFLAGS} -o $@ $<

basic: basic.dats
	acc pc ${ATSFLAGS} -o $@ $<

clean:
	rm -rf *_?dats.c basic rec_types bstree ifcase expr