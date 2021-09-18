ATSFLAGS = -DGNU_SOURCE -DATS_MEMALLOC -cleanaft -latslib -O3 -flto

CALCULATOR_SRC := calculator.dats calculator_client.dats
CALCULATOR_OBJ := ${CALCULATOR_SRC}
CALCULATOR_OBJ := ${patsubst %.dats, %_dats.o, ${CALCULATOR_OBJ}}

calculator_client: ${CALCULATOR_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^ || touch $@

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dats.o: %.dats
	acc pc -c $< || touch $@

clean:
	rm -f *.o *_?ats.c calculator_client
