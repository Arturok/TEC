/**
 * Copyright (C) 2017 
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * This file is part of the CE3102 Numerical Analysis lecture at TEC
 *
 * @author Pablo Alvarado
 * @date   29.12.2017
 */


#include <boost/test/unit_test.hpp>


#include <iostream>
#include <exception>
#include <cstdlib>
#include <complex>

/**
 * Unit tests for the matrix class
 */
#include "benchmarkFramework.hpp"
#include "Matrix.hpp"
#include "Allocator.hpp"
#include "LUCrout.hpp"
#include "LUDoolittle.hpp"

BOOST_AUTO_TEST_SUITE( Matrix )

/// Benchmark for LU operations
template<typename T>
class benchLU {
protected:
  /// Maximum allowed size for the square matrices
  const size_t _maxSize;

  /// A large matrix holding 
  anpi::Matrix<T> _data;

  /// State of the benchmarked evaluation
  anpi::Matrix<T> _a;
  anpi::Matrix<T> _LU;
  std::vector<size_t> _permut;
public:
  /// Construct
  benchLU(const size_t maxSize)
    : _maxSize(maxSize),_data(maxSize,maxSize,anpi::DoNotInitialize) {

    size_t idx=0;
    for (size_t r=0;r<_maxSize;++r) {
      for (size_t c=0;c<_maxSize;++c) {
        _data(r,c)=idx++;
      }
    }
  }

  /// Prepare the evaluation of given size
  void prepare(const size_t size) {
    assert (size<=this->_maxSize);
    this->_a=std::move(anpi::Matrix<T>(size,size,_data.data()));
  }
};

/// Provide the evaluation method for LUDoolittle
template<typename T>
class benchLUDoolittle : public benchLU<T> {
public:
  /// Constructor
  benchLUDoolittle(const size_t n) : benchLU<T>(n) { }
  
  // Evaluate Doolittle
  inline void eval() {
    anpi::luDoolittle(this->_a,this->_LU,this->_permut);
  }
};

/// Provide the evaluation method for Crout 
template<typename T>
class benchLUCrout : public benchLU<T> {
public:
  /// Constructor
  benchLUCrout(const size_t n) : benchLU<T>(n) { }
  
  // Evaluate add Crout
  inline void eval() {
    anpi::luCrout(this->_a,this->_LU,this->_permut);
  }
};

/**
 * Instantiate and test the methods of the Matrix class
 */
BOOST_AUTO_TEST_CASE( LU ) {

  std::vector<size_t> sizes = {  24,  32,  48,  64,
                                 96, 128, 192};

  const size_t n=sizes.back();
  const size_t repetitions=100;
  std::vector<anpi::benchmark::measurement> times;

  {
    benchLUDoolittle<float>  blud(n);

    // Measure Doolittle
    ANPI_BENCHMARK(sizes,repetitions,times,blud);
    
    ::anpi::benchmark::write("Doolittle_float_BM.txt",times);
    ::anpi::benchmark::plotRange(times,"Doolittle (float)","r");
  }

  {
    benchLUDoolittle<double>  blud(n);

    // Measure Doolitle
    ANPI_BENCHMARK(sizes,repetitions,times,blud);
    
    ::anpi::benchmark::write("Doolittle_double_BM.txt",times);
    ::anpi::benchmark::plotRange(times,"Doolittle (double)","g");
  }
  
  {
    benchLUCrout<float> bluc(n);

    // Measure Crout
    ANPI_BENCHMARK(sizes,repetitions,times,bluc);

    ::anpi::benchmark::write("Crout_float_BM.txt",times);
    ::anpi::benchmark::plotRange(times,"Crout (float)","b");
  }

  {
    benchLUCrout<double> bluc(n);

    // Measure Crout
    ANPI_BENCHMARK(sizes,repetitions,times,bluc);

    ::anpi::benchmark::write("rout_double_BM.txt",times);
    ::anpi::benchmark::plotRange(times,"Crout (double)","m");
  }
  
#if 0
  
  {
    benchAddOnCopy<double>  baoc(n);

    // Measure on-copy add
    ANPI_BENCHMARK(sizes,repetitions,times,baoc);
    
    ::anpi::benchmark::write("add_on_copy_double.txt",times);
    ::anpi::benchmark::plotRange(times,"On-copy (double)","g");
  }

  {
    benchAddInPlace<double> baip(n);

    // Measure in place add
    ANPI_BENCHMARK(sizes,repetitions,times,baip);

    ::anpi::benchmark::write("add_in_place_double.txt",times);
    ::anpi::benchmark::plotRange(times,"In-place (double)","m");
  }
#endif
  
  ::anpi::benchmark::show();
}
  
BOOST_AUTO_TEST_SUITE_END()
