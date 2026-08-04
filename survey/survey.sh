q="select count(*)"
q="$q from taxon"
sqlite3 neidb "$q"
q="select count(*)"
q="$q from taxon"
q="$q where rank like 'species'"
sqlite3 neidb "$q"
taxi -e root neidb
dree -R -m 0 -l 1 neidb
dree -L complete -R -m 0 -l 1 neidb
taxi -e "bacteria" neidb
dree -R -m 0 -l 2 neidb
dree -L complete -R -m 0 -l 2 neidb
bash driveDree.sh
join recAny.txt recComp.txt |
    join - rawAny.txt |
    join - rawComp.txt > recRaw.txt
wc -l recRaw.txt
awk '$2>0' recRaw.txt |
    wc -l
awk '$3>0' recRaw.txt |
    wc -l
awk '$2>0' recRaw.txt |
    awk '{c[$2]++}END{for(a in c)print a, c[a]}' |
    sort -n > gcAny.dat
head -n 1 gcAny.dat
awk '$3>0' recRaw.txt |
    awk '{c[$3]++}END{for(a in c)print a, c[a]}' |
    sort -n > gcComp.dat
head -n 1 gcComp.dat
tail -n 1 gcAny.dat
awk '$2==618721' recRaw.txt
taxi -t 28901 neidb
tail -n 1 gcComp.dat
awk '$3==7884' recRaw.txt
awk '$2>1' recRaw.txt |
    wc -l
awk '$2>$4' recRaw.txt |
    wc -l
awk '$2>$4{s+=$2}END{print s}' recRaw.txt
awk '$3>$5' recRaw.txt |
    wc -l
awk '$3>$5{s+=$3}END{print s}' recRaw.txt
