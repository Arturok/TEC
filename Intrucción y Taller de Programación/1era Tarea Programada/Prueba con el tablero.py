from tkinter import *

ventana= Tk()
ventana.title("Juego")
ventana.geometry("500x500+100+100")
ventana.resizable(width = NO, height = NO)
#Crea ventana de Configuraciones
def ventConfig():  
    ventConfig = Toplevel()
    ventConfig.title("Configuración")
    ventConfig.geometry("500x500+200+200")
    ventConfig.resizable(width=NO,height=NO)
    #Función del Boton Aceptar
    def Aceptar():
        #Se destruye la ventana de Configuracion
        ventConfig.destroy()
    #Creando elementos de la configuracion
    lblConfig=Label(ventConfig, text="Configuración.").place(x=120,y=5)
    lblDisparos=Label(ventConfig,text="Disparos:").place(x=5,y=30)
    lblIncreDisparos=Label(ventConfig,text="Incremento de Disparos por nivel:").place(x=5,y=55)
    lblBombas=Label(ventConfig, text="Bombas:").place(x=5,y=80)
    lblTeleSeg=Label(ventConfig, text="Teletransportaciones Seguras:").place(x=5,y=105)
    spnDisparos=Spinbox(ventConfig,from_=0,to=100,width=5).place(x=200,y=30)
    spnIncreDisparos=Spinbox(ventConfig,from_=0,to=100,width=5).place(x=200,y=55)
    spnBombas=Spinbox(ventConfig,from_=0,to=100,width=5).place(x=200,y=80)
    spnTeleSeg=Spinbox(ventConfig,from_=0,to=100,width=5).place(x=200,y=105)
    btnAceptar=Button(ventConfig, text="Aceptar",command=Aceptar).place(x=120,y=150)

    ventConfig.mainloop()    

#Crea ventana de Ayuda
def ventAyuda(): 
    ##Se desvanece la ventana principal
    #ventana.withdraw()
    ventAyuda = Toplevel()
    ventAyuda.title("Ayuda")
    ventAyuda.geometry("300x200+200+200")
    ventAyuda.resizable(width=NO,height=NO)
    ventAyuda.config()
    #Creando elementos de la configuracion

    ventAyuda.mainloop()
#Crea barra del Menú    
barraMenu=Menu(ventana)
#Crea los Menus
mnuJuego=Menu(barraMenu)
mnuOpciones=Menu(barraMenu)
mnuAyuda=Menu(barraMenu)
#Agrega Comandos a el Menu de Juego
mnuJuego.add_command(label="Volver a Iniciar")
mnuJuego.add_separator()
mnuJuego.add_command(label="Salir")
#Agrega Comandos a el Menu de Opciones
mnuOpciones.add_command(label="Salón de la Fama")
mnuOpciones.add_command(label="Configuración", command=ventConfig)
#Agrega Comandos a el Menu de Ayuda
mnuAyuda.add_command(label="Ayudame", command=ventAyuda)
#Agrega los menus a la barra de Menu
barraMenu.add_cascade(label="Juego", menu=mnuJuego)
barraMenu.add_cascade(label="Opciones", menu=mnuOpciones)
barraMenu.add_cascade(label="Ayuda", menu=mnuAyuda)
#Agrega la barra de Menus a la ventana
ventana.config(menu=barraMenu)

Contenedor=Canvas(ventana, bg="Blue",width=400, height=400).place(x=50,y=90)

cerocero=Label(Contenedor,bg="#BDBDBD",width=3).grid(row=10,column=0)
cerouno=Label(Contenedor,bg="#D8D8D8",width=3).grid(row=10,column=1)

ventana.mainloop()
