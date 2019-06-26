#Problema 1

def elimina(num):
    if isinstance(num, int) and num > 0:
        return elimina_aux(num, 0)
    else:
        return "Error"

def elimina_aux(num, exp):
    if num == 0:
        return 0
    elif num%10 != 0:
        return (num%10*10**exp) + elimina_aux(num//10, exp+1)
    else:
        return elimina_aux(num//10, exp+1) #Debi quitar el "+1 de la variable auxiliar"





#Problema 2

def clasifique(num):
    if isinstance(num, int) and num > 0:
        return clasifique_aux(num, 1)
    else:
        return "Error"

def clasifique_aux(num, div):
    if num == 0:
        return 0
    elif num == 1:
        return "Deficiente"
    elif num % div == 0 and div + clasifique_aux(num, div+1) == num:
        return "Perfecto"
    elif num % div == 0 and div + clasifique_aux(num, div+1) > num:
        return "Abundante"
    elif num % div == 0 and div + clasifique_aux(num, div+1) < num:
        return "Deficiente"
    else:
        return clasifique_aux(num, div+1)

    
