#!/bin/bash

sum=0

while read line; do
    ((sum+=$(echo $line | tr -d " " | grep -o "." | sort | uniq -c | wc -l)))
done < <(awk -v RS= '{for (i=1; i<=NF; i++) printf "%s%s", $i, (i==NF?"\n":" ")}' input)

echo $sum
