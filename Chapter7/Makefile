ATSFLAGS := -DGNU_SOURCE -DATS_MEMALLOC_LIBC -cleanaft -flto -O3 -latslib

all: fact swap test_acker test_acker1 test_acker2 gen_tmplt_impl spec_tmplt_impl test_intset gcd

GCD_SRC := gcd.dats
GCD_OBJ := ${GCD_SRC}
GCD_OBJ := ${patsubst %.dats, %_dats.o, ${GCD_OBJ}}

gcd: ${GCD_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^ 

INTSET_SRC := intset.sats intset.dats test_intset.dats
INTSET_OBJ := ${INTSET_SRC}
INTSET_OBJ := ${patsubst %.sats, %_sats.o, ${INTSET_OBJ}}
INTSET_OBJ := ${patsubst %.dats, %_dats.o, ${INTSET_OBJ}}

test_intset: ${INTSET_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

SPEC_TMPLT_IMPL_SRC := spec_tmplt_impl.dats
SPEC_TMPLT_IMPL_OBJ := ${SPEC_TMPLT_IMPL_SRC}
SPEC_TMPLT_IMPL_OBJ := ${patsubst %.dats, %_dats.o, ${SPEC_TMPLT_IMPL_OBJ}}

spec_tmplt_impl: ${SPEC_TMPLT_IMPL_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

GEN_TMPLT_IMPL_SRC := gen_tmplt_impl.dats
GEN_TMPLT_IMPL_OBJ := ${GEN_TMPLT_IMPL_SRC}
GEN_TMPLT_IMPL_OBJ := ${patsubst %.dats, %_dats.o, ${GEN_TMPLT_IMPL_OBJ}}

gen_tmplt_impl: ${GEN_TMPLT_IMPL_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

ACKER2_SRC := acker2.dats test_acker2.dats
ACKER2_OBJ := ${ACKER2_SRC}
ACKER2_OBJ := ${patsubst %.dats, %_dats.o, ${ACKER2_OBJ}}

test_acker2: ${ACKER2_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

ACKER1_SRC := acker1.sats acker1.dats test_acker1.dats
ACKER1_OBJ := ${ACKER1_SRC}
ACKER1_OBJ := ${patsubst %.sats, %_sats.o, ${ACKER1_OBJ}}
ACKER1_OBJ := ${patsubst %.dats, %_dats.o, ${ACKER1_OBJ}}

test_acker1: ${ACKER1_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

ACKER_SRC := acker.sats acker.dats test_acker.dats
ACKER_OBJ := ${ACKER_SRC}
ACKER_OBJ := ${patsubst %.sats, %_sats.o, ${ACKER_OBJ}}
ACKER_OBJ := ${patsubst %.dats, %_dats.o, ${ACKER_OBJ}}

test_acker: ${ACKER_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

SWAP_SRC := swap.dats
SWAP_OBJ := ${SWAP_SRC}
SWAP_OBJ := ${patsubst %.dats, %_dats.o, ${SWAP_OBJ}}

swap: ${SWAP_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

FACT_SRC := fact.dats
FACT_OBJ := ${FACT_SRC}
FACT_OBJ := ${patsubst %.dats, %_dats.o, ${FACT_OBJ}}

fact: ${FACT_OBJ}
	acc pc ${ATSFLAGS} -o $@ $^

%_sats.o: %.sats
	acc pc -c $< || touch $@

%_dats.o: %.dats
	acc pc -DATS_MEMALLOC_LIBC -c $< || touch $@

clean:
	rm -f *.o *_?ats.c fact swap test_acker test_acker1 test_acker2 gen_tmplt_impl spec_tmplt_impl test_intset gcd