from PIL import Image
import numpy as np
import cv2

def datToImage():
    with open('outimagen.dat') as f: #outimagen.dat
        content = f.readlines()
    # you may also want to remove whitespace characters like `\n` at the end of each line
    filas=192
    cols=192
    bandera=3
    content = [x.strip() for x in content]
    matriz=np.zeros((filas, cols))
    for x in range (0,filas): #para formar la imagen se hace un loop de filas y otro de columnas
        for y in range (0,cols):
            num=int(content[bandera],16)
            bandera=bandera+1
            matriz[x,y]=num
    print(matriz)
    cv2.imwrite("imagen.jpg",matriz) #se escribe la matriz como imagen

datToImage()    
