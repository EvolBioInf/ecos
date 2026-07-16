prog=o157h7
all: $(prog).sh

$(prog).sh: $(prog).org
	bash ../scripts/org2nw $(prog).org | notangle -R$(prog).sh > $(prog).sh
test: clean $(prog).sh
	bash $(prog).sh
clean:
	rm -f neidb $(prog).sh
