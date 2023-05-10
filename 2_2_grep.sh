#!bin/bash

for file in $@ ; do
    if [ -f $file ] ; then
        count=$(grep -o -w ' CPU ' $file | wc -l)
        if (( $count >= 2 )) ; then
            echo $file
        fi
    fi
done