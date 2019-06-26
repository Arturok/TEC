/*
 * Copyright (C) 2017
 * Área Académica de Ingeniería en Computadoras, ITCR, Costa Rica
 *
 * This file is part of the numerical analysis lecture CE3102 at TEC
 *
 * @Author: Pablo Alvarado
 * @Date:   28.12.2017
 */

#ifndef ANPI_MATRIX_ARITHMETIC_HPP
#define ANPI_MATRIX_ARITHMETIC_HPP

#include "Intrinsics.hpp"
#include <type_traits>
#include <iostream>
namespace anpi
{
    namespace fallback {
        /*
         * Sum
         */

        // Fallback implementation

        // In-copy implementation c=a+b
        template<typename T,class Alloc>
        inline void add(const Matrix<T,Alloc>& a,
                        const Matrix<T,Alloc>& b,
                        Matrix<T,Alloc>& c) {

            assert( (a.rows() == b.rows()) &&
                    (a.cols() == b.cols()) );

            const size_t tentries = a.rows()*a.dcols();
            c.allocate(a.rows(),a.cols());

            T* here        = c.data();
            T *const end   = here + tentries;
            const T* aptr = a.data();
            const T* bptr = b.data();

            for (;here!=end;) {
                *here++ = *aptr++ + *bptr++;
            }
        }

        // In-place implementation a = a+b
        template<typename T,class Alloc>
        inline void add(Matrix<T,Alloc>& a,
                        const Matrix<T,Alloc>& b) {

            assert( (a.rows() == b.rows()) &&
                    (a.cols() == b.cols()) );

            const size_t tentries = a.rows()*a.dcols();

            T* here        = a.data();
            T *const end   = here + tentries;

            const T* bptr = b.data();

            for (;here!=end;) {
                *here++ += *bptr++;
            }
        }


        /*
         * Subtraction
         */

        // Fall back implementations

        // In-copy implementation c=a-b
        template<typename T,class Alloc>
        inline void subtract(const Matrix<T,Alloc>& a,
                             const Matrix<T,Alloc>& b,
                             Matrix<T,Alloc>& c) {

            assert( (a.rows() == b.rows()) &&
                    (a.cols() == b.cols()) );

            const size_t tentries = a.rows()*a.dcols();
            c.allocate(a.rows(),a.cols());

            T* here        = c.data();
            T *const end   = here + tentries;
            const T* aptr = a.data();
            const T* bptr = b.data();

            for (;here!=end;) {
                *here++ = *aptr++ - *bptr++;
            }
        }

        // In-place implementation a = a-b
        template<typename T,class Alloc>
        inline void subtract(Matrix<T,Alloc>& a,
                             const Matrix<T,Alloc>& b) {

            assert( (a.rows() == b.rows()) &&
                    (a.cols() == b.cols()) );

            const size_t tentries = a.rows()*a.dcols();

            T* here        = a.data();
            T *const end   = here + tentries;

            const T* bptr = b.data();

            for (;here!=end;) {
                *here++ -= *bptr++;
            }
        }

        /*
         * Product
         */

        // Fall back implementations

        // Matrix*Matrix implementation c=a*b
        template<typename T,class Alloc>
        inline void product(const Matrix<T,Alloc>& a,
                            const Matrix<T,Alloc>& b,
                            Matrix<T,Alloc>& c) {

            c.allocate(a.rows(),b.cols());

            //T* here = c.data();
            T sum = T(0);

            for(size_t i=0;i<a.rows();++i){
                for(size_t j=0;j<b.cols();++j){
                    //*here = T(0);
                    sum = T(0);
                    for(size_t k=0;k<a.cols();++k){
                        //*here += (a[i][k]) * (b[k][j]);
                        sum += (a[i][k]) * (b[k][j]);
                    }
                    c[i][j] = sum;
                    //here++;
                }
            }
        }

        //Matrix*vector implementation c=a*b
        template<typename T,class Alloc>
        inline void product(const Matrix<T,Alloc>& a,
                            const std::vector<T>& b,
                            std::vector<T>& c){

            T sum = T(0);

            for(size_t i=0;i<a.rows();++i){
                for(size_t j=0;j<a.cols();++j){
                    sum += (a[i][j]) * (b[j]);
                }
                c.push_back(sum);
                sum = T(0);
            }
        }

        template<typename T,class Alloc>
        inline void fill(Matrix<T,Alloc> &a, const T toFill){
            a.slowfill(toFill);
        }

    } // namespace fallback


    namespace simd
    {
        /*
         * Sum
         */

        /*
         * The following code exemplifies how to manually accelerate code using
         * SIMD instructions.  However, for the simple element-wise algorithms
         * like sum or subtraction, modern compilers can automatically vectorize
         * the code, as the benchmarks show.
         */


