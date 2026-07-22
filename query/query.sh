neighbors -t 562 -o -l -L complete neidb |
    tail -n +2 |
    awk '{print $2}' > eco.txt
wc -l eco.txt
datasets summary genome accession \
           --inputfile eco.txt \
           --as-json-lines > tmp.json
dataformat tsv genome \
             --inputfile eco.json \
             --fields 'acc*','*notes','*atypical*' |
    tail -n +2 |
    grep -v fail |
    grep -v true |
    grep -v missing |
    grep -v frameshifted |
    cut -f 1 > eco.txt
wc -l eco.txt
pickle 1 eco.nwk |
    grep -c -v '^#'
midRoot -p eco.nwk |
    head -n 1
climt 562_GCF_022654545.1 eco.nwk |
    head -n 2
climt 562_GCF_021307345.1 eco.nwk |
    head -n 2
pickle -t -c 562_GCF_021307345.1 eco.nwk |
    land > eco2.nwk
midRoot -p eco2.nwk |
    head -n 1
