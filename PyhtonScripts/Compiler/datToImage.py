from PIL import Image
import numpy as np

def datToImage():
    with open('imagen1.dat') as f:
        content = f.readlines()
    # you may also want to remove whitespace characters like `\n` at the end of each line
    content = [x.strip() for x in content]
    bandera=0
    bandera2=1
    lista=[]
    lista2=[]
    while (bandera<9216):
        if(bandera2==16):
            lista2.append(lista)
            lista=[]
        lista.append(int(content[bandera],16))
        bandera=bandera+1
        bandera2=bandera2+1

    arr = np.asarray(lista2)
    print(type(arr))
    pop = Image.fromarray((arr).astype(np.uint8))
    pop.save('imagen.png') 

datToIMage()    