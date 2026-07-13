all: intro.sh

intro.sh: intro.org
	bash ../scripts/org2nw intro.org | notangle -Rintro.sh > intro.sh
test: clean intro.sh
	bash intro.sh
clean:
	rm -rf *~ intro.sh
