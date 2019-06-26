#clase Banco
class Banco():
   def __init__(self,numjuego,juego,baraja,monto,dado): #Constructor de la clase banco
      self.numjuego = numjuego
      self.juego = juego
      self.baraja = baraja
      self.monto = monto
      self.dado = dado
   def iniciarJuego(self): #Funcion para iniciar el juego
      banquero.cargaBaraja()

   def cargaBaraja(self): #Funcion para cargar la baraja
      archi=open('baraja.txt','r')
      promedio3=[]
    
      for i in archi.readlines():
         datos3 = i.strip("\n -").split(",")
         promedio3=promedio3+datos3
        
    
      promedio3=promedio3[1:]
      promedio3=promedio3[1:]
      respuesta3=[]
      m=0
      while m<=10:
         if m%2==0:
            respuesta3=respuesta3+[promedio3[m]]
         m=m+1
      self.baraja=respuesta3
      
      archi.close()
   
   def cargaConfiguracion(self): #Funcion para cargar las configuraciones
      #Variables globales
      global montoBanco
      global montoJugador1
      global montoJugador2
      global montoJugador3
      global montoJugador4
      global montoSalida
      global montoCarcel
      archi=open('setup.txt','r') #abre el archivo en modo lectura
      promedio2=[]
    
      for i in archi.readlines():
         datos2 = i.strip("\n -").split(",")
         promedio2=promedio2+datos2
        
    
      promedio2=promedio2[1:]
      promedio2=promedio2[1:]
      respuesta2=[]
      n=0
      while n<=7:
         if n%2==0:
            respuesta2=respuesta2+[promedio2[n]]
         n=n+1
      #Asigna valores a variables globales
      montoBanco=int(respuesta2[0])
      montoJugador1=int(respuesta2[1])
      montoJugador2=int(respuesta2[1])
      montoJugador3=int(respuesta2[1])
      montoJugador4=int(respuesta2[1])
      montoSalida=int(respuesta2[2])
      montoCarcel=int(respuesta2[3])
      archi.close()
   
   def realizarCobro(self): #Funcion para realizar cobro
        Jugador.monto-=valor
   def realizarPago(self): #Funcion para relizar pago
        Jugador.monto+=valor
   

#Clase Jugador
class Jugador:
   def __init__(self,nombre,turno,acumulado,posicion,propiedades,monto):
      self.head = None
      self.nombre = nombre
      self.turno = turno
      self.acumulado = acumulado
      self.posicion = posicion
      self.propiedades = propiedades
      self.monto = monto
      self.largo = 0
      
   def posJugador(self): #Funcion que da las posiciones del jugador
      #Variables globales
      global posX
      global posY
      #asigna valores a las posiciones
      posX=self.posicion[0]
      posY=self.posicion[1]
   
   def realizaCompra(self): #Funcion para realizar compra
      print(self.nombre,self.monto)           
   def pagarPaso(self): #Funcion para realizar pago
      self.monto-=derecho
   def pagarMulta(self): #Funcion para pagar multa
      self.valor-=multa
   def cobrar(self): #Funcion para cobrar
      self.valor+=cobro
#Clase Propiedad
class Propiedad:
   def __init__(self,posicion, descripcion, valor, derecho, estado="Libre"):
      self.descripcion = descripcion
      self.valor = valor
      self.derecho = derecho
      self.largo+=1
        
   def cambiaEstado(self): #Cambia el estado de libre a comprada
      self.estado="comprada"
        
   def obtenerDatos(self): #Obtiene los datos de la propiedad        
      return self.descripcion, self.valor, self.derecho


##INTERFAZ

#importa las librerias necesarias
from tkinter import *
from time import time, sleep #Importa funcionde tiempo
from threading import Thread ##Thread (hilo), para evitar threading.Thread
import random ##Metodos para generar numeros aleatorios
import threading ##Hilos
import os
import winsound ##para sonido
import time



    

#############################

##VARIABLES GLOBALES
J1=""
J2=""
J3=""
J4=""
montoBanco=0
montoJugador1=0
montoJugador2=0
montoJugador3=0
montoJugador4=0
montoSalida=0
montoCarcel=0
posX=0
posY=0
valorDado=0


#se crea la ventana del menu
menu=Tk()
menu.geometry("1000x500+100+10")
menu.title("MENU: MINIPOLY COSTA RICA")
def dado(): #Funcion que genera un numero aleatorio
   y=random.randrange(1,7)
   return y

