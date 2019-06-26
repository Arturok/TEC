/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * File:   DeflateReal_UT.h
 * Author: jeremy
 *
 * Created on 19/03/2018, 02:02:27 PM
 */

#ifndef DEFLATEREAL_UT_H
#define DEFLATEREAL_UT_H

#include <cppunit/extensions/HelperMacros.h>

class DeflateReal_UT : public CPPUNIT_NS::TestFixture {
    CPPUNIT_TEST_SUITE(DeflateReal_UT);

    CPPUNIT_TEST(testDeflate);

    CPPUNIT_TEST_SUITE_END();

public:
    DeflateReal_UT();
    virtual ~DeflateReal_UT();
    void setUp();
    void tearDown();

private:
    void testDeflate();

};

#endif /* DEFLATEREAL_UT_H */

