#!/usr/bin/env bash -x

total=0
declare -A bags
while read line; do
    bag=${line%% bags contain *}
    contain=${line#* bags contain }
    while read item; do
        if [[ $item =~ ^([0-9]+)\ ([a-z]+)\ ([a-z]+) ]]; then
            # echo "${BASH_REMATCH[1]} ${BASH_REMATCH[2]} ${BASH_REMATCH[3]}"
            bags[${bag/ /_}]="${BASH_REMATCH[1]}_${BASH_REMATCH[2]}_${BASH_REMATCH[3]}"
        fi
    done < <(echo $contain | tr ',' '\n')
done < <(cat input2)

function find_bag() {
    local total=1
    for inner in ${bags[$1]}; do
        [[ $inner =~ ^([0-9]+)\_([a-z]+)\_([a-z]+) ]]
        # echo find_bag "${BASH_REMATCH[2]}_${BASH_REMATCH[3]}"
        
        total+=$((${BASH_REMATCH[1]}*$(find_bag "${BASH_REMATCH[2]}_${BASH_REMATCH[3]}")))
    done
    echo $total
}

echo $(find_bag "shiny_gold")
