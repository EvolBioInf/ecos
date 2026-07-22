dree -L complete -l -n -g 941322 neidb
pickle 1 eco2.nwk |
    grep -c 941322_
fintac -t 941322_ -u 562_ eco2.nwk
pickle 245 eco2.nwk |
    grep -f - sero.txt |
    awk '{print $2}' |
    sort |
    uniq -c |
    sort -n -r
climt -d 1 245 eco2.nwk
pickle 246 eco2.nwk |
    grep -v '^#' -c
pickle 246 eco2.nwk |
    grep -f - sero.txt |
    awk '{print $2}' |
    sort |
    uniq -c |
    sort -n -r
pickle 246 eco2.nwk |
    grep 941322_ |
    grep -f - sero.txt
pickle -t 246 eco2.nwk |
    mrca 941322_
pickle 273 eco2.nwk |
    grep -v '^#' -c
pickle -t -c 273 eco2.nwk |
    clusters -t |
    fintac -t 941322_ -u 562_
clusters -t eco2.nwk |
    climt 532
pickle 519 eco2.nwk |
    grep -f - sero.txt |
    awk '{print $2}' |
    sort |
    uniq -c |
    sort -n -r
pickle 519 eco2.nwk |
    grep -f - mlst.txt |
    awk '{print $2}' |
    sort |
    uniq -c |
    sort -n -r
