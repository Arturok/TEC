#E:Dos números
#S:Número entero encadenando dos numeros
#R:Enteros




def num_append(num1, num2):
    if isinstance(num1, int) and isinstance(num2, int): #RESTRICCION GENERAL
        if num2 == 0:
            return num_append_aux(num1, num2, 1)
        else:
            return num_append_aux(num1, num2, 0)
    else:
        return "ERROR"

def num_append_aux(num1, num2, exp):
    if num1 == 0:      #CASO BASE O DE TERMINACION
        return 0
    elif num2 == 0:
        return (num1%10)*10**exp + num_append_aux(num1//10, num2, exp+1) #LLAMADA RECURSIVA
    else:
        return (num2%10)*10**exp + num_append_aux(num1, num2//10, exp+1) #LLAMADA RECURSIVA
    
        
