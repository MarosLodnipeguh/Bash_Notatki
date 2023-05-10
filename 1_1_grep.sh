#!/bin/bash

# nazwy plików z bieżącego katalogu, nie zawierają na początku /main/

for file in *; do
  if [[ -f "$file" ]]; then
    if ! grep -q '^/\*main\*/' "$file"; then
      echo "$file"
    fi
  fi
done