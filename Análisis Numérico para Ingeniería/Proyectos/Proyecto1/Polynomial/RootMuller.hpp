/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   RootMuller.hpp
 * Author: arturo
 *
 * Created on 12 de marzo de 2018, 06:58 PM
 */

#ifndef ROOTMULLER_HPP
#define ROOTMULLER_HPP

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <iomanip>
#include <complex>
#include <typeinfo>
#include <boost/math/tools/polynomial.hpp>
#include <boost/program_options/options_description.hpp>
#include <boost/program_options/parsers.hpp>
#include <boost/program_options/variables_map.hpp>
#include <boost/lexical_cast.hpp>
#include "string.h"



using namespace std;


namespace anpi {

    
    template<typename T>
    complex<T> evaluatePol(std::vector<std::complex<T> >& coef, std::complex<T> * x){
        std::complex<T> result = 0;
        for (int iter = 0; iter < coef.size(); iter++) {
            result += coef[iter]*std::pow(*x,iter);
         //   printf(result.real());
        }
        return result;
    }
    
    template<typename T>
    vector<complex<T> > horner(const std::vector<std::complex<T> > &a, std::complex<T> x0) {
        int n = a.size();
        std::vector<std::complex<T> >  b(std::max(1, n - 1),0);
        for (int i = n-1; i > 0; i--) {
            b[i - 1] = a[i] + (i < n - 1 ? b[i] * x0 : 0);
        }
        return b;
    }
    
    
    template<typename T>
    complex<T> polinom_zero(T x0, T x1, T x2,vector<complex<T> >& coefs,unsigned int max, double pTolerance){
        complex<T> xi0, xi1, xi2,xi3, h0,h1,q0,q1,A, B, C,result, temp1, temp2;
        long double err;
        xi0 = x0;
        xi1 = x1;
        xi2 = x2;
        err = 2;
        temp1 = temp2 = 0;
        int ite = 0;
        while (ite < max && (long double)err >= pTolerance) {
            h0 = xi1 - xi0;
            h1 = xi2 - xi1;
            q0=(evaluatePol(coefs, &xi1)-evaluatePol(coefs, &xi0))/h0;
            q1=(evaluatePol(coefs, &xi2)-evaluatePol(coefs, &xi1))/h1;
            
            A=(q1-q0)/(h1+h0);
            B=A*h1+q1;
            C=(evaluatePol(coefs, &xi2));
            
            temp1=xi2+((complex<T> )-2*C)/(B+sqrt(B*B-(complex<T> )4*A*C));
            temp2=xi2+((complex<T> )-2*C)/(B-sqrt(B*B-(complex<T> )4*A*C));
					
            if(B.real()>=0)
                xi3=temp1;
            else
		xi3=temp2;
            err = abs((((xi3-xi2)/xi3)).real())*100;

            xi0=xi1;
            xi1=xi2;
            xi2=xi3;
            ite++;
        }
        return xi3;
    }
    
    template<typename T>
    vector<complex<T> > rootMuller(T x0, T x1, T x2, const vector<complex<T> >& coefs, unsigned int max, double pTolerance){
        vector<complex<T> > res;
        vector<complex<T> > q = coefs;
        complex<T> z;
        while (q.size() > 2) {
            z = polinom_zero(x0,x1,x2,q,max,pTolerance);       
            q = horner(q, z);
            res.push_back(z);
        }
        res.push_back(-q[0] / q[1]);
        return res;
    }
}

#endif /* ROOTMULLER_HPP */

