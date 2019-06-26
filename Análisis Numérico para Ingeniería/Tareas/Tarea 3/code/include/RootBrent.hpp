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

#ifndef ANPI_ROOT_BRENT_HPP
#define ANPI_ROOT_BRENT_HPP

using namespace std;

namespace anpi {
  
  /**
   * Find the roots of the function funct looking for it in the
   * interval [xl,xu], using the Brent's method.
   *
   * @param funct a std::function of the form "T funct(T x)"
   * @param xl lower interval limit
   * @param xu upper interval limit
   *
   * @return root found, or NaN if none could be found.
   *
   * @throws anpi::Exception if inteval is reversed or both extremes
   *         have same sign.
   */
  template<typename T>
  T rootBrent(const std::function<T(T)>& funct,T xl,T xu,const T eps) {

    // TODO: Put your code in here!

    const T maxi= numeric_limits<T>::digits;
    //T iter;
    //int iter = 0;
    T a = xl, b = xu, c = xu, d, e, min1, min2;
    T fa = funct(a), fb = funct(b), fc, p, q, r, s, eps1, xm;

    if ((fa>0.0 && fb>0.0) || (fa<0.0 && fb<0.0)) {

     throw anpi::Exception("Unenclosed root");
    }
    fc=fb;
    if(xl > xu){
      throw anpi::Exception("Inverted interval");
    }
    if((funct(xl)*funct(xu)>T(0))){
      throw anpi::Exception("Unenclosed root");
    }
    for (int iter = maxi*10000; iter > 0; --iter) {
      if ((fb > 0.0 && fc > 0.0) || (fb<0.0 && fc<0.0)) {
        c=a;
        fc=fa;
        e=d=b-a;
      }
      if (fabs(fc) < fabs(fb)) {
        a = b;
        b = c;
        c = a;
        fa = fb;
        fb = fc;
        fc = fa;
      }
      eps1 = 2.0*eps*fabs(b)+0.5*eps; //Chqueo de convergencia
      xm = 0.5*(c-b);
      if (fabs(xm) <= eps1 || fb == 0.0) {
      	return b;
      }
      	
      if (fabs(e) >= eps1 && fabs(fa) > fabs(fb)) {
        s=fb/fa;
        if(a == c) {
          p = 2.0*xm*s;
          q = 1.0-s;
        }
        else {
        q=fa/fc;
          r = fb/fc;
          p = s*(2.0*xm*q*(q-r)-(b-a)*(r-1.0));
          q = (q-1.0)*(r-1.0)*(s-1.0);
        }
        if(p > 0.0) {
        	q = -q;
        }
        p = fabs(p);
        min1 = 3.0*xm*q-fabs(eps1*q);
        min2 = fabs(e*q);
        if (2.0*p < (min1 < min2 ? min1 : min2)) {
          e = d; //Acepta interpolacion
          d = p/q;
        }
        else {
          d = xm;   //Interpolacion fallo, use biseccion
          e = d;
        }
      }
      else {
        d = xm;
        e = d;
      }
      a = b;      // Mueva la última mejor estimación a
      fa = fb;
      if (fabs(d) > eps1)  //Evalua nueva raíz de prueba
        b += d;
      else 
        b += copysign(eps1, xm);
      fb=funct(b);      
    }



    // Return NaN if no root was found
    return std::numeric_limits<T>::quiet_NaN();
  }
}
  
#endif

