import pathlib

lines = pathlib.Path("2022/day1/input.txt").read_text().split("\n")

inventory=0
calories=[]
for line in lines:
    if line:
        inventory+=int(line)
    else:
        calories.append(inventory)
        inventory=0

# print(calories)
print(max(calories))
calories.sort(reverse=True)
print(sum(calories[:3]))
