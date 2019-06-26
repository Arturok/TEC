/**
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * This file is part of the CE3102 Numerical Analysis lecture at TEC
 *
 * @Author: Arturo, Santiago, Jeremy
 * @Date  : 25.04.2018
 */

#include <boost/test/unit_test.hpp>

#include "MapToLinear.hpp"
#include "MapToNode.hpp"

#include <iostream>
#include <exception>
#include <cstdlib>
#include <complex>

#include <functional>

#include <cmath>

namespace anpi {
  namespace test {

  	void mapTest(const std::function<int(const int, 
  										 const int,
  										 const int,
  										 const int,
  										 const int)>& maptoL,
  				 const std::function< std::vector<int>(const int,
  				 									   const int) >& maptoM){

  		//Test the linear maping from 2 matrix index
  		{
			int col = 50;
			int node1_row = 1;
			int node1_col = 1;
			int node2_row = 1;
			int node2_col = 2;

        	int LineIndex = maptoL(node1_row,node1_col,node2_row,node2_col,col);

        	std::vector<int> ind = maptoM(LineIndex,col);

        	BOOST_CHECK(ind[0]==node1_row);
        	BOOST_CHECK(ind[1]==node1_col);
        	BOOST_CHECK(ind[2]==node2_row);
        	BOOST_CHECK(ind[3]==node2_col);
  		}

  	}



 }//test
}//anpi

BOOST_AUTO_TEST_SUITE( MAP )

BOOST_AUTO_TEST_CASE(Linear) 
{
  anpi::test::mapTest(anpi::map_MatToLine,
                            anpi::map_LineToMat);
}

BOOST_AUTO_TEST_SUITE_END()
