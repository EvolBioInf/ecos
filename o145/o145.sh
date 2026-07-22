dree -L complete -l -n -g 1055538 neidb
pickle 1 eco2.nwk |
    egrep -c '(1055538_|1055544_)'
clusters -t eco2.nwk |
    fintac -H neidb -t 1055538_ -u 562_
clusters -t eco2.nwk |
    climt 3600
pickle 3587 eco2.nwk |
    egrep -c '(1055538_|1055544_)'
pickle 3587 eco2.nwk |
    grep -f - sero.txt |
    grep -c 'O145:-'
pickle 3587 eco2.nwk |
    grep -f - sero.txt |
    grep -v 'O145:-'