        /// We wrap the intrinsics methods to be polymorphic versions
        template<typename T,class regType>
        regType mm_add(regType,regType); // We don't implement this to cause, at
        // least, a linker error if this version is
        // used.
        //{
        // Generic function should never be called.
        // If it is called, then some SIMD chaos is going on...

        // A way to cause a compile time error would be better
        // throw std::bad_function_call();
        // return regType();
        //}
        template<typename T,class regType>
        regType mm_sub(regType,regType);
        /**
         *
         * @tparam T
         * @tparam regType
         * @param toFill
         * @return
         */
        template <typename T, class regType>
        regType mm_fill(const T toFill);



#ifdef __AVX512F__
        template<>
    inline __m512d __attribute__((__always_inline__))
    mm_add<double>(__m512d a,__m512d b) {
      return _mm512_add_pd(a,b);
    }
    template<>
    inline __m512 __attribute__((__always_inline__))
    mm_add<float>(__m512 a,__m512 b) {
      return _mm512_add_ps(a,b);
    }
    template<>
    inline __m512i __attribute__((__always_inline__))
    mm_add<uint64_t>(__m512i a,__m512i b) {
      return _mm512_add_epi64(a,b);
    }
    template<>
    inline __m512i __attribute__((__always_inline__))
    mm_add<int64_t>(__m512i a,__m512i b) {
      return _mm512_add_epi64(a,b);
    }
    template<>
    inline __m512i __attribute__((__always_inline__))
    mm_add<uint32_t>(__m512i a,__m512i b) {
      return _mm512_add_epi32(a,b);
    }
    template<>
    inline __m512i __attribute__((__always_inline__))
    mm_add<int32_t>(__m512i a,__m512i b) {
      return _mm512_add_epi32(a,b);
    }
    template<>
    inline __m512i __attribute__((__always_inline__))
    mm_add<uint16_t>(__m512i a,__m512i b) {
      return _mm512_add_epi16(a,b);
    }
    template<>
    inline __m512i __attribute__((__always_inline__))
    mm_add<int16_t>(__m512i a,__m512i b) {
      return _mm512_add_epi16(a,b);
    }
    template<>
    inline __m512i __attribute__((__always_inline__))
    mm_add<uint8_t>(__m512i a,__m512i b) {
      return _mm512_add_epi8(a,b);
    }
    template<>
    inline __m512i __attribute__((__always_inline__))
    mm_add<int8_t>(__m512i a,__m512i b) {
      return _mm512_add_epi8(a,b);
    }
#elif defined __AVX__
        template<>
        inline __m256d __attribute__((__always_inline__))
        mm_add<double>(__m256d a,__m256d b) {
            return _mm256_add_pd(a,b);
        }
        template<>
        inline __m256 __attribute__((__always_inline__))
        mm_add<float>(__m256 a,__m256 b) {
            return _mm256_add_ps(a,b);
        }
        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_add<uint64_t>(__m256i a,__m256i b) {
            return _mm256_add_epi64(a,b);
        }
        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_add<int64_t>(__m256i a,__m256i b) {
            return _mm256_add_epi64(a,b);
        }
        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_add<uint32_t>(__m256i a,__m256i b) {
            return _mm256_add_epi32(a,b);
        }
        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_add<int32_t>(__m256i a,__m256i b) {
            return _mm256_add_epi32(a,b);
        }
        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_add<uint16_t>(__m256i a,__m256i b) {
            return _mm256_add_epi16(a,b);
        }
        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_add<int16_t>(__m256i a,__m256i b) {
            return _mm256_add_epi16(a,b);
        }
        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_add<uint8_t>(__m256i a,__m256i b) {
            return _mm256_add_epi8(a,b);
        }
        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_add<int8_t>(__m256i a,__m256i b) {
            return _mm256_add_epi8(a,b);
        }
/**
 * Resta de 2 matrices
 * @param a
 * @param b
 * @return
 */
        template<>
        inline __m256d __attribute__((__always_inline__))
        mm_sub<double>(__m256d a,__m256d b) {
            return _mm256_sub_pd(a,b);
        }
        template<>
        inline __m256 __attribute__((__always_inline__))
        mm_sub<float>(__m256 a,__m256 b) {
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
            return _mm256_add_epi16(a,b);
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
//  Fill a vector with a floating-point value
//  _mm256_set1_ps/pd
//        __m256d myVector = _mm256_set1_pd(123.2986);
//        double * res = (double *)&myVector;
        /**
         *
         * @param toFill
         * @return
         */
        template<>
        inline __m256 __attribute__((__always_inline__))
        mm_fill<float> (const float toFill){
            return _mm256_set1_ps(toFill);
        }


        template<>
        inline __m256d __attribute__((__always_inline__))
        mm_fill<double> (const double toFill){
            return _mm256_set1_pd(toFill);
        }


        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_fill<int64_t> (const int64_t toFill){
            return _mm256_set1_epi64x(toFill);
        }

        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_fill<uint64_t> (const uint64_t toFill){
            return _mm256_set1_epi64x(toFill);
        }


        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_fill<int32_t> (const int32_t toFill){
            return _mm256_set1_epi32(toFill);
        }

        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_fill<uint32_t > (const uint32_t toFill){
            return _mm256_set1_epi32(toFill);
        }

        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_fill<int16_t > (const int16_t toFill){
            return _mm256_set1_epi16(toFill);
        }

        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_fill<uint16_t > (const uint16_t toFill){
            return _mm256_set1_epi16(toFill);
        }

        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_fill<int8_t > (const int8_t toFill){
            return _mm256_set1_epi8(toFill);
        }

        template<>
        inline __m256i __attribute__((__always_inline__))
        mm_fill<uint8_t > (const uint8_t toFill){
            return _mm256_set1_epi8(toFill);
        }


//        __m256i
#elif  defined __SSE2__
        template<>
    inline __m128d __attribute__((__always_inline__))
    mm_add<double>(__m128d a,__m128d b) {
      return _mm_add_pd(a,b);
    }
    template<>
    inline __m128 __attribute__((__always_inline__))
    mm_add<float>(__m128 a,__m128 b) {
      return _mm_add_ps(a,b);
    }
    template<>
    inline __m128i __attribute__((__always_inline__))
    mm_add<std::uint64_t>(__m128i a,__m128i b) {
      return _mm_add_epi64(a,b);
    }
    template<>
    inline __m128i __attribute__((__always_inline__))
    mm_add<std::int64_t>(__m128i a,__m128i b) {
      return _mm_add_epi64(a,b);
    }
    template<>
    inline __m128i __attribute__((__always_inline__))
    mm_add<std::uint32_t>(__m128i a,__m128i b) {
      return _mm_add_epi32(a,b);
    }
    template<>
    inline __m128i __attribute__((__always_inline__))
    mm_add<std::int32_t>(__m128i a,__m128i b) {
      return _mm_add_epi16(a,b);
    }
    template<>
    inline __m128i __attribute__((__always_inline__))
    mm_add<std::uint16_t>(__m128i a,__m128i b) {
      return _mm_add_epi16(a,b);
    }
    template<>
    inline __m128i __attribute__((__always_inline__))
    mm_add<std::int16_t>(__m128i a,__m128i b) {
      return _mm_add_epi32(a,b);
    }
    template<>
    inline __m128i __attribute__((__always_inline__))
    mm_add<std::uint8_t>(__m128i a,__m128i b) {
      return _mm_add_epi16(a,b);
    }
    template<>
    inline __m128i __attribute__((__always_inline__))
    mm_add<std::int8_t>(__m128i a,__m128i b) {
      return _mm_add_epi32(a,b);
    }
#endif
        /**
         * Funcion agregada para trabajar con fillSimd
         * @tparam T
         * @tparam Alloc
         * @tparam regType
         * @param a
         * @param toFill
         */
        template<typename T, class Alloc, typename regType>
        inline void fillSIMD(Matrix<T,Alloc> &a, const T toFill){
            static_assert(!extract_alignment<Alloc>::aligned||
                          (extract_alignment<Alloc>::value >= sizeof(regType)),
                          "Aliniamiento insuficiente para los registros usados");
            std::cout<<"using funcion simd"<<"\n";
            const size_t tentries = a.rows()*a.dcols();
            regType* here = reinterpret_cast<regType*>(a.data());
            const size_t blocks = (tentries* sizeof(T) + (sizeof(regType) - 1) )/ sizeof(regType);
            regType *const end = here+blocks;
            for(;here!=end;){
                *here++ = simd::mm_fill<T,regType>(toFill);
            }
        }



        template<typename T,class Alloc,typename regType>
        inline void subSIMD(const Matrix<T,Alloc>& a,
                            const Matrix<T,Alloc>& b,
                            Matrix<T,Alloc>& c) {

            // This method is instantiated with unaligned allocators.  We
            // allow the instantiation although externally this is never
            // called unaligned
            static_assert(!extract_alignment<Alloc>::aligned ||
                          (extract_alignment<Alloc>::value >= sizeof(regType)),
                          "Insufficient alignment for the registers used");

            const size_t tentries = a.rows()*a.dcols();
            c.allocate(a.rows(),a.cols());

            regType* here        = reinterpret_cast<regType*>(c.data());
            const size_t  blocks = ( tentries*sizeof(T) + (sizeof(regType)-1) )/
                                   sizeof(regType);
            regType *const end   = here + blocks;
            const regType* aptr  = reinterpret_cast<const regType*>(a.data());
            const regType* bptr  = reinterpret_cast<const regType*>(b.data());
            std::cout<<"Hola soy SIMD"<<std::endl;
            for (;here!=end;) {
                *here++ = mm_sub<T>(*aptr++,*bptr++);
            }

        }


        // On-copy implementation c=a+b
        template<typename T,class Alloc,typename regType>
        inline void addSIMD(const Matrix<T,Alloc>& a,
                            const Matrix<T,Alloc>& b,
                            Matrix<T,Alloc>& c) {

            // This method is instantiated with unaligned allocators.  We
            // allow the instantiation although externally this is never
            // called unaligned
            static_assert(!extract_alignment<Alloc>::aligned ||
                          (extract_alignment<Alloc>::value >= sizeof(regType)),
                          "Insufficient alignment for the registers used");

            const size_t tentries = a.rows()*a.dcols();
            c.allocate(a.rows(),a.cols());

            regType* here        = reinterpret_cast<regType*>(c.data());
            const size_t  blocks = ( tentries*sizeof(T) + (sizeof(regType)-1) )/
                                   sizeof(regType);
            regType *const end   = here + blocks;
            const regType* aptr  = reinterpret_cast<const regType*>(a.data());
            const regType* bptr  = reinterpret_cast<const regType*>(b.data());

            for (;here!=end;) {
                *here++ = mm_add<T>(*aptr++,*bptr++);
            }

        }

        /**
         * Fill agregado para el proyecto2
         * @tparam T
         * @tparam Alloc
         * @param a
         * @param toFill
         */
        template<typename T,
                class Alloc,
                typename std::enable_if<is_simd_type<T>::value,int>::type=0>
        inline void fill(Matrix<T, Alloc> &a, const T toFill){
            if(is_aligned_alloc<Alloc>::value){
#ifdef __AVX__multVector
                fillSIMD<T, Alloc, typename avx_traits<T>::reg_type>(a, toFill);
#else
                ::anpi::fallback::fill(a,toFill);
#endif
            } else {
                ::anpi::fallback::fill(a,toFill);
            }
        }

        // On-copy implementation c=a+b for SIMD-capable types
        template<typename T,
                class Alloc,
                typename std::enable_if<is_simd_type<T>::value,int>::type=0>
        inline void add(const Matrix<T,Alloc>& a,
                        const Matrix<T,Alloc>& b,
                        Matrix<T,Alloc>& c) {

            assert( (a.rows() == b.rows()) &&
                    (a.cols() == b.cols()) );


            if (is_aligned_alloc<Alloc>::value) {
#ifdef __AVX512F__
                addSIMD<T,Alloc,typename avx512_traits<T>::reg_type>(a,b,c);
#elif  __AVX__
                addSIMD<T,Alloc,typename avx_traits<T>::reg_type>(a,b,c);
#elif  __SSE2__
                addSIMD<T,Alloc,typename sse2_traits<T>::reg_type>(a,b,c);
#else
        ::anpi::fallback::add(a,b,c);
#endif
            } else { // allocator seems to be unaligned
                ::anpi::fallback::add(a,b,c);
            }
        }

        // Non-SIMD types such as complex
        template<typename T,
                class Alloc,
                typename std::enable_if<!is_simd_type<T>::value,int>::type = 0>
        inline void add(const Matrix<T,Alloc>& a,
                        const Matrix<T,Alloc>& b,
                        Matrix<T,Alloc>& c) {

            ::anpi::fallback::add(a,b,c);
        }

        // In-place implementation a = a+b
        template<typename T,class Alloc>
        inline void add(Matrix<T,Alloc>& a,
                        const Matrix<T,Alloc>& b) {

            add(a,b,a);
        }


        /*
         * Subtraction
         */

        // Fall back implementations

        // In-copy implementation c=a-b
        template<typename T,class Alloc>
        inline void subtract(const Matrix<T,Alloc>& a,
                             const Matrix<T,Alloc>& b,
                             Matrix<T,Alloc>& c) {
#ifdef __AVX__
            subSIMD<T,Alloc,typename avx_traits<T>::reg_type>(a,b,c);
#else
            ::anpi::fallback::subtract(a,b,c);
#endif

        }

        // In-place implementation a = a-b
        template<typename T,class Alloc>
        inline void subtract(Matrix<T,Alloc>& a,
                             const Matrix<T,Alloc>& b) {
            simd::subtract(a,b,a);
        }
    } // namespace simd


    // The arithmetic implementation (aimpl) namespace
    // dispatches to the corresponding methods
#ifdef ANPI_ENABLE_SIMD
    namespace aimpl=simd;
#else
    std::cout<<"funcion slow"<<"\n";
  namespace aimpl=fallback;
#endif

} // namespace anpi

#endif
