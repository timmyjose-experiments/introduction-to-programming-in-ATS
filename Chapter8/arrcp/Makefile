ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

array_copy_from_list: array_copy_from_list.dats
	acc pc ${ATSFLAGS} -o $@ $<

clean:
	rm -f *.o *_?ats.c array_copy_from_list