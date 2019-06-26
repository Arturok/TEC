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

#include "Exception.hpp"
#include "Matrix.hpp"
//#include "testInversion.cpp"
#include "LU.hpp"
#include "LUDoolittle.hpp"

#ifndef ANPI_SOLVELU_HPP
#define ANPI_SOLVELU_HPP

namespace anpi {

	template <typename T>
    	anpi::Matrix<T> identity2(size_t rows, size_t cols) {
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

	template<typename T>
	void solveLU(const anpi::Matrix<T>& A,
				 std::vector<T>& x,
				 const std::vector<T>& b){

		//Matrices and vectors to use.
		anpi::Matrix<T> LU;
		anpi::Matrix<T> L;
		anpi::Matrix<T> U;
		x = b;
		std::vector<size_t> p;

		//Call Decomp with pivotig.
		anpi::lu<T>(A,LU,p);

		//Unpack the LU decomp.
		anpi::unpackDoolittle<T>(LU,L,U);

		//Identity Matrix (ident) to permut (P).
		anpi::Matrix<T> ident = identity2<T>(A.rows(), A.cols());
		anpi::Matrix<T> P = ident;

		//Permute identity matrix.
		for(size_t i=0;i<A.rows();++i){
			for (size_t j=0;j<A.cols();++j){
				P[p[i]][j] = ident[i][j];
			}
		}

		//Permuted Vector for right side of system of ecuations.
		std::vector<T> b_permuted = std::vector<T>(A.rows(),0);
		b_permuted = P*b;

		//Vector with intermediate solutions for L matrix.
		std::vector<T> d = std::vector<T>(A.rows(),0);

		//Forward sustitution.
		d[0] = b_permuted[0]/L[0][0];
		size_t n = A.rows();

		for(size_t i=1;i<n;++i){
			T sum1 = b_permuted[i];
			for(size_t j=0;j<i;++j){
				sum1 -= (L[i][j])*(d[j]);
			}
			d[i] = sum1/(L[i][i]);
		}

		//Backward sustitution.
		x[n-1] = d[n-1]/U[n-1][n-1];
		for(unsigned int i=n-2;i>=0;--i){
			T sum = d[i];
			for(unsigned int j=i+1;j<n;++j){
				sum -= (U[i][j])*(x[j]);
			}

			// std::cout<<"sum: "<<sum<<"\n";

			x[i] = sum/(U[i][i]);
		}


	} //solveLU




} //anpi
#endif