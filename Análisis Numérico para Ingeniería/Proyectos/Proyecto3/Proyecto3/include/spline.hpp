/*!
 * @copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * @file: spline.hpp
 *
 * @author: Jeremy Rodriguez
 * @author: Santiago Gamboa
 * @author: Arturo Chinchilla
 * @version: 1.0
 * @date: 05.06.2018
 */

#ifndef TAREA03_SPLINE_HPP
#define TAREA03_SPLINE_HPP


#include <vector>
#include <stdlib.h>
#include <iostream>

namespace anpi{
    /**
     * Funcion que retorna un vector con el valor de la segunda derivada de una funcion por intervalo de temperaturas.
     * @param[in] arrayX Array X es un vector de valores de X que se asigan a los valores ingresados de acuerdo con la cantidad de valores ingresados y el tamano de la placa.
     * Donde el X maximo es el tamano de la placa y el minimo es cero. Los valores intermedios se toman con un paso dado por tamano de placa entre cantidad de datos
     * @param[in] arrayY Array Y es el vector que ingresa el usuario para interpolar.
     * @param[in] n n es el tamano de la placa
     * @param[in] yp1 yp1 es el valor de la derivada en 0, para el caso de estudio es 0. '(0,0)
     * @param[in] ypn ypn es el valor de la derivada en n, para el caso de estudio es 0. '(n,0)
     * @param[out] y2 y2 es el resultado
     */
    void spline(std::vector<float> arrayX,
                std::vector<float> arrayY,
                int n, float yp1, float ypn, std::vector<float> y2){

        int i, k;
        float p,qn,sig,un;
        std::vector<float> u(n-1,1);
        y2 = std::vector<float >(n,1);

        if(yp1 > 0.99e30)
            y2[0]=u[0]=0.0;
        else{
            y2[0] = float(-0.5);
            u[0]=(float(3.0)/(arrayX[1]-arrayX[0]))*((arrayY[1]-arrayY[0])/(arrayX[1]-arrayX[0])-yp1);
        }

        for(i=1;i<=n-1;i++){
            sig = (arrayX[i]-arrayX[i-1])/(arrayX[i+1]-arrayX[i-1]);
            p=sig*y2[i-1]+float(2.0);
            y2[i] = (sig-float(1.0))/p;
            u[i] = (arrayY[i+1]-arrayY[i])/(arrayX[i+1] - arrayX[i]) - (arrayY[i]-arrayY[i-1])/(arrayX[i] - arrayX[i-1]);
            u[i] = (float(6.0)*u[i]/(arrayX[i+1]-arrayX[i-1])-sig*u[i-1])/p;
        }
        if(ypn > 0.99e30)
            qn = un =0.0;
        else{
            qn=0.5;
            un=(float(3.0)/(arrayX[n]-arrayX[n-1]))*(ypn-(arrayY[n]-arrayY[n-1])/(arrayX[n]-arrayX[n-1]));
        }
        y2[n]=(un-qn*u[n-1])/(qn*y2[n-1]+float(1.0));
        for (k=n-1;k>=1;k--)
            y2[k] = y2[k]*y2[k+1]+u[k];
    }


    /**
     * Retorna un valor de x interpolado de acuerdo a los X y Y ingresados. Llama a la funcion de spline
     * @param xa Array X es un vector de valores de X que se asigan a los valores ingresados de acuerdo con la cantidad de valores ingresados y el tamano de la placa.
     * Donde el X maximo es el tamano de la placa y el minimo es cero. Los valores intermedios se toman con un paso dado por tamano de placa entre cantidad de datos
     * @param ya Array Y es el vector que ingresa el usuario para interpolar.
     * @param y2a Es el resultado de obtener las segundas derivadas de los intervalos dados.
     * @param n tamano de placa
     * @param x valor de X para realizar la interpolacion y encontrar f(x)
     * @param y valor de la funcion en x, f(x)
     */
    void splint(std::vector<float> xa,
                std::vector<float> ya,
                std::vector<float> y2a,
                int n, float x, float &y){
        int klo, khi, k;
        float h,b,a;
        klo=0;
        khi=n;
        while(khi-klo >1){
            k=(khi+klo)>>1;
            if(xa[k]>x) khi = k;
            else klo = k;
        }
        h=xa[khi]-xa[klo];
        if(h == 0.0) std::cout<<"Bad xa input to routine splint\n";
        a=(xa[khi]-x)/h;
        b=(x-xa[klo])/h;
        y=a*ya[klo]+b*ya[khi]+((a*a*a-a)*y2a[klo]+(b*b*b-b)*y2a[khi])*(h*h)/6.0;
    }


