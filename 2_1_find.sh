#!/bin/bash

for dir in */; do
  if [[ -d "$dir" ]]; then
    files=$(find "$dir" -maxdepth 1 -type f -readable)
    if [[ -n "$files" ]]; then
      echo "$dir"
    fi
  fi
done
