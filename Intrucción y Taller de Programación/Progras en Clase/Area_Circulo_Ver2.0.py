import math
def area_circulo(radio):
    if radio > 0:
            area = math.pi * radio ** 2
            return area
    else:
        return "ERROR"

def mi_area():
    calcular = 20
    return area_circulo(calcular)
    
