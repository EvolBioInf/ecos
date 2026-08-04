prog=survey
all: $(prog).sh driveDree.sh filter.sh

$(prog).sh: $(prog).org
	bash ../scripts/org2nw $(prog).org | notangle -R$(prog).sh > $(prog).sh
driveDree.sh: $(prog).org
	bash ../scripts/org2nw $(prog).org | notangle -RdriveDree.sh > driveDree.sh
filter.sh: $(prog).org
	bash ../scripts/org2nw $(prog).org | notangle -Rfilter.sh > filter.sh
test: clean $(prog).sh
	bash $(prog).sh
clean:
	rm -f neidb $(prog).sh driveDree.sh filter.sh *.txt *.dat *~
