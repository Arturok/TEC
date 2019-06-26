
/*	
*	tercero.cpp
*	Purpose: provides the roots of the quadratic equation ax2 + bx + c = 0, for simple and double numerical precisions.
*	@author Arturo Chinchilla
*	02/22/2018
*	@version 1.0
*/

#include <iostream>
#include <stdlib.h>
#include <cmath>

using namespace std;

template <typename myType>
inline myType const& tercero(myType & a, myType & b, myType & c) {
	myType discriminant = (b*b)-(4*a*c);
	float temp;
	string precisionType;
	if (sizeof(temp)==sizeof(a)) {
		precisionType = "SIMPLE";
	}
	else {
		precisionType = "DOBLE";	
	}

	cout << "--------------------------------------------------" << endl;
	cout <<  "PARA LA PRECISION " << precisionType << endl;

	if (discriminant < 0) {
		cout << "Los valores ingresados no tienen una solución real" << endl;
	}
	else {
		try {
			myType x1;
			myType x2;
			myType x3;
			myType x4;

			x1 = ((-b+sqrt(discriminant))/(2*a));
			x2 = ((-b-sqrt(discriminant))/(2*a));
			x3 = ((-2*c)/(b+sqrt(discriminant)));
			x4 = ((-2*c)/(b-sqrt(discriminant)));

			cout << "Raíces usando la fórmula cuadrática tradicional:" << endl;
			cout << "X1 = " << x1 << endl;
			cout << "X2 = " << x2 << endl;
			cout << "Raíces usando la fórmula cuadrática alternativa:" << endl;
			cout << "X1 = " << x3 << endl;
			cout << "X2 = " << x4 << endl;
			cout << "--------------------------------------------------" << endl;

		}
		catch (const exception& e) {
			cout << "No se pudo realizar la operación: " << e.what() << endl;
		}





	}

}
/*
*	Main method
*	Compile using ./run: default values or ./run a b c for customized values
* 	@values a, b, c correspond to the values of the quadratic equation ax^2 + bx + c = 0
*/
int main(int nargs, char *args[]) {
	float simplePrecision[3] = {1, 3000.001, 3};
	double doublePrecision[3] = {1, 3000.001, 3};
	cout << "Función: " << doublePrecision[0] << "x^2+" << doublePrecision[1] << "x+" << doublePrecision[2] << "=0" << endl;
	if (nargs == 1) {
		//Use defaults
	}
	else if (nargs == 4){
		try {
			for (int i = 1; i < 4; i++)
			{
				simplePrecision[i-1] = atof(args[i]);
				doublePrecision[i-1] = strtod(args[i], NULL);
			}
		}
		catch(const exception& e) {
			cout <<  "Se encontró una exepción en el programa: " << e.what() << endl;
           	return -1;
		}
	}
	else {
		cout << "Error con los parámetros, ejecute de la forma: " << endl;
		cout << "./run para ejecutar con los valores predefinidos." << endl;
		cout << "./run a b c para usar valores personalizados." << endl;
       return -1;
	}
	tercero(simplePrecision[0],simplePrecision[1],simplePrecision[2]);
	tercero(doublePrecision[0],doublePrecision[1],doublePrecision[2]);
	return 0;
}
