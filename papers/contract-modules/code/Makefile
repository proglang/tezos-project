Z3= z3 -smt2

.PHONY: all　sat1 sat2

all: michelsym_printer.cmo

sat1:
	$(Z3) auction.smt

sat2:
	$(Z3) multi-auction.smt

michelsym.cmi michelsym.cmo: michelsym.ml
	ocamlc -c michelsym.ml

michelsym_printer.cmi michelsym_printer.cmo: michelsym_printer.ml michelsym.cmi
	ocamlc -c michelsym_printer.ml
