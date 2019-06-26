#Búsqueda Lineal o Secuencial
def busqueda_lineal(ele, lista):
    return busqueda_lineal_aux(ele, lista, 0, len(lista))
def busqueda_lineal_aux(ele, lista, i, n):
    if i==n:
        return -1
    elif lista[i]==ele:
        return i
    else:
        return busqueda_lineal_aux(ele, lista, i+1, n)

#Búsqueda Binaria
def busqueda_binaria(ele, lista):
    return busqueda_binaria_aux(ele, lista, 0, len(lista)-1)
def busqueda_binaria_aux(ele, lista, inicial, final):
    if inicial>final:
        return -1
    i=(inicial+final)//2
    if lista[i]==ele:
        return i
    elif lista[i]<ele:
        return busqueda_binaria_aux(ele, lista, i+1, final)
    else:
        return busqueda_binaria_aux(ele, lista, inicial, i-1)
    
