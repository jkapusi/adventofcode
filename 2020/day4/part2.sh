#!/bin/bash

validate() {
    case $1 in
        byr)
            [[ $2 -ge 1920 && $2 -le 2002 ]] || return 1
            ;;
        iyr)
            [[ $2 -ge 2010 && $2 -le 2020 ]] || return 1
            ;;
        eyr)
            [[ $2 -ge 2020 && $2 -le 2030 ]] || return 1
            ;;
        hcl)
            [[ $2 =~ ^\#([0-9a-f]{6})$ ]] || return 1
            ;;
        ecl)
            [[ $2 =~ ^(amb|blu|brn|gry|grn|hzl|oth)$ ]] || return 1
            ;;
        pid)
            [[ $2 =~ ^([0-9]{9})$ ]] || return 1
            ;;
        hgt)
            [[ $2 =~ ^1([5678][0-9]|9[0123])cm$ || $2 =~ ^(59|6[0-9]|7[0123456])in$ ]] || return 1
            ;;
        *)
            return 1
    esac
}

awk -v RS= '{for (i=1; i<=NF; i++) printf "%s%s", $i, (i==NF?"\n":" ")}' input \
| while read line; do
    valid=0
    invalid=""
    fields=$(echo $line | tr ' ' '\n' | cut -d: -f1 | sort | tr '\n' ' ')
    if echo $fields | egrep -q "byr (cid )?ecl eyr hcl hgt iyr pid"; then
        for field in $line; do
            if validate ${field%%:*} ${field#*:}; then
                ((valid++))
            else
                invalid="$invalid ${field%%:*}:${field#*:}"
            fi
        done
    fi
    # for debug: [ $valid -ge 1 ] && echo "$invalid ---- $line"
    [ $valid -ge 7 ] && echo $line
done | wc -l
