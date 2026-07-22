taxi O111:H8 neidb
neighbors -l -L complete -t 991910 neidb |
    head -n 30
neighbors -l -L complete -t 991910 neidb |
    grep -c '^t'
neighbors -l -L complete -t 991910 neidb |
    grep -c '^n'
neighbors -l -L complete -t 562 -o neidb |
    grep -c '^t'
neighbors -l -L complete -t 991910 neidb |
    grep '^[tn]' |
    awk '{print $2}' |
    head -n 50 > acc.txt
datasets download genome accession \
           --inputfile acc.txt \
           --dehydrated \
           --exclude-atypical
unzip ncbi_dataset.zip
datasets rehydrate --directory .
mkdir all
bash rename.sh
ls all | head
phylonium all/* |
    nj |
    midRoot > all.nwk
plotTree all.nwk
land all.nwk > t
mv t all.nwk
fintac -t 991910 all.nwk
pickle 29 all.nwk |
    grep -c 991910
mkdir targets
pickle 29 all.nwk |
    grep -v '^#' |
    while read name; do
          ln -s $(pwd)/all/${name} targets/${name}.fasta
    done
mkdir neighbors
pickle -c 29 all.nwk |
    grep -v '^#' |
    while read name; do
          ln -s $(pwd)/all/${name} neighbors/${name}.fasta
    done
makeFurDb -t targets -n neighbors -d pilot.db
fur -d pilot.db |
    cleanSeq > pilot.fasta
cres pilot.fasta
fa2prim pilot.fasta |
    primer3_core |
    prim2tab |
    tail -n +2 |
    sort -n |
    head
rm -r acc.txt all all.nwk md5sum.txt \
   ncbi_dataset ncbi_dataset.zip neighbors \
   pilot.db README.md targets
