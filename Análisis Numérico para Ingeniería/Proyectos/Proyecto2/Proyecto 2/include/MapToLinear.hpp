/*
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, ITCR, Costa Rica
 *
 * @Author: Arturo, Santiago, Jeremy
 * @Date:   23.04.2018
 */

#include <iostream>
#include <cstdlib>

#ifndef ANPI_MAPTOLINEAR_HPP
#define ANPI_MAPTOLINEAR_HPP

namespace anpi{

	/**
	 * Map the index of two terminal nodes from the matrix of resistances, to linear index that
	 * calls the number of resistance, read from left to right and top to down.
	 *
	 * @param  node1_row[in] number of row for the first node.
	 * @param  node1_col[in] number of column for the first node.
	 * @param  node2_row[in] number of row for the second node.
	 * @param  node2_col[in] number of column for the second node.
	 * @param  cols[in] number of columns for the matrix.
	 * @return Linear index starting 0.
	 */
	int map_MatToLine (const int node1_row, const int node1_col,
					   const int node2_row, const int node2_col,
					   const int cols){

		int index = 0;

		if (node1_row == node2_row){

			index = (node1_col + ((node1_row-1)*(cols-1)) + ((node1_row-1)*(cols)))-1;
		}
		else {

			index = (node1_col + (node1_row*(cols-1)) + ((node1_row-1)*(cols)))-1;
		}

		return index;
	}
}
#endif