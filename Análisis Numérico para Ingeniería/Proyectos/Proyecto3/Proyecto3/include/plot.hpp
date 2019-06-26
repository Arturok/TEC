//
// Created by arturo on 08/06/18.
//

#ifndef TAREA03_PLOT_HPP
#define TAREA03_PLOT_HPP


#include <python2.7/Python.h>

#include "Matrix.hpp"

namespace anpi {


    template <typename T>
    void matrixToString(Matrix<T> Z, std::string& data) {
        data.append("Z=[");
        for (size_t i = 0; i < Z.rows(); ++i) {
            data.append("[");
            for (size_t j = 0; j < Z.cols(); ++j) {
                data.append(std::to_string(Z(i,j)));
                if (j != Z.cols()-1) {
                    data.append(",");
                }
            }
            if(i == Z.rows()-1) {
                data.append("]]\n");
            }
            else {
                data.append("],");
            }
        }

    }

    template <typename T>
    void plotMatrix(Matrix<T> A, bool heatFlow) {
        Py_Initialize();

        std::string Mat = "";
        PyRun_SimpleString("import numpy as np");
//        PyRun_SimpleString("");

        std::string zMatrix;
        matrixToString(A, zMatrix);
        if (heatFlow) {
            std::string getPlot = "import pylab as plt\n"
                                  "num = 1\n"
                                  "if((len(Z[0])+len(Z))//(2)>=10):num=(len(Z[0])+len(Z))//(2*10)\n"
                                  "dx = np.linspace(0,(len(Z[0])-num),len(Z[0])//num)\n"
                                  "dy = np.linspace(0,(len(Z)-num),len(Z)//num)\n"
                                  "X,Y = np.meshgrid(dx,dy)\n"
                                  "u = np.zeros((len(X),len(X[0])))\n"
                                  "v = np.zeros((len(Y),len(Y[0])))\n"
                                  "o=0\n"
                                  "j=0\n"
                                  "deltaX = 100\n"
                                  "deltaY = 30\n"
                                  "for x in range(len(X)):\n"
                                  "    for y in range(len(X[0])):\n"
                                  "        if(o!=0 and o!=len(Z)-1 and j!=0 and j!=len(Z[0])-1):\n"
                                  "            v[x][y]= (Z[o+1][j]-Z[o-1][j])/(2*deltaX)\n"
                                  "            u[x][y]= -(Z[o][j+1]-Z[o][j-1])/(2*deltaY)\n"
                                  "        else:\n"
                                  "            v[x][y]= 0\n"
                                  "            u[x][y]= 0\n"
                                  "        j+=num\n"
                                  "    o+=num\n"
                                  "    j=0\n"
                                  "plt.imshow(Z, cmap=plt.cm.get_cmap('jet'))\n"
                                  "plt.colorbar()\n"
                                  "plt.axis('auto')\n"
                                  "plt.title('Flujo de calor')\n"
                                  "plt.quiver(X,Y,u,v,width=.005,linewidth=.01 )\n"
                                  "plt.show()\n";
            zMatrix.append(getPlot);
        }
        else {
            std::string getPlot = "import matplotlib.pyplot as plt\n"
                                  "plt.pcolormesh(Z, cmap=plt.cm.get_cmap('jet'))\n"
                                  "plt.colorbar()\n"
                                  "plt.axis('auto')\n"
                                  "plt.title('Distribucion de calor')\n"
                                  "plt.show()\n";
            zMatrix.append(getPlot);
        }






        PyRun_SimpleString(zMatrix.c_str());

    }





}
#endif //TAREA03_PLOT_HPP
