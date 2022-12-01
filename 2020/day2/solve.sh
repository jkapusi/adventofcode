#!/bin/bash

valid_passwds=0

while read line; do
    echo $line;
    
    [[ $line =~ ^([0-9]+)-([0-9]+)\ ([a-z]+):\ ([a-z]+) ]]
    min=${BASH_REMATCH[1]}
    max=${BASH_REMATCH[2]}
    char=${BASH_REMATCH[3]}
    passwd=${BASH_REMATCH[4]}

    found=$(echo $passwd | grep -o . | grep -c $char)
    if [[ $found -ge $min && $found -le $max ]]; then
        echo "Valid password found. ${passwd}"
        ((valid_passwds++))
    fi
done < input

echo "${valid_passwds} valid passwords found!"
