theta = 1
w1 = 1
w2 = -1

def step(x):
    if x >= theta:
        return 1
    else:
        return 0

inputs = [(0,0), (0,1), (1,0), (1,1)]

print("A B | X | OUTPUT")
print("----------------")

for A, B in inputs:
    x = A*w1 + B*w2
    output = step(x)
    print(f"{A} {B} | {x} | {output}")

