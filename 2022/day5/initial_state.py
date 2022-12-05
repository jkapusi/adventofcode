import pathlib

lines = pathlib.Path("2022/day5/sample.txt").read_text().split("\n")

s = {}
for line in lines:
    if "[" in line:
        for i in range(0, len(line), 4):
            c=line[i+1:i+2].strip()
            if c:
                tmp = {i//4: [c]}
                s |= tmp
                # couldn't find a way to merge these two dict right (no overwrites)
    else:
        break
