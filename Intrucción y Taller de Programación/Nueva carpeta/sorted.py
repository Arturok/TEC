import time

s1=time.time()
def rafa(lista):
    global s1
    s1=time.time()
    return rafa_aux(lista)
def rafa_aux(lista):
    global s1
    lista.sort()
    s2=time.time()
    tiempo=(s2-s1)
    print(tiempo)
    return lista