def cargarImagen(nombre): #Funcion para cargar imágenes
        ruta = os.path.join('Imagenes',nombre)       
        imagen = PhotoImage(file = ruta)
        return imagen

def leerdocumento(): #Funcion para leer el documento
    archi=open('prop.txt','r')
    promedio=[]    
    for i in archi.readlines():        
        datos = i.strip("\n -").split(",")
        promedio=promedio+datos        
    
    promedio=promedio[1:]
    promedio=promedio[1:]
    respuesta=[]
    i=0
    while i<=190:
        if i%2==0:
            respuesta=respuesta+[promedio[i]]
        i=i+1
    return respuesta
    archi.close()


def verprop(titulo,num): #Funcion para ver datos de la propiedad
    verprop = Toplevel()
    verprop.title("DATOS DE PROPIEDAD")
    verprop.geometry("500x248+250+200")
    verprop.resizable(width=NO,height=NO)
    verprop.config(bg = "white")
    def atras():
        verprop.destroy()
    respuest=leerdocumento()
    nompro=respuest[num]
    valpro=respuest[num+1]
    derpro=respuest[num+2]
    proper=Label(verprop,image=titulo,width=300,height=300,bg="white")
    proper.image=titulo
    proper.place(x=-30,y=-30)
    lblJugador1=Label(verprop, text="Nombre de la propiedad:",bg="white",font=("Arial",12)).place(x=250,y=0)
    lblJugador2=Label(verprop, text="Valor de la propiedad:",bg="white",font=("Arial",12)).place(x=250,y=50)
    lblJugador3=Label(verprop, text="Derecho de paso:",bg="white",font=("Arial",12)).place(x=250,y=100)
    
    txtJugador1=Label(verprop,text=nompro,bg="white",font=("Arial",12)).place(x=320, y=25)
    
    txtJugador2=Label(verprop,text="¢"+valpro ,bg="white",font=("Arial",12)).place(x=320, y=75)
    
    txtJugador3=Label(verprop,text="¢"+derpro,bg="white",font=("Arial",12)).place(x=320, y=125)

    salir=Button(verprop, text="Atras",command=atras).place(x=320,y=210)

