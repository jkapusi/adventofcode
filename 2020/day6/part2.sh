#!/bin/bash

sum=0

while read line; do
    group_size=$(echo $line | tr " " "\n" | wc -l)
    while read answer; do
        [[ ${answer%% *} -eq $group_size ]] && ((sum+=1))
    done < <(echo $line | tr -d " " | grep -o "." | sort | uniq -c)
done < <(awk -v RS= '{for (i=1; i<=NF; i++) printf "%s%s", $i, (i==NF?"\n":" ")}' input)

echo $sum
