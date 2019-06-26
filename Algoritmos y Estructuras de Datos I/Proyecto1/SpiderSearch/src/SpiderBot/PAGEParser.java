package SpiderBot;



import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import java.net.URL;
import java.io.BufferedReader;



public class PAGEParser {
	
	URL url;
	
	public PAGEParser(){
	}
	

	public void parsear(URL url) throws IOException{
		this.url = url;
	    InputStream is = url.openConnection().getInputStream();

	    BufferedReader reader = new BufferedReader( new InputStreamReader( is )  );

	    String line = null;
	    while( ( line = reader.readLine() ) != null )  {
	       System.out.println(line);
	    }
	    reader.close();
	
		
		
		
		
		
		
	}
	

}
