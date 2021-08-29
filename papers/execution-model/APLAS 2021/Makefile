FILES=  bio.bib llncs.cls macros.tex paper.bbl paper.tex splncs04.bst
FILES_FOR_ARXIV= appendix.tex $(FILES)

GOALS= final.zip final_arxiv.zip final.pdf

.PHONY: all clean

all: $(GOALS)

clean:
	$(RM) -f $(GOALS)

final.zip: $(FILES)
	zip final $(FILES)

final_arxiv.zip: $(FILES_FOR_ARXIV)
	zip $@ $(FILES_FOR_ARXIV)

final.pdf: $(FILES)
	sed -e '/include/d' paper.tex > final.tex
	pdflatex final
	bibtex final
	pdflatex final
	pdflatex final

