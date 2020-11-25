def convertir():
    valor=0
    for i in range(96):
        valor=0
        for j in range(12):   
            if (valor==6):
                valor=0
            f = open("test1.dat", "a")
            f.write("MOVV R12, #"+ str((i*96)+j*8) +"\n")  #8
            f.write("LDRV R"+str(valor)+", R12" +"\n")
            f.write("MOVV R12, #" + str((i * 384) + j * 16) + "\n")  # 16
            f.write("DUPL R"+str(valor+6)+", "+ "R"+str(valor)+"\n")
            f.write("STRV R"+str(valor+6)+", R12"+"\n")
            f.write("MOVV R12, #"+ str((i*384)+(j*16) +192) +"\n")  #192
            f.write("STRV R"+str(valor+6)+", R12"+"\n")
            valor=valor+1
            f.close()    

convertir()
