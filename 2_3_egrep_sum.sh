#!bin/bash

file=$1

digits=0
letters=0
sum=0

# Sprawdzenie czy podano odpowiednią liczbę argumentów
[ $# -ne 1 ] && exit 1

# sprawdzanie czy podano plik
[ ! -f "$file" ] && exit 2


digits=$(grep -oE "[0-9]+" "$file" | wc -l)
letters=$(grep -oE "[[:alpha:]]" "$file" | wc -l) # znaki

for n in $(grep -oE "[0-9]+" $file); do
    sum=$((sum + $n))
done

echo "Plik $file zawiera $digits cyfr oraz $letters liter."
echo "Suma wszystkich liczb wynosi $sum."
