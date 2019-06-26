/**
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, ITCR, Costa Rica
 *
 * This file is part of the numerical analysis lecture CE3102 at TEC
 *
 * @Author: 
 * @Date  : 03.03.2018
 */

#include <iostream>
#include <cstdlib>

#include "Matrix.hpp"
#include "LUDoolittle.hpp"

#ifndef ANPI_LU_HPP
#define ANPI_LU_HPP

namespace anpi {

	/**
	 * Execute the faster method for the descomposition.
	 *
	 * @param[in] A a square matrix to descompose.
	 * @param[out] LU matrix encoding the L and U matrices.
	 * @param[out] permut permutation vector, holding the indices of the
   *               original matrix falling into the corresponding element.
	 */
	template<typename T>
	inline void lu (const anpi::Matrix<T>& A,
					anpi::Matrix<T>& LU,
					std::vector<size_t>& p){

		anpi::luDoolittle(A,LU,p);
	}
}
#endif