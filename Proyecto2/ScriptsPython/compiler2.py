INSTRUCTIONS = {
	"addv":{"code":"0000000000000000", "type":1},
	"subv":{"code":"0000000000000001", "type":5},
    "mulv":{"code":"0000000000000011", "type":1},
	"divv":{"code":"0000000000000100", "type":5},
    "cmpv":{"code":"0000000000000101", "type":5},
    "dupl":{"code":"0000000000001111", "type":6},

	"ldrv":{"code":"00000000000100010000", "type":2},
	"strv":{"code":"00000000000100000000", "type":2},
    "movv":{"code":"0010100000", "type":3},
    "loop":{"code":"", "type":4},
}

OUTPUT=[]
CURRENT_TYPE=""
CURRENT_CODE=""
REPEAT_LINES=[]
REPEAT_LINES2=[]
LOOP_FLAG=False
LOOP_FLAG2=False

def write_file():
    file = open("memfile.dat","w")
    text = ""
    for instruc in OUTPUT:
        file.write(instruc+"\n")
    file.close()

def read_file():
    global LOOP_FLAG,LOOP_FLAG2,OUTPUT,REPEAT_LINES,REPEAT_LINES2
    repeat_cont=0
    repeat_cont2=0
    amount=0
    amount2=0
    first=False
    first2=False
    file = open("test1.dat","r")
    for line in file:
        linea=format_instruc(line) #se le da formato a la linea leida
        verify_instr(linea) #se verifica que la instruccion sea válida
        if(linea[0]=='loop'):
            if(LOOP_FLAG2):
                repeat_cont2=int(linea[1])
                amount2=int(linea[2])
                first2=True
            elif(LOOP_FLAG):
                repeat_cont=int(linea[1])
                amount=int(linea[2])
                first=True
        else:
            compile_reg(linea) #se compila/codifica la linea de instruccion
        if len(OUTPUT[-1]) != 32 and len(OUTPUT[-1]) != 28:
            raise Exception("Error 04: Formato inválido.")
        if(LOOP_FLAG2 and amount2>0 and not first2):
            REPEAT_LINES2.append(OUTPUT[-1])
            amount2-=1
        elif(LOOP_FLAG2 and amount2 > 0):
            first2=False
        elif(LOOP_FLAG and amount > 0 and not first):
            REPEAT_LINES.append(OUTPUT[-1])
            amount-=1
        elif(LOOP_FLAG and amount > 0):
            first=False

        if(LOOP_FLAG2 and amount2==0):
            for i in range(repeat_cont2):
                for j in range(0,len(REPEAT_LINES2)):
                    REPEAT_LINES.append(REPEAT_LINES2[j])
            REPEAT_LINES2=[]    
            LOOP_FLAG2=False
        elif(LOOP_FLAG and amount == 0):
            for i in range(repeat_cont):
                for j in range(0,len(REPEAT_LINES)):
                    OUTPUT.append(REPEAT_LINES[j])
            a=REPEAT_LINES[0]
            b=REPEAT_LINES[-1]
            print(len(OUTPUT))
            print(len(REPEAT_LINES))
            REPEAT_LINES=[]
            LOOP_FLAG=False
    file.close()
    write_file()
#*********************** Validacion ************************#
def format_instruc(line):
    line=line.rstrip("\n")
    line=line.strip()
    line = line.split(" ")
    while(True):
        if '' in line:
            line.remove('')
        else:
            break
    for i in range(0,len(line)):
        if ',' in line[i]:
            elem=line[i].split(",")
            if elem[1]=='':
                line[i] = elem[0]
            else:
                line.append(elem[1])
                break
    return line

#Input: una instruccion
def verify_instr(linea):
    global LOOP_FLAG,LOOP_FLAG2
    global CURRENT_TYPE, CURRENT_CODE
    instr=linea[0]
    instr = instr.lower()
    if instr in INSTRUCTIONS:
        if(instr =='loop' and LOOP_FLAG):
            LOOP_FLAG2=True
        elif(instr =='loop' ):
            LOOP_FLAG=True
        CURRENT_TYPE = INSTRUCTIONS.get(instr).get("type")
        CURRENT_CODE = INSTRUCTIONS.get(instr).get("code")
    else:
        raise Exception("Error 01: Instrucción no encontrada. Favor revisar lista de instrucciones.")


#************** Compiling **********************#
def compile_reg(lista):
    global OUTPUT
    opcode=[CURRENT_CODE]
    rd = get_reg(lista[1])
    opcode.append(rd)
    i=2
    contains_imm=False
    while(i<len(lista)):
        data= lista[i]
        if lista[i][0].lower() == "r":
            data=get_reg(lista[i])
            opcode.append(data)
        else: 
            contains_imm=True
            num=num_to_bin(lista[i])
            if CURRENT_TYPE ==3:
                num=add_padding(int(num),16)
            opcode.append(num)
        i+=1


    opcode = fill_empty(opcode,contains_imm,lista[0])
    temp = ''
    for code in opcode:
        temp+=code
    #print(temp)
    OUTPUT.append(temp)

# ********************* Extras **********************#
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
        raise Exception("Error 03: Número inválido.")
    return num

def set_imm(registers):
    if CURRENT_TYPE ==1:
        registers[0]= registers[0][:6]+'1'+registers[6:]
    return registers


def get_reg(register):
     num = int(register[1:])
     if num<0 or num>16:
        raise Exception("Error 06: Este registro no existe. Los registros van del 0-16")
     else:
        reg = add_padding(num,4)
     return reg



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
    elif pad==16:
        #offset = "{:016b}".format(num)
        offset = "{:016}".format(num)
        offset = "{:.16}".format(offset)
        return offset
    elif pad==12:
        #offset = "{:012b}".format(num)
        offset = "{:012}".format(num)
        offset = "{:.12}".format(offset)
        return offset
    elif pad==10:
        #offset = "{:010b}".format(num)
        offset = "{:010}".format(num)
        offset = "{:.10}".format(offset)
        return offset
    elif pad==4:
        offset = "{:04b}".format(num)
        offset = "{:.4}".format(offset)
        return offset



def fill_empty(opcode,hasImm,instr):
    if CURRENT_TYPE ==5  or CURRENT_TYPE ==1:
        a="0000"+str(opcode[0])
        opcode= [a,opcode[3], opcode[1],opcode[2]]
    elif CURRENT_TYPE==2:
        a="0000"+str(opcode[0])
        opcode=[a,opcode[1],opcode[2]]
    elif CURRENT_TYPE==3 and hasImm:
        a=str(opcode[2])
        b=a[2:16]
        c="00"+a[0:2]
        opcode= [b,opcode[0], opcode[1],c]
    elif CURRENT_TYPE ==6:
        a="0000"+str(opcode[0])
        opcode= [a,'0000', opcode[1],opcode[2]]
    return opcode

read_file()
