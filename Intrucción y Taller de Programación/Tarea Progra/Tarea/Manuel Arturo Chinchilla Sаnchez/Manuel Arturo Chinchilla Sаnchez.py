#################################################################################

#Funcion para convertir cualquier base binaria y octal a Decimal
def base(num, base):
    if compara1(num, base)==True:
       return "Su número en base Decimal es: "+str(base_aux(num, base, 0))
    else:
        return "Su número no esta en base: "+str(base)
def base_aux(num, base, exp):
    if num == 0:
        return 0
    else:
        return num%10*base**exp + base_aux(num//10, base, exp+1)
def compara1(num, base):
    try:
        if num == 0:
            return True
        elif 0<= num%10 < base:
            return compara1(num//10, base)
    except Exception as txt:
        return False
#Función para convertir de base hexadecimal a decimal
def hexa(num):
    if isinstance(num,str):
        return "Su número en base Decimal es: "+str(hexa_aux(num,0, len(num)-1))           
def hexa_aux(num,resultado, exp):
    if num == '':
        return resultado
    elif comprueba(num[0]):
        return hexa_aux(num[1:],resultado+int(num[0])*16**exp,exp-1)
    else:        
        if num[0] == "A" or num[0] == "a":
            return hexa_aux(num[1:],resultado+10*16**exp,exp-1)
        elif num[0] == "B" or num[0] == "b":
            return hexa_aux(num[1:],resultado+11*16**exp,exp-1)
        elif num[0] == "C" or num[0] == "c":
            return hexa_aux(num[1:],resultado+12*16**exp,exp-1)
        elif num[0] == "D" or num[0] == "d":
            return hexa_aux(num[1:],resultado+13*16**exp,exp-1)
        elif num[0] == "E" or num[0] == "e":
            return hexa_aux(num[1:],resultado+14*16**exp,exp-1)
        elif num[0] == "F" or num[0] == "f":
            return hexa_aux(num[1:],resultado+15*16**exp,exp-1)
        else:
            return hex([])   
def comprueba(var):
    try:
        if isinstance(int(var[0]),int):
            return True
    except Exception as txt:
        
        return False
    


##############################################################################
#Se importan las librerias necesarias
from Tkinter import *
import os
import winsound
import time
from threading import Thread
import threading

#Variable global
Activado=True
imageDP=0

#Se crea la ventana principal del programa
Ventana = Tk()
Ventana.title("Conversiones a base Decimal") #tittulo de ventana
Ventana.geometry("800x550+200+50") #dimenciones de ventana"AnchoxAlto+PosicionX+PosicionY"
Ventana.resizable(width = NO, height = NO)
Ventana.config(bg = "#AAAAAA")

def resultado ():
    s=select.get()
    e=entradaN.get()
    try:        
        if e != "":
            if s== 0:
                messagebox.showinfo(title="Atención!",message="Por favor seleccione la base de su número.")
            if s==1:
                b2=base(int(e), 2)
                messagebox.showinfo(title="Resultado",message=str(b2))
            elif s==2:
                b8=base(int(e), 8)
                messagebox.showinfo(title="Resultado",message=str(b8))
            elif s==3:
                b16=hexa(e)
                messagebox.showinfo(title="Resultado",message=str(b16))
        else:
            messagebox.showinfo(title="Resultado",message="Por favor ingrese un numero")                                                          
    except Exception as txt:
        messagebox.showinfo(title="Atención!",message="Por favor ingrese un numero válido.")                                                          
    #messagebox.showinfo(title="Resultado",message="Tu numero en decimal es: "+str(s))
    
#Creando la ventana del About
def ventanaAbout(): 
    ##Se desvanece la ventana principal
    Ventana.withdraw()
    ventanaAbout = Toplevel()
    ventanaAbout.title("About")
    ventanaAbout.geometry("800x550+200+50")
    ventanaAbout.resizable(width=NO,height=NO)
    ventanaAbout.config(bg="#AAAAAA")
    #Etiquetas paralos datos
    lblProg=Label(ventanaAbout, text="Datos del Programador",bg="#AAAAAA",font=("Aharoni",12)).place(x=150,y=40)
    lblNomb=Label(ventanaAbout, text="Nombre: Manuel Arturo Chinchilla Sánchez.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=150,y=60)
    lblCarnet=Label(ventanaAbout, text="Carnet: 2013009344.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=150,y=80)
    lblGene=Label(ventanaAbout, text="Género: Masculino.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=150,y=100)
    lblEdad=Label(ventanaAbout, text="Edad: 20 años.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=150,y=120)
    lblDir=Label(ventanaAbout, text="Direccion:75 mts sur de la entrada principal del TEC.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=150,y=140)
    lblPeli=Label(ventanaAbout, text="Película favorita: Piratas del caribe.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=150,y=160)
    lblPeli=Label(ventanaAbout, text="Género de la película: Aventura.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=150,y=180)
    lblActores=Label(ventanaAbout, text="Actores Principales de Piratas del Caribe.",bg="#AAAAAA",font=("Aharoni",12)).place(x=150,y=210)
    #Etiquetas de los nombres de actores
    lblEdad=Label(ventanaAbout, text="Johnny depp.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=30,y=480)
    lblEdad=Label(ventanaAbout, text="Orlando Bloom.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=240,y=480)
    lblEdad=Label(ventanaAbout, text="Keira Knightley.",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=460,y=480)
    #Cargando imagenes
    imagenMapa = cargarImagen("Direccion.gif")
    lblMapa = Label(ventanaAbout, image=imagenMapa).place(x=495,y=20)
    imagenJonny = cargarImagen("Jonny.gif")
    lblJonny = Label(ventanaAbout, image=imagenJonny).place(x=20, y=250)
    imagenOrlando = cargarImagen("Orlando.gif")
    lblOrlando = Label(ventanaAbout, image=imagenOrlando).place(x=230, y=250)
    imagenKeira = cargarImagen("Keira.gif")
    lblKeira = Label(ventanaAbout, image=imagenKeira).place(x=450, y=250)
    imagenProg = cargarImagen("Program.gif")
    lblProg = Label(ventanaAbout, image=imagenProg).place(x=20, y=55)
    #Función para reproducir Sonido
    def sonido():
        winsound.PlaySound('Musica\piratas.wav',winsound.SND_FILENAME )
    ##Metodo para el boton regresar desde la ventana About
    def regresarAbout():
        #Se destruye la ventana About
        ventanaAbout.destroy()
        #Reaparece la ventana principal
        Ventana.deiconify()
    #Boton para regresar a la Ventana Principal desde la ventana de About
    btnVolver = Button(ventanaAbout, text="Regresar",command=regresarAbout,bg = "#000000", fg = "#AAAAAA").place(x=700,y=500)
    #Boton de la música
    imagenPlay = cargarImagen("Play.gif")
    btnMusic = Button(ventanaAbout, image=imagenPlay,command=sonido).place(x=700,y=300)

    ventanaAbout.mainloop()
    #Creando la ventana del Descansa Pantallas
def ventanaDP(): 
    ##Se desvanece la ventana principal
    Ventana.withdraw()
    ventanaDP = Toplevel()
    ventanaDP.title("Descansa Pantalla")
    ventanaDP.geometry("800x550+200+50")
    ventanaDP.resizable(width=NO,height=NO)
    ventanaDP.config(bg="#AAAAAA")
    #Cargando imagenes del Descansa Pantallas
    imagenFondoDP = cargarImagen("FondoDP.gif")
    lblFondo = Label(ventanaDP, image=imagenFondoDP).place(x=0, y=0)
    imagenFondo1 = cargarImagen("1.gif")
    imagenFondo2 = cargarImagen("2.gif")
    imagenFondo3 = cargarImagen("3.gif")

    #Funcion que hace el ciclo de las imagenes
    def descansapantalla():
        global imageDP
        global Activado
        lblFondo = Label(ventanaDP, image=imagenFondo1).place(x=0, y=0)
        time.sleep(3)
        imageDP=1
        while Activado:
            try:
                if imageDP==1:
                    lblFondo = Label(ventanaDP, image=imagenFondo2).place(x=0, y=0)
                    imageDP=2
                    time.sleep(3)
                if imageDP==2:
                    lblFondo = Label(ventanaDP, image=imagenFondo3).place(x=0, y=0)
                    imageDP=3
                    time.sleep(3)
                if imageDP==3:
                    lblFondo = Label(ventanaDP, image=imagenFondo1).place(x=0, y=0)
                    imageDP=1
                    time.sleep(3)
            except Exception as txt:
               print("Por favor precione el boton parar ")
    #Funcion del boton que Inicia el hilo
    def ver_image():
        global Activado
        Activado=True
        ##Crea un hilo
        a = Thread(target=descansapantalla, args=())
        a.start()
    #Funcion del boton terminar hilo
    def parar_image():
        global imageDP
        global Activado
        Activado=False
        imageDP=0
        lblFondo = Label(ventanaDP, image=imagenFondoDP).place(x=0, y=0)
    #Funcion del boton que regresa de la pantalla de descansa pantalla a la ventana principal
    def regresarDP():
        #Se destruye la ventana About
        ventanaDP.destroy()
        #Reaparece la ventana principal
        Ventana.deiconify()
    #Boton para comenzar el hilo
    btnVerImage=Button(ventanaDP,text="Comenzar",command=ver_image).place(x=100,y=515)
    #Boton que termina el hilo
    btnPararImage=Button(ventanaDP,text="Parar",command=parar_image).place(x=200,y=515)
    #Boton que regresa a la ventana Principal desde la ventana de Descansa Pantallas
    btnVolver = Button(ventanaDP, text="Regresar",command=regresarDP).place(x=700,y=515)
    ventanaDP.mainloop()

#Función para cargar imágenes
def cargarImagen(nombre):
    ruta = os.path.join('Imagenes',nombre)
    imagen = PhotoImage(file = ruta)
    return imagen
#Cargando imagenes
imagenFondo = cargarImagen("Fondo3.gif")
lblFondo = Label(Ventana, image=imagenFondo).place(x=0, y=0)
imagenL = cargarImagen("python.gif")
LabelL = Label(Ventana, image=imagenL).place(x=725, y=475)
#Etiquetas de la Ventana Principal
lblBienvenidos=Label(text="Bienvenidos...",bg="#AAAAAA",font=("Aharoni",24)).place(x=290,y=20)
lblDigiteNum=Label(text="Digite su número:",bg="#AAAAAA",font=("Comic Sans MS",14)).place(x=200,y=110)
lblEscojaBase=Label(text="Escoja la base de su número:",bg="#AAAAAA",font=("Comic Sans MS",14)).place(x=99,y=200)
lblDescPant=Label(text="Desc Pant",bg="#AAAAAA",font=("Comic Sans MS",10)).place(x=20,y=438)
#Campo de entrada del numero
entradaN=StringVar()
txtNumero=Entry(Ventana,bg="#AAAAAA",font=("Comic Sans MS",10),textvariable=entradaN,width=35).place(x=370,y=118)
#botones de selección (Spines)
select=IntVar()
spnBaseB=Radiobutton(Ventana,bg="#AAAAAA",text="Binaria",value=1,variable=select).place(x=400,y=200)
spnBaseO=Radiobutton(Ventana,bg="#AAAAAA",text="Octal",value=2,variable=select).place(x=500,y=200)
spnBaseH=Radiobutton(Ventana,bg="#AAAAAA",text="Hexadecimal",value=3,variable=select).place(x=590,y=200)
#boton para calcular
btnCalcular=Button(Ventana,text="Calcular",bg="#AAAAAA",command=resultado,font=("Comic Sans MS",14)).place(x=390,y=300)
#Boton para el About
btnAbout=Button(Ventana,text="About",bg="#AAAAAA",command=ventanaAbout,font=("Comic Sans MS",14)).place(x=710,y=20)
#Boton para el Descansa Pantallas
imagenDescPant = cargarImagen("DescPant.gif")
btnDescPant = Button(Ventana, image=imagenDescPant,command=ventanaDP).place(x=20,y=462)


Ventana.mainloop()
