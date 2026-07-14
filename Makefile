all: data tutorial
data:
	curl https://owncloud.gwdg.de/index.php/s/psbRSGTwx69H4tE/download -o data_ecos.tbz
	tar -xvjf data_ecos.tbz
	make -C data
	rm data_ecos.tbz
tutorial: data data/eco.json data/eco.nwk data/neidb data/sero.txt intro/intro.sh markers/markers.sh pilot/pilot.sh query/query.sh scripts/rename.sh
	test -d tutorial || mkdir tutorial
	cp intro/intro.sh tutorial/
	cp pilot/pilot.sh tutorial/
	cp query/query.sh tutorial/
	cp markers/markers.sh tutorial/
	cp scripts/rename.sh tutorial/
	ln -s $$(pwd)/data/neidb tutorial/
	ln -s $$(pwd)/data/eco.* tutorial/
	ln -s $$(pwd)/data/sero.txt tutorial/
pilot/pilot.sh:
	make -C pilot
query/query.sh:
	make -C query
markers/markers.sh:
	make -C markers
intro/intro.sh:
	make -C intro
scripts/rename.sh:
	test -d free || git clone https://github.com/evolbioinf/free
	cp free/aux/rename.sh scripts/
data/eco.*: data
data/sero.txt: data
setup:
	bash scripts/setup.sh
clean:
	make clean -C data
	make clean -C intro
	make clean -C markers
	make clean -C pilot
	make clean -C query
