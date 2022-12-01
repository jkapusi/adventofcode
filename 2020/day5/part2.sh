#!/bin/bash

seats=()
while read line; do
    seats+=($((2#$line)))
done < <(cat input | tr 'FBRL' '0110' | sort)

# loop thru the array except the last one
for (( seatpos = 0 ; seatpos < $((${#seats[@]}-1)) ; seatpos++ )); do
    # if we get the next element and if its not equal with the current seatid+1 then we found the seat!
    if [ $((${seats[$seatpos]}+1)) -ne ${seats[$(($seatpos + 1))]} ]; then
        echo $((${seats[$seatpos]}+1))
    fi
done
