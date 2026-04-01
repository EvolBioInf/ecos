date
# Get taxid
taxi O104 neidb  | head
# Get target accessions
neighbors -L complete -t 1038927 -l neidb |
    grep '^t' |
    awk '{print $2}' > tacc.txt
# Get accessions of E. coli
neighbors -L complete -t 562 -l neidb |
    grep '^t' |
    awk '{print $2}' > eco.txt
# Subtract targets from E. coli to find neighbors
cat tacc.txt eco.txt |
    sort |
    uniq -c |
    awk '$1==1{print $2}' > nacc.txt
# Get data
datasets download genome accession --exclude-atypical --inputfile tacc.txt --filename tdat.zip --dehydrated
datasets download genome accession --exclude-atypical --inputfile nacc.txt --filename ndat.zip --dehydrated
# Unzip
unzip -d tdat tdat.zip
unzip -d ndat ndat.zip
# Rehydrate
datasets rehydrate --directory tdat
datasets rehydrate --directory ndat
# Make directory for all sequences
mkdir all
# Link & rename targets
c=1
for a in tdat/*/*/*/*.fna; do
    ln -s $(pwd)/$a all/t$c
    c=$(($c+1))
done
# Link & rename neighbors
c=1
for a in ndat/*/*/*/*.fna; do
    ln -s $(pwd)/$a all/n$c
    c=$(($c+1))
done
date
# Calculate phylonium phylogeny
phylonium all/* |
    nj |
    midRoot |
    land > all.nwk
date