def juego(): #Ventana del Juego
    global J1
    global J2
    global J3
    global J4
    global Jugadores
    global montoJugador1
    global montoJugador2
    global montoJugador3
    global montoJugador4
    global posX
    global posY

    
    #creaventana principal
    ventana_principal= Toplevel()
    ventana_principal.title("MINIPOLY COSTA RICA")
    ventana_principal.geometry("1300x930+100+10")
    ventana_principal.resizable(width = NO, height = NO)

   
    fondo2 = Canvas(ventana_principal , width=1200,height=1200,bg="red")
    fondo2.place(x=622,y=-10)
    fondo = Canvas(ventana_principal , width=1200,height=1200,bg="white")
    fondo.place(x=0,y=0)
    nl=[]
       
    def tablero(): #Funcion para crear el tablero        
        
        ind=0
        c1=1
        c2=0
        while ind < 24:
            nl.append(Button(fondo))
            nl[ind].grid(row=c2,column=c1)
            ind+=1
            if c1==0 and c2<=6:
                c2=c2-1
            elif c2==6:
                c1=c1-1
            
            elif c1==6:
                c2=c2+1
            else: c1+=1
        #Cargando las imagenes del tablero
        Moín=cargarImagen("Moín.gif")
        propMoín=cargarImagen("propMoín.gif")
        arenal = cargarImagen("arenal.gif")
        proparenal = cargarImagen("proparenal.gif")                
        hotel_costa = cargarImagen("hotel_costa.gif")
        prophotel_costa = cargarImagen("prophotel_costa.gif")
        juan_santamaria = cargarImagen("juan_santamaria.gif")
        propjuan_santamaria = cargarImagen("propjuan_santamaria.gif")
        rio_celeste = cargarImagen("rio_celeste.gif")
        proprio_celeste = cargarImagen("proprio_celeste.gif")
        salida = cargarImagen("salida.gif")
        salida = cargarImagen("salida.gif")
        Fortin = cargarImagen("Fortin.gif")
        propFortin = cargarImagen("propFortin.gif")
        Irazu= cargarImagen("Irazu.gif")
        propIrazu= cargarImagen("propIrazu.gif")
        Flora=cargarImagen("Flora.gif")
        Flora=cargarImagen("Flora.gif")
        Braulio_Carrillo=cargarImagen("Braulio_Carrillo.gif")
        propBraulio_Carrillo=cargarImagen("propBraulio_Carrillo.gif")
        Caldera=cargarImagen("Caldera.gif")
        propCaldera=cargarImagen("propCaldera.gif")
        Carcel=cargarImagen("Carcel.gif")
        Carcel=cargarImagen("Carcel.gif")
        Intercontinental=cargarImagen("Intercontinental.gif")
        propIntercontinental=cargarImagen("propIntercontinental.gif")
        ICE=cargarImagen("ICE.gif")
        propICE=cargarImagen("propICE.gif")
        Chirripó =cargarImagen("Chirripó.gif")
        propChirripó =cargarImagen("propChirripó.gif")
        Fauna =cargarImagen("Fauna.gif")
        Fauna =cargarImagen("Fauna.gif")
        bolaños =cargarImagen("bolaños.gif")
        propbolaños =cargarImagen("propbolaños.gif")
        Nacional =cargarImagen("Nacional.gif")
        propNacional =cargarImagen("propNacional.gif")
        Barva=cargarImagen("Barva.gif")
        propBarva=cargarImagen("propBarva.gif")
        Ballena=cargarImagen("Ballena.gif")
        propBallena=cargarImagen("propBallena.gif")
        elico=cargarImagen("elico.gif")
        propelico=cargarImagen("propelico.gif")
        coco=cargarImagen("coco.gif")
        propcoco=cargarImagen("propcoco.gif")
        saprissa=cargarImagen("saprissa.gif")
        propsaprissa=cargarImagen("propsaprissa.gif")
        INS=cargarImagen("INS.gif")
        propINS=cargarImagen("propINS.gif")
        nl[0].config(image=(saprissa),width=127,height=127,command=lambda: verprop(propsaprissa,53))  ,nl[8].config(image=Chirripó,width=127,height=127,command=lambda: verprop(propChirripó,85))                ,nl[16].config(image=INS,width=127,height=127,command=lambda: verprop(propINS,21))
        nl[1].config(image=(ICE ),width=127,height=127,command=lambda: verprop(propICE,57))           ,nl[9].config(image=Barva,width=127,height=127,command=lambda: verprop(propBarva,89))                      ,nl[17].config(image=Flora,width=127,height=127,command=lambda: verprop(Flora,25))
        nl[2].config(image=(coco),width=127,height=127,command=lambda: verprop(propcoco,61))          ,nl[10].config(image=Nacional,width=127,height=127,command=lambda: verprop(propNacional,93))               ,nl[18].config(image=Braulio_Carrillo,width=127,height=127,command=lambda: verprop(propBraulio_Carrillo,29))
        nl[3].config(image=(bolaños),width=127,height=127,command=lambda: verprop(propbolaños,65))    ,nl[11].config(image=salida,width=127,height=127,command=lambda: verprop(salida,1))                        ,nl[19].config(image=Fortin,width=127,height=127,command=lambda: verprop(propFortin,33))
        nl[4].config(image=(elico),width=127,height=127,command=lambda: verprop(propelico,69))        ,nl[12].config(image=hotel_costa,width=127,height=127,command=lambda: verprop(prophotel_costa,5))          ,nl[20].config(image=Irazu,width=127,height=127,command=lambda: verprop(propIrazu,37))
        nl[5].config(image=(Fauna),width=127,height=127,command=lambda: verprop(Fauna,73))        ,nl[13].config(image=rio_celeste,width=127,height=127,command=lambda: verprop(proprio_celeste,9))              ,nl[21].config(image=Caldera,width=127,height=127,command=lambda: verprop(propCaldera,41))
        nl[6].config(image=(Ballena),width=127,height=127,command=lambda: verprop(propBallena,77))    ,nl[14].config(image=arenal,width=127,height=127,command=lambda: verprop(proparenal,13))                   ,nl[22].config(image=Intercontinental,width=127,height=127,command=lambda: verprop(propIntercontinental,45)) 
        nl[7].config(image=(Moín),width=127,height=127,command=lambda: verprop(propMoín,81))          ,nl[15].config(image=juan_santamaria,width=127,height=127,command=lambda: verprop(propjuan_santamaria,17)) ,nl[23].config(image=Carcel,width=127,height=127,command=lambda: verprop(Carcel,49))
 
        nl[0].image =saprissa
        nl[1].image = ICE      
        nl[2].image = coco      
        nl[3].image =bolaños     
        nl[4].image =elico    
        nl[5].image = Fauna     
        nl[6].image =Ballena      
        nl[7].image =Moín       
        nl[8].image = Chirripó    
        nl[9].image =Barva
        nl[10].image =Nacional
        nl[11].image = salida
        nl[12].image = hotel_costa
        nl[13].image = rio_celeste
        nl[14].image = arenal
        nl[15].image =juan_santamaria
        nl[16].image = INS
        nl[17].image = Flora
        nl[18].image = Braulio_Carrillo
        nl[19].image =Fortin 
        nl[20].image = Irazu
        nl[21].image = Caldera
        nl[22].image = Intercontinental
        nl[23].image = Carcel
   #Widgets del Juego
    fondo5 = cargarImagen("fondo5.gif")    
    labeltitulo=Label(ventana_principal,image=fondo5,width=660,height=650)
    labeltitulo.image=fondo5
    labeltitulo.place(x=134,y=133)
    fondo6 = cargarImagen("fondo6.gif")    
    labeltitulo4=Label(fondo2,image=fondo6,width=1200,height=1200)
    labeltitulo4.image=fondo6
    labeltitulo4.place(x=0,y=0)
    lblBanco=Label(ventana_principal, text="BANCO",bg="white", font=("Comic Sans MS",16)).place(x=230,y=550)
    lblMontoBanco=Label(ventana_principal,bg="white", text="¢"+str(montoBanco), font=("Comic Sans MS",16)).place(x=200,y=600)
         
    #Depende de la cantidad de jugadores
    if Jugadores == 2:
       #Carga los elementos
       imageJUT = cargarImagen("sombreroTablero.gif")
       lblJUT=Label(ventana_principal,image=imageJUT,bg="Black").place(x=posX,y=posX)
       imageJU = cargarImagen("sombreroInterfaz.gif")
       lblJU=Label(ventana_principal,image=imageJU,bg="Black").place(x=950,y=30)
       lblJ1=Label(ventana_principal, text="Jugador 1",font=("Comic Sans MS",12),fg="red",bg="black").place(x=950,y=100)
       lblNJ1=Label(ventana_principal, text=J1,fg="red",font=("Comic Sans MS",12),bg="black").place(x=950,y=140)
       lblMJ1=Label(ventana_principal, text="¢"+str(montoJugador1),fg="red",font=("Comic Sans MS",12),bg="black").place(x=950,y=180)
       imageJDT = cargarImagen("zapatoTablero.gif")
       lblJUT=Label(ventana_principal,image=imageJDT,bg="Black").place(x=810,y=850)
       imageJD = cargarImagen("zapatoInterfaz.gif")
       lblJD=Label(ventana_principal,image=imageJD,bg="Black").place(x=1150,y=5)
       lblJ2=Label(ventana_principal, text="Jugador 2",font=("Comic Sans MS",12),fg="Green",bg="black").place(x=1150,y=100)        
       lblNJ2=Label(ventana_principal, text=J2,fg="Green",font=("Comic Sans MS",12),bg="black").place(x=1150,y=140)        
       lblMJ2=Label(ventana_principal, text="¢"+str(montoJugador2),fg="Green",font=("Comic Sans MS",12),bg="black").place(x=1150,y=180)
    elif Jugadores == 3:
       imageJUT = cargarImagen("sombreroTablero.gif")
       lblJUT=Label(ventana_principal,image=imageJUT,bg="Black").place(x=810,y=810)
       imageJU = cargarImagen("sombreroInterfaz.gif")
       lblJU=Label(ventana_principal,image=imageJU,bg="Black").place(x=950,y=30)
       lblJ1=Label(ventana_principal, text="Jugador 1",font=("Comic Sans MS",12),fg="red",bg="black").place(x=950,y=100)
       lblNJ1=Label(ventana_principal, text=J1,fg="red",font=("Comic Sans MS",12),bg="black").place(x=950,y=140)
       lblMJ1=Label(ventana_principal, text="¢"+str(montoJugador1),fg="red",font=("Comic Sans MS",12),bg="black").place(x=950,y=180)
       imageJDT = cargarImagen("zapatoTablero.gif")
       lblJUT=Label(ventana_principal,image=imageJDT,bg="Black").place(x=810,y=850)
       imageJD = cargarImagen("zapatoInterfaz.gif")
       lblJD=Label(ventana_principal,image=imageJD,bg="Black").place(x=1150,y=5)
       lblJ2=Label(ventana_principal, text="Jugador 2",font=("Comic Sans MS",12),fg="Green",bg="black").place(x=1150,y=100)        
       lblNJ2=Label(ventana_principal, text=J2,fg="Green",font=("Comic Sans MS",12),bg="black").place(x=1150,y=140)        
       lblMJ2=Label(ventana_principal, text="¢"+str(montoJugador2),fg="Green",font=("Comic Sans MS",12),bg="black").place(x=1150,y=180)
       imageJTT = cargarImagen("carroTablero.gif")
       lblJTT=Label(ventana_principal,image=imageJTT,bg="Black").place(x=880,y=810)
       imageJT = cargarImagen("carroInterfaz.gif")
       lblJT=Label(ventana_principal,image=imageJT,bg="Black").place(x=950,y=420)
       lblJ3=Label(ventana_principal, text="Jugador 3",font=("Comic Sans MS",12),fg="Blue",bg="black").place(x=950,y=495)     
       lblNJ3=Label(ventana_principal, text=J3,fg="Blue",font=("Comic Sans MS",12),bg="black").place(x=950,y=535)
       lblMJ3=Label(ventana_principal, text="¢"+str(montoJugador3),fg="Blue",font=("Comic Sans MS",12),bg="black").place(x=950,y=575)
    else:
       
       imageJUT = cargarImagen("sombreroTablero.gif")
       lblJUT=Label(ventana_principal,image=imageJUT,bg="Black").place(x=810,y=810)
       imageJU = cargarImagen("sombreroInterfaz.gif")
       lblJU=Label(ventana_principal,image=imageJU,bg="Black").place(x=950,y=30)
       lblJ1=Label(ventana_principal, text="Jugador 1",font=("Comic Sans MS",12),fg="red",bg="black").place(x=950,y=100)
       lblNJ1=Label(ventana_principal, text=J1,fg="red",font=("Comic Sans MS",12),bg="black").place(x=950,y=140)
       lblMJ1=Label(ventana_principal, text="¢"+str(montoJugador1),fg="red",font=("Comic Sans MS",12),bg="black").place(x=950,y=180)
       imageJDT = cargarImagen("zapatoTablero.gif")
       lblJUT=Label(ventana_principal,image=imageJDT,bg="Black").place(x=810,y=850)
       imageJD = cargarImagen("zapatoInterfaz.gif")
       lblJD=Label(ventana_principal,image=imageJD,bg="Black").place(x=1150,y=5)
       lblJ2=Label(ventana_principal, text="Jugador 2",font=("Comic Sans MS",12),fg="Green",bg="black").place(x=1150,y=100)        
       lblNJ2=Label(ventana_principal, text=J2,fg="Green",font=("Comic Sans MS",12),bg="black").place(x=1150,y=140)        
       lblMJ2=Label(ventana_principal, text="¢"+str(montoJugador2),fg="Green",font=("Comic Sans MS",12),bg="black").place(x=1150,y=180)
       imageJTT = cargarImagen("carroTablero.gif")
       lblJTT=Label(ventana_principal,image=imageJTT,bg="Black").place(x=880,y=810)
       imageJT = cargarImagen("carroInterfaz.gif")
       lblJT=Label(ventana_principal,image=imageJT,bg="Black").place(x=950,y=420)
       lblJ3=Label(ventana_principal, text="Jugador 3",font=("Comic Sans MS",12),fg="Blue",bg="black").place(x=950,y=495)     
       lblNJ3=Label(ventana_principal, text=J3,fg="Blue",font=("Comic Sans MS",12),bg="black").place(x=950,y=535)
       lblMJ3=Label(ventana_principal, text="¢"+str(montoJugador3),fg="Blue",font=("Comic Sans MS",12),bg="black").place(x=950,y=575)
       imageJCT = cargarImagen("barcoTablero.gif")
       lblJCT=Label(ventana_principal,image=imageJCT,bg="Black").place(x=880,y=850)
       imageJC = cargarImagen("barcoInterfaz.gif")
       lblJC=Label(ventana_principal,image=imageJC,bg="Black").place(x=1150,y=420)
       lblJ4=Label(ventana_principal, text="Jugador 4",font=("Comic Sans MS",12),fg="Yellow",bg="black").place(x=1150,y=520)
       lblNJ4=Label(ventana_principal, text=J4,fg="Yellow",font=("Comic Sans MS",12),bg="black").place(x=1150,y=560)
       lblMJ4=Label(ventana_principal, text="¢"+str(montoJugador4),fg="Yellow",font=("Comic Sans MS",12),bg="black").place(x=1150,y=600)


    tablero()

    dado1=cargarImagen("dado1.gif")
    dado2=cargarImagen("dado2.gif")
    dado3=cargarImagen("dado3.gif")
    dado4=cargarImagen("dado4.gif")
    dado5=cargarImagen("dado5.gif")
    dado6=cargarImagen("dado6.gif")

    def anima(): #funcion para la animacion del dado
       #Variables globales
       global x
       global activado
       global valorDado
       global posX
       global posY
       global jugador1
       x=dado()
       valorDado=dado()
       #ciclo para la animacion
       for i in range(0,6):

          try:
             if x==1:
                lbldado=Label(ventana_principal, image=dado1).place(x=680,y=150)
                x=dado()               
                time.sleep(0.5)
             if x==2:
                lbldado=Label(ventana_principal, image=dado2).place(x=680,y=150)
                x=dado()
                time.sleep(0.5)
             if x==3:
                lbldado=Label(ventana_principal, image=dado3).place(x=680,y=150)
                x=dado()
                time.sleep(0.5)
             if x==4:
                lbldado=Label(ventana_principal, image=dado4).place(x=680,y=150)
                x=dado()
                time.sleep(0.5)
             if x==5:            
                lbldado=Label(ventana_principal, image=dado5).place(x=680,y=150)
                x=dado()
                time.sleep(0.5)
             if x==6:
                lbldado=Label(ventana_principal, image=dado6).place(x=680,y=150)
                x=dado()
                time.sleep(0.5)
               
          except Exception as txt:
              print("espere a que termine el dado") 
       #Pone la ultima imagen de acuerdo al valor del dado
       if valorDado==1:
          lbldado=Label(ventana_principal, image=dado1).place(x=680,y=150)

       if valorDado==2:
          lbldado=Label(ventana_principal, image=dado2).place(x=680,y=150)
       
       if valorDado==3:
          lbldado=Label(ventana_principal, image=dado3).place(x=680,y=150)
    
       if valorDado==4:
          lbldado=Label(ventana_principal, image=dado4).place(x=680,y=150)
      
       if valorDado==5:            
          lbldado=Label(ventana_principal, image=dado5).place(x=680,y=150)

       if valorDado==6:
          lbldado=Label(ventana_principal, image=dado6).place(x=680,y=150)
    def ver_dado(): #Funcion que inicia el hilo de la animacion del dado
       global activado
       activado=True
       a = Thread(target=anima, args=())
       a.start()
    imagebntdado=cargarImagen("Push.gif")     
    bntdado=Button(ventana_principal,image=imagebntdado,command=ver_dado).place(x=690,y=270)
   
    ventana_principal.mainloop() #loop
