/*!
 * @copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * @file: liebmann.hpp
 *
 * @author: Jeremy Rodriguez
 * @author: Santiago Gamboa
 * @author: Arturo Chinchila
 * @version: 1.0
 * @date: 05.06.2018
 */

#include <cstdlib>
#include <iostream>
#include <vector>
#include <stdio.h>
#include <limits>

#include "omp.h"

#ifndef ANPI_LIEBMANN_HPP
#define ANPI_LIEBMANN_HPP

namespace anpi{

/**
 * Ejecuta el metodo de Liebmann para el calculo de EDP en una matriz que
 * representa una placa delgada rectangular, con valores frontera de tempratura
 * fija en cada extremo de la placa.
 * La matriz se lee de izquierda a derecha, de arriba hacia abajo.
 *
 * @param[in] top Valor de temperatura de la parte de arriba de la placa.
 * @param[in] bottom Valor de temperatura de la parte de abajo de la placa.
 * @param[in] left Valor de temperatura de la parte izquierda de la placa.
 * @param[in] right Valor de temperatura de la parte derecha de la placa.
 * @param[out] A Matriz que contiene los valores del flujo de temperatura calculados.
 */
    void liebmann (std::vector<float> top, std::vector<float> bottom,
                   std::vector<float> left, std::vector<float> right,
                   anpi::Matrix<float>& A){

        //Variables globales
        float lambda = 1.5;                                          //factor relajacion
        const float eps = std::numeric_limits<float>::epsilon();     //valor de terminacion
        int maxi = std::numeric_limits<float>::digits;               //maximo numero de iteraciones
        float ea;                                                    //Error calculado
        float tmp;                                                   //Valor temporal del elemento calculado usado para sobrerelajacion
        bool flag;                                                   //Bandera usada para calculo de errores (ea)

        //Indices de la matriz calculados para cada elemento
        float ele_up;
        float ele_down;
        float ele_left;
        float ele_right;

        //Matriz temporal
        anpi::Matrix<float>& B = A;                                  //Usada para almacenar temporalmente los valores actuales de temperatura para el calculo de ea
        
        for(int term=maxi;term>0;--term){
            flag = true;

            for(int i=0;i<B.rows();++i){
                //#pragma omp parallel for
                for(int j=0;j<B.cols();++j){
                    //Calcula elemento de derecha
                    if((j+1)==B.cols())
                        ele_right = right[i];
                    else
                        ele_right = B[i][j+1];


                    //Calcula elemento de izquierda
                    if((j-1)==-1)
                        ele_left = left[i];
                    else
                        ele_left = B[i][j-1];


                    //Calcula elemento de arriba
                    if((i-1)==-1)
                        ele_up = top[j];
                    else
                        ele_up = B[i-1][j];


                    //Calcula elemento abajo
                    if((i+1)==B.rows())
                        ele_down = bottom[j];
                    else
                        ele_down = B[i+1][j];


                    //Almacena valor temporal anterior para sobrerelajacion
                    tmp = B[i][j];

                    //Aplica formula
                    B[i][j] = (ele_right+ele_left+ele_up+ele_down)/4;

                    //Aplica sobrerelajacion
                    B[i][j] = ((lambda)*(B[i][j]))+((1-lambda)*(tmp));
                }

            }

			//#pragma omp parallel for
            //Calculo de errores para cada elemento
            for(int i=0;i<B.rows();++i){
                for(int j=0;j<B.cols();++j){
                    //Calcula error
					//#pragma omp critical
                    ea = (abs(((B[i][j])-(A[i][j]))/B[i][j]))*100;

                    //Solo un elemento que tenga un ea>eps provoca que continue las iteraciones
                    if(ea>eps){
                        flag = false;
                    }
                }
            }
            //Si se cumple el eps de cada elemento, sale de las iteraciones
            if(flag){
                term = 0;
            }
            A = B;
        }
    }
} //anpi
#endif