from PIL import Image
import numpy as np
import cv2

def convertirImagen():
    image = cv2.imread("2.jpg", 0)
    filas=390
    cols=390
    flag=1
    flag1=0
    flag3=0
    for x in range (0,filas): #se recorre la imagen
        for y in range (0,cols):
            if (y<96 and x<96):
                flag=1
            if (95<y<192 and x<96):
                flag=2
            if (191<y<288 and x<96):
                flag=3
            if (287<y<384 and x<96):
                flag=4
            if (y<96 and 95<x<192):
                flag=5
            if (95<y<192 and 95<x<192):
                flag=6
            if (191<y<288 and 95<x<192):
                flag=7
            if (287<y<384 and 95<x<192):
                flag=8
            if (y<96 and 191<x<288):
                flag=9
            if (95<y<192 and 191<x<288):
                flag=10
            if (191<y<288 and 191<x<288):
                flag=11
            if (287<y<384 and 191<x<288):
                flag=12
            if (y<96 and 287<x<384):
                flag=13
            if (95<y<192 and 287<x<384):
                flag=14
            if (191<y<288 and 287<x<384):
                flag=15
            if (287<y<384 and 287<x<384):
                flag=16
            pixel = image[x,y]
            f = open("imagen"+ str(flag)+".dat", "a")
            f.write(str((hex(pixel))[2:])+"\n")
            f.close()
            
    '''# load the image
    image = Image.open('1.jpg').convert('L')
    # convert image to numpy array
    data = np.asarray(image)
    print(type(data))
    # summarize shape
    print(data.shape)

    # create Pillow image
    image2 = Image.fromarray(data)
    print(type(image2))

    data=data.tolist()
    flag=1
    flag1=0
    for i in range(0,390):
        for j in range(0,390):   
            if (flag1==9217):
                flag=flag+1
                flag1=0
            f = open("imagen"+ str(flag)+".dat", "a")
            f.write(str((hex(data[i][j]))[2:])+"\n")  #8 
            f.close()
            flag1=flag1+1'''

convertirImagen()
