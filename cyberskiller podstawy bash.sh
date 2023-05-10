#!/bin/bash

echo "Hello"
# ======================================================= #
file=$(<data.txt)
echo "$file"
# ======================================================= #
echo "File created in Bash." >> out.txt
# ======================================================= #
arg=13
if [ $1 -gt 100 ] # Pierwszy argument!!
then
    echo High
else
    echo Low
fi
# ======================================================= #
-gt = >
-le = <

$1 # pierwszy argument
$@ # argument przekazywany przy uruchomieniu skryptu
# ======================================================= #
x=5
n=1
while [ $n -le $1 ]
do
    echo "Loop $n"
    n=$(($n+1))
done
# ======================================================= #
for word in "$@" # @ to argument przy uruchamianiu skryptu (./wordlength.sh sit et amet)
do
    echo ${#word}
 done

 calculate_area () {
    local a=$1
    local area=$((a*a))
    return $area
}
# ======================================================= #
calculate_area () {
    local a=$@
    local area=$((a*a))
    echo $area
}

area=$(calculate_area)
echo $area

calculate_area
echo $?
# ======================================================= #
expr 21 + 57

let var=1920/16
echo $var

(( var -= 30 ))
echo $var
# ======================================================= #
file=$1 # file path
sum=0
while read -r line
do
    ((sum += $line))
done < $file # read file path

echo $sum

# ======================================================= #
crontab -l # lista wszystkich cyklicznie uruchamianych skryptów

sort "$1" | head -n 1
sort "$1" | tail -n 1
# ======================================================= #
file=$1

min_date=""
max_date=""

while read -r line; do
  if [ -z "$min_date" ] || [[ "$line" < "$min_date" ]]; then
    min_date="$line"
  fi

  if [ -z "$max_date" ] || [[ "$line" > "$max_date" ]]; then
    max_date="$line"
  fi
done < $file

echo $min_date
echo $max_date
# ======================================================= #
file=$1
success=false
while [ $success = false ]
do
  if [ -e $file ] && [ -r $file ]
  then
    cat $file
    success=true
  else
    sleep 0.01
  fi
done