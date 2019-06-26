package SpiderBot;

import java.net.MalformedURLException;




public class SpiderBot {
	
	
	public SpiderBot(){}
	
	
	public static void main(String[] args) throws MalformedURLException{
		
		XMLParser parseThreads = new XMLParser("spider.xml","maxthreads");
		String maxthread = parseThreads.obtenerCola().obtenerInicio().obtenerValor().toString();
		int maxthreads = Integer.parseInt(maxthread);
		
		listaHilos hilos = new listaHilos();
		hilos.crearHilos(maxthreads);
		
		
	}
	

}