    /**
     * Funcion principal que utiliza la funcion spline para encontrar segunda derivada y con ello forma
     * un vector de interpolacion con todos los valores de x entre los valores de temperaturas
     * @param[in] yIn Vector con los valores de temperatura a interpolar
     * @param[out] values Vector con los valores interpolados
     * @param[in] sizeP Cantidad de Pixeles en el borde a interpolar
     */
    void interpolar(std::vector<float> yIn, std::vector<float> &values, int sizeP){

        int len =yIn.size();

        values = std::vector<float>(sizeP,1);
        std::vector<float> xIn(len,0);
        std::vector<float> temp(len,0);
        int paso = sizeP/len,i;
        i=0;
        for (int j = 0; j < len-1; ++j) {
            xIn[j]=i;
            i += paso;
        }
        xIn[len-1]=sizeP-1;
        spline(xIn,yIn,len,0,0,temp);
        int k;
        float interpol;
        values = std::vector<float>(sizeP,0);
        for (k = 0; k < sizeP; ++k) {
            splint(xIn,yIn,temp,len,k,interpol);
            values[k]=interpol;
        }
    }

    /**
     * Realiza una interpolación lineal para dos valores en un vector de temperaturas
     * @tparam[in] T Template para el tipo de dato contenido en los vectores (float/double)
     * @param[in] yIn Vector con el rango para dos temperaturas a interpolar
     * @param [out]values Vector con las temperaturas interpoladas
     * @param[in] sizeP Cantidad de Pixeles en el eje del borde
     */
    template <typename T>
    void linear(std::vector<T> yIn, std::vector<T> &values, int sizeP) {
        if (yIn[0] < yIn[1]) {
            float step = (yIn[1] - yIn[0])/(sizeP-1);
            for (int i = 0; i < sizeP; ++i) {
                values[i] = yIn[0] + i*step;
            }
        }
        else if (yIn[0] > yIn[1]) {
            float step = (yIn[0] - yIn[1])/(sizeP-1);
            for (int i = 0; i < sizeP; ++i) {
                values[i] = yIn[0] - i*step;
            }
        }
        else if (yIn[0] == yIn[1]) {
            T val = yIn[0];
            for (int i = 0; i < sizeP; ++i) {
                values[i] = val;
            }
        }
    }

    template <typename T>
    void singleTemp(std::vector<T> yIn, std::vector<T> &values, int sizeP) {
        T val = yIn[0];
        for (int i = 0; i < sizeP; ++i) {
            values[i] = val;
        }
    }

    /**
     * Maneja el tipo de interpolación que se debe realizar para cierto vector de temperaturas
     * @tparam[in] T Template para el tipo de dato contenido en los vectores (float/double)
     * @param[in] yIn Vector con el rango para dos temperaturas a interpolar
     * @param [out]values Vector con las temperaturas interpoladas
     * @param[in] sizeP Cantidad de Pixeles en el eje del borde
     */
    template<typename T>
    void manageInterpolation(std::vector<T>& yIn, int sizeP) {
        if (yIn.size() > 2) {
            std::vector<T> values(sizeP, 0);
            anpi::interpolar(yIn, values, sizeP);
            yIn = values;
        }
        if (yIn.size() == 2) {
            std::vector<T> values(sizeP, 0);
            anpi::linear(yIn, values, sizeP);
            yIn = values;
        }
        if (yIn.size()  ==  1) {
            std::vector<T> values(sizeP, 0);
            anpi::singleTemp(yIn, values, sizeP);
            yIn = values;
        }
    }
}




#endif //TAREA03_SPLINE_HPP
