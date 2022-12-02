import pathlib

lines = pathlib.Path("2022/day2/input.txt").read_text().split("\n")

shapepoint = {'X':1, 'Y':2, 'Z':3}
win = {'A':'Y', 'B':'Z', 'C':'X'}
draw = {'A':'X', 'B':'Y', 'C':'Z'}
lose = {'A':'Z', 'B':'X', 'C':'Y'}
totalscore=0
# X lose, Y draw, Z win

for line in lines:
    tmp = line.split()

    if tmp[1] == 'X': # lose
        new = lose[tmp[0]]
    elif tmp[1] == 'Y': # draw
        new = draw[tmp[0]]
    elif tmp[1] == 'Z': # win
        new = win[tmp[0]]
    tmp[1] = new

    current = dict([tmp])

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