def inicia():#Funcion que inicia las instancias
   #variables globales
   global J1
   global J2
   global J3
   global J4
   global Jugadores
   global montoJugador1
   #instancias  
   banquero=Banco(0,0,[],0,4)
   banquero.cargaBaraja()
   banquero.cargaConfiguracion()
   #Segun el numero de jugadores
   if Jugadores == 2:
      J1=J1.get()
      J2=J2.get()
      jugador1=Jugador(J1,0,0,[810,810],0,montoJugador1)
      jugador1.realizaCompra()
      jugador1.posJugador()
      jugador2=Jugador(J2,0,0,0,0,montoJugador2)
      jugador1.realizaCompra()
   elif Jugadores == 3:
      J1=J1.get()
      J2=J2.get()
      J3=J3.get()
      jugador1=Jugador(J1,0,0,0,0,montoJugador1)
      jugador2=Jugador(J2,0,0,0,0,montoJugador2)
      jugador3=Jugador(J3,0,0,0,0,montoJugador3)
   else:
      J1=J1.get()
      J2=J2.get()
      J3=J3.get()
      J4=J4.get()
      jugador1=Jugador(J1,0,0,0,0,montoJugador1)
      jugador2=Jugador(J2,0,0,0,0,montoJugador2)
      jugador3=Jugador(J3,0,0,0,0,montoJugador3)
      jugador4=Jugador(J4,0,0,0,0,montoJugador4)
  
   juego()

