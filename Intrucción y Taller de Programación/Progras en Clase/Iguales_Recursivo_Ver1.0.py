def iguales(num):
    if isinstance(num,int):
            num = abs(num)
            udig = num % 10            #Obtener digito menos significativo
            pdig = primer(num)         #Llamada a una funcion auxiliar recursiva
            return udig ==pdig         #Comparacion
    else:
        return "ERROR"


def primer(num):
    if num < 10:                       #caso base o condicion de terminacion
        return num                     #valor de retorno
    else:
        return primer(num//10)         #llamada recursiva (a sí misma) #(num//10)-> MODIFICACION DE ARGUMENTO
    
