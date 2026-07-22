pickle 5377 eco2.nwk |
    grep -v '^#' |
    sed 's/[^_]*_//' > acc.txt
datasets download genome accession \
           --inputfile acc.txt \
           --dehydrated \
           --exclude-atypical
unzip ncbi_dataset.zip
datasets rehydrate --directory .
mkdir all
bash rename.sh
mkdir targets
pickle -t 5377 eco2.nwk |
    pickle 5379 |
    grep -v '^#' |
    while read name; do
          ln -s $(pwd)/all/${name} targets/${name}.fasta
    done
mkdir neighbors
pickle -t 5377 eco2.nwk |
    pickle -c 5379 |
    grep -v '^#' |
    while read name; do
          ln -s $(pwd)/all/${name} neighbors/${name}.fasta
    done
makeFurDb -t targets -n neighbors -d markers.db
fur -d markers.db |
    cleanSeq > markers.fasta
cres markers.fasta
fa2prim markers.fasta |
    primer3_core > markers.prim
prim2tab markers.prim |
    sort -n |
    head
rm -r all acc.txt md5sum.txt ncbi_dataset \
   ncbi_dataset.zip markers.db markers.prim \
   neighbors README.md targets
