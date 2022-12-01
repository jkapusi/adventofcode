#!/bin/bash

highest=0

while read line; do
    # I don't know how to do natively with bash without doing 4 replacement, tr is doing a better job here
    binline=$(echo $line | tr 'FBRL' '0110')
    row=$((2#${binline:0:7}))
    column=$((2#${binline:7}))
    seatid=$((2#$binline))
    [ $seatid -gt $highest ] && highest=$seatid
    echo $binline $row $column $seatid $highest
done < input
