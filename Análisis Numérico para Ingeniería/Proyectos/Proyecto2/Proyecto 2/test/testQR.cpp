/**
 * Copyright (C) 2017
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * @Author: Arturo Chinchilla, Jeremy Rodríguez, Santiago Gamboa
 * @Date  : 03.04.2018
 */


#include <boost/test/unit_test.hpp>

#include "QR.hpp"


#include <iostream>
#include <exception>
#include <cstdlib>
#include <complex>

#include <functional>

#include <cmath>

namespace anpi {

    namespace test {

        //Q Matriz Ortogonal
        template <typename T>
        void qrTest(const std::function<void(const Matrix<T>&,
                                                Matrix<T>&,
                                                Matrix<T>&)>& qrDescomp) {
            //Results
            Matrix<T> Q;
            Matrix<T> R;


            //Test for Orthogonal Matrix
            {
                anpi::Matrix<T> A = { {-1,-2,1,2},{ 2, 0,1,2},{-1,-1,0,1},{ 1, 1,1,1} };
                qrDescomp(A, Q, R);
                const T eps = std::numeric_limits<T>::epsilon();
                anpi::Matrix<T> ident = anpi::identity<T>(Q.rows(),Q.cols());
                anpi::Matrix<T> QQT = Q*anpi::transpose<T>(Q);
                for (size_t i = 0; i < QQT.rows(); ++i) {
                    for (size_t j = 0; j < QQT.cols(); ++j) {
                        BOOST_CHECK(QQT(i,j)-ident(i,j) < eps);
                    }
                }
            }
            //Check that R is a superior triangular matrix
            {
                anpi::Matrix<T> A = { {-1,-2,1,2},{ 2, 0,1,2},{-1,-1,0,1},{ 1, 1,1,1} };
                qrDescomp(A, Q, R);
                const T eps = std::numeric_limits<T>::epsilon();
                for (size_t i = 0; i < R.rows(); ++i) {
                    for (size_t j = 0; j < R.cols(); ++j) {
                        if (i > j) {
                            BOOST_CHECK(R(i, j) < eps);
                        }
                    }
                }
            }
            //Check that Q*R = A
            {
                anpi::Matrix<T> A = { {-1,-2,1,2},{ 2, 0,1,2},{-1,-1,0,1},{ 1, 1,1,1} };
                qrDescomp(A, Q, R);
                const T eps = std::numeric_limits<T>::epsilon();
                anpi::Matrix<T> QR = Q*R;
                BOOST_CHECK(QR.rows() == A.rows());
                BOOST_CHECK(QR.cols() == A.cols());
                for (size_t i = 0; i < QR.rows(); ++i) {
                    for (size_t j = 0; j < QR.cols(); ++j) {
                        BOOST_CHECK(QR(i, j)-A(i, j) < eps);
                    }
                }

            }
        }
    }//test
}//anpi

BOOST_AUTO_TEST_SUITE( QR )

BOOST_AUTO_TEST_CASE( QR_TEST ) {
//     anpi::test::qrTest<float>(anpi::qr<float>);
//     anpi::test::qrTest<double>(anpi::qr<double>);
}
BOOST_AUTO_TEST_SUITE_END()

