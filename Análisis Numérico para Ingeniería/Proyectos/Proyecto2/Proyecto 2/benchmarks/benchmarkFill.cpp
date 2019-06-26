/**
 * Copyright (C) 2017
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * This file is part of the CE3102 Numerical Analysis lecture at TEC
 *
 * @author Arturo, Jeremy, Santiago
 * @date   17.4.2018
 */

#include <boost/test/unit_test.hpp>


#include <iostream>
#include <exception>
#include <cstdlib>
#include <complex>
#include "AnpiConfig.hpp"
/**
 * Unit tests for the matrix class
 */
#include "benchmarkFramework.hpp"
#include "Matrix.hpp"
#include "Allocator.hpp"
#include "LUDoolittle.hpp"
#include "LUDoolittleSIMD.hpp"
BOOST_AUTO_TEST_SUITE( FillMatrix )

//Benchmark for matrix filling
template <typename T>
class benchFill {
protected:
    /// Maximum allowed size for the square matrices
    const size_t _maxSize;

    /// A large matrix holding
    anpi::Matrix<T> _data;

    /// Value to fill
    const size_t _val = 0;


public:
    //Construct
    benchFill(const size_t maxSize)
            : _maxSize(maxSize),_data(maxSize,maxSize,anpi::DoNotInitialize) {    }

    /// Prepare the evaluation of given size
    void prepare(const size_t size) {
        assert (size<=this->_maxSize);
    }

};

// Provide the evaluation method for fill with SIMD
template <typename T>
class benchFillWithSIMD : public benchFill<T> {
public:
    //constructor
    benchFillWithSIMD(const size_t n) : benchFill<T>(n) { }

    //Evaluate fill with SIMD
    inline void eval(){
        this->_data.fill(this->_val);
    }
};

// Provide the evaluation method for fill without SIMD

template <typename T>
class benchFillWithoutSIMD : public benchFill<T> {
public:
    //constructor

    benchFillWithoutSIMD(const size_t n) : benchFill<T>(n) { }
    //Evaluate fill without SIMD
    inline void eval(){
        this->_data.slowfill(this->_val);
    }

};

    BOOST_AUTO_TEST_SUITE( LU )

//Benchmark for  LU

        template <typename T>
        class benchLU {
        protected:
            /// Maximum allowed size for the square matrices
            const size_t _maxSize;

            /// Arguments for LU function
            anpi::Matrix<T> _A;
            anpi::Matrix<T> _LU;
            std::vector<size_t > _permut;

        public:
            //constructor
            benchLU(const size_t maxSize)
                    : _maxSize(maxSize),_A(maxSize,maxSize,anpi::DoNotInitialize) {
                //std::vector<T> _c(_maxSize);
                //_permut = _c;
                _A.fill(1);
//                size_t idx=1;
//                for (size_t r=0;r<_maxSize;++r) {
//                    for (size_t c=0;c<_maxSize;++c) {
//                        _A(r,c)=idx++;
//                    }
//                }
            }

            //prepare the evaluation
            void prepare(const size_t size) {
                assert (size<=this->_maxSize);
            }
        };

// Provide the evaluation method for LU without SIMD

        template <typename T>
        class benchLUWithoutSIMD : public benchLU<T> {
        public:
            //constructor
            benchLUWithoutSIMD(const size_t n) : benchLU<T>(n) { }

            //evaluate LU without SIMD
            inline void eval() {
                anpi::luDoolittle(this->_A, this->_LU, this->_permut);
            }
        };

// Provide the evaluation method for LU without SIMD

        template <typename T>
        class benchLUWithSIMD : public benchLU<T> {
        public:
            //constructor
            benchLUWithSIMD(const size_t n) : benchLU<T>(n) { }

            //evaluate LU without SIMD
            inline void eval() {
                anpi::luDoolittleSIMD(this->_A, this->_LU, this->_permut);
            }
        };



