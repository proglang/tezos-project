OCAMLC=ocamlc
OCAMLYACC=menhir
OCAMLLEX=ocamllex
OCAMLCFLAGS=
all :
	$(OCAMLYACC) ParTest.mly
	$(OCAMLLEX) LexTest.mll
	$(OCAMLC) $(OCAMLCFLAGS) -o TestTest BNFC_Util.ml AbsTest.ml SkelTest.ml ShowTest.ml PrintTest.ml ParTest.mli ParTest.ml LexTest.ml TestTest.ml

clean :
	-rm -f *.cmi *.cmo *.o

distclean : clean
	-rm -f LexTest.* ParTest.* LayoutTest.* SkelTest.* PrintTest.* ShowTest.* TestTest.* AbsTest.* TestTest BNFC_Util.ml Makefile