def dosJugadores(): #crea ventana de dos jugadores
   global J1
   global J2
   global Jugadores
    
   Jugadores=2
   menu.withdraw()
   datosDJ = Toplevel()
   datosDJ.title("DOS JUGADORES")
   datosDJ.geometry("500x500+100+10")
   datosDJ.resizable(width=NO,height=NO)
   
   fondo7 = Canvas(datosDJ , width=500,height=500,bg="black")
   fondo7.place(x=0,y=0)
   def atras():# Funcion boton atras
      datosDJ.destroy()
      menu.deiconify()
   def aceptar(): #funcion boton aceptar
      datosDJ.destroy()
      inicia()
   #Widgets   
   fondo6 = cargarImagen("FondoJugadores2.gif")    
   labeltitulo3=Label(fondo7,image=fondo6,width=500,height=500)
   labeltitulo3.image=fondo6
   labeltitulo3.place(x=0,y=0)
   lblJugador1=Label(datosDJ, text="Jugador 1",bg="white",font=("Comic Sans MS",22)).place(x=170,y=200)
   lblJugador2=Label(datosDJ, text="Jugador 2",bg="white",font=("Comic Sans MS",22)).place(x=170,y=300)    
   J1=StringVar()
   txtJugador1=Entry(datosDJ,textvariable=J1,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=250)
   J2=StringVar()
   txtJugador1=Entry(datosDJ,textvariable=J2,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=350)
   btnAtras=Button(datosDJ, text="Atras",command=atras,font=("Comic Sans MS",12),bg="grey").place(x=120,y=450)
   btnAceptar=Button(datosDJ, text="Aceptar",command=aceptar,font=("Comic Sans MS",12),bg="grey").place(x=270,y=450)
   

   
