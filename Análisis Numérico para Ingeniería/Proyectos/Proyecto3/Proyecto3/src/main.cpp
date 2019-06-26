#include <iostream>
#include <boost/math/tools/polynomial.hpp>
#include <boost/program_options/options_description.hpp>
#include <boost/program_options/parsers.hpp>
#include <boost/program_options/variables_map.hpp>
#include <boost/lexical_cast.hpp>
#include "Matrix.hpp"
#include <stdlib.h>
#include <vector>

#include <ctime>
#include <time.h>

#include <string>
#include <fstream>

#include "liebmann.hpp"
#include "plot.hpp"
#include "spline.hpp"
//#include "string.h"



int main(int argc, char** argv) {

  using boost::lexical_cast;
  using boost::bad_lexical_cast;

  std::vector<float> topTemp;
    std::vector<float> topTemp2;
  std::vector<float> bottomTemp;
  std::vector<float> bottomTemp2;
  std::vector<float> leftTemp;
  std::vector<float> leftTemp2;
  std::vector<float> rightTemp;
  std::vector<float> rightTemp2;
  std::vector<std::string> isolate;
  std::string configFile;
  int hPixels = 0;
  int vPixels = 0;
  bool displayForm = true;
  bool heatFlowCalc = false;
  int gridSize = 0;


#define debug

  boost::program_options::options_description options("Project 3 Options");
  options.add_options()
          ( "help","Imprime esta lista de opciones")
          ( "p", boost::program_options::value<std::string>(&configFile),"Indica el nombre del archivo con perfil t́ermico." )
          ( "t", boost::program_options::value<std::vector<float> >(&topTemp)->multitoken(), "Indica temperatura en borde superior." )
          ( "b", boost::program_options::value<std::vector<float> >(&bottomTemp)->multitoken(), "Indica temperatura en borde inferior." )
          ( "l", boost::program_options::value<std::vector<float> >(&leftTemp)->multitoken(), "Indica temperatura en borde izquierdo." )
          ( "d", boost::program_options::value<std::vector<float> >(&rightTemp)->multitoken(), "Indica temperatura en borde derecho." )
          ( "i", boost::program_options::value<std::vector<std::string> >(&isolate)->multitoken(), "Bordes que se desean aislar")
          ( "h", boost::program_options::value<int>(&hPixels), "Número de píxeles horizontales en la solución." )
          ( "v", boost::program_options::value<int>(&vPixels), "Número de píxeles verticales en la solución." )
          ( "q", "Desactiva toda forma de visualización")
          ( "f", "Activa el cálculo de flujo de calor" )
          ( "g", boost::program_options::value<int>(&gridSize), "Tamaño de rejilla de visualización para flujo de calor." );


  boost::program_options::options_description fileOptions{"ConfigFile"};
  fileOptions.add_options()
          ( "top", boost::program_options::value<std::vector<float> >(&topTemp2)->multitoken(), "Indica temperatura en borde superior." )
          ( "bottom", boost::program_options::value<std::vector<float> >(&bottomTemp2)->multitoken(), "Indica temperatura en borde inferior." )
          ( "left", boost::program_options::value<std::vector<float> >(&leftTemp2)->multitoken(), "Indica temperatura en borde izquierdo." )
          ( "right", boost::program_options::value<std::vector<float> >(&rightTemp2)->multitoken(), "Indica temperatura en borde derecho." )
          ( "horizontal", boost::program_options::value<int>(), "Pixeles horizontales");

  boost::program_options::positional_options_description pod;
  pod.add("file", -1);
  boost::program_options::variables_map vMap;

  try {
    boost::program_options::store(boost::program_options::parse_command_line(argc, argv, options, boost::program_options::command_line_style::unix_style ^ boost::program_options::command_line_style::allow_short), vMap);
    boost::program_options::notify(vMap);

    if (vMap.count("help")) {
      std::cout << options << std::endl;
      return 0;
    }




      if (vMap.count("p")) {
          std::cout << "Se utilizará el archivo: " << configFile << std::endl;

          std::fstream path("perfil");
          const std::string xxx = configFile;
          path.open(xxx);
          boost::program_options::notify(vMap);
          std::ifstream ifs{"perfil.txt"};
          if (!path.is_open()) {
              std::cout << "No se puede abrir el archivo: " << vMap["p"].as<std::string>() << "\n";
              return -1;
          }
          else {
              boost::program_options::store(parse_config_file(path, fileOptions, true), vMap);
              boost::program_options::notify(vMap);
          }
          path.close();
      }

      if (vMap.count("t")) {
#ifdef debug
          std::cout << "Temperatura del borde superior cambiada a: ";
          for(std::vector<float>::iterator it = topTemp.begin(); it != topTemp.end(); ++it) {
              std::cout << ' ' << *it;
          }
          std::cout << '\n';
#endif
      }
      if (vMap.count("top")) {

#ifdef debug
          if (topTemp.empty()) {
              topTemp = topTemp2;
              std::cout << "Temperatura del borde superior cambiada a: ";
              for(std::vector<float>::iterator it = topTemp.begin(); it != topTemp.end(); ++it) {
                  std::cout << ' ' << *it;
              }
              std::cout << '\n';
          }

#endif
      }

    if (vMap.count("b")) {
#ifdef debug
      std::cout << "Temperatura del borde inferior cambiada a: ";
      for(std::vector<float>::iterator it = bottomTemp.begin(); it != bottomTemp.end(); ++it) {
        std::cout << ' ' << *it;
      }
      std::cout << '\n';
#endif
    }

      if (vMap.count("bottom")) {
#ifdef debug
          if (bottomTemp.empty()) {
              bottomTemp = bottomTemp2;
              std::cout << "Temperatura del borde inferior cambiada a: ";
              for(std::vector<float>::iterator it = bottomTemp.begin(); it != bottomTemp.end(); ++it) {
                  std::cout << ' ' << *it;
              }
              std::cout << '\n';
          }

#endif
      }

    if (vMap.count("l")) {
#ifdef debug
      std::cout << "Temperatura del borde izquierdo cambiada a: ";
      for(std::vector<float>::iterator it = leftTemp.begin(); it != leftTemp.end(); ++it) {
        std::cout << ' ' << *it;
      }
      std::cout << '\n';
#endif
    }

      if (vMap.count("left")) {
#ifdef debug
          if (leftTemp.empty()) {
              leftTemp = leftTemp2;
              std::cout << "Temperatura del borde izquierdo cambiada a: ";
              for(std::vector<float>::iterator it = leftTemp.begin(); it != leftTemp.end(); ++it) {
                  std::cout << ' ' << *it;
              }
              std::cout << '\n';
          }

#endif
      }

    if (vMap.count("d")) {
#ifdef debug
      std::cout << "Temperatura del borde derecho cambiada a: ";
      for(std::vector<float>::iterator it = rightTemp.begin(); it != rightTemp.end(); ++it) {
        std::cout << ' ' << *it;
      }
      std::cout << '\n';
#endif
    }

      if (vMap.count("right")) {
#ifdef debug
          if (rightTemp.empty()) {
              rightTemp = rightTemp2;
              std::cout << "Temperatura del borde derecho cambiada a: ";
              for(std::vector<float>::iterator it = rightTemp.begin(); it != rightTemp.end(); ++it) {
                  std::cout << ' ' << *it;
              }
              std::cout << '\n';
          }

#endif
      }

    if (vMap.count("i")) {
#ifdef debug
      std::cout << "Bordes aislados: ";
      for(std::vector<std::string>::iterator it = isolate.begin(); it != isolate.end(); ++it) {
        std::cout << ' ' << *it;
      }
      std::cout << '\n';
      for(std::vector<std::string>::iterator it = isolate.begin(); it != isolate.end(); ++it) {
        if (*it == "b") {
          bottomTemp = {0};
          std::cout << "Temperatura del borde de abajo cambiada a:";
          for(std::vector<float>::iterator it = bottomTemp.begin(); it != bottomTemp.end(); ++it) {
            std::cout << ' ' << *it;
          }
          std::cout << '\n';
        }
        else if (*it == "l") {
          leftTemp = {0};
          std::cout << "Temperatura del borde izquierdo cambiada a:";
          for(std::vector<float>::iterator it = leftTemp.begin(); it != leftTemp.end(); ++it) {
            std::cout << ' ' << *it;
          }
          std::cout << '\n';
        }
        else if (*it == "d") {
          rightTemp = {0};
          std::cout << "Temperatura del borde derecho cambiada a:";
          for(std::vector<float>::iterator it = rightTemp.begin(); it != rightTemp.end(); ++it) {
            std::cout << ' ' << *it;
          }
          std::cout << '\n';
        }
        else if (*it == "t") {
          topTemp = {0};
          std::cout << "Temperatura del borde de abajo cambiada a:";
          for(std::vector<float>::iterator it = topTemp.begin(); it != topTemp.end(); ++it) {
            std::cout << ' ' << *it;
          }
          std::cout << '\n';
        }
        else {
          std::cerr << "Error: el borde asignado no pertenece a la rejilla" << std::endl;
          isolate = {};
        }
      }
#endif
    }
    if (vMap.count("h")) {
      if (hPixels > 0) {
#ifdef debug
        std::cout << "Número de píxeles horizontales en la solución cambiado a: " << hPixels << std::endl;
#endif
      }
      else {
        std::cout << "Se definieron " << hPixels << " píxeles horizontales para la solución" << std::endl;
        std::cerr << "Error: el número de píxeles horizontales en la solución debe ser un número entero mayor que cero" << std::endl;
      }
    }
    if (vMap.count("v")) {
      if (vPixels > 0) {
#ifdef debug
        std::cout << "Número de píxeles verticales en la solución cambiado a: " << vPixels << std::endl;
#endif
      }
      else {
        std::cout << "Se definieron " << vPixels << " píxeles verticales para la solución" << std::endl;
        std::cerr << "Error: el número de píxeles verticales en la solución debe ser un número entero mayor que cero" << std::endl;
      }

    }
    if (vMap.count("q")) {
      displayForm = false;
      if (displayForm == false) {
        std::cout << "Visualización desactivada" << std::endl;
      }
      if (displayForm == true) {
        std::cout << "Visualización activada" << std::endl;
      }
    }
    if (vMap.count("f")) {
      heatFlowCalc = true;
      if (displayForm == false) {
        std::cout << "Se desactivó el cálculo de flujo de calor" << std::endl;
      }
      if (displayForm == true) {
        std::cout << "Se activó el cálculo de flujo de calor" << std::endl;
      }
    }
    if (vMap.count("g")) {
      std::cout << "Tamaño de la rejilla de visualización cambiado a: " << gridSize << std::endl;
    }
    if (vMap.count("horizontal")) {
        std::cout << "Pixeles horizontales: " << vMap["horizontal"].as<int>() << '\n';
    }
  }
  catch (const boost::program_options::error &exception) {
    std::cerr << exception.what() << std::endl;
  }


  //Interpolations
    anpi::manageInterpolation(topTemp, hPixels);
    anpi::manageInterpolation(bottomTemp, hPixels);
    anpi::manageInterpolation(leftTemp, vPixels);
    anpi::manageInterpolation(rightTemp, vPixels);


  //Liebmann
  anpi::Matrix<float> placa;
  placa.allocate(vPixels,hPixels);
  const float N = 0;
  placa.fill(N);


  struct timeval start, end;
  gettimeofday(&start, NULL);
  liebmann (topTemp, bottomTemp, leftTemp, rightTemp, placa);
  gettimeofday(&end, NULL);

  double delta;
  delta = ((end.tv_sec  - start.tv_sec) * 1000000u + 
         end.tv_usec - start.tv_usec) / 1.e6;



  std::cout << "Execution Time liebmann: " << delta << std::endl;


    //########################## IMPRIMIENDO MATRIZ
  std::cout << "[";
  for(size_t i = 0; i < placa.rows(); ++i) {
      std::cout << "[";
      for (size_t j = 0; j < placa.cols(); ++j) {
          std::cout << placa(i,j) << ",";
      }
      std::cout << "]";
      std::cout << std::endl;
  }
    std::cout << "]"<< std::endl;
    //#####################################################


    if (displayForm) {
        anpi::plotMatrix(placa, heatFlowCalc);
    }

}