def validar(bits):
    error = 0
    if(isinstance(bits, str)):
        for i in bits:
            if(i!="0" and i!="1"):
                error = 1
    else:
        error = 99
    return error

def setBitsParidad(bits):
    maxPosParidad = int(len(bits)**(1/2))
    newbits=""
    x=1
    indice=0
    for i in range (maxPosParidad+2):
        bits=bits[:indice]+"p"+bits[indice:]
        indice = indice+x
        x=x*2
    return bits

def setParidadHamming(bits,par):
    maxPosParidad = int(len(bits)**(1/2))
    posParidad=0

    while(posParidad <= maxPosParidad):
        jump = 0
        ignore = False
        check=""
        indice=2**posParidad-1
        for i in range(indice, len(bits)):
            if(jump==2**posParidad):
                jump=0
                ignore = not ignore
            if not ignore:
                check+=bits[i]
            jump+=1
        bits=bits[0:indice]+paridad(check,par)+bits[indice+1:]
        posParidad+=1
    return bits


def llenarP1(bits,parid):
    ocupo=[0,1,3,4,6,8,10,11]
    check=""
    #bits=setBitsParidad(bits)
    for i in range(0,len(bits)):
        if(i in ocupo):
            check+=bits[i]
    check=paridad(check,parid)+check
    return check

def llenarP2(bits,parid):
    ocupo=[0,2,3,5,6,9,10]
    check=""
    #bits=setBitsParidad(bits)
    for i in range(len(bits)):
        if(i in ocupo):
            check+=bits[i]
    check=paridad(check,parid)+check
    return check

def llenarP3(bits,parid):
    ocupo=[1,2,3,7,8,9,10]
    check=""
    #bits=setBitsParidad(bits)
    for i in range(0,len(bits)):
        if(i in ocupo):
            check+=bits[i]
    check=paridad(check,parid)+check
    return check

def llenarP4(bits,parid):
    ocupo=[4,5,6,7,8,9,10]
    check=""
    #bits=setBitsParidad(bits)
    print("bits",bits)
    for i in range(0,len(bits)):
        if(i in ocupo):
            check+=bits[i]
    print("check",check)
    check=paridad(check,parid)+check
    print("result: ",check)
    print("len:"+str(len(check)))
    return check


def llenarP5(bits,parid):
    ocupo=[11]
    check=""
    #bits=setBitsParidad(bits)
    print("bits",bits)
    for i in range(0,len(bits)):
        if(i in ocupo):
            check+=bits[i]
    print("check",check)
    check=paridad(check,parid)+check
    print("result: ",check)
    print("len:"+str(len(check)))
    return check

def paridad(check, par):
    numUnos = contarUnos(check)
    if(par):
        if(numUnos%2==0):
            return "0"
        else:
            return "1"
    else:
        if(numUnos%2==0):
            return "1"
        else:
            return "0"

def contarUnos(hilera):
    CantidadUnos=0
    for i in hilera:
        if i == "1":
            CantidadUnos+=1
    return CantidadUnos

def hexa2bin(num):
    result = ""
    for i in num:
        result+=equivalente(i)+" "
    return result

def equivalente(num):
    hexaLetters=["A","B","C","D","E","F"]
    if(num.isdigit()):
        if(num == "0"):
            return "0000"
        elif(num == "1"):
            return "0001"
        elif(num =="2"):
            return "0010"
        elif(num == "3"):
            return "0011"
        elif(num == "4"):
            return "0100"
        elif(num == "5"):
            return "0101"
        elif(num == "6"):
            return "0110"
        elif(num == "7"):
            return "0111"
        elif(num == "8"):
            return "1000"
        elif(num == "9"):
            return "1001"

    elif(num in hexaLetters):
        if(num == "A"):
            return "1010"
        elif(num == "B"):
            return "1011"
        elif(num == "C"):
            return "1100"
        elif(num == "D"):
            return "1101"
        elif(num == "E"):
            return "1110"
        elif(num == "F"):
            return "1111"
    else:
        return "No Valido"

def valid_hex(num):
    pass
