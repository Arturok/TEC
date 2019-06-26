package SpiderBot;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;

import EstructurasDeDatos.Cola;
import EstructurasDeDatos.ListaEnlazada;

public class listaHilos {
	
	protected class Hilo extends Thread{
		
		URL url;
		int hilo;
				
		public Hilo(int hilo){	
			this.hilo = hilo;
		}
		
		public synchronized void run(){	
			
			
			while(true){
				if(colaURL.estaVacia() == false){
					try {
						String U = colaURL.obtenerInicio().obtenerValor().toString();
						URL url = new URL(U);
						System.out.println("soy el hilo: "+hilo+" y tengo la url: "+url);
						colaURL.eliminaInicio();
						Thread.sleep(10000);
						PAGEParser page = new PAGEParser();
						page.parsear(url);
						
						contador++;
						Thread.sleep(10000);
					} catch (InterruptedException | IOException e) {e.printStackTrace();}
				}
				else{
					//System.out.println("soy el hilo: "+hilo+" y estoy esperando un url");
					try {wait();} catch (InterruptedException e) {e.printStackTrace();}
					contador++;
				}			
			}		
		}
	}
	
	int trabajadores;
	int contador = 0;
	XMLParser urlParser = new XMLParser("targets.xml","URL");
	Cola colaURL = urlParser.obtenerCola();
	
	public listaHilos(){}
	
	public void crearHilos(int trabajadores) throws MalformedURLException{
		
		this.trabajadores = trabajadores;	
		ListaEnlazada listaHilos = new ListaEnlazada();
		
		for(int i = 0; i < trabajadores; i++){		
			Hilo nuevo = new Hilo(i);
			nuevo.start();
			listaHilos.addFinal(nuevo);	
		}	
	}
}
