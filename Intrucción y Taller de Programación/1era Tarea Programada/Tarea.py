from Tkinter import *

ventana= Tk()
ventana.title("Juego")
ventana.geometry("500x500+100+100")
ventana.resizable(width = NO, height = NO)
#Crea ventana de Configuraciones
def ventConfig():  
    ventConfig = Toplevel()
    ventConfig.title("Configuracion")
    ventConfig.geometry("300x200+200+200")
    ventConfig.resizable(width=NO,height=NO)
    #Función del Boton Aceptar
    def AceptarConfig():
        #Se destruye la ventana de Configuracion
        ventConfig.destroy()
    #Creando elementos de la configuracion
    lblConfig=Label(ventConfig, text="Configuracion.").place(x=120,y=5)
    lblDisparos=Label(ventConfig,text="Disparos:").place(x=5,y=30)
    lblIncreDisparos=Label(ventConfig,text="Incremento de Disparos por nivel:").place(x=5,y=55)
    lblBombas=Label(ventConfig, text="Bombas:").place(x=5,y=80)
    lblTeleSeg=Label(ventConfig, text="Teletransportaciones Seguras:").place(x=5,y=105)
    spnDisparos=Spinbox(ventConfig,from_=0,to=100,width=5).place(x=200,y=30)
    spnIncreDisparos=Spinbox(ventConfig,from_=0,to=100,width=5).place(x=200,y=55)
    spnBombas=Spinbox(ventConfig,from_=0,to=100,width=5).place(x=200,y=80)
    spnTeleSeg=Spinbox(ventConfig,from_=0,to=100,width=5).place(x=200,y=105)
    btnAceptar=Button(ventConfig, text="Aceptar",command=AceptarConfig).place(x=120,y=150)

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
    #Funcion del boton aceptar
    def AceptarAyuda():
        #destruye la ventana de Ayuda
        ventAyuda.destroy()
    #Creando elementos de la Ayuda
    btnAceptar=Button(ventAyuda, text="Aceptar",command=AceptarAyuda).place(x=120,y=150)

    ventAyuda.mainloop()

#Funcion para salir del Juego
def salir():
    ventana.destroy()
   

#Crea barra del Menú    
barraMenu=Menu(ventana)
#Crea los Menus
mnuJuego=Menu(barraMenu)
mnuOpciones=Menu(barraMenu)
mnuAyuda=Menu(barraMenu)
#Agrega Comandos a el Menu de Juego
mnuJuego.add_command(label="Volver a Iniciar")
mnuJuego.add_separator()
mnuJuego.add_command(label="Salir", command=salir)
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


ventana.mainloop()
