/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   RootLaguerre.hpp
 * Author: santii
 *
 * Created on March 12, 2018, 8:07 PM
 */

#ifndef ROOTLAGUERRE_HPP
#define ROOTLAGUERRE_HPP


#include <math.h>
#include <iostream>
#include <complex>
#include <math.h>

#define EPSS 1.0e-7
#define MR 8
#define MT 10
#define MAXIT (MT*MR)

using namespace std;

template <typename T>
void laguerre(std::complex<T> a[], int m, std::complex<T> *x, int *its){
    int iter, j;
    T abx, abp, abm, err;
    std::complex<T> dx, x1, b,d,f,g,h,sq,gp,gm,g2;
    static T frac[] = {0.0,0.5,0.25,0.75,0.13,0.38,0.62,0.88,1.0};
    
     
    for (iter = 1;iter<=MAXIT; iter++){
        //cout<<"Cantidad de iter: "<<iter<<"\n";
        *its = iter;
        b=a[m];
        err=fabs(b);
        d=f=std::complex<T> (T(0),T(0));
        abx = fabs(*x);
        for (j=m-1;j>=0;j--){
            f = (*x * f)+d;
            d = (*x * d)+b;
            b = (*x * b) + a[j];
            err = fabs(b)+abx*err;           
        }
        
        err *= EPSS;

        if(fabs(b) <= err){
//            cout<<"Retorno por error \n";
//            cout<<"Cantidad de b:"<<b.real()<<"\n";
//            cout<<"Cantidad de abs(b): %d\n"<<fabs(b)<<"\n";
//            cout<<"Cantidad de err: "<<err<<"\n";
            return;
        }
        g = d/b;
        g2 = g*g;
        h = g2-(T(2)*(f/b));
        sq = std::sqrt(T(m-1) * (T(m)*h)-g2);
        gp = g + sq;
        gm = g - sq;
        abp = fabs(gp);
        abm = fabs(gm);
        if(abp < abm) gp = gm;
        dx = (std::max(abp, abm)) > T(0) ? std::complex<T>(T(m),T(0))/ gp : (1+abx)* std::complex<T>(std::cos((T)iter), std::sin((T)iter));
        x1 = *x - dx;
        if(x->real() == x1.real() && x->imag() == x1.imag()){
  //          cout<< "Converge\n";
            bool f = x->real() == x1.real() && x->imag() == x1.imag();
    //        cout<<"f: "<<f<<"\n";
            return;// converge
        }
        if(iter%MT) *x = x1;
        else *x = *x - (frac[iter/MT]*dx);
    }
    cout<<"Demasiadas iteraciones";
    return;
}




#endif /* ROOTLAGUERRE_HPP */

