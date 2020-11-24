from PIL import Image
import numpy as np

def convertirImagen():
    # load the image
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
    flag=0
    flag1=0
    for i in range(390):
        for j in range(390):   
            if (flag1==9216):
                flag=flag+1
                flag1=0
            f = open("imagen"+ str(flag)+".dat", "a")
            f.write(str(hex(data[i][j]))+"\n")  #8 
            f.close()
            flag1=flag1+1

convertirImagen()