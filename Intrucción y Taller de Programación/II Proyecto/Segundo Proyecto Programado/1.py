import pygame

#Clase Nodo
class Nodo:
    def __init__(self,next=None,valor=None):
        self.next=next
        self.valor=valor
    def __str__(self):
        return str(self.valor)
#clase Lista
class Lista:
    def __init__(self):
        self.largo=0
        self.head=None #Puntero al primer elemento
    def __len__(self):
        return self.largo
    def insertar(self,dato):
        self.largo+=1
        if self.head == None: #Lista vacia
            self.head=Nodo(valor = dato)
        else:
            temp=self.head
            while temp.next != None:
                temp=temp.next
            temp.next=Nodo(valor = dato)
    def print(self):
        temp=self.head
        while temp != None:
            print(temp.valor)
            temp=temp.next


pygame.init()
pantalla=pygame.display.set_mode([800,500])
salir=False
reloj1=pygame.time.Clock()

while salir!=True:
    for event in  pygame.event.get():
        if event.type == pygame.QUIT:
            salir = True

        i

    reloj1.tick(20)
    pantalla.fill([30,30,200])
    pygame.display.update()

pygame.quit()
