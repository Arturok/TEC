/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: jeremy
 *
 * Created on 12 de marzo de 2018, 05:47 PM
 */

#include <cstdlib>
#include "RootMuller.hpp"
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <iomanip>
#include <complex>
#include <typeinfo>
#include <boost/math/tools/polynomial.hpp>
#include <boost/program_options/options_description.hpp>
#include <boost/program_options/parsers.hpp>
#include <boost/program_options/variables_map.hpp>
#include <boost/lexical_cast.hpp>
#include "string.h"

#define deflation 1
#define deflation2 2
#define muller 3
#define laguerre 4
#define debug


void mainAux(std::vector<double>& poly, std::vector<double> positions,
        short order, unsigned short method, double tolerance, int maxIt, 
        double root, bool polish, bool singlePrecision) {
    if (poly.size() == 0 && method != 0) {
        std::cout << "Para usar un metodo debe proporcionar un polinomio usando la opcion '--polynomial coef1 coef2 coef3'" << std::endl;
        return;
    }
    switch(method) {
        case deflation: {
            if (singlePrecision) {
                //Deflation single(float)
            }
            else {
                //Deflation double
            }
            break;
        } 
        case deflation2: {
            if (singlePrecision) {
                //Deflation2 single(float)
            }
            else {
                //Deflation2 double
            }
            break;
        }
        case muller: {
            if (singlePrecision) {
                std::vector<std::complex<float> > polyFloat;
                for (int iter = poly.size()-1; iter >= 0; iter--) {
                    std::complex<float> temp = *(new std::complex<float>(poly[iter],0));
                    polyFloat.push_back(temp);
                }
                std::vector<std::complex<float> > result;
                result = anpi::rootMuller<float>((float)positions[0], 
                                (float)positions[1], 
                                (float)positions[2], 
                                polyFloat, 
                                (unsigned int)maxIt,
                                (float)tolerance);
                std::cout << "Raices de Muller para presicion simple: " << std::endl;
                for (int i = 0; i < result.size(); i++){
                    std::cout<< "x" << i <<": " << result[i] << std::endl; 
                }
            }
            else {
                std::vector<std::complex<double> > polyDouble;
                for (int iter = poly.size()-1; iter >= 0 ; iter--) {
                    std::complex<double> temp = *(new std::complex<double>(poly[iter],0));
                    polyDouble.push_back(temp);
                }
                std::vector<std::complex<double> > result;
                result = anpi::rootMuller<double>((double)positions[0], 
                    (double)positions[1], 
                    (double)positions[2], 
                    polyDouble, 
                    (unsigned int)maxIt,
                    (double)tolerance);
                std::cout << "Raices de Muller para presicion doble: " << std::endl;
                for (int i = 0; i < result.size(); i++){
                    std::cout<< "x" << i <<": " << result[i] << std::endl; 
                }
            }
            break;
        }
        case laguerre: {
            if (singlePrecision) {
                //Laguerre single(float)
            }
            else {
                //Laguerre double
            }
            break;
        }
        
        default: {
            //Deflation
            
            //Deflation2
            
            //Default Muller Method
            std::cout << "Metodo de Muller para x^3+2x^2+9x+18=0" << std::endl;
            std::complex<double> tmp= *(new std::complex<double>(12,0));

            std::vector<std::complex<double> >coefs;
            tmp = 18;
            coefs.push_back(tmp);
            tmp = 9;
            coefs.push_back(tmp);
            tmp = 2;
            coefs.push_back(tmp);
            tmp = 1;
            coefs.push_back(tmp);
            std::vector<std::complex<double> > result;
            result = anpi::rootMuller<double>((double)-3, 
                            (double)-1, 
                            (double)0, 
                            coefs, 
                            (unsigned int)50,
                            (long double)0.000001);
            for (int i = 0; i < result.size(); i++){
                std::cout<< "x" << i <<": " << result[i] << std::endl; 
            }
            //Laguerre
        }
    
    
    
    
    }
    
}

