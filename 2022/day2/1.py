import pathlib

lines = pathlib.Path("2022/day2/input.txt").read_text().split("\n")

shapepoint = {'X':1, 'Y':2, 'Z':3}
win = {'A':'Y', 'B':'Z', 'C':'X'}
draw = {'A':'X', 'B':'Y', 'C':'Z'}

totalscore=0
for line in lines:
    current = dict([line.split()])

    score = shapepoint.get(list(current.values())[0])
    if current.items() <= win.items():
        score+=6
        # print('Win')
    elif current.items() <= draw.items():
        score+=3
        # print('Draw')
    print(score)

    totalscore+=score

print(totalscore)