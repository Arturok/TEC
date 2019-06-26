//
// Created by santii on 27/03/18.
//
#include <cmath>
#include <limits>
#include <functional>
#include <algorithm>
#include <math.h>
#include <iostream>
#include <cstdlib>
#include <vector>

#include "Exception.hpp"
#include "Matrix.hpp"

#ifndef TAREA03_QR_HPP
#define TAREA03_QR_HPP

//#ifndef ANPI_LU_DOOLITTLE_HPP
//#define ANPI_LU_DOOLITTLE_HPP

namespace anpi {
    template <typename T>
    void printMatrix(anpi::Matrix<T> Q, int id){
        std::cout<<"La matriz Q"<<id<<" es:"<<std::endl;
        for (size_t i = 0; i< Q.rows(); ++i){
            for (size_t j = 0; j < Q.cols(); ++j) {
                std::cout<<Q[i][j]<<" ";
            }
            std::cout<<std::endl;
        }
    }

    template <typename T>
    void setColumn(Matrix<T> &E, Matrix<T> &Q,int colum){
        for (size_t i = 0; i< Q.rows(); ++i){
            E[i][colum] = Q[i][colum];
        }
    }

    template <typename T>
    T norm(anpi::Matrix<T> a, int colum){
        T mynorm = T(0);
        for (size_t i = 0; i < a.rows(); ++i) {
            mynorm += a[i][colum] * a[i][colum];
        }

        mynorm = std::sqrt(mynorm);
        return mynorm;
    }

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
    template <typename T>
    void multNumXMatrix(Matrix<T>& q, T num){
        for (size_t i = 0; i < q.rows() ; ++i) {
            for (size_t j = 0; j < q.cols() ; ++j) {
                q(i,j) = q(i,j) * num;
            }
        }
    }

    template<typename T>
    anpi::Matrix<T> transpose(anpi::Matrix<T> Q) {
        anpi::Matrix<T> transpMatrix;
        transpMatrix.allocate(Q.cols(),Q.rows());

        for (size_t i = 0; i < Q.rows(); ++i) {
            for (size_t j = 0; j < Q.cols(); ++j) {
                transpMatrix[j][i] = Q[i][j];
            }
        }
        return transpMatrix;
    }

    template<typename T>
    void getAprim(Matrix<T> &Aprim){
        Matrix<T> temp;
        temp.allocate(Aprim.rows() -1, Aprim.cols()-1);
        for(size_t i = 0; i<Aprim.rows(); ++i){
            for (size_t j = 0; j < Aprim.cols() ; ++j) {
                if(i >= 1 && j>=1){
                    temp(i-1,j-1)= Aprim[i][j];
                }
            }
        }
        Aprim = temp;
    }
    template <typename T>
    Matrix<T> fillZeros(Matrix<T> Q1, size_t n){
        Matrix<T> complete;
        if(Q1.rows() < n){
            complete.allocate(n,n);
            size_t Qsize = Q1.rows();
            //diference betwen the matriz that has to be fill
            size_t dif = n - Qsize;
            for (size_t i = 0; i < n; ++i) {
                for (size_t j = 0; j < n; ++j) {
                    if(i < dif or j < dif){
                        if(i==j)complete(i,j) = T(1);
                        else complete(i,j) = T(0);
                    }
                    else complete(i,j) = Q1(i-dif, j-dif);
                }
            }
        } else complete = Q1;
        return complete;
    }

    /**
     * Obtener la matriz H sub n de la descomposici[on
     * @tparam T
     * @param H
     * @param n
     * @return
     */
    template <typename T>
    Matrix<T> getH( Matrix<T> Aprim){
        /**
         * I = identidad de n - 1
         * e = vector [1, 0, 0, ..... n]^T
         * u = variable temporal guarda a - ||a||^2 * e
         */
        Matrix<T> e, col, I, H;


        //Identidad del H.rows tamano
        I = identity<T>(Aprim.rows(),Aprim.cols());
        //Vector del tamano de H [[1] [0] [0] ..... ]
        e.allocate(Aprim.rows(),1);

        //e.column(0)= I.column(0);
        setColumn(e,I,0);


        //Obtenemos la norma del primer vector

        T normA = norm(Aprim,0);
        //e * norma
        multNumXMatrix<T>(e,normA);

        //a - ||a||*e
        col.allocate(Aprim.rows(),1);
        //col.column(0) = Aprim.column(0);
        setColumn(col,Aprim,0);

        col = col - e;
        Matrix<T> mult = col * transpose<T>(col);

       //2/(||a||^2)

        T normCol = norm(col,0);
        T value = (T(2) / (normCol * normCol));

        //H = value * u*(u^T)
        H = col * transpose(col);

        multNumXMatrix(H,value);

        H = I -  H;
        return H;
    }

    template<typename T>
    void qr ( const anpi::Matrix<T>& A, anpi::Matrix<T>& Q, anpi::Matrix<T>& R ) {
        Matrix<T> Aprim = A, temp, Hn;
        size_t Asize = A.rows();
        std::vector<Matrix<T> > qRoots;

        Hn = getH<T>(Aprim);
        Hn = fillZeros(Hn, Asize);
        qRoots.push_back(Hn);

        Aprim = Hn * Aprim;

        //Empieza en 1 xq el 0 se hizo para inicializar los valores
        for (size_t i = 1; i < Asize-1 ; ++i) {
            temp = Aprim;
            getAprim(temp);
            Hn = getH(temp);
            Hn = fillZeros(Hn,Asize);
            qRoots.push_back( Hn);
            Aprim = Hn * Aprim ;
        }

        Q = qRoots[0];
        for (size_t k = 1; k < Asize-1; ++k){
            Q = Q * qRoots[k];
        }
        R = transpose(Q)*A;
    }
}


#endif //TAREA03_QR_HPP
