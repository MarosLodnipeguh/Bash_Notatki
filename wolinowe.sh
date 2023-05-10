#!bin/bash

file=$1

# Sprawdzenie czy podano odpowiednią liczbę argumentów
[ "$#" -ne 2 ] && exit 1

if [ ! -e "$file" ]; then
    echo "Podany plik nie istnieje"
    exit 2
fi

# sprawdzanie czy podano plik i czy mozna go odczytać i zapisać
[ ! -f "$file" ] && [ ! -r "$file" ] && [ ! -w "$file" ] && exit 3



# [ -e temp.txt ] && rm temp.txt
touch temp.txt

for L in $(cat "$file") ; do
    echo -n "$2$L" >> temp.txt
    echo $2 | rev >> temp.txt
done

cp temp.txt "$file"
rm temp.txt

exit 0
