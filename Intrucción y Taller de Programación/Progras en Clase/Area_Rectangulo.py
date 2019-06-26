def rectangulo(base, altura):
    if base > 0 and altura > 0 :
        area = base * altura
        perimetro = 2 * ( base + altura )
        return area, perimetro
    else:
        return "ERROR"
