/**
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, ITCR, Costa Rica
 *
 * This file is part of the numerical analysis lecture CE3102 at TEC
 *
 * @Author: Pablo Alvarado
 * @Date  : 10.02.2018
 */

#include <cmath>
#include <limits>
#include <functional>

#include "Exception.hpp"

#ifndef ANPI_NEWTON_RAPHSON_HPP
#define ANPI_NEWTON_RAPHSON_HPP

namespace anpi {
  
  /**
   * Find the roots of the function funct looking by means of the
   * Newton-Raphson method
   *
   * @param funct a functor of the form "T funct(T x)"
   * @param xi initial root guess
   * 
   * @return root found, or NaN if none could be found.
   *
   * @throws anpi::Exception if inteval is reversed or both extremes
   *         have same sign.
   */
  template<typename T>
  T rootNewtonRaphson(const std::function<T(T)>& funct,T xi,const T eps) {

  	//Varibles necesarias
  	int maxi = std::numeric_limits<T>::digits*4;						//Valor maximo, usado para limitar las iteraciones en caso de un ciclo infinito
  	T xr = xi;														//Raiz
  	T ea = T();
  	//der_xr = ;

  	//Verifica si el valor inicial elegido es cero
  	if (funct(xi) != T(0))
  	{
  		return std::numeric_limits<T>::quiet_NaN();					// Return NaN if no root was found
  	}

  	//Si xi no es cero, comienza iteracion
  	for(int i = maxi; i > 0; --i)
  	{

  		T xrold(xr);												//Valor anterior de xr.

  		if(((funct(xr+0.5)-funct(xr-0.5))/(2*0.5))==T(0))
  		{
  			xr = xr+T(0.00001);										//Si la derivada es cero, sumar decimales
  		}

  		xr = xr-((funct(xr))/((funct(xr+0.5)-funct(xr-0.5))/(2*0.5)));						//Calcula el nuevo xr
  		ea = std::abs((xr-xrold)/xr)*T(100);						//Calcular error aproximado nuevo
  		
  		if(ea < eps)
  		{
  			return xr;												//Devuelve el valor de la raiz si el error es menor que el deseado
  		}
  	}

    // Return NaN if no root was found
    return std::numeric_limits<T>::quiet_NaN();
  }
}
  
#endif
