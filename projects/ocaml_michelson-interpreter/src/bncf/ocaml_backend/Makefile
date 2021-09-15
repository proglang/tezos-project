OCAMLC=ocamlc
OCAMLYACC=menhir
OCAMLLEX=ocamllex
OCAMLCFLAGS=
all :
	$(OCAMLYACC) ParMichelson.mly
	$(OCAMLLEX) LexMichelson.mll
	$(OCAMLC) $(OCAMLCFLAGS) -o TestMichelson BNFC_Util.ml AbsMichelson.ml SkelMichelson.ml ShowMichelson.ml PrintMichelson.ml ParMichelson.mli ParMichelson.ml LexMichelson.ml TestMichelson.ml

clean :
	-rm -f *.cmi *.cmo *.o

distclean : clean
	-rm -f LexMichelson.* ParMichelson.* LayoutMichelson.* SkelMichelson.* PrintMichelson.* ShowMichelson.* TestMichelson.* AbsMichelson.* TestMichelson BNFC_Util.ml Makefile
