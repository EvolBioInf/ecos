neighbors -t 562 -o -l -L complete neidb |
    tail -n +2 |
    awk '{print $2}' > eco.txt
wc -l eco.txt
datasets summary genome accession \
           --inputfile eco.txt \
           --as-json-lines > tmp.json
fields="'acc*','*notes','*atypical*','ani-check*'"
dataformat tsv genome \
             --inputfile eco.json \
             --fields $fields |
    tail -n +2 |
    grep -v fail |
    grep -v true |
    grep -v missing |
    grep -v frameshifted |
    grep -v Failed |
    cut -f 1 > eco.txt
wc -l eco.txt
while read acc; do
    q="select taxid"
    q="$q from genome"
    q="$q where accession = '$acc'"
    taxid=$(sqlite3 neidb "$q")
    echo $taxid
done < eco.txt |
    awk '$1!="562"' > taxids.txt
sort taxids.txt |
    uniq -c |
    sort -n -r |
    awk '$1>=10{printf("%s\t%s\n", $2, $1)}' |
    cat -n
while read taxid; do
    ants $taxid neidb |
        awk 'open{print $2}$2==562{open=1}'
done < taxids.txt > taxids2.txt
sort taxids2.txt |
    uniq -c |
    sort -n -r |
    awk '$1>=10{printf("%s\t%s\n", $2, $1)}' |
    cat -n
sort taxids2.txt |
    uniq -c |
    sort -n -r |
    awk '$1>=10{printf("%s\t%s\n", $2, $1)}' |
    cat -n > focalTaxa.txt
while read n taxid count; do
    ants $taxid neidb |
        awk 'open{print $2}$2==562{open=1}'
done < focalTaxa.txt |
    sort |
    uniq -c |
    sort -n -r
dree -g 83333 neidb |
    xdot -
grep -v 511145 focalTaxa.txt |
    while read n taxid ng; do
        printf "%s\t%s\t" $taxid $ng
        taxi -t $taxid neidb |
            tail -n +2 |
            awk '{for(i=3;i<=NF;i++)printf(" %s", $i)}'
        echo ""
    done |
    cat -n
pickle 1 eco.nwk |
    grep -c -v '^#'
midRoot -p eco2.nwk |
    head -n 1
