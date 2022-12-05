import pathlib

lines = pathlib.Path("2022/day5/sample.txt").read_text().split("\n")[5:]

#     [D]    
# [N] [C]    
# [Z] [M] [P]
#  1   2   3 

sample = [[],["Z","N"],["M","C","D"],["P"]]
s = sample

for line in lines:
    # print(f"$ {line}")
    _, nr, _, f, _, t = line.split(" ")
    print(nr,f,t, s[int(f)], s[int(t)])

    pos = len(s[int(f)]) - int(nr)
    s[int(t)] += s[int(f)][pos:]
    del(s[int(f)][pos:])

    print(nr,f,t, s[int(f)], s[int(t)], pos)
    # for i in range(int(nr)):
    #     s[int(t)].append(s[int(f)].pop())
    #     # print(nr,f,t)

sol = ""
for c in s:
    try:
        sol += c.pop()
    except:
        pass

print(sol)