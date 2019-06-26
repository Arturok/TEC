class robot():
    estado = int
    posicionx = int
    posiciony = int


       

    def vida(self):
        if self.estado() == 0:
            return "Estoy Muerto "
        else:
            return "Estoy Vivo "
    def posicion(self):
        return "(self.posicionx(), self.posiciony())"

    print("y tengo las cordenadas: " + self.posicion)
    
robotcito = robot()
robotcito.estado = 1
robotcito.posicionx = 10
robotcito.posiciony = 15
#robotcito.vida()
robotcito.posicion()

    
