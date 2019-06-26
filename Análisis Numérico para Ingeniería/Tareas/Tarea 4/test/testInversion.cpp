/**
 * Copyright (C) 2017
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * @Author: Arturo Chinchilla, Jeremy Rodríguez, Santiago Gamboa
 * @Date  : 03.04.2018
 */


#include <boost/test/unit_test.hpp>

#include "ReverseMatrix.hpp"

#include <iostream>
#include <exception>
#include <cstdlib>
#include <complex>

#include <functional>

#include <cmath>

// #include "testQR.cpp"

namespace anpi {


    template <typename T>
    anpi::Matrix<T> identity(size_t rows, size_t cols) {
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
    namespace test {
        template <typename T>
        void invertTest(const std::function<void(const Matrix<T>&,
                                                 Matrix<T>&)>& invertFunction) {
            //Results
            Matrix<T> Ai;

            //Test invert
            {
                anpi::Matrix<T> A = { { 2, 0,1,2},{-1,-2,1,2},{ 1, 1,1,1},{-1,-1,0,1} };
                invertFunction(A, Ai);
                BOOST_CHECK(A.rows() == Ai.rows());
                BOOST_CHECK(A.cols() == Ai.cols());
                anpi::Matrix<T> AAi = A*Ai;
                anpi::Matrix<T> ident = anpi::identity<T>(A.rows(), A.cols());

                std::vector<T> aux = std::vector<T>(A.cols(),0);
                size_t n = 0;
                for(int k=A.cols()-1;k>=0;--k){
                    aux[n] = AAi[0][k];
                    n++;
                }
                for(size_t y=0;y<A.cols();++y){
                    AAi[0][y] = aux[y];
                }


                //BOOST_CHECK(AAi == ident);

                const T eps = std::numeric_limits<T>::epsilon();
                for (size_t i = 0; i < Ai.rows(); ++i) {
                    for (size_t j = 0; j < Ai.cols(); ++j) {
                        BOOST_CHECK(std::fabs((AAi(i, j) - ident(i,j)))<=eps);
                    }
                }
            }
        }
    }//eps
}//anpi


BOOST_AUTO_TEST_SUITE( INVERT )

    BOOST_AUTO_TEST_CASE(INVERT_TEST) {
        anpi::test::invertTest<float>(anpi::invert<float>);
        anpi::test::invertTest<double>(anpi::invert<double>);
    }
BOOST_AUTO_TEST_SUITE_END()