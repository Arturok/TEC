/**
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, ITCR, Costa Rica
 *
 * This file is part of the numerical analysis lecture CE3102 at TEC
 *
 * @Author: 
 * @Date  : 03.03.2018
 */
#include <cmath>
#include <limits>
#include <functional>
#include <algorithm>
#include <math.h>
#include <iostream>
#include <cstdlib>

#include "Matrix.hpp"
#include "LU.hpp"
#include "LUDoolittle.hpp"
#include "SolveLU.hpp"

#ifndef ANPI_REVERSEMATRIX_HPP
#define ANPI_REVERSEMATRIX_HPP

namespace anpi {
	template <typename T>
    	anpi::Matrix<T> identity1(size_t rows, size_t cols) {
        anpi::Matrix<T> identityMatrix;
        identityMatrix.allocate(rows, cols);
        for (size_t i = 0; i < rows; ++i) {
            for (size_t j = 0; j < cols; ++j) {
                if (i == j) {
                    identityMatrix[i][j] = T(1);
                }
                else {
                    identityMatrix[i][j] = T(0);
                }
            }
        }
        return identityMatrix;
    }

	/**
	 * Invert the Matrix A.
	 *
	 * @param[in] A a square matrix to invert.
	 * @param[out] Ai the matrix where the result is storaged.
	 */
	template<typename T>
	void invert(const anpi::Matrix<T>& A, anpi::Matrix<T>& Ai){

		//Initialize Ai with valid values.
		Ai = A;

		//Vectors for solutions (column "i" of Ai)(x) and rigth side of equations (b).
		std::vector<T> x;
		std::vector<T> b;

		//Identity matrix for system of ecuations.
		anpi::Matrix<T> idn = identity1<T>(A.rows(), A.cols());

		//Calculate the values for column of "i" Ai. 
		for(size_t i=0;i<idn.cols();++i){
			b = idn.column(i);

			anpi::solveLU<T>(A,x,b);

			for(size_t k=0;k<Ai.cols();++k){
				Ai[k][i] = x[k];
			}
		}

	} //invert

} //anpi
#endif