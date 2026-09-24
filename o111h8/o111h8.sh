dree -L complete -l -n -g 991910 neidb
pickle 1 eco.nwk |
    grep -c 991910_
fintac -t 991910_ -u 562_ eco.nwk
pickle -t 5377 eco.nwk |
    land -r |
    plotTree
pickle 5379 eco.nwk |
    grep -v '^#' -c
pickle 5379 eco.nwk |
    grep -f - sero.txt
