

def obtenerDatos(cadena):
    original = ""
    i = 0
    x = 0
    #Recorre el string
    for j in cadena:
        #Si la posición es diferente a un 2^n agarra el dato y lo concatena
        if (i+1 != 2**x or i+1 == 16):
            original += j
            i+=1
        else:
            i+=1
            x+=1
    return original

def obtenerDatos2(cadena):
    original = ""
    i = 0
    x = 0
    #Recorre el string
    for j in cadena:
        #Si la posición es diferente a un 2^n agarra el dato y lo concatena
        if (i != 2**x):
            original += j
            i+=1
        else:
            i+=1
            x+=1
    return original

def calculoParidad(cadena):
    paridad = ""
    i = 0
    x = 0
    #Recorre el string
    for j in cadena:
        #Si la posición es igual a un 2^n agarra el dato y lo concatena
        if (i+1 == 2**x and i < 15):
            paridad += j
            i+=1
            x+=1
        else:
            i+=1
    return paridad

def compara(paridad1, paridad2):
    pos = ""
    #recorre las dos cadenas de paridad
    for j,i in zip(paridad1, paridad2):
        #Si los bits son iguales añade un 0
        if (j == i):
            #No hubo error en el bit de paridad
            pos = pos + "0"
        #Si no son iguales añade un 1
        else:
            #Hubo error en el bit de paridad
            pos = pos + "1"
    return pos

def binToDec(binary):
    x = ""
    for i in binary:
        x = i + x

    binary = x



    dec = ""
    pos = len(binary)
    for i in binary:
        if (dec == "" or dec == "0"):
            dec = str(int(i)*(2**(pos-1)))
        else:
            #print("Sum dec: ", int(i)*(2**pos-1))
            dec = str(int(dec)+(int(i)*(2**(pos-1))))
        pos-=1

    return dec
