#!/bin/bash

awk -v RS= '{for (i=1; i<=NF; i++) printf "%s%s", $i, (i==NF?"\n":" ")}' input \
| while read line; do
    fields=$(echo $line | tr ' ' '\n' | cut -d: -f1 | sort | tr '\n' ' ')
    echo $fields;
done | egrep -c "byr (cid )?ecl eyr hcl hgt iyr pid"
