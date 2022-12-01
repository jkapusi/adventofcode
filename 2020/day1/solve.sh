#!/bin/bash

IFS=$'\n' read -d '' -r -a INPUT < input

for x in ${INPUT[@]}; do
    for y in ${INPUT[@]}; do
        if [ $((x+y)) -eq 2020 ]; then
            echo "$x + $y = 2020; $x * $y = $((x*y))"
        fi
    done
done

for x in ${INPUT[@]}; do
    for y in ${INPUT[@]}; do
        for z in ${INPUT[@]}; do
            if [ $((x+y+z)) -eq 2020 ]; then
                echo "$x + $y + $z = 2020; $x * $y * $z = $((x*y*z))"
            fi
        done
    done
done
