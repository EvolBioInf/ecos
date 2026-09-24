dree -L complete -l -n -g 941322 neidb
pickle 1 eco.nwk |
    grep -c 941322_
fintac -t 941322_ -u 562_ eco.nwk
pickle 245 eco.nwk |
    grep -f - sero.txt |
    awk '{print $2}' |
    sort |
    uniq -c |
    sort -n -r
climt -d 1 245 eco.nwk
pickle 246 eco.nwk |
    grep -v '^#' -c
pickle 246 eco.nwk |
    grep -f - sero.txt |
    awk '{print $2}' |
    sort |
    uniq -c |
    sort -n -r
pickle 246 eco.nwk |
    grep 941322_ |
    grep -f - sero.txt
pickle -t 246 eco.nwk |
    mrca 941322_
pickle 273 eco.nwk |
    grep -v '^#' -c
pickle -t -c 273 eco.nwk |
    clusters -t |
    fintac -t 941322_ -u 562_
clusters -t eco.nwk |
    climt 532
pickle 519 eco.nwk |
    grep -f - sero.txt |
    awk '{print $2}' |
    sort |
    uniq -c |
    sort -n -r
pickle 519 eco.nwk |
    grep -f - mlst.txt |
    awk '{print $2}' |
    sort |
    uniq -c |
    sort -n -r
