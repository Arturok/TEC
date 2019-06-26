/**
 * Copyright (C) 2017
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * This file is part of the CE3102 Numerical Analysis lecture at TEC
 *
 * @Author: Arturo, Santiago, Jeremy
 * @Date  : 17.04.2018
 */

#include <boost/test/unit_test.hpp>

#include "LUCrout.hpp"
#include "LUDoolittle.hpp"

#include <iostream>
#include <exception>
#include <cstdlib>
#include <complex>

#include <functional>

#include <cmath>

namespace anpi {
    namespace test {

        //Test for matrix filling
        template <typename T>
        void fillTest() {
            {
                Matrix<T> matrixF;
                matrixF.allocate(256,256);
                matrixF.fill(5);

                for (size_t i =0; i < matrixF.cols(); ++i){
                    for (size_t j = 0; j< matrixF.rows(); ++j) {
                        BOOST_CHECK(matrixF(i,j)==T(5)); //Testea que todas las posiciones tengan el dato dado
                    }
                }
            }
        }
    }//test
}//anpi

BOOST_AUTO_TEST_SUITE(FILL)

BOOST_AUTO_TEST_CASE(FillMatrix)
    {
        anpi::test::fillTest<float>();
        anpi::test::fillTest<double>();
    }
BOOST_AUTO_TEST_SUITE_END()