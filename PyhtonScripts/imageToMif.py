import sys
from PIL import Image

IMAGE=None
COLS=0
PIXELS=[]

def main(image_name, maxSize=152100): #maxsize = 390x390 = 152100
  global IMAGE,COLS,PIXELS
  width = 8 #int(input("Row width in bits to store in mem:"))
  
  IMAGE = Image.open(image_name, 'r').convert('L')
  IMAGE.save('greyscale.png')
  PIXELS = list(IMAGE.getdata())
  COLS= width/8

  imageSize=IMAGE.size[1]*IMAGE.size[0]

  #Create mif file
  mif_name1 = image_name.split('.')[0] + '1.mif'
  mif_file1 = open(mif_name1, 'w+')
  pixel_Index=input_lines(mif_file1,0,width,maxSize)

  if(pixel_Index<imageSize):
    mif_name2 = image_name.split('.')[0] + '2.mif'
    mif_file2 = open(mif_name2, 'w+')
    pixel_Index=input_lines(mif_file2,pixel_Index,width,maxSize)

  if(pixel_Index<imageSize):
    mif_name3 = image_name.split('.')[0] + '3.mif'
    mif_file3 = open(mif_name3, 'w+')
    pixel_Index=input_lines(mif_file3,pixel_Index,width,maxSize)

  if(pixel_Index<imageSize):
    mif_name4 = image_name.split('.')[0] + '4.mif'
    mif_file4 = open(mif_name4, 'w+')
    pixel_Index=input_lines(mif_file4,pixel_Index,width,maxSize)

  if(pixel_Index<imageSize):
    mif_name5 = image_name.split('.')[0] + '5.mif'
    mif_file5 = open(mif_name5, 'w+')
    pixel_Index=input_lines(mif_file5,pixel_Index,width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '6.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '7.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '8.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '9.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '10.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '11.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '12.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '13.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '14.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '15.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  if (pixel_Index < imageSize):
      mif_name5 = image_name.split('.')[0] + '16.mif'
      mif_file5 = open(mif_name5, 'w+')
      pixel_Index = input_lines(mif_file5, pixel_Index, width,maxSize)

  IMAGE.close()
  print("done")

def input_lines(file,line,width,maxSize=152100):
  global IMAGE,COLS,PIXELS

  #Get depth
  depth = IMAGE.size[1]*IMAGE.size[0]/COLS
  if(depth> maxSize):
    depth=maxSize
  file.write('DEPTH='+str(int(depth))+';\nWIDTH='+str(width)+';\nADDRESS_RADIX=HEX;\nDATA_RADIX=HEX;\nCONTENT\nBEGIN\n\n'.format(len(PIXELS), 8))

  #Begin file creation
  pixel_Index = line
  line=''
  cont=0
  address=0
  row= pixel_Index // IMAGE.size[0]
  col= pixel_Index % IMAGE.size[0] 
  for i in range(row,IMAGE.size[1]):
    if(address>=maxSize):
        break
    for j in range(col,IMAGE.size[0]):
      if(address>=maxSize):
        break
      #Set pixel_Index and write 
      if(cont==0):
        hexpixel_Index = hex(address).split('x')[-1]
        file.write(hexpixel_Index.upper()  + ": ")
        address+=1

      if(cont<COLS-1):
        line ='' + eight_bit_conversion(PIXELS[pixel_Index])+line
        file.write(line)
        cont+=1
      else:
        cont=0

        line ='' + eight_bit_conversion(PIXELS[pixel_Index])+line
        file.write(line)
        file.write(';\n')
      
      line=''
      pixel_Index+=1
      
              
  file.write('END;')
  file.close()
  return pixel_Index

def eight_bit_conversion(rgb):
  num="{0:b}".format(int(str(rgb)))
  num = "{:08b}".format(rgb)
  num = "{:.8}".format(num)
  if( len(num)!=8):
      print(rgb, num)
  hexNum=hex(int(num,2)).upper().split('X')[-1]
  if len(hexNum)!=2:
      hexNum = '0'+hexNum
  return  hexNum

def add_padding(num,pad):
  if pad == 24: 
      #offset = "{:024b}".format(num)
      offset = "{:024}".format(num)
      offset = "{:.24}".format(offset)
      return offset
  if pad == 20: 
      #offset = "{:024b}".format(num)
      offset = "{:020}".format(num)
      offset = "{:.20}".format(offset)
      return offset
  elif pad==12:
      #offset = "{:012b}".format(num)
      offset = "{:012}".format(num)
      offset = "{:.12}".format(offset)
      return offset
  elif pad==4:
      offset = "{:04b}".format(num)
      offset = "{:.4}".format(offset)
      return offset
  
def num_to_bin(num):
  if num[0]=='#':
      if '0x' in num:
          num="{0:b}".format(abs(int(num[1:],16)))
      else:
          num= "{0:b}".format(abs(int(num[1:])))
  elif num[0]=='=':
      if '0x' in num:
          num="{0:b}".format(abs(int(num[1:],16)))
      else:
          num= "{0:b}".format(abs(int(num[1:])))
  elif '0x' in num:
      num="{0:b}".format(abs(int(num,16)))
  else:
      raise Exception("Error 03: Numero no valido. Por favor revisar el reference sheet.")
  return num

main("boat.jpg")
