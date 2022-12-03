import pathlib

lines = pathlib.Path("2022/day3/input.txt").read_text().split("\n")

sum = 0
for line in lines:
    p1, p2 = [line[i:i + len(line)//2] for i in range(0, len(line), len(line)//2)]
    shared = list(set(p1).intersection(set(list(p2))))

    # A-Z 27-52; a-z 1-26
    if ord(shared[0]) <= 90: # Z
        score = ord(shared[0])-65+27
    else:
        score = ord(shared[0])-97+1

    # print(f"{shared[0]} s: {score}")
    sum += score

print(sum)