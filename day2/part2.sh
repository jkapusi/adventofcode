#!/bin/bash

valid_passwds=0

while read line; do
    echo $line;
    
    [[ $line =~ ^([0-9]+)-([0-9]+)\ ([a-z]+):\ ([a-z]+) ]]
    pos1=$((${BASH_REMATCH[1]}-1))
    pos2=$((${BASH_REMATCH[2]}-1))
    char=${BASH_REMATCH[3]}
    passwd=${BASH_REMATCH[4]}

    char1=${passwd:$pos1:1}
    char2=${passwd:$pos2:1}
    if [[ $char == $char1 && $char != $char2 ]] || \
       [[ $char != $char1 && $char == $char2 ]];
    then
        echo "Valid password: $passwd ($char1 $char2 $char)"
        ((valid_passwds++))
    fi
done < input

echo "${valid_passwds} valid passwords found!"
