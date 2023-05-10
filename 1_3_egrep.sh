#!bin/bash

file=$1
out1=$2
out2=$3

# Sprawdzenie czy podano odpowiednią liczbę argumentów
[ $# -ne 3 ] && exit 1

# sprawdzanie czy podano plik i czy mozna go odczytać
[ ! -f "$file" ] && exit 2
[ ! -r "$file" ] && exit 2

[ -e "$out1" ] && [ ! -f "$out1" ] && exit 2
[ -e "$out2" ] && [ ! -f "$out2" ] && exit 2

rm -f $out1
rm -f $out2

IFS=$'\n'
for L in $(cat $file); do
    IFS=$' \n\t'
    for E in $L; do
        D=$(echo -n "$E" | wc -c)

        #ver 1 (jeśli ciąg znaków który ma więcej niż 1 znak to usuwa pliki)
        if [ $D -ne 1 ]; then
          rm -f $out1
          rm -f $out2
          exit 1
        fi

        if echo $E | egrep "^[0-9]$" > /dev/null ; then
            echo -n $E >> $out1
        else 
            echo -n $E >> $out2
        fi
    done
    echo >> $out1
    echo >> $out2
done