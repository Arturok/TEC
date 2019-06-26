package Parseo;


import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;

//import EstructurasDeDatos.Cola;

/**
 * Clase usada para extraer datos de un archivo.xml
 * @author arturo
 * @version 02/04/2015 
 */

public class XMLParser {
	//Campos de la clase
	String archivo;
	String tag;
	String nuevo = null;
	Peso peso = new Peso();
	/**
	 * Constructor para la funcion que parsea los archivos XML
	 * @param archivo - El parametro recibe el nombre del archivo XML de la forma "nombre.xml" al que se va a acceder
	 * @param tag - El parametro recibe el tag que se desea buscar en el archivo XML de la forma "tag"
	 */		
	public XMLParser(String archivo, String tag){
		this.archivo = archivo;
		this.tag = tag;
		
		
	}//Cierre del Constructor
	/**
	 * Funcion que retorna una cola con los datos parseados
	 * @return Cola con los datos obtenidos
	 */
	public Object  obtenerCola(){
		
		String ruta = "/media/Respaldo/Java/SpiderSearch-Engine-Stage-2/";
		//Cola colaParse = new Cola();
		try {
			peso.SetPeso();
			DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder(); //Se crea un documento builder para parsear el xml
			File f = new File(ruta+archivo); //se carga el xml en un documento 
			Document documento = builder.parse(f); //se crea un documento tipo Document con el xml parseado
			Node nodo = documento;
						
			if(nodo != null){
				//Solo si el nodo es diferente de nulo
				Node padre = documento.getChildNodes().item(0); //Obtiene la primera jerarquia del documento
				NodeList hijos = padre.getChildNodes(); //Obtiene una lista con los nodos de la segunda jerarquia
				try{
					for(int i = 0; i < (hijos.getLength()-1)/2; i++){ 					
						 nuevo = documento.getElementsByTagName(tag).item(i).getTextContent(); //Obtiene el contenido del XML en la posicion i
						 //Introduce las URL's en una lista
					}
				}catch(Exception e){}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;		
	}//Cierre de la funcion
	
	public Object getPeso(){
		return peso.GetPeso();
	}
	public Object getArchivo(){
		return nuevo;
	}
}//Cierre de la clase
