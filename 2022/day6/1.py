from collections import Counter
lines = open('2022/day6/input.txt').read().splitlines()

for line in lines:
    print(line)
    l = list(line)
    for i in range(4, len(l)):
        cur = l[i-4:i]
        if len(Counter(cur)) == 4:
            print(line, cur, len(Counter(cur)), i)
            break
