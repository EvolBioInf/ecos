for file in $(ls ncbi_*/*/*/*.fna); do
    acc=$(basename $file |
                sed -E 's/(G.._[^_]+)_.*/\1/')
    tax=$(grep "$acc" accTax.txt | awk '{print $2}')
    name="${tax}_${acc}"
    ln -s $(pwd)/$file all/$name
done
