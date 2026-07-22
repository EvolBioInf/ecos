all: data tutorial
data:
	curl https://owncloud.gwdg.de/index.php/s/psbRSGTwx69H4tE/download -o data_ecos.tbz
	tar -xvjf data_ecos.tbz
	make -C data
	rm data_ecos.tbz
tutorial: data data/eco.json data/eco.nwk data/mlst.txt data/neidb data/sero.txt intro/intro.sh markers/markers.sh pilot/pilot.sh query/query.sh scripts/rename.sh scripts/testTut.sh o157h7/o157h7.sh k12/k12.sh o111h8/o111h8.sh o25bh4/o25bh4.sh o16h48/o16h48.sh o145/o145.sh
	test -d tutorial || mkdir tutorial
	cp intro/intro.sh pilot/pilot.sh query/query.sh markers/markers.sh tutorial/
	cp o157h7/o157h7.sh k12/k12.sh o111h8/o111h8.sh o25bh4/o25bh4.sh o16h48/o16h48.sh o145/o145.sh tutorial/
	cp scripts/rename.sh scripts/testTut.sh tutorial/
	ln -s $$(pwd)/data/neidb tutorial/
	ln -s $$(pwd)/data/eco.* tutorial/
	ln -s $$(pwd)/data/mlst.txt tutorial/
	ln -s $$(pwd)/data/sero.txt tutorial/
pilot/pilot.sh:
	make -C pilot
query/query.sh:
	make -C query
markers/markers.sh:
	make -C markers
intro/intro.sh:
	make -C intro
o157h7/o157h7.sh:
	make -C o157h7
k12/k12.sh:
	make -C k12
o111h8/o111h8.sh:
	make -C o111h8
o25bh4/o25bh4.sh:
	make -C o25bh4
o16h48/o16h48.sh:
	make -C o16h48
o145/o145.sh:
	make -C o145
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
