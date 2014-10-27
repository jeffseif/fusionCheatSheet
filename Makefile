.PHONY: all clean
CHEAT = cheat

all : $(CHEAT).pdf

$(CHEAT).pdf : $(CHEAT).tex
	pdflatex $^
	@rm -f $(JUNK)

%.pdf : %.tex %.bib
	pdflatex $*
	bibtex $*
	@pdflatex $*
	@bibtex $*
	@pdflatex $*
	@rm -f $(JUNK)

JUNK = \
       $(CHEAT).aux \
       $(CHEAT).bbl \
       $(CHEAT).blg \
       $(CHEAT).log \
       $(CHEAT).out

clean :
	@rm -f $(CHEAT).pdf
