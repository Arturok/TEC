///**
// * Copyright (C) 2017
// * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
// *
// * This file is part of the CE3102 Numerical Analysis lecture at TEC
// *
// * @Author: Arturo, Jeremy, Santiago
// * @Date  : 24.05.2018
// */
//
//
//#include
//
////#include "sort.hpp"
//
//#include <iostream>
//#include <exception>
//#include <cstdlib>
//#include <complex>
//
//#include <functional>
//
//#include <cmath>
//#include <Matrix.hpp>
//#include <vector>
//#include <boost/test/test_tools.hpp>
//
//namespace anpi {
//    namespace test {
//
//        template <typename T>
//        void sortTest(const std::function<void(std::vector<T>&,
//                anpi::Matrix<T>&)>& sort) {
//
//            std::vector<T> eigenvalues, tempValues = {6,2,4};
//
//            anpi::Matrix<T> eigenVectors = {{1,7,6,4},{2,17,27,17},{2,6,4,5}};
//
//            //Test if eigenvalues are the same amount of eigen vectors
//            {
//                try {
//                    BOOST_CHECK_MESSAGE(false, "Same number of Eigen values and Eigen Vectors should be provided");
//                }
//                catch (anpi::Exception& exc) {
//                    BOOST_CHECK_MESSAGE(true, "Same number of Eigen values and Eigen Vectors provided");
//                }
//            }
//
//            //Sorting
//            sort(eigenvalues, eigenVectors);
//
//            //Test for sorting of the values in the vector
//            {
//                bool flag = true;
//                for (size_t i = 1; i < eigenvalues.size(); ++i) {
//                    if (eigenvalues[i] > eigenvalues[i-1]) {
//                        flag = false;
//                        break;
//                    }
//                }
//                BOOST_CHECK(flag ==  true);
//            }
//
//            //test that verifies if the eigen vectors match the eigen values
//            {
//
//            }
//
//        }
//
//    }
//}