def tresJugadores(): #crea ventana de tres jugadores
    global J1
    global J2
    global J3
    global Jugadores
     
    Jugadores=3
    menu.withdraw()
    datosTJ = Toplevel()
    datosTJ.title("TRES JUGADORES")
    datosTJ.geometry("500x500+100+10")
    datosTJ.resizable(width=NO,height=NO)
    fondo8 = Canvas(datosTJ , width=500,height=500,bg="black")
    fondo8.place(x=0,y=0)
    def atras():# Funcion boton atras
        datosTJ.destroy()
        menu.deiconify()
    def aceptar(): #funcion boton aceptar
        datosTJ.destroy()
        inicia()
    #Widgets
    fondo9 = cargarImagen("FondoJugadores2.gif")    
    labeltitulo6=Label(fondo8,image=fondo9,width=500,height=500)
    labeltitulo6.image=fondo9
    labeltitulo6.place(x=0,y=0)
    lblJugador1=Label(datosTJ, text="Jugador 1",bg="white",font=("Comic Sans MS",22)).place(x=150,y=150)
    lblJugador2=Label(datosTJ, text="Jugador 2",bg="white",font=("Comic Sans MS",22)).place(x=150,y=250)
    lblJugador3=Label(datosTJ, text="Jugador 3",bg="white",font=("Comic Sans MS",22)).place(x=150,y=350)
    J1=StringVar()
    txtJugador1=Entry(datosTJ,textvariable=J1,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=200)
    J2=StringVar()
    txtJugador2=Entry(datosTJ,textvariable=J2,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=300)
    J3=StringVar()
    txtJugador3=Entry(datosTJ,textvariable=J3,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=400)
    btnAtras=Button(datosTJ, text="Atras",command=atras,font=("Comic Sans MS",12),bg="grey").place(x=120,y=450)
    btnAceptar=Button(datosTJ, text="Aceptar",command=aceptar,font=("Comic Sans MS",12),bg="grey").place(x=270,y=450)
                      
