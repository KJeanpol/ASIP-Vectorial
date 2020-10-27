from PIL import Image
import numpy as np

def parser():
  file = open("./list.lst", "r")
  cont=0
  temp=[]
  new_pixels=np.zeros((256,256,3),dtype='uint8')
  for line in file:
    if(cont<11):
      cont+=1
    else:
      if(cont>256*256):
        break
      nums=line.split(" ")
      if(nums[-2]!="1" ):
        nums=[int(nums[-5],2),int(nums[-4],2),int(nums[-3],2)]
        temp.append(nums)
        cont+=1
  cont=0
  for i in range(len(new_pixels)):
    for j in range(len(new_pixels[0])):
      if(cont<len(temp)):
        if(temp[cont][0]>255 or temp[cont][1]>255 or temp[cont][2]>255):
          print(cont, temp[cont])
        new_pixels[i][j]=temp[cont]
        cont+=1
      else:
        break

  file.close()
  print(new_pixels)
  im = Image.fromarray(new_pixels).convert('RGB')
  im.show()
  print("Hee Hee")


parser()