int main(int argc, char** argv) {
    using boost::lexical_cast;
    using boost::bad_lexical_cast;
    
    std::vector<double> poly;
    std::vector<double> positions;
    short order = 3;
    unsigned short method = 0;
    double tolerance = 0.000001;
    int maxIt=50;    
    double root;    
    bool polish=0;
    bool singlePrecision=0;


    
    
    //User Interface (Options)
    boost::program_options::options_description options("Project 1 Options");
    options.add_options()
            ("help", "Muestra la ayuda del progrma")
            ("polynomial", boost::program_options::value<std::vector<double> >(&poly)->multitoken(), "Polinomio que se va a usar, utilizar '--polynomial coef1 coef2 ... coefn'")
            ("positions", boost::program_options::value<std::vector<double> >(&positions)->multitoken(), "Posiciones que encierran las primeras 2 raices, utilizar '--positions pos1 pos2 pos3'")
            ("root", boost::program_options::value<double>(&root), "Raiz utilizada para deflacionar, utilizar '--root rootValue'")
            ("order", boost::program_options::value<short>(&order), "Orden del polinomio, utilizar '--order orderValue'")
            ("tolerance", boost::program_options::value<double>(&tolerance), "Tolerancia del error, utilizar '--tolerance tolValue'")
            ("maxIterations", boost::program_options::value<int>(&maxIt), "Cantidad maxima de iteraciones que se quieren realizar")
            ("singlePrecision", boost::program_options::value<bool>(&singlePrecision), "Presicion usada para los metodos, utilizar '--singlePrecision boolValue' 1:single, 0:double(default)")
            ("deflation", "Usar el metodo de Deflacion para numeros reales, utilizar '--deflation'")
            ("deflation2", "Usar el metodo de Deflacion para numeros complejos, utilizar '--deflation2'")
            ("muller", "Usar el metodo de Muller, utilizar '--muller'")
            ("laguerre", "Usar el metodo de Laguerre, utilizar '--laguerre'")
            ("polish", "Pule las raices, utilizar '--polish boolValue'");
            
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
        if (vMap.count("polynomial")) {
            #ifdef debug
                std::cout <<  "Coeficientes del polinomio cambiados a: " << std::endl;
                for(std::vector<double>::iterator it = poly.begin(); it != poly.end(); ++it) {
                    std::cout << ' ' << *it;	
		}
		std::cout << '\n';
            #endif    
                if (poly.size()<=0) {
                    std::cout << "Poly size: " << poly.size() << std::endl;
                    std::cout << "Deben de asignarse mas de 0 coeficientes al polinomio" << std::endl;
                    return -1;
                }
        }
        if (vMap.count("positions")) {
            #ifdef debug
                std::cout <<  "Posiciones cambiadas a: ";
                for(std::vector<double>::iterator it = positions.begin(); it != positions.end(); ++it) {
                    std::cout << ' ' << *it;	
		}
                std:: cout << '\n';
            #endif      
                if (positions.size() <= 0) {
                    std::cout << "Pos size: " << positions.size() << std::endl;
                    std::cout << "Deben de asignarse mas de 0 posiciones" << std::endl;
                    return -1;
                }
        }
        if (vMap.count("root")) {
            #ifdef debug
                std::cout <<  "Raiz cambiada a: "<< root << std::endl;
            #endif         
        }   
        if (vMap.count("order")) {
            #ifdef debug
                std::cout <<  "Orden cambiado a: " << order << std::endl;
            #endif         
                if (order < 0) {
                    std::cout <<  "El orden debe ser un numero positivo" << std::endl;
                    return -1;
                }
        }  
        if (vMap.count("tolerance")) {
            #ifdef debug
                std::cout <<  "Tolerancia cambiada a: "<< tolerance << std::endl;
            #endif         
                if (tolerance < 0) {
                    std::cout <<  "La tolerancia debe ser un numero positivo" << std::endl;
                    return -1;
                }
        }
        if (vMap.count("maxIterations")) {
            #ifdef debug
                std::cout <<  "Cantidad maxima de iteraciones cambiada a: " << maxIt << std::endl;
            #endif         
                if (tolerance < 0) {
                    std::cout <<  "La cantidad maxima de iteraciones debe ser un numero positivo" << std::endl;
                    return -1;
                }
        }
        if (vMap.count("singlePrecision")) {
            #ifdef debug
                string precision = singlePrecision == 1 ? "Single" : "Float";
                std::cout <<  "Precision cambiada a: " << precision << std::endl;
            #endif         
        } 
        if (vMap.count("deflation")) {
            #ifdef debug
                std::cout <<  "Usando metodo de Deflacion para reales" << std::endl;
            #endif         
                method = deflation;
        }
        if (vMap.count("deflation2")) {
            #ifdef debug
                std::cout <<  "Usando metodo de Deflacion para complejos" << std::endl;
            #endif         
                method = deflation2;
        }
        if (vMap.count("muller")) {
            #ifdef debug
                std::cout <<  "Usando metodo de Muller" << std::endl;
            #endif       
                method = muller;
        }    
        if (vMap.count("laguerre")) {
            #ifdef debug
                std::cout <<  "Usando metodo de Laguerre" << std::endl;
            #endif        
                method = laguerre;
        }
        mainAux(poly,  positions, order, method, tolerance, maxIt, root, polish, singlePrecision);
    }
    catch (const boost::program_options::error &exception) {
        std::cerr << exception.what() << '\n';
    }
}

