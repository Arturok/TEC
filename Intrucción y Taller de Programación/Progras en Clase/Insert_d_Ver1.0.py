def insert_d(ref, ele, lista):
    if lista != []:
        return insert_d_aux(ref, ele, lista)
    else:
        return "Error"

def insert_d_aux(ref, ele, lista):
    if lista == []:
        return []
    elif lista[0]==ref:
        return [lista[0]]+[ele]+insert_d_aux(ref, ele, lista[1:])
    else:
        return [lista[0]]+insert_d_aux(ref, ele, lista[1:])
    
