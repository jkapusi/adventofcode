#!/bin/bash

seen=()
function find_bag() {
    echo "egrep \"contain(.*)${1} bag\" input2"
    while read line; do
        bag=${line%% bags contain *}
        # contain=${line#* bags contain }
        # while read item; do
        #     [[ $item =~ ^([0-9]+)\ ([a-z]+)\ ([a-z]+) ]]
        #     echo "${BASH_REMATCH[2]} ${BASH_REMATCH[3]}"
        # done < <(echo $contain | tr ',' '\n')
        echo "$bag --- $line"
        if [[ ! " ${seen[@]} " =~ " ${bag/ /_} " ]]; then
            echo "New bag: ${bag}"
            seen+=("${bag/ /_}")
            echo ${seen[@]}
        fi
        find_bag "${bag}"

        # echo "$bag --- $line --- $contain"
        # echo $contain | grep -o '[a-z]* [a-z]*'
        
    done < <(egrep "contain(.*)${1} bag" input)
}

find_bag "shiny gold"
echo ${#seen[@]}