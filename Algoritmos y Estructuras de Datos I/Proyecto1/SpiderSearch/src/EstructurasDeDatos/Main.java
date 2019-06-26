package EstructurasDeDatos;
//Clase designada para las pruebas de las estructuras de Datos

public class Main {

	public static void main(String[] args) {
	
	Cola colaU = new Cola();
	System.out.println("Esta vacia??? "+colaU.estaVacia());
	
	colaU.addFinal("www.nacion.com"); //addFinal
	colaU.addFinal("www.google.com"); //addInicio
	colaU.addFinal("www.wikipedia.org");
	colaU.addFinal("www.shippuden.tv");


	System.out.println("");
	colaU.imprimir();
	
	colaU.eliminaInicio();;
	System.out.println("");
	colaU.imprimir();
	
	System.out.println("");
	System.out.println(colaU.obtenerInicio());
	System.out.println("Esta vacia??? "+colaU.estaVacia());
	
	







	}

}
