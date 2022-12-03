import pathlib

lines = pathlib.Path("2022/day3/input.txt").read_text().split("\n")

sum = 0
for i in range(0, len(lines), 3):
    groupoflines = lines[i:i+3]
    r = list(set.intersection(
        set(list(groupoflines[0])), 
        set(list(groupoflines[1])),
        set(list(groupoflines[2]))
    ))

    c = r[0]
    # A-Z 27-52; a-z 1-26
    if ord(c) <= 90: # Z
        score = ord(c)-65+27
    else:
        score = ord(c)-97+1

    # print(f"{c} s: {score}")
    sum += score

print(sum)