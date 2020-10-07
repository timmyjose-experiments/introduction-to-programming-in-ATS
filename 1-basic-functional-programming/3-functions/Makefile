PATSCC := acc pc
PATSFLAGS := -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -O3 -cleanaft -flto -latslib -lgc -lm
RM := rm -f
ARTEFACTS := chapter recursion coin_change

.PHONY: all clean 

all: $(ARTEFACTS)

$(ARTEFACTS): %: %.dats
	$(PATSCC) $(PATSFLAGS) -o $@ $<

clean:
	$(RM) $(ARTEFACTS) ?_*dats.c	