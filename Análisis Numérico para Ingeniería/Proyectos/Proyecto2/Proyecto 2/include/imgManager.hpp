//
// Created by arturo on 27/04/18.
//

#ifndef TAREA03_IMGMANAGER_HPP
#define TAREA03_IMGMANAGER_HPP

#endif //TAREA03_IMGMANAGER_HPP



#include <map>
#include <iostream>
#include <cstdlib>
#include <vector>
#include <opencv2/opencv.hpp>
//#include "code/Matrix.hpp"
#include <python2.7/Python.h>
//#include "code/LU.cpp"
//#include "code/Optimizado/LUoptimizado.cpp"
//#include "anpi_code/plot/plotpy.h"
#include "Matrix.hpp"

using namespace cv;

namespace anpi {
    /**
     * Function that load the img pixels into a Matrix map
     * @tparam T Double or Float
     * @tparam Alloc For the Matrix
     * @param a The Matrix to be loaded
     * @param path Path of the image
     */
    template <typename T>
    inline void loadMatrix(Matrix<T>& a, std::string path){
        Mat img = imread(path, IMREAD_GRAYSCALE);
        anpi::Matrix<T> map;
        map.allocate(img.cols, img.rows);

        for (int i = 0; i < img.cols; ++i) {
            for (int j = 0; j < img.rows; ++j) {
                int color;
                color = img.at<uchar>(i,j);
                if (color > 200) {
                    map[i][j] = T(0);
//                    std::cout<< "Alto" << std::endl;
                }
                else {
                    map[i][j] = T(1);
//                    std::cout<< "Bajo" << std::endl;
                }
            }
        }
        a = map;
    }
}//end anpi