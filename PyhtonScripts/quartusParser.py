from PIL import Image
import numpy as np
def buildImage(fileContent):
	finalImage = ""
	numberOfCharacters = len(fileContent)
	for i in range(1, numberOfCharacters):
		if fileContent[i-1] == "+" and fileContent[i] == "0":
			j = i + 9
			temp = fileContent[j:j+26]
			if(temp != "xxxxxxxx xxxxxxxx xxxxxxxx"): 
				finalImage += temp
				finalImage += "\n"

	return finalImage



def parserToRGB90(binaryString):
	rgb = []
	val = ""
	numberOfCharacters = len(binaryString)
	i = 0
	for j in range(0, numberOfCharacters):
		if i != numberOfCharacters:
			if not(binaryString[i] == " ") and not(binaryString[i:i+1] == "\n"):
				val = binaryString[i : i+8]
				i = i + 7
				rgb.append(int(val,2))
				#print(str(int(val,2)))
			i = i + 1
	return rgb


def parser():
	file = open("./list.lst", "r")
	#test = open("./test.txt", "a")
	contents = file.read()
	image = buildImage(contents)
	#test.write(image)
	#test.close
	file.close()
	prueb = Image.frombytes('RGB', (256, 256), bytes(parserToRGB90(image)))
	prueb.show()
	prueb.save("image.png")
	print("Hee Hee")


parser()
