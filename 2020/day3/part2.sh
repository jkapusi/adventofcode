#!/bin/bash

function displaymapline {
    if [[ ${1:$2:1} == "#" ]]; then
        mark="X"
    else
        mark="O"
    fi
    echo "${1:0:$2}${mark}${1:(($2+1))}"
}

function process {
    linenr=0
    rightpos=0
    tree=0

    down=$1
    right=$2
    while read line; do
        ((linenr++))
 
        # the first line should be skipped
        [[ $linenr -le $down ]] && continue;

        # if we have to go down more than 1 line we should work only when the remainder is 0
        [[ $down -gt 1 && $(( $linenr % $down )) -eq 0 ]] && echo $line && continue
 
        ((rightpos+=right))
        adjustedrightpos=$(( $rightpos % ${#line} ))
        displaymapline $line $adjustedrightpos
        [[ ${line:adjustedrightpos:1} == "#" ]] && ((tree++))
    done < input

    echo "${tree} tree found"
    return $tree
}

# This is not zero because if we multiply something with zero it will be always zero
result=1

for right in 1 3 5 7; do
    process 1 $right
    ((result=result*$?))
done
process 2 1
((result=result*$?))

echo "The result is ${result}"
