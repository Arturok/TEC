def multi(num1, num2):
    if isinstance(num2, int):
        if num2 == 0:
            return 0
        else:
            return multi_aux(num1, num2)
    else:
        return 'Error: segundo argumento debe ser entero'

def multi_aux(num1, num2):
    if num2 == 0:
        return 0
    else:
        return num1 + multi_aux(num1, num2-1)
        
    
