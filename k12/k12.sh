dree -L complete -l -n -g 83333 neidb
dree -L complete -l -n -g 83333 neidb |
    awk '!/^#/{printf "%s_\n", $1}' > k12.txt
wc -l k12.txt
pickle 1 eco2.nwk |
    grep -f k12.txt -c
fintac -H neidb -t 83333_ -u 562_ eco2.nwk
pickle 7112 eco2.nwk |
    grep -f - sero.txt |
    grep -v O16:H48
clusters -t eco2.nwk |
    climt 7112
pickle 7011 eco2.nwk |
    grep -f - sero.txt |
    grep -v O16:H48
pickle 7011 eco2.nwk |
    grep -v '^#' -c
pickle -t 7011 eco2.nwk |
    land -r -l |
    plotTree
pickle -t 7011 eco2.nwk |
    clusters -b 7011 |
    grep -v '^#' |
    sort -k 3 -g -r |
    head
pickle -t 7276 eco2.nwk |
    land -r |
    plotTree
pickle 7276 eco2.nwk
