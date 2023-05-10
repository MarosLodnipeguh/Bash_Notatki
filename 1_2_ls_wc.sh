#!bin/bash

echo "Podaj nazwę pliku:"
read -r filename

for arg in *; do
  if [[ -d $arg ]]; then # sprawdzanie czy arg jest folderem
    count=$(ls -A $arg | wc -l)

    if (( $count <= 11 )); then
      echo $arg $count >> $filename
    fi
  fi
done