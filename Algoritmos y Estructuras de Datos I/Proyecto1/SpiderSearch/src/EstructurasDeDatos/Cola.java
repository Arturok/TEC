package EstructurasDeDatos;

public class Cola {
	
	Nodo cabeza;
	Nodo cola;
	int size;	
	
	public Cola(){ //Constructor de la clase ListaEnlazada
		
		cabeza = null;
		cola = null;
		size = 0;
	}
	
	public boolean estaVacia(){ //Metodo que verifica si la lista esta vacia
		return(cabeza == null)?true:false;
	}
	
	public void addFinal(Object obj){ //Metodo que agrega nodos al inicio de la lista
		
		if(estaVacia()){
			cabeza = new Nodo(obj);
			cola = cabeza;
			Nodo p = new Nodo(0);
			cabeza.enlazarProfundidad(p);
		}
		else{
			Nodo temp = cola;
			Nodo nuevo = new Nodo(obj);
			temp.enlazarSiguiente(nuevo);
			cola = nuevo;
			Nodo p = new Nodo(0);
			nuevo.enlazarProfundidad(p);
		}
		size++; //suma 1 al contador de tamanio cuando se agrega un nodo
	}
	
	public void eliminaInicio(){ //Metodo para eliminar al inicio
		if(cabeza == null)
			System.out.println("La lista esta vacia");
		else{
			Nodo temp = cabeza.obtenerSiguiente();
			cabeza = temp;			
		}
		size--;
	}
	
	public Nodo obtenerInicio(){ //Metodo para obtener el nodo en una posicion
		return cabeza;
		//Nodo temp = cabeza;		
		//return temp.obtenerValor();			
	}
	
	public void imprimir(){
		int contador = 0;
		Nodo temp = cabeza;
		while(contador < size){
			System.out.println(temp.obtenerValor().toString());
			temp=temp.obtenerSiguiente();
			contador++;		
		}	
	}
	
	
	public int getSize(){ //metodo para obtener el tamanio de la lista
		return size;
	}
}

	
	


