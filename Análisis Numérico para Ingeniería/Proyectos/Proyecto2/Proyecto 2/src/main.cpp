/**
 * Copyright (C) 2018
 * Área Académica de Ingeniería en Computadoras, TEC, Costa Rica
 *
 * This file is part of the CE3102 Numerical Analysis lecture at TEC
 *
 * @Author: 
 * @Date  : 24.02.2018
 */

#include <cstdlib>
#include <iostream>
//#include <opencv2/opencv.hpp>
//#include "Matrix.hpp"
#include "LUDoolittle.hpp"
#include "QR.hpp"
#include "imgManager.hpp"

int main() {
    anpi::Matrix<float> map;
    std::string path = "Capture.PNG";
    //std::string path = "Capture.PNG";
    anpi::loadMatrix(map, path);
    anpi::printMatrix(map, 55);


  return 1;
}
  
