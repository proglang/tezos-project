.PHONY: all　sat

all: michelsym.cmo

sat:
	z3 -smt2 auction.smt

michelsym.cmi michelsym.cmo: michelsym.ml
	ocamlc -c michelsym.ml
