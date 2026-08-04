sed -E 's/  +/\t/g' |
    sed 's/ /_/g' |
    awk '$3=="species"{print $1, $4}' |
    sort -k 1b,1