def cuatroJugadores():#crea ventana de cuatro jugadores
    global J1
    global J2
    global J3
    global J4
    global Jugadores
    Jugadores=4
    menu.withdraw()
    datosCJ = Toplevel()
    datosCJ.title("DOS JUGADORES")
    datosCJ.geometry("500x500+100+10")
    datosCJ.resizable(width=NO,height=NO)
    fondo10 = Canvas(datosCJ , width=500,height=500,bg="black")
    fondo10.place(x=0,y=0)
    fondo11 = cargarImagen("FondoJugadores2.gif")    
    labeltitulo7=Label(fondo10,image=fondo11,width=500,height=500)
    labeltitulo7.image=fondo11
    labeltitulo7.place(x=0,y=0)
    def atras():# Funcion boton atras
        datosCJ.destroy()
        menu.deiconify()
    def aceptar(): #funcion boton aceptar
        datosCJ.destroy()
        inicia()
    #Widgets
    lblJugador1=Label(datosCJ, text="Jugador 1",bg="white",font=("Comic Sans MS",22)).place(x=150,y=50)
    lblJugador2=Label(datosCJ, text="Jugador 2",bg="white",font=("Comic Sans MS",22)).place(x=150,y=150)
    lblJugador3=Label(datosCJ, text="Jugador 3",bg="white",font=("Comic Sans MS",22)).place(x=150,y=250)
    lblJugador4=Label(datosCJ, text="Jugador 4",bg="white",font=("Comic Sans MS",22)).place(x=150,y=350)
    J1=StringVar()
    txtJugador1=Entry(datosCJ,textvariable=J1,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=100)
    J2=StringVar()
    txtJugador2=Entry(datosCJ,textvariable=J2,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=200)
    J3=StringVar()
    txtJugador3=Entry(datosCJ,textvariable=J3,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=300)
    J4=StringVar()
    txtJugador4=Entry(datosCJ,textvariable=J4,font=("Comic Sans MS",18),justify=CENTER).place(x=100, y=400)
    btnAtras=Button(datosCJ, text="Atras",command=atras,font=("Comic Sans MS",12),bg="grey").place(x=120,y=450)
    btnAceptar=Button(datosCJ, text="Aceptar",command=aceptar,font=("Comic Sans MS",12),bg="grey").place(x=270,y=450)
                      
