- https://github.com/pamdemonia/AOC_2022/blob/main/aoc04_solved.py
  - issubset and I like the mk_range part
- https://www.reddit.com/r/adventofcode/comments/zc0zta/comment/iyukvko/?utm_source=reddit&utm_medium=web2x&context=3 #pandas interval
- https://www.reddit.com/r/adventofcode/comments/zc0zta/comment/iyujqc7/?utm_source=reddit&utm_medium=web2x&context=3
  - like the replace ,- characters and split with - only
- https://www.reddit.com/r/adventofcode/comments/zc0zta/comment/iyuhyal/?utm_source=reddit&utm_medium=web2x&context=3
  - `tuple(map(sum, zip(\*\[ (((l0>=r0) and (l1<=r1)) or (((r0>=l0) and (r1<=l1))), (l0<=r1) and (r0<=l1)) for l0,l1,r0,r1 in (map(int, x.replace(',', '-').split('-')) for x in open("input4.txt").read().strip().split("\\n"))\])))`
 
