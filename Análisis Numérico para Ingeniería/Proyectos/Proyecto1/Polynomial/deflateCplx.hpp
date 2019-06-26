/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   deflateCplx.hpp
 * Author: jeremy
 *
 * Created on 18 de marzo de 2018, 12:16 PM
 */

/**
 * Includes
 */
#include <boost/math/tools/polynomial.hpp>
#include <iostream>
#include <queue>
#include <stack>
#include <complex>
#include <cmath>

#ifndef DEFLATECPLX_HPP
#define DEFLATECPLX_HPP
#define debug

using std::string;
using std::exception;
using std::cout;
using std::abs;
using std::pair;

using namespace std;
using namespace boost::math;
using namespace boost::math::tools; // for polynomial
using boost::lexical_cast;

namespace anpi {
    
    /**
     * Realiza la deflacion polinomial para polinomios con raices complejas.
     * @param poly Polinomio
     * @param root Una de las raices conocidas
     * @param residuo Polinomio de tipo complejos 
     * (con las partes imaginarias iguales a cero) con el residuo esperado
     * @return Polinomio deflacionado
     */
    template<typename T>
    polynomial<complex<T>> deflate2 (const polynomial<T>& poly, complex<T>& root,
                            polynomial< complex<T>>& residuo){
        //Insertar coeficientes a una lista (Polynomial no permite editar valores)
        polynomial<complex<T>> coef[poly.size()];
        for (int i = 0; i<poly.size();++i){
            coef[i] = poly[i];
        }
        //Imprimir polinomio a deflacionar
        for (int i = poly.degree();i>=0;--i){
            cout<<coef[i]<<"x^"<<i;
            if(i!=0) cout<<"+";
        }
        cout<<"\n";
        
        //Disminuir grado del polinomio y agregarlo como residuo.
        residuo = poly[poly.degree()];
        coef[poly.degree()] = 0;
        
        #ifdef debug
            cout << "Deflation complex method started." << endl;
        #endif
        for (int i = poly.degree()-1;i>=0;--i){
            polynomial<complex<T>> s = coef[i];
            coef[i] = residuo;
            residuo = s.operator +=(residuo.operator *=(root));
        }
        residuo = coef[poly.degree()-1];
        root = conj(root);
        coef[poly.degree()-1] = 0;
        
        for (int i = poly.degree()-2;i>=0;--i){
            polynomial<complex<T>> s = coef[i];
            coef[i] = residuo;
            residuo = s.operator +=(residuo.operator *=(root));
            cout<<coef[i]<<"x^"<<i;
            if(i!=0) cout<<"+";
        }
        cout<<"\n";
        
        #ifdef debug
            cout << "Deflation complex method ended." << endl;
	#endif

        //Pasa datos de tipo polynomial de "coef[]" a un arreglo como datos
        //numericos, para seguidamente pasarlos al polynomio que se debe retornar
        complex<T> tmp_array[poly.size()-2];
        for(int i = poly.degree()-2; i>=0;--i){
            polynomial<complex<T>> a = coef[i];
            tmp_array[i] = a[0];
        }
        
        polynomial<complex<T>> tmp_pol(tmp_array,poly.degree()-2);
        return tmp_pol;
    }
}

#endif /* DEFLATECPLX_HPP */

