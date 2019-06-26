///**
// * Copyright (C) 2017
// * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
// *
// * This file is part of the CE3102 Numerical Analysis lecture at TEC
// *
// * @author Arturo, Jeremy, Santiago
// * @date   17.4.2018
// */
//
//#include <boost/test/unit_test.hpp>
//
//
//#include <iostream>
//#include <exception>
//#include <cstdlib>
//#include <complex>
//#include "AnpiConfig.hpp"
///**
// * Unit tests for the matrix class
// */
//#include "benchmarkFramework.hpp"
//#include "Matrix.hpp"
//#include "Allocator.hpp"
//#include "SolveLU.hpp"
//
//
//BOOST_AUTO_TEST_SUITE( SolveLU )
//
////Benchmark for solve LU
//
//template <typename T>
//class benchSolveLU {
//protected:
//    /// Maximum allowed size for the square matrices
//    const size_t _maxSize;
//
//    /// Arguments for SolveLU function
//    anpi::Matrix<T> _A;
//    std::vector<T> _x;
//    const std::vector<T> _b;
//
//public:
//    //constructor
//    benchSolveLU(const size_t maxSize)
//            : _maxSize(maxSize),_A(maxSize,maxSize,anpi::DoNotInitialize) {
//        size_t idx=0;
//        for (size_t r=0;r<_maxSize;++r) {
//            for (size_t c=0;c<_maxSize;++c) {
//                _A(r,c)=idx++;
//            }
//        }
//    }
//
//    //prepare the evaluation
//    void prepare(const size_t size) {
//        assert (size<=this->_maxSize);
//    }
//};
//
//// Provide the evaluation method for SolveLU without SIMD
//
//template <typename T>
//class benchSolveLUWithoutSIMD : public benchSolveLU<T> {
//public:
//    //constructor
//    benchSolveLUWithoutSIMD(const size_t n) : benchSolveLU<T>(n) { }
//
//    //evaluate solveLU without SIMD
//    inline void eval() {
//        anpi::solveLU(this->_A, this->_x, this->_b);
//    }
//};
//
//// Provide the evaluation method for SolveLU without SIMD
//
//template <typename T>
//class benchSolveLUWithSIMD : public benchSolveLU<T> {
//public:
//    //constructor
//    benchSolveLUWithSIMD(const size_t n) : benchSolveLU<T>(n) { }
//
//    //evaluate solveLU without SIMD
//    inline void eval() {
//        anpi::solveLU(this->_A, this->_x, this->_b);
//    }
//};
//
///**
// * Instantiate and test the methods
// */
//BOOST_AUTO_TEST_CASE( Solve ) {
////        std::vector<size_t> sizes = {24, 32, 48, 64,
////                                     96, 128, 192};
//    std::vector<size_t> sizes = {  24,  32,  48,  64,
//                                   96, 128, 192, 256,
//                                   384, 512, 768,1024,
//                                   1536,2048,3072,4096};
//    const size_t n=sizes.back();
//    const size_t repetitions=100;
//    std::vector<anpi::benchmark::measurement> times;
//    {
//        benchSolveLUWithSIMD<float> bsws(n);
//
//        // Measure solveLU with simd (float)
//        ANPI_BENCHMARK(sizes, repetitions, times, bsws);
//
//        ::anpi::benchmark::write("solveLU_with_SIMD_float.txt", times);
//        ::anpi::benchmark::plotRange(times, "SolveLU SIMD(float)", "r");
//    }
//    {
//        benchSolveLUWithSIMD<double> bsws(n);
//
//        // Measure solveLU with simd (double)
//        ANPI_BENCHMARK(sizes, repetitions, times, bsws);
//
//        ::anpi::benchmark::write("solveLU_with_SIMD_double.txt", times);
//        ::anpi::benchmark::plotRange(times, "SolveLU SIMD(double)", "g");
//    }
//    {
//        benchSolveLUWithoutSIMD<float> bsws(n);
//
//        // Measure solveLU with simd (float)
//        ANPI_BENCHMARK(sizes, repetitions, times, bsws);
//
//        ::anpi::benchmark::write("solveLU_without_SIMD_float.txt", times);
//        ::anpi::benchmark::plotRange(times, "SolveLU (float)", "b");
//    }
//    {
//        benchSolveLUWithoutSIMD<double> bsws(n);
//
//        // Measure solveLU with simd (float)
//        ANPI_BENCHMARK(sizes, repetitions, times, bsws);
//
//        ::anpi::benchmark::write("solveLU_without_SIMD_double.txt", times);
//        ::anpi::benchmark::plotRange(times, "SolveLU (double)", "m");
//    }
//
//#if 0
//
//    {
//    benchAddOnCopy<double>  baoc(n);
//
//    // Measure on-copy add
//    ANPI_BENCHMARK(sizes,repetitions,times,baoc);
//
//    ::anpi::benchmark::write("add_on_copy_double.txt",times);
//    ::anpi::benchmark::plotRange(times,"On-copy (double)","g");
//  }
//
//  {
//    benchAddInPlace<double> baip(n);
//
//    // Measure in place add
//    ANPI_BENCHMARK(sizes,repetitions,times,baip);
//
//    ::anpi::benchmark::write("add_in_place_double.txt",times);
//    ::anpi::benchmark::plotRange(times,"In-place (double)","m");
//  }
//#endif
//
//
//
//
//    ::anpi::benchmark::show();
//}
//
//BOOST_AUTO_TEST_SUITE_END()
//
//
//
//
//
