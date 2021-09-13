all: lists misc plist listfuns datatypes parametric_polymorphism mergesort
ATSFLAGS = -DATS_MEMALLOC_LIBC	

mergesort: mergesort.dats
	acc pc ${ATSFLAGS} -o $@ $<

parametric_polymorphism: parametric_polymorphism.dats
	acc pc ${ATSFLAGS} -o $@ $<

datatypes: datatypes.dats
	acc pc ${ATSFLAGS} -o $@ $<

listfuns: listfuns.dats
	acc pc ${ATSFLAGS} -o $@ $<

plist: plist.dats
	acc pc ${ATSFLAGS} -o $@ $<

misc: misc.dats
	acc pc ${ATSFLAGS} -o $@ $<

lists: lists.dats
	acc pc ${ATSFLAGS} -o $@ $<

clean:
	rm -f *_?dats.c lists misc plist listfuns datatypes parametric_polymorphism mergesort