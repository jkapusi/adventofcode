#!/bin/bash

linenr=0
rightpos=0
tree=0

function displaymapline {
    if [[ ${1:$2:1} == "#" ]]; then
        mark="X"
    else
        mark="O"
    fi
    echo "${1:0:$2}${mark}${1:(($2+1))}"
}

while read line; do
    ((linenr++))

    [[ $linenr -eq 1 ]] && continue;
    ((rightpos+=3))
    adjustedrightpos=$(( $rightpos % ${#line}))
    displaymapline $line $adjustedrightpos
    [[ ${line:adjustedrightpos:1} == "#" ]] && ((tree++))
done < input

echo "${tree} found"
