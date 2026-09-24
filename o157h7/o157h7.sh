dree -L complete -l -n -g 83334 neidb
dree -L complete -l -n -g 83334 neidb |
    awk '!/^#/{printf "%s_\n", $1}' > o157h7.txt
wc -l o157h7.txt
pickle 1 eco.nwk |
    grep -f o157h7.txt > o157h7_2.txt
wc -l o157h7_2.txt
fintac -H neidb -t 83334_ -u 562_ eco.nwk
pickle -c 3131 eco.nwk |
    grep -f o157h7_2.txt |
    grep -f - sero.txt
mrca "^3131$|_003722195" eco.nwk
pickle -t 3119 eco.nwk |
    land -l |
    plotTree
pickle 3131 eco.nwk |
    grep -f o157h7_2.txt |
    grep -f - mlst.txt |
    awk '$2!="11"'
grep 003722195.1 mlst.txt
pickle -t 3130 eco.nwk |
    pickle -c 3131 |
    grep -f - sero.txt
pickle -t 3130 eco.nwk |
    pickle -c 3131 |
    grep -f - mlst.txt
pickle -t 3120 eco.nwk |
    pickle -c 3130 |
    grep -f - sero.txt
pickle -t 3120 eco.nwk |
    pickle -c 3130 |
    grep -f - mlst.txt
