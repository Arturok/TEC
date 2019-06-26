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
#include <iostream>

#include "Exception.hpp"
#include "Matrix.hpp"

#ifndef ANPI_LU_CROUT_HPP
#define ANPI_LU_CROUT_HPP

namespace anpi {

    /**
     * Auxiliary method used to debug LU decomposition.
     *
     * It separates a packed LU matrix into the lower triangular matrix
     * L and the upper triangular matrix U, such that the diagonal of U
     * is composed by 1's.
     */
    template<typename T>
    void unpackCrout(const Matrix<T>& LU,
                     Matrix<T>& L,
                     Matrix<T>& U) {
        L=LU;
        U=LU;
        if(LU.rows()!=LU.cols()){
            throw anpi::Exception("Matrix must be square");
        }
        for (unsigned int i = 0; i < LU.rows(); ++i) {
            for (unsigned int j = 0; j < LU.cols(); ++j) {
                if (j == 0) {
                    L[i][j] = LU[i][j];
                    if (i == 0)
                        U[i][j] = 1;
                    else
                        U[i][j] = 0;
                }
                if (i == 0 and j > 0) {
                    L[i][j] = 0;
                    U[i][j] = LU[i][j];
                }
                if (i > 0 and j > 0) {
                    if (i < j){
                        L[i][j] = 0;
                        U[i][j] = LU[i][j];
                    }
                    if (i > j){
                        U[i][j] = 0;
                        L[i][j] = LU[i][j];
                    }
                    if (i == j){
                        L[i][j] = LU[i][j];
                        U[i][j] = 1;
                    }
                }
            }
        }
    }

    /**
     * Calculate the necessary summation for the crount method
     *
     * @param LU LU Matrix partialy calculated
     * @param i Pos i of the value to be calculated
     * @param j Pos j of the value to be calculated
     * @return Type T with the value of the summation
     */

    template <typename T>
    T summationCalc(Matrix<T> LU, int i, int j) {
        T result = 0;
        for (int k = 0; k < j; k++) {
            result += LU[i][k]*LU[k][j];
        }
        return result;
    }



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
    void pivoteoCrout(Matrix<T>& LU, size_t col, std::vector<size_t>& permut){
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
     * Decompose the matrix A into a lower triangular matrix L and an
     * upper triangular matrix U.  The matrices L and U are packed into
     * a single matrix LU.
     *
     * Crout's way of packing assumes a diagonal of
     * 1's in the U matrix.
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
    void luCrout(const Matrix<T>& A,
                 Matrix<T>& LU,
                 std::vector<size_t>& permut) {

        if(A.rows()!=A.cols()){
            throw anpi::Exception("Matrix must be square");
        }
        try{
            permut = std::vector<size_t>(A.rows(),0);
            LU = A;
            for(size_t k=0;k<LU.rows()-1;++k){
                pivoteoCrout(LU,k,permut);
            }
            const T x = T(0);
            LU.fill(x);
            size_t a = 0;
            size_t b = 1;
            for (size_t j = 0; j < A.rows(); ++j) {
                
                for (size_t i = a; i < A.rows(); ++i) {
                    if(j == 0) {
                        LU[i][j] = A[i][j];
                    }
                    if(j > 0 and j < A.cols()) {
                        if(j == i) {
                            LU[i][j] = A[i][j]-summationCalc<T>(LU, i, j);
                        }
                        if(i > j) {
                            LU[i][j] = A[i][j]-summationCalc<T>(LU, i, j);
                        }
                    }
                }
                for (size_t k = b; k < A.cols(); ++k) {
                    if(j == 0) {
                        LU[j][k] = A[j][k]/LU[0][0];
                    }
                    if(k > j and j > 0) {
                        LU[j][k] = ((A[j][k]-summationCalc<T>(LU, j, k))/LU[j][j]);
                    }
                }
                a++;
                b++;
            }

        }
        catch(anpi::Exception& exc){throw anpi::Exception("Matrix can't be descomposed");}

    }

}

#endif

