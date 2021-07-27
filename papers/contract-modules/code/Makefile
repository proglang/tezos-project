.PHONY: all　sat

all: michelsym_printer.cmo

sat:
	z3 -smt2 auction.smt

michelsym.cmi michelsym.cmo: michelsym.ml
	ocamlc -c michelsym.ml

michelsym_printer.cmi michelsym_printer.cmo: michelsym_printer.ml michelsym.cmi
	ocamlc -c michelsym_printer.ml
