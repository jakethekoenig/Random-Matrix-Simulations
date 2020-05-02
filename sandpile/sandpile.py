from PIL import Image,ImageDraw
import sys

n = int(sys.argv[1])

state = {(0,0): n}
fire = {(0,0)}


def adj(p):
    x,y = p
    return {(x+1,y),(x-1,y),(x,y+1),(x,y-1)}

while len(fire)>0:
    nex = set()
    for p in fire:
        for q in adj(p):
            state[q] = state[p]//4 + state.get(q,0)
            if state[q]>3:
                nex.add(q)
        state[p] = state[p]%4
    fire = nex

largest=0
for p in state.keys():
    largest = max(largest,p[0])

img = Image.new('RGB', (largest*2+1,largest*2+1), (0,0,0))
pixels = img.load()

def color(i):
    if i==0:
        return (0,0,0)
    if i==1:
        return (0,0,255)
    if i==2:
        return (0,255,0)
    if i==3:
        return (255,0,0)

for p in state.keys():
    pixels[p[0]+largest,p[1]+largest] = color(state[p])

img.save(sys.argv[2]+".jpg", "JPEG")
