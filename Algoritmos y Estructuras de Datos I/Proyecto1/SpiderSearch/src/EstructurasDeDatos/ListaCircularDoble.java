package EstructurasDeDatos;

public class ListaCircularDoble {
	
	Nodo cabeza;
	Nodo cola;
	int size;
	
	public ListaCircularDoble(){ //Constructor de la clase ListaEnlazada
		
		cabeza = null;
		cola = null;
		size = 0;
	}
	
	public boolean estaVacia(){ //Metodo que verifica si la lista esta vacia
		return(cabeza == null)?true:false;
	}
	
	public void addInicio(Object obj){ //Metodo que agrega nodos al principio de la lista

		if(estaVacia()){ //Caso lista vacia
			cabeza = new Nodo(obj);
			cola = cabeza; //unico nodo es cabeza y cola
			cola.enlazarSiguiente(cabeza);
			cabeza.enlazarAnterior(cola);			
		}
		else{ //caso lista con elementos dentro
			Nodo temp = cabeza; //temporal apunta al primer nodo
			Nodo nuevo = new Nodo(obj); //crea el nodo nuevo fuera de la lista
			nuevo.enlazarSiguiente(temp); //el nuevo nodo apunta al inicio de la lista
			temp.enlazarAnterior(nuevo); //la vieja cabeza apunta al nodo anterior, la nueva cabeza
			cabeza = nuevo; //el nodo nuevo ahora es la cabeza
			cabeza.enlazarAnterior(cola); //la nueva cabeza apunta al nodo anterior, la cola
			cola.enlazarSiguiente(cabeza); //la cola apunta al siguiente nodo, la nueva cabeza
		}
		size++; //suma 1 al contador de tamanio cuando se agrega un nodo
	}
	
	public void addFinal(Object obj){ //Metodo que agrega nodos al inicio de la lista
		
		if(estaVacia()){
			cabeza = new Nodo(obj);
			cola = cabeza;
			cola.enlazarSiguiente(cabeza);
			cabeza.enlazarAnterior(cola);
		}
		else{
			Nodo temp = cola;
			Nodo nuevo = new Nodo(obj);
			temp.enlazarSiguiente(nuevo);
			nuevo.enlazarAnterior(temp);
			cola = nuevo;
			cola.enlazarSiguiente(cabeza);
			cabeza.enlazarAnterior(cola);
		}
		size++; //suma 1 al contador de tamanio cuando se agrega un nodo
	}
	
	public void eliminaInicio(){ //Metodo para eliminar al inicio
		if(cabeza == null)
			System.out.println("La lista esta vacia");
		else{
			cabeza = cabeza.obtenerSiguiente();
			cabeza.enlazarAnterior(cola);
			cola.enlazarSiguiente(cabeza);
		}
		size--;
	}

	public void eliminaFinal(){ //Metodo para eliminar al final
		if(cabeza == null)
			System.out.println("La lista esta vacia"); //
		else{
			cola = cola.obtenerAnterior();
			cola.enlazarSiguiente(cabeza);
			cabeza.enlazarAnterior(cola);			
		}
		size--;		
	}
	
	public void eliminarenPos(int indice){
		if(indice == 0)
			eliminaInicio();
		else if(indice == getSize()-1)
			eliminaFinal();
		else{
			int contador = 0;
			Nodo temp = cabeza;
			Nodo temp2 = null;
			while(contador < indice-1){
				temp = temp.obtenerSiguiente();
				contador++;			
			}
			temp.enlazarSiguiente(temp.obtenerSiguiente().obtenerSiguiente());
			temp2 = temp.obtenerSiguiente();
			temp.enlazarAnterior(temp);
		}
		size--;
	}
	
	public Object obtenerenPos(int indice){ //Metodo para obtener el nodo en una posicion
		int contador = 0;
		Nodo temporal = cabeza;
		while(contador < indice){
			temporal = temporal.obtenerSiguiente();
			contador++;
		}
		return temporal.obtenerValor();			
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
