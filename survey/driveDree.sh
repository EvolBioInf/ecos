dree -R -l 2 neidb |
    bash filter.sh > recAny.txt &
dree -R -L complete -l 2 neidb |
    bash filter.sh > recComp.txt &
dree -l 2 neidb |
    bash filter.sh > rawAny.txt &
dree -L complete -l 2 neidb |
    bash filter.sh > rawComp.txt &
wait
