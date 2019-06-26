/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * File:   DeflateReal_UT.cpp
 * Author: jeremy
 *
 * Created on 19/03/2018, 02:02:27 PM
 */

#include "DeflateReal_UT.h"
#include "./../deflateReal.hpp"


CPPUNIT_TEST_SUITE_REGISTRATION(DeflateReal_UT);

DeflateReal_UT::DeflateReal_UT() {
}

DeflateReal_UT::~DeflateReal_UT() {
}

void DeflateReal_UT::setUp() {
}

void DeflateReal_UT::tearDown() {
}

//template<typename T>
void DeflateReal_UT::testDeflate() {
    //Caso 1
    double coef[6] = {-120,-46,79,-3,-7,1};
    double coef_exp[5] = {30, 19, -15, -3, 1};
    const polynomial<double> poly(coef,5);
    const double root = 4;    
    polynomial<double> residuo;
    
    polynomial<double> result = anpi::deflate(poly, root, residuo);
    if ((result[0] != coef_exp[0])&(result[1] != coef_exp[1])&(result[2] != coef_exp[3])&(result[0] != coef_exp[3])) {
        CPPUNIT_ASSERT(false);
    }
    
    //Caso 2
    double coef[6] = {-120,-46,79,-3,-7,1};
    double coef_exp[5] = {30, 19, -15, -3, 1};
    poly = polynomial<double> (coef,5);
    root = 4;
    
    polynomial<double> result = anpi::deflate(poly, root, residuo);
    if ((result[0] != coef_exp[0])&(result[1] != coef_exp[1])&(result[2] != coef_exp[3])&(result[0] != coef_exp[3])) {
        CPPUNIT_ASSERT(false);
    }
}

