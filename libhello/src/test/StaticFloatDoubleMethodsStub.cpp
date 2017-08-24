// -------------------------------------------------------------------------------------------------
//
// Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
//
// This software, including documentation, is protected by copyright controlled by
// HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
// adapting or translating, any or all of this material requires the prior written
// consent of HERE Global B.V. This material also contains confidential information,
// which may not be disclosed to others without prior written consent of HERE Global B.V.
//
// -------------------------------------------------------------------------------------------------

#include "stub/test/StaticFloatDoubleMethodsStub.h"

namespace test {

float
StaticFloatDoubleMethodsStub::returnFloat( const float inputNumber )
{
    return inputNumber;
}

float
StaticFloatDoubleMethodsStub::returnIncrementedFloat( const float inputNumber )
{
    return inputNumber + 1.0f;
}

float
StaticFloatDoubleMethodsStub::sumTwoFloats( const float inputNumber1, const float inputNumber2 )
{
    return inputNumber1 + inputNumber2;
}

double
StaticFloatDoubleMethodsStub::returnDouble( const double inputNumber )
{
    return inputNumber;
}

double
StaticFloatDoubleMethodsStub::returnIncrementedDouble( const double inputNumber )
{
    return inputNumber + 1.0;
}

double
StaticFloatDoubleMethodsStub::sumTwoDoubles( const double inputNumber1, const double inputNumber2 )
{
    return inputNumber1 + inputNumber2;
}

}


