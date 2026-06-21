for file in $(ls ncbi_*/*/*/*.fna); do
    acc=$(basename $file |
                sed -E 's/(G.._[^_]+)_.*/\1/')
    q="select taxid from genome where accession='$acc'"
    tax=$(sqlite3 neidb "$q")
    name="${tax}_${acc}"
    ln -s $(pwd)/$file all/$name
done
