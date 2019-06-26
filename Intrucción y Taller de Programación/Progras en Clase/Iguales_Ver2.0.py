def iguales(num):
    num = abs(num)
    if num > 0 and num < 999:
        udig = num % 10            #Obtener digito menos significativo
        pdig = num // 100          #Obtener digito menos significativo
        return udig ==pdig         #Comparacion
    else:
        return "ERROR"
