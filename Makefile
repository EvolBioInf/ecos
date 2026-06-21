all: data tutorial
data:
	curl https://owncloud.gwdg.de/index.php/s/UWYXjJL8ScRx4V1/download -o data_o111h8.tbz
	tar -xvjf data_o111h8.tbz
	make -C data
	rm data_o111h8.tbz
tutorial: data pilot/pilot.sh query/query.sh markers/markers.sh scripts/rename.sh data/neidb data/eco.nwk data/eco.json data/sero.txt
	test -d tutorial || mkdir tutorial
	cp pilot/pilot.sh tutorial/
	cp query/query.sh tutorial/
	cp markers/markers.sh tutorial
	cp scripts/rename.sh tutorial
	ln -s $$(pwd)/data/neidb tutorial
	ln -s $$(pwd)/data/eco.* tutorial
	ln -s $$(pwd)/data/sero.txt tutorial
pilot/pilot.sh:
	make -C pilot
query/query.sh:
	make -C query
markers/markers.sh:
	make -C markers
scripts/rename.sh:
	test -d free || git clone https://github.com/evolbioinf/free
	cp free/aux/rename.sh scripts/
data/eco.*: data
data/sero.txt: data
setup:
	bash scripts/setup.sh
clean:
	make clean -C data
	make clean -C pilot
	make clean -C query
	make clean -C markers
