import pathlib, os

lines = pathlib.Path("2022/day5/input.txt").read_text().split("\n")[10:]

# [B]                     [N]     [H]
# [V]         [P] [T]     [V]     [P]
# [W]     [C] [T] [S]     [H]     [N]
# [T]     [J] [Z] [M] [N] [F]     [L]
# [Q]     [W] [N] [J] [T] [Q] [R] [B]
# [N] [B] [Q] [R] [V] [F] [D] [F] [M]
# [H] [W] [S] [J] [P] [W] [L] [P] [S]
# [D] [D] [T] [F] [G] [B] [B] [H] [Z]
#  1   2   3   4   5   6   7   8   9 
s = [list(""),list("DHNQTWVB"),list("DWB"),list("TSQWJC"),list("FJRNZTP"),list("GPVJMST"),list("BWFTN"),list("BLDQFHVN"),list("HPFR"),list("ZSMBLNPH")]

for line in lines:
    # print(f"$ {line}")
    _, nr, _, f, _, t = line.split(" ")

    pos = len(s[int(f)]) - int(nr)
    s[int(t)] += s[int(f)][pos:]
    del(s[int(f)][pos:])
    # break        

sol = ""
for c in s:
    try:
        sol += c.pop()
    except:
        pass

print(sol)