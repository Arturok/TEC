/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   deflateReal.hpp
 * Author: jeremy
 *
 * Created on 12 de marzo de 2018, 06:57 PM
 */

/**
 * Includes
 */
#include <boost/math/tools/polynomial.hpp>
#include <iostream>
#include <queue>
#include <stack>

#ifndef DEFLATEREAL_HPP
#define DEFLATEREAL_HPP
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
     * Realiza la deflacion polinomial para polinomios con raices reales.
     * @param poly Polinomio
     * @param root Una de las raices conocidas
     * @param residuo Polinomio con el residuo esperado luego de la deflacion
     * @return Polinomio deflacionado
     */
    template<typename T>
    polynomial<T> deflate (const polynomial<T>& poly, const T& root, 
                           polynomial<T>& residuo){
        
        //Insertar coeficientes a una lista (Polynomial no permite editar valores)
        polynomial<T> coef[poly.size()];
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
            cout << "Deflation method started." << endl;
        #endif
        for (int i = poly.degree()-1;i>=0;--i){
            polynomial<T> s = coef[i];
            coef[i] = residuo;
            residuo = s.operator +=(residuo.operator *=(root));
            cout<<coef[i]<<"x^"<<i;
            if(i!=0) cout<<"+";
        }
        cout<<"\n";
        #ifdef debug
            cout << "Deflation method ended." << endl;
	#endif
        
        //Pasa datos de tipo polynomial de "coef[]" a un arreglo como datos
        //numericos, para seguidamente pasarlos al polynomio que se debe retornar
        T tmp_array[poly.size()-1];
        for(int i = poly.degree()-1; i>=0;--i){
            polynomial<T> a = coef[i];
            tmp_array[i] = a[0];
        }     
        
        polynomial<T> tmp_pol(tmp_array,poly.degree()-1);
        return tmp_pol;
    }
}

#endif /* DEFLATEREAL_HPP */

