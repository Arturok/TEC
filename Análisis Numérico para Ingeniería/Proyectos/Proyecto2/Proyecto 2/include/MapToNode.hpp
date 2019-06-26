/*
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, ITCR, Costa Rica
 *
 * @Author: Arturo, Santiago, Jeremy
 * @Date:   23.04.2018
 */

#include <iostream>
#include <cstdlib>

#ifndef ANPI_MAPTONODE_HPP
#define ANPI_MAPTONODE_HPP

namespace anpi{

	/**
	 * Map the index of a current, to the index of two terminal nodes.
	 *
	 * @param  i[in] index of the current in vector x.
	 * @param  cols[in] number of columns of the matrix.
	 * @return vector that contain the 2 index for each node.
	 */
	std::vector<int> map_LineToMat (const int i, const int cols){

		std::vector<int> index(4,0);

		int factpar = 0;
		int factimpar = 0;

		int it = 0;

		int j = i;
		while (j>0){

			if ((j-(cols-1)) >= 0){
				j -= cols-1;
				factpar++;
				it++;
			}
			else{
				break;
			}

			if ((j-(cols)) >= 0){
				j -= cols;
				factimpar++;
				it++;
			}
			else{
				break;
			}
		}

		if ((it%2) != 0){
			index[0] = it-factimpar;
			index[1] = j+1;
			index[2] = it+1-factimpar;
			index[3] = j+1;
		}

		else if (it==0){
			index[0] = it+1;
			index[1] = j+1;
			index[2] = it+1;
			index[3] = j+2;
		}

		else{
			index[0] = it+1-factpar;
			index[1] = j+1;
			index[2] = it+1-factpar;
			index[3] = j+2;
		}

		return index;
	}
}
#endif