/**
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, ITCR, Costa Rica
 *
 * This file is part of the numerical analysis lecture CE3102 at TEC
 *
 * @Author: Jeremy, Arturo, Santiago
 * @Date  : 10.05.2018
 */




#ifndef TAREA03_RANDOMSYMMETRICSQR_HPP
#define TAREA03_RANDOMSYMMETRICSQR_HPP

namespace anpi {
    /**
     * Genera una matriz simetrica con valores aleatorios
     *
     * @param[in] N Tamanyo de la matriz (N filas y N columnas)
     * @return Matriz simetrica aleatoria
     */
    template<typename T>
    anpi::Matrix<T> randomSymmetricSqr(const size_t N){
        anpi::Matrix<T> A;

        A.allocate(N,N);

        const size_t tentries = A.dcols()*A.rows();
        T* here = A.data();
        T *const end = here + tentries;

        int i = 0;
        srand(time(0));
        for(;here!=end;){

            *here++ = rand();
            i++;
        }
        return A;
    }

    template <typename T>
    void randomSymmetricSqrByParam(Matrix<T>& A, const size_t N){
//        anpi::Matrix<T> A;

        A.allocate(N,N);

        const size_t tentries = A.dcols()*A.rows();
        T* here = A.data();
        T *const end = here + tentries;
        for(;here!=end;){
            const T rnd = rand();
        //    std::cout << "Random: " << rnd << std::endl;

            *here++ = rnd;
        }
//        return A;
    }

}



#endif //TAREA03_RANDOMSYMMETRICSQR_HPP
