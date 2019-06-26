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

#ifndef ANPI_ROOT_SECANT_HPP
#define ANPI_ROOT_SECANT_HPP
#define MAXIT 30

namespace anpi {

  /**
   * Find a root of the function funct looking for it starting at xi
   * by means of the secant method.
   *
   * @param funct a functor of the form "T funct(T x)"
   * @param xi initial position
   * @param xii second initial position
   *
   * @return root found, or NaN if no root could be found
   */
  template<typename T>
  T rootSecant(const std::function<T(T)>& funct,T xi,T xii,const T eps) {

    //printf("EPS recived: %fl\n",eps);

    // TODO: Put your code in here!
    //void nrerror(char error_text[]);
    int j;
    T f1, f, dx, swap, xl, rts;
    
    f1 = funct(xi);
    f = funct(xii);

    if(funct(xi)*funct(xii)>T(0)){
      throw anpi::Exception("Uneclosed root");
    }

    if(xi>=xii){
      throw anpi::Exception("Inverted interval");
    }

    if(fabs(f1)<fabs(f)){
      rts = xi;
      xl = xii;
      swap = f1;
      f1 = f;
      f = swap;
    }
    else{
      xl = xi;
      rts = xii;
    }
    for (j = 1; j<=MAXIT; j++){
      dx = (xl-rts)*f/(f-f1);
      xl = rts;
      f1 = f;
      rts += dx;
      f = funct(rts);
      /*
      std::printf("dx >> %fl\n",fabs(dx));
      std::printf("rts >> %fl\n",rts);
      std::printf("f >> %fl\n",f);
      std::printf("eps >> %fl\n",eps);
      std::printf("f == t(0): %s\n",f == T(0) ? "true":"false");
      */
      if(fabs(dx) < eps || f == T(0)){
        //std::printf("rts >> %fl\n",rts);       
        return rts;
      } 

    }
    std::printf("Not a number\n");
     // Return NaN if no root was found
    return std::numeric_limits<T>::quiet_NaN();
  }
}

#endif
