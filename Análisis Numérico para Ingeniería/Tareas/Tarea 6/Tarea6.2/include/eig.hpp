/**
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, ITCR, Costa Rica
 *
 * This file is part of the numerical analysis lecture CE3102 at TEC
 *
 * @Author: Jeremy, Arturo, Santiago
 * @Date  : 23.05.2018
 */

#include <stdio.h>
#include <lapacke.h>
#include "vector"
#include "Matrix.hpp"


#ifndef TAREA03_EIG_HPP
#define TAREA03_EIG_HPP

namespace anpi {

    /**
     * Obtiene los eigenvalores y eigenvectores a partir de funciones LAPACK. Los eigenvalores se devuleven
     * en orden ascendente
     *
     * Para precision simple (float) se usa ssyev: Es la mas simple en cuanto a cantidad y tipo de parametros,
     * ademas de que se usa unicamente para matrices simetricas tal y como se solicita.
     *
     * Para precision dobre (double) se usa dsyev: Es la mas simple en cuanto a cantidad de parametros,
     * ademas de que se usa unicamente para matrices simetricas tal y como se solicita.
     *
     * La funcion ordena la matriz de eigen vectores por filas (LAPACK_ROW_MAYOR), es decir, los vectores
     * correspondientes son las filas de la matriz E.
     *
     *@param[in] A Matriz para calcular eigenvectores y eigenvalores
     *@param[out] val vector con los eigenvalores calculados ordenados de forma ascendente
     *@param[out] E Matriz con eigenvectores calculados, ordenados por columnas
     */
    template<typename T>
    void eig (const anpi::Matrix<T>& A, std::vector<T>& val, anpi::Matrix<T>& E){
        //Pasar matriz a arreglo de vectores
        float a[A.rows()][A.cols()] = {};

        for(unsigned int i=0;i<A.rows();++i){
            for(unsigned int j=0;j<A.cols();++j){
                a[i][j] = A[i][j];
            }
        }

        std::cout<<"Array inicial"<<std::endl;
        for (size_t i = 0; i < A.cols(); ++i) {
            for (size_t j = 0; j < A.cols(); ++j) {
                std::cout << a[i][j] << " ";
            }
        std::cout << std::endl;
        }

        /////////////////////////////////////Eigen//////////////////////////////////////
        //Inicializar parametros
        lapack_int N,LDA,INFO;
        N = A.rows();
        LDA = A.cols();
        float W[N];

        //Funcion LAPACK
        INFO = LAPACKE_ssyev(LAPACK_ROW_MAJOR,'V','U',N,*a,LDA,W);

        //Inicializar estructuras para eigenvalores y eigenvectores
        val = std::vector<float>(A.rows(),0);
        E.allocate(A.rows(),A.cols());

        ///////////////////////////////////Llenar estructuras/////////////////////////////
        //eigenvalores
        for(int i=0;i<N;++i){
            val[i] = W[i];
        }

        //eigenvectores
        for(unsigned int i=0;i<E.rows();++i){
            for(unsigned int j=0;j<E.cols();++j){
                E[i][j] = a[i][j];
            }
        }

        //Imprime resultado de la operacion
        std::cout<<"Resultado de la operacion: ";
        if(INFO==0){
            std::cout<<"Satisfactoria"<<std::endl<<std::endl;
        }
        else{
            std::cout<<"Error al calcular eigen"<<std::endl<<std::endl;
        }
    }

}



#endif //TAREA03_EIG_HPP
