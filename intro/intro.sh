taxi -e "Escherichia coli" neidb
ranks -L complete 562 neidb |
    dot -T svg |
    imv-x11 -
dree -n -R -L complete -l 562 neidb |
    tail -n +2 |
    sed 's/o /o_/' |
    sort -k 4 -n -r |
    awk '$4>=10'