def ventAyuda(): #crea ventana de ayuda
    ventAyuda = Toplevel()
    ventAyuda.title("AYUDA")
    ventAyuda.geometry("500x300+100+10")
    ventAyuda.resizable(width=NO,height=NO)
    lbldatos=Label(ventAyuda,text="Minipoly Costa Rica, compra, vende, juega y diviértete",font=("Comic Sans MS",12)).place(x=40,y=20)
    lbldatos1=Label(ventAyuda,text="Puedes escoger cuantos jugadores quieres",font=("Comic Sans MS",12)).place(x=80,y=60)
    lbldatos2=Label(ventAyuda,text="Tira de los dados para dirigirte a una propiedad y comprarla",font=("Comic Sans MS",12)).place(x=20,y=100)
    lbldatos3=Label(ventAyuda,text="Administra tu dinero y ten cuidado de no quedar en bancarrota",font=("Comic Sans MS",12)).place(x=16,y=140)
    lbldatos2=Label(ventAyuda,text="Pero sobre todo, diviertete y admira las bellezas de Costa Rica",font=("Comic Sans MS",12)).place(x=14,y=180)
#Widgets del menu   
imagenFondo=cargarImagen("FondoJugadores.gif")        
imagen2Jugadores=cargarImagen("2Jugadores.gif")
imagen3Jugadores=cargarImagen("3Jugadores.gif")
imagen4Jugadores=cargarImagen("4Jugadores.gif")
ayuda=cargarImagen("ayuda.gif")
lblfondo=Label(menu,image=imagenFondo).place(x=0,y=0)
lblJugadores=Label(menu, text="Jugadores",font=("Comic Sans MS",22),bg="white").place(x=425,y=30)
btnJudares2=Button(menu, image=imagen2Jugadores,command=dosJugadores).place(x=450,y=100)
btnJudares3=Button(menu, image=imagen3Jugadores,command=tresJugadores).place(x=425,y=200)
btnJudares4=Button(menu, image=imagen4Jugadores,command=cuatroJugadores).place(x=400,y=300)
bntAyuda=Button(menu, image=ayuda,command=ventAyuda).place(x=900,y=10)



menu.mainloop()