/**
 * Instantiate and test the methods for LU
 */

        BOOST_AUTO_TEST_CASE( Doolittle ) {
        std::vector<size_t> sizes = {24, 32, 48, 64, 96, 128};
//            std::vector<size_t> sizes = {  24,  32,  48,  64,
//                                           96, 128, 192};
//                std::vector<size_t> sizes = {  384, 512};
            const size_t n = sizes.back();
            const size_t repetitions = 100;
            std::vector<anpi::benchmark::measurement> times;
            std::cout << "LU with SIMD (float)" << std::endl;
            {
                benchLUWithoutSIMD<float> bsws(n);

                // Measure LU with simd (float)
                ANPI_BENCHMARK(sizes, repetitions, times, bsws);

                ::anpi::benchmark::write("LU_with_SIMD_float.txt", times);
                ::anpi::benchmark::plotRange(times, "LU SIMD (float)", "b");
            }
            std::cout << "LU with SIMD (double)" << std::endl;
            {
                benchLUWithoutSIMD<double> bsws(n);

                // Measure LU with simd (float)
                ANPI_BENCHMARK(sizes, repetitions, times, bsws);

                ::anpi::benchmark::write("LU_with_SIMD_double.txt", times);
                ::anpi::benchmark::plotRange(times, "LU SIMD (double)", "m");
            }
            std::cout << "LU without SIMD (float)" << std::endl;
            {
                benchLUWithSIMD<float> bsws(n);

                // Measure LU with simd (float)
                ANPI_BENCHMARK(sizes, repetitions, times, bsws);

                ::anpi::benchmark::write("LU_without_SIMD_float.txt", times);
                ::anpi::benchmark::plotRange(times, "LU (float)", "r");
            }
            std::cout << "LU without SIMD (double)" << std::endl;
            {
                benchLUWithSIMD<double> bsws(n);

                // Measure LU with simd (double)
                ANPI_BENCHMARK(sizes, repetitions, times, bsws);

                ::anpi::benchmark::write("LU_without_SIMD_double.txt", times);
                ::anpi::benchmark::plotRange(times, "LU (double)", "g");
            }


            ::anpi::benchmark::show();
        }

    BOOST_AUTO_TEST_SUITE_END()




/**
 * Instantiate and test the methods for FillMatrix
 */
BOOST_AUTO_TEST_CASE( FillMatrix ) {

//        std::vector<size_t> sizes = {24, 32, 48, 64,
//                                     96, 128, 192};
        std::vector<size_t> sizes = {  24,  32,  48,  64,
                    96, 128, 192, 256,
                    384, 512, 768,1024};

        const size_t n = sizes.back();
        const size_t repetitions = 100;
        std::vector<anpi::benchmark::measurement> times;
        std::cout << "#########With SIMD(float)###########" << std::endl;
        {
            benchFillWithSIMD<float> bfws(n);

            //Measure with SIMD float
            ANPI_BENCHMARK(sizes, repetitions, times, bfws);
            ::anpi::benchmark::write("WithSIMD_float_BM.txt", times);
            ::anpi::benchmark::plotRange(times, "Fill With SIMD (float)", "r");
        }
        std::cout << "#########With SIMD(double)###########" << std::endl;
        {
            benchFillWithSIMD<double> bfws(n);

            //Measure with SIMD double
            ANPI_BENCHMARK(sizes, repetitions, times, bfws);
            ::anpi::benchmark::write("WithSIMD_double_BM.txt", times);
            ::anpi::benchmark::plotRange(times, "Fill With SIMD (double)", "g");
        }
        std::cout << "#########Without SIMD(float)###########" << std::endl;
        {

            benchFillWithoutSIMD<float> bfws(n);

            //Measure without SIMD float
            ANPI_BENCHMARK(sizes, repetitions, times, bfws);
            ::anpi::benchmark::write("WithoutSIMD_float_BM.txt", times);
            ::anpi::benchmark::plotRange(times, "Fill Without SIMD (float)", "b");
        }
        std::cout << "#########Without SIMD(double)###########" << std::endl;
        {

            benchFillWithoutSIMD<double> bfws(n);

            //Measure without SIMD float
            ANPI_BENCHMARK(sizes, repetitions, times, bfws);
            ::anpi::benchmark::write("WithoutSIMD_double_BM.txt", times);
            ::anpi::benchmark::plotRange(times, "Fill Without SIMD (double)", "m");
        }
        ::anpi::benchmark::show();

    }
    BOOST_AUTO_TEST_SUITE_END()







































