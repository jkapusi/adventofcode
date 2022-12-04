import pathlib

lines = pathlib.Path("2022/day4/input.txt").read_text().split("\n")

count=0
countp2=0
for line in lines:
    p1, p2 = line.split(",")
    p1list = set(range(int(p1.split("-")[:1].pop()), int(p1.split("-")[1:].pop())+1))
    p2list = set(range(int(p2.split("-")[:1].pop()), int(p2.split("-")[1:].pop())+1))

    print(p1list)
    print(p2list)
    shared = set.intersection(p1list, p2list)
    if len(shared) == len(p1list) or len(shared) == len(p2list):
        count+=1
    if len(shared) > 0:
        countp2+=1

print(count)
print(countp2)
