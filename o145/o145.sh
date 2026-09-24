dree -L complete -l -n -g 1055538 neidb
pickle 1 eco.nwk |
    egrep -c '(1055538_|1055544_)'
clusters -t eco.nwk |
    fintac -H neidb -t 1055538_ -u 562_
clusters -t eco.nwk |
    climt 3600
pickle 3587 eco.nwk |
    egrep -c '(1055538_|1055544_)'
pickle 3587 eco.nwk |
    grep -f - sero.txt |
    grep -c 'O145:-'
pickle 3587 eco.nwk |
    grep -f - sero.txt |
    grep -v 'O145:-'
