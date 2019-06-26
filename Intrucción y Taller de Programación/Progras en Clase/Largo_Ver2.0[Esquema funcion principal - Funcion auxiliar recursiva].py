def largo(num):
    if isinstance(num,int):               #Restricción General
        num = abs(num)
        if num != 0:                      #Caso especial
            return largo_aux(num)
        else:
            return 1

def largo_aux(num):
    if num == 0:
        return 0
    else:
        return 1+largo_aux(num // 10)
            
        
