package EstructurasDeDatos;

public class ListaEnlazada {
	
	Nodo cabeza;
	Nodo cola;
	int size;
	
	public ListaEnlazada(){ //Constructor de la clase ListaEnlazada
		
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
		}
		else{ //caso lista con elementos dentro
			Nodo temp = cabeza; //temporal apunta al primer nodo
			Nodo nuevo = new Nodo(obj); //crea el nodo nuevo fuera de la lista
			nuevo.enlazarSiguiente(temp); //el nuevo nodo apunta al inicio de la lista
			cabeza = nuevo; //el nodo nuevo ahora es la cabeza
		}
		size++; //suma 1 al contador de tamanio cuando se agrega un nodo
	}
	
	public void addFinal(Object obj){ //Metodo que agrega nodos al inicio de la lista
		
		if(estaVacia()){
			cabeza = new Nodo(obj);
			cola = cabeza;
		}
		else{
			Nodo temp = cola;
			Nodo nuevo = new Nodo(obj);
			temp.enlazarSiguiente(nuevo);
			cola = nuevo;
			//cola.enlazarSiguiente(null);;
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

	public void eliminaFinal(){ //Metodo para eliminar al final
		if(cabeza == null)
			System.out.println("La lista esta vacia"); //
		else{
			Nodo temp = cabeza;
			int contador = 0;
			while(contador < size){
				temp = temp.obtenerSiguiente();
				contador++;				
			}		
			cola = temp;
		}
		size--;		
	}
	
	public void eliminarenPos(int indice){
		if(indice == 0)
			eliminaInicio();
		else if(indice == getSize()-1)
			eliminaFinal();
		else{
			int contador = 1;
			Nodo temp = cabeza;
			while(contador < indice){
				temp = temp.obtenerSiguiente();
				contador++;			
			}
			temp.enlazarSiguiente(temp.obtenerSiguiente().obtenerSiguiente());
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
