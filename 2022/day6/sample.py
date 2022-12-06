from collections import Counter
lines = open('2022/day6/sample.txt').read().splitlines()

# for line in lines:
#     print(line)
#     l = list(line)
#     for i in range(4, len(l)):
#         cur = l[i-4:i]
#         if len(Counter(cur)) == 4:
#             print(line, cur, len(Counter(cur)), i)
#             break

for line in lines:
    print(line)
    l = list(line)
    for i in range(14, len(l)):
        cur = l[i-14:i]
        if len(Counter(cur)) == 14:
            print(line, cur, len(Counter(cur)), i)
            break
