#!/bin/bash

IFS=$'\n' read -d '' -r -a INPUT < input

echo ${INPUT[@]}
for x in ${INPUT[@]}; do
    for y in ${INPUT[@]}; do
        if [ $((x+y)) -eq 2020 ]; then
            echo "$x + $y = 2020; $x * $y = $((x*y))"
        fi
    done
done
