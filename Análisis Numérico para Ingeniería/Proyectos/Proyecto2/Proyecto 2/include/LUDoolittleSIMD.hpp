//
// Created by santii on 25/04/18.
//

#ifndef TAREA03_LUDOOLITTLESIMD_HPP
#define TAREA03_LUDOOLITTLESIMD_HPP

#include <vector>
#include <cmath>

#include "Matrix.hpp"
namespace anpi {

    template<typename T, class regType>
    regType mm_multiply(regType a, const T escalar);

    template<typename T, class regType>
    regType mm_sub(regType a, regType b);



#ifdef __AVX__
    /**
     * Funciones para multiplicar
     * @param a
     * @param escalar
     * @return
     */
    template<>
    inline __m256d __attribute__((__always_inline__))
    mm_multiply<double>(__m256d a, const double escalar) {
        return _mm256_mul_pd(a, _mm256_set1_pd(escalar));
    }

    template<>
    inline __m256 __attribute__((__always_inline__))
    mm_multiply<float>(__m256 a, const float escalar) {
        return _mm256_mul_ps(a, _mm256_set1_ps(escalar));
    }


    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_multiply<uint32_t>(__m256i a, const uint32_t escalar) {
        return _mm256_mul_epu32(a,_mm256_set1_epi32(escalar));
    }
    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_multiply<int32_t>(__m256i a, const int32_t escalar) {
        return _mm256_mul_epi32(a,_mm256_set1_epi32(escalar));
    }



    /**
     * Funciones para restar
     * @param a
     * @param escalar
     * @return
     */
    template<>
    inline __m256d __attribute__((__always_inline__))
    mm_sub<double>(__m256d a, __m256d b) {
        return _mm256_sub_pd(a,b);
    }

    template<>
    inline __m256 __attribute__((__always_inline__))
    mm_sub<float>(__m256 a, __m256 b) {
        return _mm256_sub_ps(a,b);
    }

    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_sub<uint64_t>(__m256i a,__m256i b) {
        return _mm256_sub_epi64(a,b);
    }
    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_sub<int64_t>(__m256i a,__m256i b) {
        return _mm256_sub_epi64(a,b);
    }
    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_sub<uint32_t>(__m256i a,__m256i b) {
        return _mm256_sub_epi32(a,b);
    }
    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_sub<int32_t>(__m256i a,__m256i b) {
        return _mm256_sub_epi32(a,b);
    }
    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_sub<uint16_t>(__m256i a,__m256i b) {
        return _mm256_sub_epi16(a,b);
    }
    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_sub<int16_t>(__m256i a,__m256i b) {
        return _mm256_sub_epi16(a,b);
    }
    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_sub<uint8_t>(__m256i a,__m256i b) {
        return _mm256_sub_epi8(a,b);
    }
    template<>
    inline __m256i __attribute__((__always_inline__))
    mm_sub<int8_t>(__m256i a,__m256i b) {
        return _mm256_sub_epi8(a,b);
    }

#endif
    /**
     * Funcion para multiplicar una fila x por un escalar
     * @tparam T
     * @tparam Alloc
     * @tparam regType
     * @param a
     * @param fila
     * @param valor
     */
    template<typename T, class Alloc, typename regType>
    inline void multSIMD(Matrix<T, Alloc> &a, size_t fila, const T valor) {
        regType *here = reinterpret_cast<regType *>(a.data());
        for (size_t i = 0; i < fila; ++i) here++;
        *here = mm_multiply<T, regType>(*here, valor);

    }

    /**
     * Restar 2 filas de una matriz
     * @tparam T
     * @tparam Alloc
     * @tparam regType
     * @param a
     * @param fila
     * @param valor
     */
    template<typename T, class Alloc, typename regType>
    inline void sub2RowSIMD(Matrix<T, Alloc> &a, const size_t fila1, Matrix<T,Alloc> &b, const size_t fila2) {
        regType *here = reinterpret_cast<regType *>(a.data());
        regType *subtract = reinterpret_cast<regType *>(b.data());

        for (size_t i = 0; i < fila1; ++i) here++;
        for (size_t i = 0; i < fila2; ++i) subtract++;
        *here = mm_sub<T, regType>(*here, *subtract);

    }

    template<typename T, class Alloc>
    inline void multVector(Matrix<T, Alloc> &a, size_t fila, const T valor) {
//        std::cout<<"SIMD MULT"<<std::endl;

        anpi::multSIMD<T, Alloc, typename avx_traits<T>::reg_type>(a, fila, valor);
    }

    template<typename T, class Alloc>
    inline void sub2Rows(Matrix<T, Alloc> &a, const size_t fila1, Matrix<T,Alloc> &b, const size_t fila2) {
        anpi::sub2RowSIMD<T, Alloc, typename avx_traits<T>::reg_type>(a, fila1, b, fila2);
    }



/**
   * Decompose the matrix A into a lower triangular matrix L and an
   * upper triangular matrix U.  The matrices L and U are packed into
   * a single matrix LU, all it using SIMD
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
    template <typename T>
    void luDoolittleSIMD(const Matrix<T>& A,
                         Matrix<T>& LU,
                         std::vector<size_t>& permut) {
        if(A.rows() != A.cols()) {
            throw anpi::Exception("Matrix must be square");
        }

        try {
            permut = std::vector<size_t>(A.rows(), 0);
            LU = A;
            for(size_t k = 0; k < LU.rows() - 1; ++k) {
                for(size_t i = k + 1; i < LU.rows(); ++i) {
                    //Calculate factor
                    const T factor = LU[i][k]/LU[k][k];
                    //Multiply all the row for the factor
                    Matrix<T> temp = LU;
                    multVector(temp, i, factor);
                    sub2Rows(LU,i,temp,i);
                    //LU[i,j] = factor;

//                    for(size_t j = k; j < LU.rows(); ++j) {
//                        //Copy factor in matrix L
//                        if(j == k){
//                            LU[i][j] = factor;
//                        }
//                            //Run the substration from the elimination to calculate matrix U
//                        else{
//                            LU[i][j] -= factor * LU[k][j];
//                        }
//                    }
                }
            }
        }
        catch(anpi::Exception& exc){throw anpi::Exception("Matrix can't be descomposed");}
    }

}
#endif //TAREA03_LUDOOLITTLESIMD_HPP
