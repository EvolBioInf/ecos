dree -L complete -l -n -g 991910 neidb
pickle 1 eco2.nwk |
    grep -c 991910_
fintac -t 991910_ -u 562_ eco2.nwk
pickle -t 5377 eco2.nwk |
    land -r |
    plotTree
pickle 5379 eco2.nwk |
    grep -v '^#' -c
pickle 5379 eco2.nwk |
    grep -f - sero.txt
