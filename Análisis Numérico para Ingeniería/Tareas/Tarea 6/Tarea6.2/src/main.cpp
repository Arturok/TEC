/**
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * This file is part of the CE3102 Numerical Analysis lecture at TEC
 *
 * @Author: 
 * @Date  : 24.02.2018
 */

#include <cstdlib>
#include <iostream>

#include "LUDoolittle.hpp"
#include "RandomSymmetricSqr.hpp"
#include "eig.hpp"

int main() {

  // Some example code
//  anpi::Matrix<float> A = { {-1,-2,1,2},
//                            { 2, 0,1,2},
//                            {-1,-1,0,1},
//                            { 1, 1,1,1} };
//  anpi::Matrix<float> LU;
//
//  std::vector<size_t> p;
//  anpi::luDoolittle(A,LU,p);
//
//  std::cout<<LU[0][0];
//  
//  
//  
//  
//  
//  
//  
//  
    const size_t n = 3;
    //anpi::Matrix<float> Random = { {1.96,-6.49,-0.47,-7.20,-0.65},{-6.49,3.80,-6.39,1.50,-6.34},{0.47,-6.39,4.17,-1.51,2.67},{-7.20,1.50,-1.51,5.70,1.80},{-0.65,-6.34,2.67,1.80,-7.10} };
    anpi::Matrix<float> Random;


//    Pasado por referencia
//    Random.allocate(n,n);
//   anpi::randomSymmetricSqrByParam(Random,n);

    //Primera
    Random = anpi::randomSymmetricSqr<float>(n);


    std::cout << "Imprimiendo Matriz Random" << std::endl;
    for (size_t i = 0; i < Random.cols(); ++i) {
        for (size_t j = 0; j < Random.cols(); ++j) {
            std::cout << Random(i,j) << " ";
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;

    anpi::Matrix<float> E;
    std::vector<float> val;
    anpi::eig<float>(Random,val,E);

    std::cout << "Imprimiendo Matriz eigenvectores" << std::endl;
    for (size_t i = 0; i < E.cols(); ++i) {
        for (size_t j = 0; j < E.cols(); ++j) {
            std::cout << E(i,j) << " ";
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;

    std::cout << "Imprimiendo vector eigenvalores" << std::endl;
    for (size_t i = 0; i < E.rows(); ++i) {
        std::cout << val[i] << " ";
    }
    std::cout << std::endl;
    std::cout << std::endl;

  return EXIT_FAILURE;
}
  
