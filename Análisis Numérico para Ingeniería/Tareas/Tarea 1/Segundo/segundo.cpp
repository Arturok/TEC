
/*	
*	segundo.cpp
*	Purpose: Accumulate a given number n times some other number x and calculate the true error 
*	of adding n = 10 000 000 times the number x = 0.00001, with simple and double numerical precision
*	@author Arturo Chinchilla
*	02/21/2018
*	@version 1.0
*/

#include <iostream>
#include <stdlib.h>
#include <cmath>

using namespace std;

//Using Templates
/*
*
*/
template <typename myType>
inline myType const& segundo(int & n, myType & x) {
	float temp;
	myType addResult = 0;
	string precisionType;

	for (int i = 0; i < n; i++)
	{
		addResult += x;
	}

	if (sizeof(temp)==sizeof(addResult)) {
		precisionType = "simple";
	}
	else {
		precisionType = "doble";	
	}
	cout <<  "Para la precision " << precisionType << endl;
	cout <<  "Resultado de la suma: " << addResult << endl;
	cout <<  "Error verdadero: " << abs((n*x)-addResult) << endl;

}


/*
*	Main method
*	Compile using ./run: default values or ./run n x for customized values
*	@values n correspond to the number of times that the value x will be added
*/
int main(int nargs, char *args[]) {
	int n = 10000000;
	float simplePrecision = 0.00001;
	double doublePrecision = 0.00001;
	//case for no
	if (nargs == 1) {
		//Use defaults
	}
	else if(nargs == 3) {
		try {
			n = atoi(args[1]);
			simplePrecision = atof(args[2]);
			doublePrecision = strtod(args[2], NULL);
		}
		catch (const exception& e) {
			cout <<  "Se encontró una exepción en el programa: "
                  << e.what() << endl;
            return -1;
		}
	}
	else{
		cout << "Error con los parámetros, ejecute de la forma: " << endl;
		cout << "./run para ejecutar con los valores predefinidos." << endl;
		cout << "./run n x para usar valores personalizados." << endl;
        return -1;
	}

	segundo(n, simplePrecision);
	segundo(n,doublePrecision);
	return 0;
}