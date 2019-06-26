/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   zRoots.hpp
 * Author: santii
 *
 * Created on March 19, 2018, 1:46 PM
 */

#ifndef ZROOTS_HPP
#define ZROOTS_HPP
#include <math.h>
#include "complex.h"
#include "RootLaguerre.hpp"

#define MAXM 100
#define EPS 2.0e-6

template <typename T>
void zroot(std::complex<T> a[], int m, std::complex<T> roots[], int polish){
    //laguerre(std::complex a[], int m, std::complex<T> *x, int *its);
    int i, its, j, jj;
    std::complex<T> x,b,c,ad[MAXM];
       
    for(j=0;j<=m;j++) ad[j]=a[j];
    for(j=m; j>=1; j--){
        x = std::complex<T>(T(0), T(0));
        laguerre<T>(ad,j,&x,&its);
        
        if(std::abs(x.imag()) <= T(2) * EPS * std::abs(x.real())) x.imag(T(0));
        roots[j] = x;
        b = ad[j];
        for(jj = j-1;jj>=0;jj--){
            c=ad[jj];
            ad[jj]=b;
            b=(x*b)+c;
        }
    }
    if(polish)
        for(j=1;j<m;j++)
            laguerre<T>(a,m,&roots[j],&its);
    for(j=2;j<m;j++){
        x = roots[j];
        for(i=j-1;i>=1;i--){
            if(roots[i].real()<= x.real()) break;
            roots[i+1]=roots[i];
        }
        roots[i+1]=x;
    }
} 
    




#endif /* ZROOTS_HPP */

