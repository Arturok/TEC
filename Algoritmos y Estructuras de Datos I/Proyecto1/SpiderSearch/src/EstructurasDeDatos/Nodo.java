package EstructurasDeDatos;

public class Nodo{
	
	Object valor;
	Nodo siguiente;
	Nodo anterior;
	Nodo profundidad;
	
	public Nodo(Object valor){ //Constructor de la clase nodo
		
			this.valor = valor;	
			this.siguiente = null;
	}
	
	public Object obtenerValor(){ //Retorna el valor del nodo
		return valor;
	}
	
	public void enlazarSiguiente(Nodo s){ // Enlaza el siguiente nodo a agregar
		siguiente = s;
	}
	
	public void enlazarAnterior(Nodo a){
		anterior = a;
	}
	
	public void enlazarProfundidad(Nodo p){
		profundidad = p;
	}
	
	public Nodo obtenerSiguiente(){ //Retorna el nodo siguiente
		return siguiente;
	}
	
	public Nodo obtenerAnterior(){
		return anterior;
	}
	
	public Nodo obtenerProfundidad(){
		return profundidad;
	}
	
	
}
