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

#ifndef ANPI_LU_DOOLITTLE_HPP
#define ANPI_LU_DOOLITTLE_HPP

namespace anpi {

  /**
   * Auxiliary function used to calculate the pivoting method.
   *
   * Edit the matrix LU.
   *
   * LU[input] Matrix to be edited.
   * col[input] row where the pivoting is aplying.
   * permut[input] permut vector where the positions are stored.
   */
  template<typename T>
  void pivoteo(Matrix<T>& LU, size_t col, std::vector<size_t>& permut){

  	size_t row = col;
  	T max = T(std::fabs(LU[col][col]));

  	for(size_t i=col+1;i<LU.rows();++i){
  		if(T(std::fabs(LU[i][col])) >= max){
  			max = std::fabs(LU[i][col]);
  			row = i;
  		}
  	}
  	if(row!=col){
    	T tmp = T(0);
    	for(size_t i=0;i<LU.cols();++i){
    		tmp = LU[col][i];
    		LU[col][i] = LU[row][i];
    		LU[row][i] = tmp;
    	}
    	permut[col] = row;
    	permut[row] = col;
    }
  }

  /**
   * Auxiliary method used to debug LU decomposition.
   *
   * It separates a packed LU matrix into the lower triangular matrix
   * L and the upper triangular matrix U, such that the diagonal of L
   * is composed by 1's.
   */
  template<typename T>
  void unpackDoolittle(const Matrix<T>& LU,
                       Matrix<T>& L,
                       Matrix<T>& U) {

  	//Initialice Matrix U and L
  	L = LU;
  	U = LU;

  	for(size_t i=0;i<LU.rows();++i){
  		for(size_t k=0;k<LU.cols();++k){
  			//For U matrix
  			if(k>=i){
  				U[i][k] = LU[i][k];
  			}
  			else{
  				U[i][k] = T(0);
  			}

  			//For L matrix
  			if(k==i){
  				L[i][k] = T(1);
  			}
  			else if(k>i){
  				L[i][k] = T(0);
  			}
  			else{
  				L[i][k] = LU[i][k];
  			}
  		}
  	}
  }
  
  /**
   * Decompose the matrix A into a lower triangular matrix L and an
   * upper triangular matrix U.  The matrices L and U are packed into
   * a single matrix LU. 
   *
   * The L matrix will have in the Doolittle's LU decomposition a
   * diagonal of 1's
   *
   * @param[in] A a square matrix 
   * @param[out] LU matrix encoding the L and U matrices
   * @param[out] permut permutation vector, holding the indices of the
   *             original matrix falling into the corresponding element.
   *             For example if permut[5]==3 holds, then the fifth row
   *             of the LU decomposition in fact is dealing with the third
   *             row of the original matrix.
   *
   * @throws anpi::Exception if matrix cannot be decomposed, or input
   *         matrix is not square.
   */
  template<typename T>
  void luDoolittle(const Matrix<T>& A,
                   Matrix<T>& LU,
                   std::vector<size_t>& permut) {

  	if(A.rows()!=A.cols()){
  		throw anpi::Exception("Matrix must be square");
  	}

  	try{
  		permut = std::vector<size_t>(A.rows(),0);

    	LU = A;

		//Pivoting
		for(size_t k=0;k<LU.rows()-1;++k){
    		pivoteo(LU,k,permut);
   		}

    	for(size_t k=0;k<LU.rows()-1;++k){
   			for(size_t i=k+1;i<LU.rows();++i){
   				//Calculate factor
   				const T factor = LU[i][k]/LU[k][k];
   				for(size_t j=k;j<LU.rows();++j){
					//Copy factor in matrix L
   					if(j==k){
   						LU[i][j] = factor;
   					}
   					//Run the subtration from the elimination to calculate matrix U
   					else{
   						LU[i][j] -= factor*LU[k][j];
   					}
   				}
   			}
   		}    
  	}
  	catch(anpi::Exception& exc){throw anpi::Exception("Matrix can't be descomposed");}
  }
}
#endif

