date = $(shell git log | grep -m 1 Date | sed -r 's/Date: +[A-Z][a-z]+ ([A-Z][a-z]+) ([0-9]+) [^ ]+ ([0-9]+) .+/\2_\1_\3/')
version = $(shell git describe)
docs = ~/WinHome/ownCloud/docs
nw = $(shell which noweb)
src = ../intro/ranksLabels.tex ../intro/taxa.tex intro.tex k12.tex markers.tex o111h8.tex o111h8.tex o145.tex ../o157h7/3119Labels.tex ../o157h7/3119.ps o157h7.tex o16h48.tex o25bh4.tex pilot.tex ../query/exLabels.tex query.tex
all: $(src) ecos.pdf
%.tex:	../*/%.org
	bash ../scripts/org2nw $< | noweave -n -x > $@
ecos.pdf: ecos.tex $(src) header.tex
	echo $(date) | tr '_' ' ' > date.txt
	echo $(version) | tr '-' ' ' | awk '{printf "%s", $$1; if ($$2) printf "-%s", $$2; printf "\n"}' > version.txt
	latex ecos
	bibtex ecos
	latex ecos
	latex ecos
	dvipdf -dALLOWPSTRANSPARENCY ecos
publish: $(docs)/ecos.pdf
$(docs)/ecos.pdf: ecos.pdf
	cp ecos.pdf $(docs)
clean:
	rm -f ecos.aux ecos.dvi ecos.log ecos.out ecos.pdf $(src)
